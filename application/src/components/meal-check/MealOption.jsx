import { StyleSheet, Text, View } from "react-native";
import React, { useContext } from "react";
import Button from "../Button";
import { StateContext } from "../../context/StateContext";

const MealOption = ({ meal, setMeal }) => {
  const { todayMeals, setTodayMeals, defaultToday } = useContext(StateContext);

  return (
    <View style={styles.container}>
      <Button
        variant={meal === "breakfast" ? "mealAct" : "mealDef"}
        onPress={() => setMeal("breakfast")}
        title={"Breakfast"}
        disabled={todayMeals.breakfast}
      />
      <Button
        variant={meal === "lunch" ? "mealAct" : "mealDef"}
        onPress={() => setMeal("lunch")}
        title={"Lunch"}
        disabled={todayMeals.lunch}
      />
      <Button
        variant={meal === "dinner" ? "mealAct" : "mealDef"}
        onPress={() => setMeal("dinner")}
        title={"Dinner"}
        disabled={todayMeals.dinner}
      />
      <Button
        variant={meal === "snack" ? "mealAct" : "mealDef"}
        onPress={() => setMeal("snack")}
        title={"Snack"}
        disabled={todayMeals.snack}
      />
    </View>
  );
};

export default MealOption;

const styles = StyleSheet.create({
  container: {
    position: "absolute",
    right: 8,
    bottom: 151,
    width: 130,
    height: 271,
    justifyContent: "space-between",
    alignItems: "flex-start",
  },
});
