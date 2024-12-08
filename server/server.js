// Load environment variables from .env file when running on development machine
// Use Heroku's config vars when running on Heroku
const fs = require('fs');
const path = require('path');
if (process.env.NODE_ENV !== 'production') {
  let dotenvPath = path.resolve(__dirname, '.env');
  if (!fs.existsSync(dotenvPath)) {
    dotenvPath = path.resolve(__dirname, '../.env');
  }
  require('dotenv').config({ path: dotenvPath });
}

const db = require('./db');

const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;
app.use(express.json());

const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const JWT_SECRET_KEY = process.env.JWT_SECRET_KEY;


// Middleware to authenticate JWT
const authenticateToken = (req, res, next) => {
  const authHeader = req.headers['authorization'];
  const token = authHeader && authHeader.split(' ')[1];

  if (!token) {
    return res.status(401).json({ error: 'Access denied' });
  }

  jwt.verify(token, JWT_SECRET_KEY, (err, user) => {
    if (err) {
      return res.status(403).json({ error: 'Invalid token' });
    }
    req.user = user;
    next();
  });
};


/**
 * @api {post} /api/signUp Register a new user
 * @apiName SignUp
 * @apiGroup User
 * 
 * @apiParam {String} username Username of the user. Must be unique and from 1 to 20 characters long with no leading or trailing space.
 * @apiParam {String} password Password of the user. Must have at least 1 character. Must not have leading or trailing space.
 * @apiParam {String} gender Gender of the user. Must be a capitalized letter (A-Z). M and F are recommended.
 * 
 * @apiSuccess {String} message Success message.
 * 
 * @apiError (400) BadRequest Missing username or password.
 * @apiError (400) BadRequest Username or password must not have leading or trailing spaces.
 * @apiError (400) BadRequest Username must be 20 characters or less.
 * @apiError (409) Conflict Username already exists.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.post('/api/signUp', async (req, res) => {
  const { username, password, gender } = req.body;
  if (!username || !password || !gender) {
    return res.status(400).json({ error: 'Missing username, password, or gender' });
  }
  if (username !== username.trim() || password !== password.trim()) {
    return res.status(400).json({ error: 'Username or password must not have leading or trailing spaces' });
  }
  if (username.length > 20) {
    return res.status(400).json({ error: 'Username must be 20 characters or less' });
  }
  if (!/^[A-Z]$/.test(gender)) {
    return res.status(400).json({ error: 'Gender must be a capitalized letter (A-Z). M and F are recommended.' });
  }

  let client;
  try {
    // Generate a salt and hash the password
    const saltRounds = 10;
    const hashedPassword = await bcrypt.hash(password, saltRounds);
    // Store the user in the database
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE');
    await client.query(`
      INSERT INTO users (user_name, hashed_pw, gender)
      VALUES ($1, $2, $3)
    `, [username, hashedPassword, gender]);
    await client.query('COMMIT');
    return res.status(201).json({ message: 'User registered successfully' });
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    if (err.code == '23505') { // Unique violation error code in PostgreSQL
      return res.status(409).json({ error: 'Username already exists' });
    }
    console.error('Error in /api/signUp', err);
    return res.status(500).json({ error: 'Server error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {post} /api/logIn Log in an existing user
 * @apiName LogIn
 * @apiGroup User
 * 
 * @apiParam {String} username Username of the user.
 * @apiParam {String} password Password of the user.
 * 
 * @apiSuccess {String} token JWT token for the authenticated user.
 * 
 * @apiError (400) BadRequest Missing username or password.
 * @apiError (401) Unauthorized Invalid username or password.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.post('/api/logIn', async (req, res) => {
  const { username, password } = req.body;
  if (!username || !password) {
    return res.status(400).json({ error: 'Missing username or password' });
  }

  let client;
  try {
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE READ ONLY DEFERRABLE');

    // Fetch user from database
    const result = await client.query(`
      SELECT user_id, hashed_pw
      FROM users
      WHERE user_name = $1
    `, [username]);
    const user = result.rows[0];

    if (user && await bcrypt.compare(password, user.hashed_pw)) {
      // Generate JWT
      const token = jwt.sign({ userId: user.user_id }, JWT_SECRET_KEY, { expiresIn: '1h' });
      await client.query('COMMIT');
      return res.status(200).json({ token });
    }
    else {
      await client.query('ROLLBACK');
      return res.status(401).json({ error: 'Invalid username or password' });
    }
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/logIn:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {post} /api/getNutrientCount Get the total amount of nutrients in a list of ingredients
 * @apiName GetNutrientCount
 * @apiGroup Nutrient
 * 
 * @apiParam {Object[]} ingredients List of ingredients.
 * @apiParam {String} ingredients.name Ingredient name.
 * @apiParam {Number} ingredients.amount Ingredient amount.
 * 
 * @apiSuccess {Object[]} nutrients List of nutrients.
 * @apiSuccess {String} nutrients.name Nutrient name.
 * @apiSuccess {Number} nutrients.total_amount Total amount of the nutrient.
 * @apiSuccess {String} nutrients.unit_name Nutrient unit name.
 * 
 * @apiError (500) ServerError An error occurred on the server.
 * @apiError (400) BadRequest No ingredients provided or invalid ingredients.
 */
app.post('/api/getNutrientCount', async (req, res) => {
  const { ingredients } = req.body;
  if (!ingredients || ingredients.length === 0) {
    return res.status(400).json({ error: 'Missing ingredients parameter' });
  }

  let client;

  try {
    const ingredientNames = ingredients.map(ingredient => ingredient.name);
    const ingredientAmounts = ingredients.map(ingredient => ingredient.amount);

    client = await db.connect();

    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE READ ONLY DEFERRABLE');

    // Check for invalid ingredients
    const invalidIngredientsResult = await client.query(`
      SELECT name
      FROM UNNEST($1::TEXT[]) AS name
      WHERE name NOT IN (SELECT name FROM ingredient)
    `, [ingredientNames]);

    if (invalidIngredientsResult.rows.length > 0) {
      const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
      await client.query('ROLLBACK');
      return res.status(400).json({ error: 'Invalid ingredients', invalidIngredients });
    }

    const result = await client.query(`
      SELECT n.name, SUM(icn.amount * ing_amnt.amount) AS total_amount, n.unit_name
      FROM
        (SELECT UNNEST($1::TEXT[]) AS name, UNNEST($2::NUMERIC[]) AS amount
        ) ing_amnt
        JOIN ingredient ing ON ing_amnt.name = ing.name
        JOIN ingredient_contains_nutrient icn ON ing.ingredient_id = icn.ingredient_id
        JOIN nutrient n ON icn.nutrient_id = n.nutrient_id
      GROUP BY n.name, n.unit_name
    `, [ingredientNames, ingredientAmounts]);
    
    await client.query('COMMIT');
    return res.status(200).json(result.rows);
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/getNutrientCount:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {get} /api/getTodayMeals Get today's meals
 * @apiName GetTodayMeals
 * @apiGroup Meal
 * 
 * @apiParam {String} user_id User's unique ID.
 * 
 * @apiSuccess {Object[]} meals List of today's meals.
 * @apiSuccess {Number} meals.meal_id Meal ID.
 * @apiSuccess {String} meals.type Meal type.
 * @apiSuccess {String} meals.datetime Meal datetime.
 * @apiSuccess {Object[]} meals.ingredients List of ingredients.
 * @apiSuccess {String} meals.ingredients.name Ingredient name.
 * @apiSuccess {Number} meals.ingredients.amount Ingredient amount.
 * @apiSuccess {String} meals.ingredients.unit_name Ingredient unit name.
 * 
 * @apiError (400) BadRequest Missing user_id parameter or invalid user_id.
 * @apiError (401) Unauthorized Access denied.
 * @apiError (403) Forbidden Invalid token.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.get('/api/getTodayMeals', authenticateToken, async (req, res) => {
  const userId = req.query.user_id;

  if (!userId) {
    return res.status(400).json({ error: 'Missing user_id parameter' });
  }

  let client;

  try {
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE READ ONLY DEFERRABLE');

    // Check if user ID exists
    const userResult = await client.query(`
      SELECT user_id
        FROM users
        WHERE user_id = $1
    `, [userId]);

    if (userResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(400).json({ error: 'Invalid user_id' });
    }

    const result = await client.query(`
      SELECT  m.meal_id, 
              m.type, 
              m.datetime,
              JSONB_AGG(JSONB_BUILD_OBJECT('name', i.name, 'amount', mi.amount, 'unit_name', i.unit_name)) AS ingredients
      FROM meal m
        LEFT JOIN meal_includes_ingredient mi ON m.meal_id = mi.meal_id
        LEFT JOIN ingredient i ON mi.ingredient_id = i.ingredient_id
      WHERE m.datetime::DATE = CURRENT_DATE AND m.user_id = $1
      GROUP BY m.meal_id
    `, [userId]);
    
    await client.query('COMMIT');
    return res.status(200).json(result.rows);
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/getTodayMeals:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {get} /api/getMealbyId Get meal by ID
 * @apiName GetMealById
 * @apiGroup Meal
 * 
 * @apiParam {String} meal_id Meal's unique ID.
 * 
 * @apiSuccess {Number} meal_id Meal ID.
 * @apiSuccess {String} type Meal type.
 * @apiSuccess {String} datetime Meal datetime.
 * @apiSuccess {Object[]} ingredients List of ingredients.
 * @apiSuccess {String} ingredients.name Ingredient name.
 * @apiSuccess {Number} ingredients.amount Ingredient amount.
 * @apiSuccess {String} ingredients.unit_name Ingredient unit name.
 * 
 * @apiError (400) BadRequest Missing meal_id parameter.
 * @apiError (401) Unauthorized Access denied.
 * @apiError (403) Forbidden Invalid token.
 * @apiError (404) NotFound Meal not found.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.get('/api/getMealbyId', authenticateToken, async (req, res) => {
  const mealId = req.query.meal_id;

  if (!mealId) {
    return res.status(400).json({ error: 'Missing meal_id parameter' });
  }

  let client;
  try {
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE READ ONLY DEFERRABLE');

    const result = await client.query(`
      SELECT  m.meal_id, 
              m.type, 
              m.datetime,
              JSONB_AGG(JSONB_BUILD_OBJECT('name', i.name, 'amount', mi.amount, 'unit_name', i.unit_name)) AS ingredients
      FROM meal m
        LEFT JOIN meal_includes_ingredient mi ON m.meal_id = mi.meal_id
        LEFT JOIN ingredient i ON mi.ingredient_id = i.ingredient_id
      WHERE m.meal_id = $1
      GROUP BY m.meal_id, m.type, m.datetime
    `, [mealId]);

    if (result.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Meal not found' });
    }

    await client.query('COMMIT');
    return res.status(200).json(result.rows[0]);
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/getMealbyId:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {post} /api/createMeal Create a Meal
 * @apiName CreateMeal
 * @apiGroup Meal
 * 
 * @apiParam {String} type Meal type ("breakfast", "lunch", "dinner", or "snack").
 * @apiParam {Date|String} datetime Meal datetime.
 * @apiParam {Number} user_id User ID.
 * @apiParam {Object[]} [ingredients] List of ingredients.
 * @apiParam {String} ingredients.name Ingredient name.
 * @apiParam {Number} ingredients.amount Ingredient amount.
 * @apiParam {Boolean} [aggregate=false] Whether to aggregate ingredient amounts automatically if duplicates are found.
 * 
 * @apiSuccess {Number} meal_id ID of the created meal.
 * 
 * @apiError (400) DuplicateIngredient Duplicate ingredient in meal.
 * @apiError (400) InvalidInput Missing or invalid input parameters.
 * @apiError (400) InvalidUserID Invalid user id.
 * @apiError (400) InvalidIngredients Invalid ingredients.
 * @apiError (401) Unauthorized Access denied.
 * @apiError (403) Forbidden Invalid token.
 * @apiError (409) Conflict Meal with same user id, type, and datetime truncated to minute already exists.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.post('/api/createMeal', authenticateToken, async (req, res) => {
  const { type, datetime, user_id, ingredients, aggregate = false } = req.body;

  // Check if type or user_id is not provided
  if (!type || !user_id || !datetime) {
    return res.status(400).json({ error: 'Missing meal type, user id, or time' });
  }

  // Aggregate ingredient amounts or respond with an error if duplicates are found
  const aggregatedIngredients = {};
  for (const ingredient of ingredients) {
    if (aggregatedIngredients[ingredient.name]) { // Duplicate ingredient found
      if (aggregate) {
        aggregatedIngredients[ingredient.name] += ingredient.amount;
      }
      else {
        return res.status(400).json({ error: 'Duplicate ingredient in meal' });
      }
    }
    else {
      aggregatedIngredients[ingredient.name] = ingredient.amount;
    }
  }

  let client;
  try {
    client = await db.connect();
    // Begin transaction
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE');

    // Check if ingredient names exist in the database
    const ingredientNames = Object.keys(aggregatedIngredients);
    const invalidIngredientsResult = await client.query(`
      SELECT name
      FROM UNNEST($1::TEXT[]) AS name
      WHERE name NOT IN (SELECT name FROM ingredient)
    `, [ingredientNames]);

    if (invalidIngredientsResult.rows.length > 0) {
      await client.query('ROLLBACK');
      const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
      return res.status(400).json({ error: 'Invalid ingredients', invalidIngredients });
    }

    // Insert new meal into the meal table and get the generated meal_id
    const mealResult = await client.query(`
      INSERT INTO meal (type, datetime, user_id)
      VALUES ($1, $2, $3)
      RETURNING meal_id
    `, [type, datetime, user_id]);

    const meal_id = mealResult.rows[0].meal_id;

    // Insert aggregated ingredients into meal_includes_ingredient table
    if (ingredients) {
      const ingredientAmounts = Object.values(aggregatedIngredients);

      await client.query(`
        WITH new_meal_ingredients AS (
          SELECT UNNEST($2::TEXT[]) AS name, UNNEST($3::NUMERIC[]) AS amount
        )
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        SELECT $1, i.ingredient_id, nmi.amount
        FROM new_meal_ingredients AS nmi
          JOIN ingredient i ON i.name = nmi.name
      `, [meal_id, ingredientNames, ingredientAmounts]);
    }

    // Commit transaction
    await client.query('COMMIT');
    return res.status(201).json({ meal_id });
  }  catch (err) {
    // Rollback transaction in case of error
    if (client) {
      await client.query('ROLLBACK');
    }
    if (err.constraint == 'meal_user_id_fkey') {
      return res.status(400).json({ error: 'Invalid user id' });
    }
    if (err.constraint == 'meal_type_user_id_datetime_truncated_to_minute_key') {
      return res.status(409).json({ error: 'Meal with same user id, type, and datetime truncated to minute already exists' });
    }
    console.error(err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    // Release the client back to the pool
    if (client) {
        client.release();
    }
  }
});


/**
 * @api {put} /api/updateMeal Update a Meal
 * @apiName UpdateMeal
 * @apiGroup Meal
 * 
 * @apiParam {Number} meal_id Meal ID.
 * @apiParam {String} [type] Meal type.
 * @apiParam {Date|String} [datetime] Meal datetime.
 * @apiParam {Number} [user_id] User ID.
 * @apiParam {Object[]} [ingredients] List of ingredients.
 * @apiParam {String} ingredients.name Ingredient name.
 * @apiParam {Number} ingredients.amount Ingredient amount.
 * @apiParam {Boolean} [aggregate=false] Whether to aggregate ingredient amounts if duplicates are found.
 * 
 * @apiSuccess {String} message Success message.
 * 
 * @apiError (400) DuplicateIngredient Duplicate ingredient in meal.
 * @apiError (400) InvalidInput Missing or invalid input parameters.
 * @apiError (400) InvalidUserID Invalid user id.
 * @apiError (400) InvalidIngredients Invalid ingredients.
 * @apiError (404) NotFound Meal not found in database.
 * @apiError (401) Unauthorized Access denied.
 * @apiError (403) Forbidden Invalid token.
 * @apiError (409) Conflict Meal with same user id, type, and datetime truncated to minute already exists.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.put('/api/updateMeal', authenticateToken, async (req, res) => {
  const { meal_id, type, datetime, user_id, ingredients, aggregate = false } = req.body;

  // Check if meal_id is provided
  if (!meal_id) {
    return res.status(400).json({ error: 'Missing meal_id parameter' });
  }

  // Aggregate ingredient amounts or respond with an error if duplicates are found
  const aggregatedIngredients = {};
  if (ingredients) {
    for (const ingredient of ingredients) {
      if (aggregatedIngredients[ingredient.name]) {
        if (aggregate) {
          aggregatedIngredients[ingredient.name] += ingredient.amount;
        }
        else {
          return res.status(400).json({ error: 'Duplicate ingredient in meal' });
        }
      }
      else {
        aggregatedIngredients[ingredient.name] = ingredient.amount;
      }
    }
  }

  let client;
  try {
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE');

    // Check if ingredient names exist in the database
    if (ingredients) {
      const ingredientNames = Object.keys(aggregatedIngredients);
      const invalidIngredientsResult = await client.query(`
        SELECT name
        FROM UNNEST($1::TEXT[]) AS name
        WHERE name NOT IN (SELECT name FROM ingredient)
      `, [ingredientNames]);

      if (invalidIngredientsResult.rows.length > 0) {
        const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
        await client.query('ROLLBACK');
        return res.status(400).json({ error: 'Invalid ingredients', invalidIngredients });
      }
    }

    // Update meal details if provided
    const updateFieldTexts = [];
    const updateValues = [];
    let fieldIndex = 2; // index of the $ placeholder in SQL update query, starts at index 2 since meal_id is at index 1

    if (type) {
      updateFieldTexts.push(`type = $${fieldIndex++}`);
      updateValues.push(type);
    }
    if (datetime) {
      updateFieldTexts.push(`datetime = $${fieldIndex++}`);
      updateValues.push(datetime);
    }
    if (user_id) {
      updateFieldTexts.push(`user_id = $${fieldIndex++}`);
      updateValues.push(user_id);
    }

    if (updateFieldTexts.length > 0) {
      let updateMealDetailsResult = await client.query(`
        UPDATE meal
        SET ${updateFieldTexts.join(', ')}
        WHERE meal_id = $1
        RETURNING 1
      `, [meal_id, ...updateValues]);
      // if no rows are updated, the meal_id does not exist in the database
      if (updateMealDetailsResult.rows.length === 0) {
        await client.query('ROLLBACK');
        return res.status(404).json({ error: 'Meal not found in database' });
      }
    }

    // Replace existing ingredients if new ingredients are provided
    if (ingredients) {
      const ingredientNames = Object.keys(aggregatedIngredients);
      const ingredientAmounts = Object.values(aggregatedIngredients);

      await client.query(`
        DELETE FROM meal_includes_ingredient
        WHERE meal_id = $1
      `, [meal_id]);
    
      await client.query(`
        WITH new_meal_ingredients AS (
          SELECT UNNEST($2::TEXT[]) AS name, UNNEST($3::NUMERIC[]) AS amount
        )
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        SELECT $1, i.ingredient_id, nmi.amount
        FROM new_meal_ingredients AS nmi
          JOIN ingredient i ON i.name = nmi.name
      `, [meal_id, ingredientNames, ingredientAmounts]);
    }

    await client.query('COMMIT');

    return res.status(200).json({
      message: 'Meal updated successfully',
    });
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    if (err.constraint == 'meal_user_id_fkey') {
      return res.status(400).json({ error: 'Invalid user id' });
    }
    if (err.constraint == 'meal_type_user_id_datetime_truncated_to_minute_key') {
      return res.status(409).json({ error: 'Meal with same user id, type, and datetime truncated to minute already exists' });
    }
    console.error('Error in /api/updateMeal:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


/**
 * @api {delete} /api/deleteMeal Delete a Meal
 * @apiName DeleteMeal
 * @apiGroup Meal
 * 
 * @apiParam {Number} meal_id Meal ID.
 * 
 * @apiSuccess {String} message Success message.
 * 
 * @apiError (400) BadRequest Meal ID not provided.
 * @apiError (401) Unauthorized Access denied.
 * @apiError (403) Forbidden Invalid token.
 * @apiError (404) NotFound Meal not found in database.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.delete('/api/deleteMeal', authenticateToken, async (req, res) => {
  const { meal_id } = req.body;

  if (!meal_id) {
    return res.status(400).json({ error: 'Meal ID is required' });
  }

  let client;

  try {
    client = await db.connect();

    await client.query('');

    // Begin transaction and delete the meal if it exists
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE');
  
    const deleteResult = await client.query(`
      DELETE FROM meal
      WHERE meal_id = $1
      RETURNING 1
    `, [meal_id]);
  
    if (deleteResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Meal ID not found' });
    }
  
    await client.query('COMMIT');
    return res.status(200).json({ message: 'Meal deleted successfully' });
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/deleteMeal:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
        client.release();
    }
  }
});


/**
 * @api {get} /api/getRecipes Get recipes by ingredients
 * @apiName GetRecipes
 * @apiGroup Recipe
 *
 * @apiParam {String} ingredients Comma-separated list of ingredient names. Note that each separator is a comma without spaces, so any space will be interpreted as part of the ingredient names.
 * @apiParam {String} [ingredientMatchType=only] Type of ingredient match. Can be 'all' to search for recipes with all of the input ingredients, 'any' to search for recipes with at least one of the input ingredients, or 'only' (the default mode) to search for recipes with no ingredients not in the input ingredient list.
 *
 * @apiSuccess (200) {Object[]} recipes List of recipes matching the ingredients, which may be empty.
 * @apiSuccess {Number} recipes.recipe_id Recipe ID.
 * @apiSuccess {String} recipes.title Recipe title.
 * @apiSuccess {Number} recipes.total_time Total time to prepare the recipe.
 * @apiSuccess {String} recipes.instructions Instructions to prepare the recipe.
 * @apiSuccess {Object[]} recipes.ingredients List of ingredients.
 * @apiSuccess {String} recipes.ingredients.name Ingredient name.
 * @apiSuccess {Number} recipes.ingredients.amount Ingredient amount.
 *
 * @apiError (400) InvalidIngredients Invalid ingredients.
 * @apiError (400) InvalidIngredientMatchType Invalid ingredientMatchType value.
 * @apiError (400) MissingIngredients Ingredients parameter is required.
 * @apiError (500) {String} error Server error message.
 */
app.get('/api/getRecipes', async (req, res) => {
  let { ingredients, ingredientMatchType = 'only' } = req.query;

  // Parse ingredientMatchType
  if (!['all', 'any', 'only'].includes(ingredientMatchType)) {
    return res.status(400).json({ error: 'Invalid ingredientMatchType' });
  }

  // Check if ingredients are provided
  if (!ingredients) {
    return res.status(400).json({ error: 'ingredients parameter is required' });
  }

  // Parse ingredients as an array
  ingredients = ingredients.split(',');

  // Deduplicate ingredient list
  const uniqueIngredients = [...new Set(ingredients)];

  let client;

  try {
    client = await db.connect();
    await client.query('START TRANSACTION ISOLATION LEVEL SERIALIZABLE READ ONLY DEFERRABLE');

    // Check if all ingredients exist in the database
    const ingredientCheckResult = await client.query(`
      SELECT name
      FROM ingredient
      WHERE name = ANY ($1::TEXT[])
    `, [uniqueIngredients]);
    const validIngredients = ingredientCheckResult.rows.map(row => row.name);
    const invalidIngredients = uniqueIngredients.filter(ingredient => !validIngredients.includes(ingredient));
    if (invalidIngredients.length > 0) {
      await client.query('ROLLBACK');
      return res.status(400).json({ error: 'Invalid ingredients', invalidIngredients });
    }

    // Filter recipes by ingredients based on ingredientMatchType
    let result;
    if (ingredientMatchType === 'only') {
      result = await client.query(`
        SELECT
          r.recipe_id, r.title, r.total_time, r.instructions,
          JSONB_AGG(JSONB_BUILD_OBJECT('name', i.name, 'amount', rii.amount)) AS ingredients
        FROM recipe r
          JOIN recipe_includes_ingredient rii ON r.recipe_id = rii.recipe_id
          JOIN ingredient i ON rii.ingredient_id = i.ingredient_id
        WHERE NOT EXISTS
          (SELECT rii1.ingredient_id
           FROM recipe_includes_ingredient AS rii1
            JOIN ingredient AS i1 ON rii1.ingredient_id = i1.ingredient_id
           WHERE rii1.recipe_id = r.recipe_id
            AND i1.name <> ALL ($1::TEXT[])
          )
        GROUP BY r.recipe_id, r.title, r.total_time, r.instructions
        UNION
        SELECT
          r.recipe_id, r.title, r.total_time, r.instructions, '[]'::JSONB AS ingredients
        FROM recipe r
        WHERE r.recipe_id NOT IN (SELECT recipe_id FROM recipe_includes_ingredient)
      `, [uniqueIngredients]);
    }
    else if (ingredientMatchType === 'any') {
      result = await client.query(`
        SELECT
          filtered_recipes.recipe_id, filtered_recipes.title, filtered_recipes.total_time, filtered_recipes.instructions,
          JSONB_AGG(JSONB_BUILD_OBJECT('name', i.name, 'amount', rii.amount)) AS ingredients
        FROM 
          (SELECT DISTINCT r.recipe_id, r.title, r.total_time, r.instructions
           FROM recipe r
            JOIN recipe_includes_ingredient rii1 ON r.recipe_id = rii1.recipe_id
            JOIN ingredient i1 ON rii1.ingredient_id = i1.ingredient_id
            WHERE i1.name = ANY ($1::TEXT[])
          ) filtered_recipes
          JOIN recipe_includes_ingredient rii ON filtered_recipes.recipe_id = rii.recipe_id
          JOIN ingredient i ON rii.ingredient_id = i.ingredient_id
        GROUP BY filtered_recipes.recipe_id, filtered_recipes.title, filtered_recipes.total_time, filtered_recipes.instructions
      `, [uniqueIngredients]);
    }
    else if (ingredientMatchType === 'all') {
      result = await client.query(`
        SELECT
          filtered_recipes.recipe_id, filtered_recipes.title, filtered_recipes.total_time, filtered_recipes.instructions,
          JSONB_AGG(JSONB_BUILD_OBJECT('name', i.name, 'amount', rii.amount)) AS ingredients
        FROM
          (SELECT r.recipe_id, r.title, r.total_time, r.instructions
           FROM recipe r
            JOIN recipe_includes_ingredient rii1 ON r.recipe_id = rii1.recipe_id
            JOIN ingredient i1 ON rii1.ingredient_id = i1.ingredient_id
           WHERE i1.name = ANY ($1::TEXT[])
           GROUP BY r.recipe_id, r.title, r.total_time, r.instructions
           HAVING COUNT(rii1.ingredient_id) = $2
          ) filtered_recipes
          JOIN recipe_includes_ingredient rii ON filtered_recipes.recipe_id = rii.recipe_id
          JOIN ingredient i ON rii.ingredient_id = i.ingredient_id
        GROUP BY filtered_recipes.recipe_id, filtered_recipes.title, filtered_recipes.total_time, filtered_recipes.instructions
      `, [uniqueIngredients, uniqueIngredients.length]);
    }

    await client.query('COMMIT');
    return res.status(200).json(result.rows);
  }
  catch (err) {
    if (client) {
      await client.query('ROLLBACK');
    }
    console.error('Error in /api/getRecipes:', err);
    return res.status(500).json({ error: 'Server Error' });
  }
  finally {
    if (client) {
      client.release();
    }
  }
});


app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
  console.log(`Testing database connection...`);
  db.query('SELECT 1')
    .then(() => console.log('Database connection successful'))
    .catch((err) => {
      console.log('Database connection failed', err);
      throw err;
    });
});