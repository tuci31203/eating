const express = require('express');
const db = require('./db');
require('dotenv').config({ path: '../.env' });

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Endpoint to get today's meals
app.get('/api/getTodayMeals', async (req, res) => {
  try {
    const result = await db.query(`
      SELECT meal_id, type, datetime, user_id
      FROM meal
      WHERE datetime::date = CURRENT_DATE
    `);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

// Endpoint to get meal by ID
app.get('/api/getMealbyId', async (req, res) => {
  const { id } = req.query;
  try {
    const result = await db.query(`
      SELECT i.name, mi.amount, i.unit_name
      FROM meal_includes_ingredient mi
      JOIN ingredient i ON mi.ingredient_id = i.ingredient_id
      WHERE mi.meal_id = $1
    `, [id]);
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

// Endpoint to get nutrient count for ingredients
app.post('/api/getNutrientCount', async (req, res) => {
  const { ingredients } = req.body;
  try {
    const ingredientNames = ingredients.map(ingredient => ingredient.name);
    const ingredientAmounts = ingredients.map(ingredient => ingredient.amount);

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

    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

// Endpoint to create a meal
app.post('/api/createMeal', async (req, res) => {
  const { type, datetime = new Date(), user_id, ingredients } = req.body;
  try {
    const mealResult = await db.query(`
      INSERT INTO meal (type, datetime, user_id)
      VALUES ($1, $2, $3)
      RETURNING meal_id
    `, [type, datetime, user_id]);

    const meal_id = mealResult.rows[0].meal_id;

    const ingredientQueries = ingredients.map(ingredient => {
      return db.query(`
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        VALUES ($1, (SELECT ingredient_id FROM ingredient WHERE name = $2), $3)
      `, [meal_id, ingredient.name, ingredient.amount]);
    });

    await Promise.all(ingredientQueries);

    res.status(201).json({ meal_id });
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

// Endpoint to update a meal
app.put('/api/updateMeal', async (req, res) => {
  const { meal_id, type, datetime, user_id, ingredients } = req.body;
  try {
    await db.query(`
      UPDATE meal
      SET type = $1, datetime = $2, user_id = $3
      WHERE meal_id = $4
    `, [type, datetime, user_id, meal_id]);

    await db.query(`
      DELETE FROM meal_includes_ingredient
      WHERE meal_id = $1
    `, [meal_id]);

    const ingredientQueries = ingredients.map(ingredient => {
      return db.query(`
        INSERT INTO meal_includes_ingredient (meal_id, ingredient_id, amount)
        VALUES ($1, (SELECT ingredient_id FROM ingredient WHERE name = $2), $3)
      `, [meal_id, ingredient.name, ingredient.amount]);
    });

    await Promise.all(ingredientQueries);

    res.status(200).send('Meal updated successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

// Endpoint to delete a meal
app.delete('/api/deleteMeal', async (req, res) => {
  const { meal_id } = req.body;
  try {
    await db.query(`
      DELETE FROM meal
      WHERE meal_id = $1
    `, [meal_id]);

    res.status(200).send('Meal deleted successfully');
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});