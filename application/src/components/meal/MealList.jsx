import { StyleSheet, Text, View } from "react-native";
import React, { useContext, useEffect, useState } from "react";
import Meal from "./Meal";
import { StateContext } from "../../context/StateContext";
import { getTodayMealsApi } from "../../configs/networking/server-api/meal/getToday";

const MealList = () => {
  const { dayInfo, setDayInfo } = useContext(StateContext);
  const mock = {
    breakfast: {
      mealId: 1,
      ingredients: "Oats, Milk, Banana",
    },
    lunch: {
      mealId: 3,
      ingredients: "Pork, Noodle, Lettuce, Chilli, Carrot, Raddish, Orange",
    },
    dinner: {
      mealId: 4,
      ingredients: "",
    },
    snack: {
      mealId: 2,
      ingredients: "Potato, Tomato, Beef",
    },
  };
  const [meals, setMeals] = useState({
    breakfast: { mealId: 1, ingredients: "" },
    lunch: { mealId: 2, ingredients: "" },
    dinner: { mealId: 3, ingredients: "" },
    snack: { mealId: 4, ingredients: "" },
  });

  const getMeals = async () => {
    const res = await getTodayMealsApi();
    if (res) {
      console.log("Meals>>>", res);
      const meall = res.reduce(
        (acc, meal) => {
          acc[meal.type] = {
            mealId: meal.meal_id,
            ingredients: meal.ingredients.map((ing) => ing.name).join(", "),
          };
          return acc;
        },
        {
          breakfast: { mealId: null, ingredients: "" },
          lunch: { mealId: null, ingredients: "" },
          dinner: { mealId: null, ingredients: "" },
          snack: { mealId: null, ingredients: "" },
        }
      );
      setMeals(meall);
    }
  };
  useEffect(() => {
    getMeals();
    console.log("WHATTT");
  }, []);

  return (
    <View style={styles.container}>
      <Meal
        onChange={getMeals}
        name="Breakfast"
        list={meals.breakfast.ingredients}
        id={meals.breakfast.mealId}
      />
      <Meal
        onChange={getMeals}
        name="Lunch"
        list={meals.lunch.ingredients}
        id={meals.lunch.mealId}
      />
      <Meal
        onChange={getMeals}
        name="Dinner"
        list={meals.dinner.ingredients}
        id={meals.dinner.mealId}
      />
      <Meal
        onChange={getMeals}
        name="Snacks"
        list={meals.snack.ingredients}
        id={meals.snack.mealId}
      />
    </View>
  );
};

export default MealList;

const styles = StyleSheet.create({
  container: {
    marginBottom: 100,
  },
});
