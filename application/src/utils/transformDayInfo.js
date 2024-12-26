export const transformResults = (results) => {
  const transformed = {
    nutrients: {
      calory: 0,
      fat: 0,
      carbs: 0,
      water: 0,
      sugar: 0,
      protein: 0,
      fiber: 0,
    },
    meals: {
      breakfast: "",
      lunch: "",
      dinner: "",
      snacks: "",
    },
  };

  results.forEach((meal) => {
    meal.nutrients.forEach((nutrient) => {
      if (transformed.nutrients[nutrient.name] !== undefined) {
        transformed.nutrients[nutrient.name] += nutrient.amount;
      }
    });

    if (transformed.meals[meal.type] !== undefined) {
      const ingredientsList = meal.ingredients
        .map((ingredient) => ingredient.name)
        .join(", ");
      transformed.meals[meal.type] = transformed.meals[meal.type]
        ? `${transformed.meals[meal.type]}, ${ingredientsList}`
        : ingredientsList;
    }
  });

  Object.keys(transformed.nutrients).forEach((key) => {
    transformed.nutrients[key] = Math.round(transformed.nutrients[key]);
  });

  return transformed;
};

export const noInfo = {
  nutrients: {
    calory: 0,
    fat: 0,
    carbs: 0,
    water: 0,
    sugar: 0,
    protein: 0,
    fiber: 0,
  },
  meals: {
    breakfast: "",
    lunch: "",
    dinner: "",
    snacks: "",
  },
};
