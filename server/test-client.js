const axios = require('axios');
const baseURL = 'http://localhost:3000/api';
const { Client } = require('pg');
const fs = require('fs');
const path = require('path');
const { response } = require('express');


// Create output directory
const outputDir = path.join(__dirname, 'test-client-output');
if (!fs.existsSync(outputDir)) {
  fs.mkdirSync(outputDir);
}

function saveToFile(filename, data) {
  fs.writeFileSync(path.join(outputDir, filename), JSON.stringify(data, null, 2));
}


// Create a test user
require('dotenv').config({ path: '../.env' });

const client = new Client({
  connectionString: process.env.DATABASE_URL,
});

async function createUser() {
  await client.connect();
  const result = await client.query(`
    INSERT INTO users (user_name, gender, hashed_pw, current_weight, target_weight, timeframe)
    VALUES ('test_user', 'M', 'password123', 70.0, 65.0, 7)
    RETURNING user_id
  `);
  await client.end();
  return result.rows[0].user_id;
}


// Function to test GET endpoint for today's meals
async function testGetTodayMeals(userId) {
  try {
    const response = await axios.get(`${baseURL}/getTodayMeals`, {
      params: { user_id: userId }
    });
    console.log('GET /getTodayMeals Response:', {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
    saveToFile('getTodayMealsResponse.json', response);
  } catch (error) {
    console.error('Error with GET /getTodayMeals request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile('getTodayMealsError.json', error);
  }
}

// Function to test GET endpoint for meal by ID
async function testGetMealById(meal_id) {
  try {
    const response = await axios.get(`${baseURL}/getMealbyId`, {
      params: { meal_id }
    });
    console.log(`GET /getMealbyId Response for meal ID ${meal_id}:`, {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
    saveToFile(`getMealByIdResponse_${meal_id}.json`, response);
  } catch (error) {
    console.error(`Error with GET /getMealbyId request for meal ID ${meal_id}:`, {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile(`getMealByIdError_${meal_id}.json`, error);
  }
}

// Function to test POST endpoint for nutrient count
async function testGetNutrientCount(ingredients) {
  try {
    const response = await axios.post(`${baseURL}/getNutrientCount`, {
      ingredients
    });
    console.log('POST /getNutrientCount Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
    saveToFile('getNutrientCountResponse.json', response);
  } catch (error) {
    console.error('Error with POST /getNutrientCount request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile('getNutrientCountError.json', error);
  }
}

// Function to test POST endpoint for creating a meal
async function testCreateMeal(type, user_id, ingredients, datetime = new Date(), aggregate = false) {
  try {
    const response = await axios.post(`${baseURL}/createMeal`, {
      type,
      datetime,
      user_id,
      ingredients,
      aggregate
    });
    console.log(`POST /createMeal Response for ${type}:`, {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
    return response.data.meal_id;
  } catch (error) {
    console.error(`Error with POST /createMeal request for ${type}:`, {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}

// Function to test PUT endpoint for updating a meal
async function testUpdateMeal(meal_id, type, ingredients, datetime, user_id) {
  try {
    const response = await axios.put(`${baseURL}/updateMeal`, {
      meal_id,
      type,
      datetime,
      user_id,
      ingredients
    });
    console.log('PUT /updateMeal Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
    saveToFile(`updateMealResponse_${meal_id}.json`, response);
  } catch (error) {
    console.error('Error with PUT /updateMeal request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile(`updateMealError_${meal_id}.json`, error);
  }
}

// Function to test DELETE endpoint for deleting a meal
async function testDeleteMeal(meal_id) {
  try {
    const response = await axios.delete(`${baseURL}/deleteMeal`, {
      data: { meal_id }
    });
    console.log('DELETE /deleteMeal Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
    saveToFile(`deleteMealResponse_${meal_id}.json`, response);
  } catch (error) {
    console.error('Error with DELETE /deleteMeal request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile(`deleteMealError_${meal_id}.json`, error);
  }
}

// Function to test GET endpoint for getting recipes by ingredients
async function testGetRecipes(ingredients, requireAllIngredients) {
  try {
    const response = await axios.get(`${baseURL}/getRecipes`, {
      params: {
        ingredients,
        requireAllIngredients,
      }
    });
    console.log('GET /getRecipes Response:', {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
    saveToFile(`getRecipesResponse_${Date.now()}.json`, response);
  } catch (error) {
    console.error('Error with GET /getRecipes request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
    saveToFile(`getRecipesError_${Date.now()}.json`, error);
  }
}


// Function to pause and wait for user input
function pause(message) {
  return new Promise((resolve) => {
    console.log(message);
    const onData = (key) => {
      if (key.toString().toLowerCase() === 'c') {
        process.stdin.setRawMode(false);
        process.stdin.pause();
        process.stdin.removeListener('data', onData);
        resolve();
      }
    };
    process.stdin.setRawMode(true);
    process.stdin.resume();
    process.stdin.on('data', onData);
  });
}


// Run the tests
(async () => {
  const userId = await createUser();
  console.log(`Created user with ID ${userId}`);

  let meal1Id, meal2Id, meal3Id, meal4Id;

  await pause('\nPress "C" to create a meal with duplicate ingredients without aggregate (should get status code 400)...');
  meal1Id = await testCreateMeal('Snack', userId, [
    { name: 'carrot', amount: 100 },
    { name: 'carrot', amount: 200 },
    { name: 'apple', amount: 200 }
  ]);

  await pause('\nPress "C" to create a meal with duplicate ingredients with aggregate (should get status code 201)...');
  meal2Id = await testCreateMeal('Snack', userId, [
    { name: 'carrot', amount: 100 },
    { name: 'carrot', amount: 200 },
    { name: 'apple', amount: 200 }
  ], new Date(), true);

  await pause('\nPress "C" to create another valid meal with today\'s date (should get status code 201)...');
  meal3Id = await testCreateMeal('Lunch', userId, [
    { name: 'asparagus', amount: 400 }
  ]);

  await pause('\nPress "C" to create a valid meal with yesterday\'s date (should get status code 201)...');
  meal4Id = await testCreateMeal('Yesterday Dinner', userId, [
    { name: 'banana', amount: 600 },
    { name: 'broccoli', amount: 500 }
  ], new Date(Date.now() - 86400000));

  await pause('\nPress "C" to get today\'s meals (should get status code 200: 1 snack and 1 lunch, no yesterday dinner)...');
  await testGetTodayMeals(userId);

  await pause('\nPress "C" to create a meal with non-existent ingredients (should get status code 400)...');
  await testCreateMeal('Snack', userId, [
    { name: 'invalidIngredient1', amount: 100 },
    { name: 'apple', amount: 200 }
  ]);

  await pause(`\nPress "C" to update meal with ID ${meal2Id} with new ingredients (should get status code 200)...`);
  await testUpdateMeal(meal2Id, 'Updated Breakfast', [
    { name: 'carrot', amount: 150 },
    { name: 'bacon', amount: 250 }
  ]);

  await pause('\nPress "C" to update a non-existent meal (should get status code 404)...');
  await testUpdateMeal(9999, 'Non-existent Meal', [
    { name: 'beef', amount: 150 },
    { name: 'bacon', amount: 250 }
  ]);

  await pause(`\nPress "C" to get meal with ID ${meal2Id} (should get status code 200)...`);
  await testGetMealById(meal2Id);

  await pause('\nPress "C" to get meal by invalid ID (should get status code 404)...');
  await testGetMealById(9999);

  await pause('\nPress "C" to get nutrient count for valid ingredients (should get status code 200)...');
  await testGetNutrientCount([
    { name: 'apple', amount: 100 },
    { name: 'beef', amount: 200 },
    { name: 'apple', amount: 300 },
  ]);

  await pause('\nPress "C" to get nutrient count for invalid ingredients (should get status code 400)...');
  await testGetNutrientCount([
    { name: 'apple', amount: 100 },
    { name: 'invalidIngredient1', amount: 200 }
  ]);

  await pause('\nPress "C" to get nutrient count for empty ingredients (should get status code 400)...');
  await testGetNutrientCount([]);

  await pause(`\nPress "C" to delete meal with ID ${meal2Id} (should get status code 200)...`);
  await testDeleteMeal(meal2Id);

  await pause(`\nPress "C" to delete meal with ID ${meal2Id} again (should get status code 404)...`);
  await testDeleteMeal(meal2Id);

  await pause('\nPress "C" to delete meal without providing a meal ID (should get status code 400)...');
  await testDeleteMeal();

  await pause('\nPress "C" to get recipes for valid ingredients with requireAllIngredients=true (should get status code 200)...');
  await testGetRecipes('apple,tomato', true);

  await pause('\nPress "C" to get recipes for valid ingredients with requireAllIngredients=false (should get status code 200)...');
  await testGetRecipes('apple,tomato', '0');

  await pause('\nPress "C" to get all recipes by not specifying ingredients (should get status code 200)...');
  await testGetRecipes('', 1);

  await pause('\nPress "C" to get recipes for invalid ingredients (should get status code 400)...');
  await testGetRecipes('invalidIngredient1,invalidIngredient2', 'fAlSe');

  console.log('\nAll tests completed.');
})();