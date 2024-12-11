import { StyleSheet, Text, View } from "react-native";
import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import { NavigationContainer } from "@react-navigation/native";
import IngredientScreen from "../../screens/ingredient-screen/IngredientScreen";
import IngredientConfirmScreen from "../../screens/ingredient-confirm-screen/IngredientConfirmScreen";
import RecipeScreen from "../../screens/recipes-screen/RecipeScreen";

const Stack = createStackNavigator();

const SnackIngredient = ({ navigation, route }) => {
  return (
    <Stack.Navigator
      initialRouteName="ingre"
      screenOptions={{ headerShown: false }}
    >
      <Stack.Screen
        name="ingre"
        component={IngredientScreen}
        initialParams={route.params}
      />
      <Stack.Screen name="confirm" component={IngredientConfirmScreen} />
      <Stack.Screen name="recipes" component={RecipeScreen} />
    </Stack.Navigator>
  );
};

export default SnackIngredient;

const styles = StyleSheet.create({});
