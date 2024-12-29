import { Dimensions, StyleSheet, View } from "react-native";
import React, { useContext, useEffect, useRef } from "react";
import { ScrollView } from "react-native";
import Carousel from "../../components/chart/Carousel";
import MealList from "../../components/meal/MealList";
import { GreetText, ScreenView } from "../../components";
import { StateContext } from "../../context/StateContext";
import { getAllIngredients } from "../../configs/networking/server-api/ingredients/getAllIngredients";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { goal } from "../../utils/defaultValues";
import { getMealsFromTo } from "../../configs/networking/server-api/meal/getMealFromTo";
import { getDateApi } from "../../utils/getDateApi";
import { formatNutrientData } from "../../utils/transformWeekTrackGoal";
const { width, height } = Dimensions.get("screen");

const HomeScreen = () => {
  const { allIngredients, setAllIngredients, track, setTrack } =
    useContext(StateContext);
  const ScrollViewRef = useRef(null);
  useEffect(() => {
    const fetchIngredients = async () => {
      const res = await getAllIngredients();
      setAllIngredients(res);
    };
    fetchIngredients();
    setInitialGoals();
    getTrack();
  }, []);
  const getTrack = async () => {
    const weeek = getDateApi();
    const res = await getMealsFromTo(weeek.start_time, weeek.end_time);
    // console.log("Track:", formatNutrientData(res));
    setTrack(formatNutrientData(res));
  };
  const setInitialGoals = async () => {
    const g = await AsyncStorage.getItem("goal");
    console.log("Goal:", g);
    if (!g) {
      await AsyncStorage.setItem("goal", JSON.stringify(goal));
    }
  };
  return (
    <ScreenView>
      <ScrollView ref={ScrollViewRef} showsVerticalScrollIndicator={false}>
        <View style={{ gap: 38 }}>
          <GreetText>What do you eat today?</GreetText>
          <Carousel />
          <MealList ScrollViewRef={ScrollViewRef} />
        </View>
      </ScrollView>
    </ScreenView>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({});
