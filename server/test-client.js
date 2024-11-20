const axios = require('axios');
const baseURL = 'http://localhost:3000/api';

let meal1Id, meal2Id;

// Function to test GET endpoint for today's meals
async function testGetTodayMeals() {
  try {
    const response = await axios.get(`${baseURL}/getTodayMeals`);
    console.log('GET /getTodayMeals Response:', response.data);
  } catch (error) {
    console.error('Error with GET /getTodayMeals request:', error.response ? error.response.status : error.message);
  }
}

// Function to test GET endpoint for meal by ID
async function testGetMealById(id) {
  try {
    const response = await axios.get(`${baseURL}/getMealbyId`, {
      params: { id }
    });
    console.log(`GET /getMealbyId Response for meal ID ${id}:`, response.data);
  } catch (error) {
    console.error(`Error with GET /getMealbyId request for meal ID ${id}:`, error.response ? error.response.status : error.message);
  }
}

// Function to test POST endpoint for nutrient count
async function testGetNutrientCount() {
  try {
    const response = await axios.post(`${baseURL}/getNutrientCount`, {
      ingredients: [
        { name: 'ingredient1', amount: 100 },
        { name: 'ingredient2', amount: 200 }
      ] // Replace with actual ingredients and amounts
    });
    console.log('POST /getNutrientCount Response:', response.data);
  } catch (error) {
    console.error('Error with POST /getNutrientCount request:', error.response ? error.response.status : error.message);
  }
}

// Function to test POST endpoint for creating a meal
async function testCreateMeal(type, user_id, ingredients) {
  try {
    const response = await axios.post(`${baseURL}/createMeal`, {
      type,
      datetime: new Date(),
      user_id,
      ingredients
    });
    console.log(`POST /createMeal Response for ${type}:`, response.data);
    return response.data.meal_id;
  } catch (error) {
    console.error(`Error with POST /createMeal request for ${type}:`, error.response ? error.response.status : error.message);
  }
}

// Function to test PUT endpoint for updating a meal
async function testUpdateMeal(meal_id, type, user_id, ingredients) {
  try {
    const response = await axios.put(`${baseURL}/updateMeal`, {
      meal_id,
      type,
      datetime: new Date(),
      user_id,
      ingredients
    });
    console.log('PUT /updateMeal Response:', response.data);
  } catch (error) {
    console.error('Error with PUT /updateMeal request:', error.response ? error.response.status : error.message);
  }
}

// Function to test DELETE endpoint for deleting a meal
async function testDeleteMeal(meal_id) {
  try {
    const response = await axios.delete(`${baseURL}/deleteMeal`, {
      data: { meal_id }
    });
    console.log('DELETE /deleteMeal Response:', response.data);
  } catch (error) {
    console.error('Error with DELETE /deleteMeal request:', error.response ? error.response.status : error.message);
  }
}

// Run the tests
(async () => {
  meal1Id = await testCreateMeal('Breakfast', 1, [
    { name: 'apple', amount: 100 },
    { name: 'almond', amount: 200 }
  ]);

  meal2Id = await testCreateMeal('Lunch', 1, [
    { name: 'avocado', amount: 150 },
    { name: 'asparagus', amount: 250 }
  ]);

  await testGetTodayMeals();
  await testUpdateMeal(meal1Id, 'Updated Breakfast', 1, [
    { name: 'beef', amount: 150 },
    { name: 'bacon', amount: 250 }
  ]);

  await testGetMealById(meal1Id);
  await testGetNutrientCount();

  console.log('Press "d" to delete one of the meals and continue...');
  process.stdin.setRawMode(true);
  process.stdin.resume();
  process.stdin.on('data', async (key) => {
    if (key.toString() === 'd') {
      await testDeleteMeal(meal1Id);
      process.exit();
    }
  });
})();