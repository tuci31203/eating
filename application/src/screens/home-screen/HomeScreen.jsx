import { Dimensions, StyleSheet, View } from "react-native";
import React, { useContext, useEffect } from "react";
import { ScrollView } from "react-native";
import Carousel from "../../components/chart/Carousel";
import MealList from "../../components/meal/MealList";
import { GreetText, ScreenView } from "../../components";
import { StateContext } from "../../context/StateContext";
import { getAllIngredients } from "../../configs/networking/server-api/ingredients/getAllIngredients";
const { width, height } = Dimensions.get("screen");

const HomeScreen = () => {
  const { allIngredients, setAllIngredients } = useContext(StateContext);
  useEffect(() => {
    const fetchIngredients = async () => {
      const res = await getAllIngredients();
      setAllIngredients(res);
    };
    fetchIngredients();
  }, []);
  return (
    <ScreenView>
      <ScrollView>
        <View style={{ gap: 38 }}>
          <GreetText>What do you eat today?</GreetText>
          <Carousel />
          <MealList />
        </View>
      </ScrollView>
    </ScreenView>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({});
