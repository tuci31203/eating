import { StyleSheet, Text, View } from "react-native";
import React, { useContext, useEffect, useState } from "react";
import Meal from "./Meal";
import { StateContext } from "../../context/StateContext";
import { getTodayMealsApi } from "../../configs/networking/server-api/meal/getToday";
import { transformTodayMeals } from "../../utils/transformTodayInfo";

const MealList = ({ ScrollViewRef }) => {
  const mealTypes = ["breakfast", "lunch", "dinner", "snack"];
  const { todayMeals, setTodayMeals, defaultToday } = useContext(StateContext);
  const [meals, setMeals] = useState({
    breakfast: { mealId: 1, ingredients: "" },
    lunch: { mealId: 2, ingredients: "" },
    dinner: { mealId: 3, ingredients: "" },
    snack: { mealId: 4, ingredients: "" },
  });

  const getMeals = async () => {
    const res = await getTodayMealsApi();
    if (res) {
      console.log("TODAY Meals>>>", res);
      // const meall = res.reduce(
      //   (acc, meal) => {
      //     acc[meal.type] = {
      //       mealId: meal.meal_id,
      //       ingredients: meal.ingredients.map((ing) => ing.name).join(", "),
      //     };
      //     return acc;
      //   },
      //   {
      //     breakfast: { mealId: null, ingredients: "" },
      //     lunch: { mealId: null, ingredients: "" },
      //     dinner: { mealId: null, ingredients: "" },
      //     snack: { mealId: null, ingredients: "" },
      //   }
      // );
      const meall = transformTodayMeals(res);
      console.log("TODAY Meals TRANSFORMED>>>", meall);

      setTodayMeals((prevMeals) => ({
        ...prevMeals,
        ...mealTypes.reduce(
          (acc, type) => ({
            ...acc,
            [type]: meall[type].ingredients !== "",
          }),
          {}
        ),
      }));
      setMeals(meall);
    }
  };
  useEffect(() => {
    getMeals();
    console.log("WHATTT");
  }, []);

  const handleSnacksOpen = () => {
    // Add a small delay to ensure the meal has expanded
    setTimeout(() => {
      ScrollViewRef.current?.scrollToEnd({ animated: true });
    }, 100);
  };

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
        ScrollViewRef={handleSnacksOpen}
      />
    </View>
  );
};

export default MealList;

const styles = StyleSheet.create({
  container: {
    marginBottom: 130,
    // marginBottom: 100,
  },
});
