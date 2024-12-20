const axios = require('axios');
const jwt = require('jsonwebtoken');

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

// Get the port and domain name for the server
const domainName = process.env.HEROKU_APP_DEFAULT_DOMAIN_NAME || 'localhost';
const protocol = domainName === 'localhost' ? 'http' : 'https';
const PORT = process.env.PORT || 3000;
const baseURL = `${protocol}://${domainName}:${PORT}/api`;


// Function to POST endpoint for signing up a new user
async function testSignUp(username, password, gender) {
  try {
    const response = await axios.post(`${baseURL}/signUp`, {
      username,
      password,
      gender
    });
    console.log('POST /signUp Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
    return response.data;
  } catch (error) {
    console.error('Error with POST /signUp request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}


// Function to test POST endpoint for logging in
async function testLogIn(username, password) {
  try {
    const response = await axios.post(`${baseURL}/logIn`, {
      username,
      password
    });
    console.log('POST /logIn Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });

    const token = response.data.token;
    const decodedToken = jwt.decode(token);
    const userId = decodedToken.userId;

    console.log('Decoded Token:', decodedToken);
    console.log('User ID:', userId);

    return { token, userId };
  } catch (error) {
    console.error('Error with POST /logIn request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}


// Function to test GET endpoint for today's meals
async function testGetTodayMeals(token) {
  try {
    const response = await axios.get(`${baseURL}/getTodayMeals`, {
      headers: token ? { Authorization: `Bearer ${token}` } : undefined
    });
    console.log('GET /getTodayMeals Response:', {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
  } catch (error) {
    console.error('Error with GET /getTodayMeals request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}

// Function to test GET endpoint for meal by ID
async function testGetMealById(meal_id, token) {
  try {
    const response = await axios.get(`${baseURL}/getMealbyId`, {
      params: { meal_id },
      headers: token ? { Authorization: `Bearer ${token}` } : undefined
    });
    console.log(`GET /getMealbyId Response for meal ID ${meal_id}:`, {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
  } catch (error) {
    console.error(`Error with GET /getMealbyId request for meal ID ${meal_id}:`, {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}

// Function to test POST endpoint for creating a meal
async function testCreateMeal(type, ingredients, token, datetime = new Date(), aggregate = false) {
  try {
    const response = await axios.post(`${baseURL}/createMeal`, {
      type,
      datetime,
      ingredients,
      aggregate
    }, {
      headers: token ? { Authorization: `Bearer ${token}` } : undefined
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
async function testUpdateMeal(meal_id, type, ingredients, token, datetime) {
  try {
    const response = await axios.put(`${baseURL}/updateMeal`, {
      meal_id,
      type,
      datetime,
      ingredients
    }, {
      headers: token ? { Authorization: `Bearer ${token}` } : undefined
    });
    console.log('PUT /updateMeal Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
  } catch (error) {
    console.error('Error with PUT /updateMeal request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}

// Function to test DELETE endpoint for deleting a meal
async function testDeleteMeal(meal_id, token) {
  try {
    const response = await axios.delete(`${baseURL}/deleteMeal`, {
      data: { meal_id },
      headers: token ? { Authorization: `Bearer ${token}` } : undefined
    });
    console.log('DELETE /deleteMeal Response:', {
      data: response.data,
      status: response.status,
      statusText: response.statusText
    });
  } catch (error) {
    console.error('Error with DELETE /deleteMeal request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
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
  } catch (error) {
    console.error('Error with POST /getNutrientCount request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
  }
}

// Function to test GET endpoint for getting recipes by ingredients
async function testGetRecipes(ingredients, ingredientMatchType) {
  try {
    const response = await axios.get(`${baseURL}/getRecipes`, {
      params: {
        ingredients,
        ingredientMatchType: ingredientMatchType,
      }
    });
    console.log('GET /getRecipes Response:', {
      data: JSON.stringify(response.data, null, 2),
      status: response.status,
      statusText: response.statusText
    });
  } catch (error) {
    console.error('Error with GET /getRecipes request:', {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status
    });
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
  const username = `user${new Date().getTime()}`;
  const password = 'password123';

  await pause('\nPress "C" to sign up a new user (should get status code 201)...');
  await testSignUp(username, password, "M");

  await pause('\nPress "C" to sign up the same user again (should get status code 409)...');
  await testSignUp(username, password, "F");

  await pause('\nPress "C" to log in with the wrong password (should get status code 401)...');
  await testLogIn(username, 'wrongPassword');

  await pause('\nPress "C" to log in with the correct password (should get status code 200)...');
  const { token, userId } = await testLogIn(username, password);

  let meal1Id, meal2Id, meal3Id, meal4Id, meal5Id, meal6Id, meal7Id;

  await pause('\nPress "C" to create a meal with duplicate ingredients without aggregate (should get status code 400)...');
  meal1Id = await testCreateMeal('Snack', [
    { name: 'carrot', amount: 100 },
    { name: 'carrot', amount: 200 },
    { name: 'apple', amount: 200 }
  ], token);

  await pause('\nPress "C" to create a meal with duplicate ingredients with aggregate (should get status code 201)...');
  meal2Id = await testCreateMeal('Snack', [
    { name: 'carrot', amount: 100 },
    { name: 'carrot', amount: 200 },
    { name: 'apple', amount: 200 }
  ], token, new Date(), true);

  await pause('\nPress "C" to create another valid meal with today\'s date (should get status code 201)...');
  meal3Id = await testCreateMeal('Lunch', [
    { name: 'asparagus', amount: 400 }
  ], token);

  const yesterdayTimestamp = new Date(Date.now() - 86400000);
  await pause('\nPress "C" to create a valid meal with yesterday\'s date (should get status code 201)...');
  meal4Id = await testCreateMeal('Yesterday Dinner', [
    { name: 'banana', amount: 600 },
    { name: 'broccoli', amount: 500 }
  ], token, yesterdayTimestamp);

  await pause('\nPress "C" to create another meal like Yesterday Dinner but with datetime added or substracted by 10 seconds such that minute is not changed (should get status code 409)...');
  meal5Id = await testCreateMeal(
    'Yesterday Dinner',
    [{ name: 'banana', amount: 600 }],
    token,
    new Date(yesterdayTimestamp.getMinutes() < 30 ? yesterdayTimestamp.getTime() + 10000 : yesterdayTimestamp.getTime() - 10000)
  );

  await pause('\nPress "C" to create a meal without providing a token (should get status code 401)...');
  meal6Id = await testCreateMeal('Yesterday Dinner', [
    { name: 'banana', amount: 600 },
    { name: 'broccoli', amount: 500 }
  ], undefined, yesterdayTimestamp, true);

  await pause('\nPress "C" to create a meal with an invalid token (should get status code 403)...');
  meal7Id = await testCreateMeal('Another Dinner Today', [
    { name: 'banana', amount: 600 },
    { name: 'broccoli', amount: 500}
  ], 'invalidToken');

  await pause('\nPress "C" to get today\'s meals (should get status code 200: 1 snack and 1 lunch, no yesterday dinner)...');
  await testGetTodayMeals(token);

  await pause('\nPress "C" to create a meal with non-existent ingredients (should get status code 400)...');
  await testCreateMeal('Snack', [
    { name: 'invalidIngredient1', amount: 100 },
    { name: 'apple', amount: 200 }
  ], token);

  await pause(`\nPress "C" to update meal with ID ${meal2Id} with new ingredients (should get status code 200)...`);
  await testUpdateMeal(meal2Id, 'Updated Breakfast', [
    { name: 'carrot', amount: 150 },
    { name: 'bacon', amount: 250 }
  ], token);

  await pause('\nPress "C" to update a non-existent meal (should get status code 404)...');
  await testUpdateMeal(9999, 'Non-existent Meal', [
    { name: 'beef', amount: 150 },
    { name: 'bacon', amount: 250 }
  ], token);

  await pause(`\nPress "C" to get meal with ID ${meal2Id} (should get status code 200)...`);
  await testGetMealById(meal2Id, token);

  await pause('\nPress "C" to get meal by invalid ID (should get status code 404)...');
  await testGetMealById(9999, token);

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
  await testDeleteMeal(meal2Id, token);

  await pause(`\nPress "C" to delete meal with ID ${meal2Id} again (should get status code 404)...`);
  await testDeleteMeal(meal2Id, token);

  await pause('\nPress "C" to delete meal without providing a meal ID (should get status code 400)...');
  await testDeleteMeal(undefined, token);

  await pause('\nPress "C" to get recipes for valid ingredients with ingredientMatchType="all" (should get status code 200)...');
  await testGetRecipes('chicken breast,green pepper,lemon', 'all');

  await pause('\nPress "C" to get recipes for valid ingredients with ingredientMatchType="any" (should get status code 200)...');
  await testGetRecipes('chicken breast', 'any');

  await pause('\nPress "C" to get recipes for valid ingredients with ingredientMatchType not defined (should get status code 200)...');
  await testGetRecipes('chicken breast,green pepper,lemon,tuna,pork rib,carrot,onion');

  await pause('\nPress "C" to get recipes for invalid ingredients (should get status code 400)...');
  await testGetRecipes('invalidIngredient1,carrot');

  console.log('\nAll tests completed.');
})();