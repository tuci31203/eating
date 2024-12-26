import { ScrollView, StyleSheet, Text, View } from "react-native";
import React, { useContext } from "react";
import ScreenView from "../../components/ScreenView";
import GreetText from "../../components/GreetText";
import MyCalendar from "../../components/calendar/Calendar";
import NutrientGroup from "../../components/nutrient-icons/NutrientGroup";
import MealList from "../../components/meals-a-day/MealList";
import { StateContext } from "../../context/StateContext";

const RecordScreen = () => {
  // const res = {
  //     nutrients: {
  //         calory: 2000,
  //         fat: 280,
  //         carbs: 800,
  //         water: 2400,
  //         sugar: 500,
  //         protein: 900,
  //         fiber: 900,
  //     },
  //     meals: {
  //         breakfast: "bread, pork, cheese, lettuce, tomato, egg, milk",
  //         lunch: "noodle, beef, onion, cilantro, quail egg, bread, rice",
  //         dinner: "chicken, chili, carrot, broccoli, potato, cream, cheese, orange, pineapple",
  //         snacks: "apple, pineapple, banana, potato, bread"
  //     }
  // }
  const { dayInfo } = useContext(StateContext);
  const res = dayInfo;
  return (
    <ScreenView>
      <ScrollView>
        <GreetText>Your intake record</GreetText>
        <MyCalendar />
        <NutrientGroup nutrients={res.nutrients} />
        <MealList meals={res.meals} />
      </ScrollView>
    </ScreenView>
  );
};

export default RecordScreen;

const styles = StyleSheet.create({});
