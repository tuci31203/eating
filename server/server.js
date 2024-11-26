const express = require('express');
const db = require('./db');
require('dotenv').config({ path: '../.env' });


const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());


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

  try {
    const ingredientNames = ingredients.map(ingredient => ingredient.name);
    const ingredientAmounts = ingredients.map(ingredient => ingredient.amount);

    // Check for invalid ingredients
    const invalidIngredientsResult = await db.query(`
      SELECT name FROM unnest($1::text[]) as name
      WHERE name NOT IN (SELECT name FROM ingredient)
    `, [ingredientNames]);

    if (invalidIngredientsResult.rows.length > 0) {
      const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
      return res.status(400).json({ error: 'Ingredients not found in database', invalidIngredients });
    }

    const result = await db.query(`
      SELECT n.name, SUM(icn.amount * ing_amnt.amount) as total_amount, n.unit_name
      FROM (
        SELECT unnest($1::text[]) as name, unnest($2::numeric[]) as amount
      ) ing_amnt
      JOIN ingredient ing ON ing_amnt.name = ing.name
      JOIN ingredient_contains_nutrient icn ON ing.ingredient_id = icn.ingredient_id
      JOIN nutrient n ON icn.nutrient_id = n.nutrient_id
      GROUP BY n.name, n.unit_name
    `, [ingredientNames, ingredientAmounts]);

    res.status(200).json(result.rows);
  } catch (err) {
    console.error('Error in /api/getNutrientCount:', err);
    res.status(500).json({ error: 'Server Error' });
  }
});


/**
 * @api {get} /api/getTodayMeals Get today's meals
 * @apiName GetTodayMeals
 * @apiGroup Meals
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
 * @apiError (400) BadRequest Missing user_id parameter.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.get('/api/getTodayMeals', async (req, res) => {
  const userId = req.query.user_id;

  if (!userId) {
    return res.status(400).json({ error: 'Missing user_id parameter' });
  }

  try {
    const result = await db.query(`
      SELECT 
        m.meal_id, 
        m.type, 
        m.datetime,
        json_agg(json_build_object('name', i.name, 'amount', mi.amount, 'unit_name', i.unit_name)) AS ingredients
      FROM meal m
      LEFT JOIN meal_includes_ingredient mi ON m.meal_id = mi.meal_id
      LEFT JOIN ingredient i ON mi.ingredient_id = i.ingredient_id
      WHERE m.datetime::date = CURRENT_DATE AND m.user_id = $1
      GROUP BY m.meal_id
    `, [userId]);
    res.status(200).json(result.rows);
  } catch (err) {
    console.error('Error in /api/getTodayMeals:', err);
    res.status(500).json({ error: 'Server Error' });
  }
});


/**
 * @api {get} /api/getMealbyId Get a Meal by ID
 * @apiName GetMealById
 * @apiGroup Meal
 * 
 * @apiParam {Number} id Meal ID.
 * 
 * @apiSuccess {Number} meal_id Meal ID.
 * @apiSuccess {String} type Meal type.
 * @apiSuccess {String} datetime Meal datetime.
 * @apiSuccess {Number} user_id User ID.
 * @apiSuccess {Object[]} ingredients List of ingredients in the meal.
 * @apiSuccess {String} ingredients.name Ingredient name.
 * @apiSuccess {Number} ingredients.amount Ingredient amount.
 * @apiSuccess {String} ingredients.unit_name Ingredient unit name.
 * 
 * @apiError (404) NotFound Meal not found in database.
 * @apiError (500) ServerError An error occurred on the server.
 * @apiError (400) BadRequest Missing meal ID.
 */
app.get('/api/getTodayMeals', async (req, res) => {
  const userId = req.query.user_id;

  if (!userId) {
    return res.status(400).json({ error: 'Missing user_id parameter' });
  }

  try {
    const result = await db.query(`
      SELECT 
        m.meal_id, 
        m.type, 
        m.datetime,
        json_agg(json_build_object('name', i.name, 'amount', mi.amount, 'unit_name', i.unit_name)) AS ingredients
      FROM meal m
      LEFT JOIN meal_includes_ingredient mi ON m.meal_id = mi.meal_id
      LEFT JOIN ingredient i ON mi.ingredient_id = i.ingredient_id
      WHERE m.datetime::date = CURRENT_DATE AND m.user_id = $1
      GROUP BY m.meal_id
    `, [userId]);
    res.status(200).json(result.rows);
  } catch (err) {
    console.error('Error in /api/getTodayMeals:', err);
    res.status(500).json({ error: 'Server Error' });
  }
});

/**
 * @api {post} /api/createMeal Create a Meal
 * @apiName CreateMeal
 * @apiGroup Meal
 * 
 * @apiParam {String} type Meal type ("breakfast", "lunch", "dinner", or "snack").
 * @apiParam {String} [datetime] Meal datetime. Defaults to current time if not provided.
 * @apiParam {Number} user_id User ID.
 * @apiParam {Object[]} ingredients List of ingredients.
 * @apiParam {String} ingredients.name Ingredient name.
 * @apiParam {Number} ingredients.amount Ingredient amount.
 * @apiParam {Boolean} [aggregate=false] Whether to aggregate ingredient amounts automatically if duplicates are found.
 * 
 * @apiSuccess {Number} meal_id ID of the created meal.
 * 
 * @apiError (400) DuplicateIngredient Duplicate ingredient in meal.
 * @apiError (400) InvalidInput Missing or invalid input parameters.
 * @apiError (400) InvalidUserID User not found in database.
 * @apiError (400) InvalidIngredients Ingredients not found in database.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.post('/api/createMeal', async (req, res) => {
  const { type, datetime = new Date(), user_id, ingredients, aggregate = false } = req.body;

  // Check if type or user_id is not provided
  if (!type || !user_id) {
    return res.status(400).json({ error: 'Missing meal type or user id' });
  }

  const client = await db.connect();

  try {
    // Check if user_id exists
    const userResult = await client.query(`
      SELECT user_id FROM users WHERE user_id = $1
    `, [user_id]);

    if (userResult.rows.length === 0) {
      return res.status(400).json({ error: 'User not found' });
    }

    // Aggregate ingredient amounts or respond with an error if duplicates are found
    const aggregatedIngredients = {};
    for (const ingredient of ingredients) {
      if (aggregatedIngredients[ingredient.name]) { // Duplicate ingredient found
        if (aggregate) {
          aggregatedIngredients[ingredient.name] += ingredient.amount;
        } else {
          return res.status(400).json({ error: 'Duplicate ingredient in meal' });
        }
      } else {
        aggregatedIngredients[ingredient.name] = ingredient.amount;
      }
    }

    // Check if ingredient names exist in the database
    const ingredientNames = Object.keys(aggregatedIngredients);
    const invalidIngredientsResult = await client.query(`
      SELECT name FROM unnest($1::text[]) as name
      WHERE name NOT IN (SELECT name FROM ingredient)
    `, [ingredientNames]);

    if (invalidIngredientsResult.rows.length > 0) {
      const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
      return res.status(400).json({ error: 'Ingredients not found', invalidIngredients });
    }

    // Begin transaction
    await client.query('BEGIN');

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
          SELECT unnest($2::text[]) AS name, unnest($3::numeric[]) AS amount
        )
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        SELECT $1, i.ingredient_id, nmi.amount
        FROM new_meal_ingredients as nmi
        JOIN ingredient i ON i.name = nmi.name
      `, [meal_id, ingredientNames, ingredientAmounts]);
    }

    // Commit transaction
    await client.query('COMMIT');
    res.status(201).json({ meal_id });
  } catch (err) {
    // Rollback transaction in case of error
    await client.query('ROLLBACK');
    console.error(err);
    res.status(500).json({ error: 'Server Error' });
  } finally {
    // Release the client back to the pool
    client.release();
  }
});


/**
 * @api {put} /api/updateMeal Update a Meal
 * @apiName UpdateMeal
 * @apiGroup Meal
 * 
 * @apiParam {Number} meal_id Meal ID.
 * @apiParam {String} [type] Meal type.
 * @apiParam {String} [datetime] Meal datetime.
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
 * @apiError (400) InvalidUserID User not found in database.
 * @apiError (400) InvalidIngredients Ingredients not found in database.
 * @apiError (404) NotFound Meal not found in database.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.put('/api/updateMeal', async (req, res) => {
  const { meal_id, type, datetime, user_id, ingredients, aggregate = false } = req.body;

  // Check if meal_id is provided
  if (!meal_id) {
    return res.status(400).json({ error: 'Missing meal_id parameter' });
  }

  const client = await db.connect();

  try {
    // Begin transaction
    await client.query('BEGIN');

    // Check if meal exists in the database
    const mealExistsResult = await client.query(`
      SELECT 1 FROM meal WHERE meal_id = $1
    `, [meal_id]);

    if (mealExistsResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Meal not found in database' });
    }

    // Check if user_id exists if provided
    if (user_id) {
      const userResult = await client.query(`
        SELECT user_id FROM users WHERE user_id = $1
      `, [user_id]);

      if (userResult.rows.length === 0) {
        await client.query('ROLLBACK');
        return res.status(400).json({ error: 'User not found in database' });
      }
    }

    // Aggregate ingredient amounts or respond with an error if duplicates are found
    const aggregatedIngredients = {};
    if (ingredients) {
      for (const ingredient of ingredients) {
        if (aggregatedIngredients[ingredient.name]) { // Duplicate ingredient found
          if (aggregate) {
            aggregatedIngredients[ingredient.name] += ingredient.amount;
          } else {
            await client.query('ROLLBACK');
            return res.status(400).json({ error: 'Duplicate ingredient in meal' });
          }
        } else {
          aggregatedIngredients[ingredient.name] = ingredient.amount;
        }
      }

      // Check if ingredient names exist in the database
      const ingredientNames = Object.keys(aggregatedIngredients);
      const invalidIngredientsResult = await client.query(`
        SELECT name FROM unnest($1::text[]) as name
        WHERE name NOT IN (SELECT name FROM ingredient)
      `, [ingredientNames]);

      if (invalidIngredientsResult.rows.length > 0) {
        const invalidIngredients = invalidIngredientsResult.rows.map(row => row.name);
        await client.query('ROLLBACK');
        return res.status(400).json({ error: 'Ingredients not found in database', invalidIngredients });
      }
    }

    // Update meal details if provided
    const updateFields = [];
    const updateValues = [];
    let fieldIndex = 2; // index of the $ placeholder in SQL update query, starts at index 2 since meal_id is at index 1

    if (type) {
      updateFields.push(`type = $${fieldIndex++}`);
      updateValues.push(type);
    }
    if (datetime) {
      updateFields.push(`datetime = $${fieldIndex++}`);
      updateValues.push(datetime);
    }
    if (user_id) {
      updateFields.push(`user_id = $${fieldIndex++}`);
      updateValues.push(user_id);
    }

    if (updateFields.length > 0) {
      await client.query(`
        UPDATE meal
        SET ${updateFields.join(', ')}
        WHERE meal_id = $1
      `, [meal_id, ...updateValues]);
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
          SELECT unnest($2::text[]) AS name, unnest($3::numeric[]) AS amount
        )
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        SELECT $1, i.ingredient_id, nmi.amount
        FROM new_meal_ingredients as nmi
        JOIN ingredient i ON i.name = nmi.name
      `, [meal_id, ingredientNames, ingredientAmounts]);
    }

    // Commit transaction
    await client.query('COMMIT');

    // Prepare response message
    const processedFields = [];
    if (type) processedFields.push('type');
    if (datetime) processedFields.push('datetime');
    if (user_id) processedFields.push('user_id');
    if (ingredients) processedFields.push('ingredients');

    res.status(200).json({ message: `Meal with ID ${meal_id} updated successfully. Processed fields: ${JSON.stringify(processedFields)}` });
  } catch (err) {
    // Rollback transaction in case of error
    await client.query('ROLLBACK');
    console.error('Error in /api/updateMeal:', err);
    res.status(500).json({ error: 'Server Error' });
  } finally {
    // Release the client back to the pool
    client.release();
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
 * @apiError (404) NotFound Meal not found in database.
 * @apiError (500) ServerError An error occurred on the server.
 */
app.delete('/api/deleteMeal', async (req, res) => {
  const { meal_id } = req.body;

  if (!meal_id) {
    return res.status(400).json({ error: 'Meal ID is required' });
  }

  const client = await db.connect();

  try {
    await client.query('BEGIN');

    // Check if meal exists in the database
    const mealExistsResult = await client.query(`
      SELECT 1 FROM meal WHERE meal_id = $1
    `, [meal_id]);

    if (mealExistsResult.rows.length === 0) {
      await client.query('ROLLBACK');
      return res.status(404).json({ error: 'Meal ID not found' });
    }

    // Delete ingredients associated with the meal
    await client.query(`
      DELETE FROM meal_includes_ingredient
      WHERE meal_id = $1
    `, [meal_id]);

    // Delete the meal
    await client.query(`
      DELETE FROM meal
      WHERE meal_id = $1
    `, [meal_id]);

    await client.query('COMMIT');
    res.status(200).json({ message: `Meal with ID ${meal_id} deleted successfully` });
  } catch (err) {
    await client.query('ROLLBACK');
    console.error('Error in /api/deleteMeal:', err);
    res.status(500).json({ error: 'Server Error' });
  } finally {
    client.release();
  }
});


/**
 * @api {get} /api/getRecipes Get recipes by ingredients
 * @apiName GetRecipes
 * @apiGroup Recipe
 *
 * @apiParam {String[]} ingredients List of ingredient names.
 * @apiParam {Boolean} [all=true] Whether to search for recipes with all or just at least one of the ingredients.
 *
 * @apiSuccess (200) {Object[]} recipes List of recipes.
 * @apiSuccess {Number} recipes.recipe_id Recipe ID.
 * @apiSuccess {String} recipes.title Recipe title.
 * @apiSuccess {Number} recipes.total_time Total time to prepare the recipe.
 * @apiSuccess {String} recipes.instructions Instructions to prepare the recipe.
 * @apiSuccess {Object[]} recipes.ingredients List of ingredients.
 * @apiSuccess {String} recipes.ingredients.name Ingredient name.
 * @apiSuccess {Number} recipes.ingredients.amount Ingredient amount.
 *
 * @apiError (400) {String} error Error message.
 * @apiError (500) {String} error Server error message.
 */
app.get('/api/getRecipes', async (req, res) => {
  const { ingredients, all = 'true' } = req.query;

  if (!ingredients || !Array.isArray(ingredients) || ingredients.length === 0) {
    return res.status(400).json({ error: 'Ingredients query parameter should be a non-empty list' });
  }

  try {
    const client = await pool.connect();

    // Check if all ingredients exist in the database
    const ingredientCheckQuery = `
      SELECT name
      FROM public.ingredient
      WHERE name = ANY($1::text[])
    `;
    const ingredientCheckResult = await client.query(ingredientCheckQuery, [ingredients]);

    const validIngredients = ingredientCheckResult.rows.map(row => row.name);
    const invalidIngredients = ingredients.filter(ingredient => !validIngredients.includes(ingredient));

    if (invalidIngredients.length > 0) {
      client.release();
      return res.status(400).json({ error: `Ingredients not found in the database: ${invalidIngredients.join(', ')}` });
    }

    // deduplicate ingredient list
    const uniqueIngredients = [...new Set(ingredients)];

    // Query to find recipes
    const query = `
      SELECT r.recipe_id, r.title, r.total_time, r.instructions,
             json_agg(json_build_object('name', i.name, 'amount', rii.amount)) AS ingredients
      FROM public.recipe r
      JOIN public.recipe_includes_ingredient rii ON r.recipe_id = rii.recipe_id
      JOIN public.ingredient i ON rii.ingredient_id = i.ingredient_id
      WHERE rii.ingredient_id IN (
        SELECT ingredient_id
        FROM public.ingredient
        WHERE name = ANY($1::text[])
      )
      GROUP BY r.recipe_id
      HAVING ${all === 'true' ? 'COUNT(DISTINCT rii.ingredient_id) = $2' : 'COUNT(DISTINCT rii.ingredient_id) > 0'};
    `;

    const result = await client.query(query, [uniqueIngredients, uniqueIngredients.length]);

    client.release();
    res.status(200).json(result.rows);
  } catch (err) {
    console.error('Error in /api/getRecipes:', err);
    res.status(500).json({ error: 'Server Error' });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});