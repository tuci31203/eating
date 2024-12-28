import { StyleSheet, Text, View } from "react-native";
import React, { useCallback, useContext, useEffect, useState } from "react";
import IngredientList from "../../components/ingredient/IngredientList";
import CameraButton from "../../components/camera-button/CameraButton";
import { StateContext } from "../../context/StateContext";
import { useRoute } from "@react-navigation/native";
import { Button, GreetText, ScreenView, Xmark } from "../../components";
import { getMealByIdApi } from "../../configs/networking/server-api/meal/getMealById";
import { COLORS } from "../../configs/constants/colors";

const IngredientScreen = ({ navigation, route }) => {
  // const [ingredients, setIngredients] = useState(defaultIngredients)
  const {
    selectedIngredients,
    setSelectedIngredients,
    ingredients,
    setIngredients,
    defaultIngredients,
  } = useContext(StateContext);
  const [mealId, setMealId] = useState(() => {
    return route.params?.id ? route.params.id : null;
  });
  const [initMeal, setInitMeal] = useState({});
  const [mealType, setMealType] = useState("");

  useEffect(() => {
    console.log("INGREDIENT SCREEN changes >>> ");
    // setIngredients(defaultIngredients)
    console.log("MEAL ID >>> ", mealId);
    if (mealId) {
      getMealById();
      return;
    }
    setMealType("");
  }, []);

  const getMealById = async () => {
    const res = await getMealByIdApi(mealId);
    if (res) {
      console.log(res);
      setInitMeal(res);
      const initIngre = res.ingredients.map((each, index) => ({
        id: index,
        name: each.name,
        amount: each.amount.toString(),
        unit: "g",
        chosen: true,
      }));
      setMealType(res.type);
      console.log(initIngre);
      setIngredients(initIngre);
    }
  };

  const selectIngredients = () => {
    setIngredients((prev) =>
      prev.map((each) => ({ ...each, name: each.name.trim() }))
    );
    const selected = ingredients
      .filter((each) => each.chosen === true)
      .map(({ chosen, ...rest }) => rest);
    if (selected.length > 0) {
      setSelectedIngredients(selected);
      // console.log(selected)
      navigation.navigate("confirm", {
        mealId: mealId,
        mealType: initMeal.type,
      });
    }
  };

  const searchRecipes = () => {
    navigation.navigate("recipes");
  };

  return (
    <>
      <ScreenView>
        <GreetText>Ingredients 🍗</GreetText>
        <Xmark />
        <View style={styles.ingreContainer}>
          {mealId && <Text style={styles.meal}>{mealType}</Text>}
          <IngredientList
            ingredients={ingredients}
            setIngredients={setIngredients}
          />
        </View>
      </ScreenView>
      {!mealId && (
        <Button
          title={"Recipes"}
          variant="default"
          style={[styles.botBut, { left: 40 }]}
          onPress={searchRecipes}
        />
      )}
      <Button
        title={mealId ? "Next" : "Add"}
        variant="action"
        style={[styles.botBut, { right: 52 }]}
        onPress={selectIngredients}
      />
      {!mealId && <CameraButton />}
    </>
  );
};

export default IngredientScreen;

const styles = StyleSheet.create({
  botBut: {
    position: "absolute",
    bottom: 73,
  },
  ingreContainer: {
    marginHorizontal: 30,
    marginTop: 27,
    flex: 1,
    marginBottom: 336,
  },
  meal: {
    textAlign: "center",
    fontFamily: "Inter-Black",
    fontSize: 18,
    color: COLORS.undertone,
  },
});
