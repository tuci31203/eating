export const transformTodayMeals = (meals) => {
  // Initialize default structure with empty values
  const defaultStructure = {
    breakfast: { mealId: 1, ingredients: "" },
    lunch: { mealId: 2, ingredients: "" },
    dinner: { mealId: 3, ingredients: "" },
    snack: { mealId: 4, ingredients: "" },
  };

  // Reduce the meals array into the desired format
  return meals.reduce((acc, meal) => {
    // Extract ingredients names and join them with commas
    const ingredientsList = meal.ingredients.map((ing) => ing.name).join(", ");

    // Update the corresponding meal type
    acc[meal.type] = {
      mealId: meal.meal_id,
      ingredients: ingredientsList,
    };

    return acc;
  }, defaultStructure);
};
