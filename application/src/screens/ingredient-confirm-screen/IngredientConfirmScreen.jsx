import { StyleSheet, View } from "react-native";
import React, { useContext, useEffect, useState } from "react";
import ScreenView from "../../components/ScreenView";
import GreetText from "../../components/GreetText";
import Xmark from "../../components/navigation/Xmark";
import Button from "../../components/Button";
import { StateContext } from "../../context/StateContext";
import ConfirmList from "../../components/ingredient-confirm/confirmList";
import NutrientContent from "../../components/nutrients/NutrientContent";
import MealOption from "../../components/meal-check/MealOption";
import { createMealApi } from "../../configs/networking/server-api/meal/createMeal";
import { calcNutrients } from "../../configs/networking/server-api/meal/calcNutrient";
import {
  CommonActions,
  useNavigation,
  useRoute,
} from "@react-navigation/native";
import { updateMealApi } from "../../configs/networking/server-api/meal/updateMeal";
import * as Burnt from "burnt";

const IngredientConfirmScreen = () => {
  const route = useRoute();
  const { mealId, mealType } = route.params;
  const navigation = useNavigation();
  // const [ingredients, setIngredients] = useState(defaultIngredients)
  const [meal, setMeal] = useState(() => {
    return mealId ? mealType : "";
  });
  const [nutrients, setNutrients] = useState({
    calory: 0,
    water: 0,
    carbs: 0,
    sugar: 0,
    fiber: 0,
    protein: 0,
    fat: 0,
  });

  const {
    selectedIngredients,
    setSelectedIngredients,
    ingredients,
    defaultIngredients,
    setIngredients,
    todayMeals,
    setTodayMeals,
    defaultToday,
  } = useContext(StateContext);

  useEffect(() => {
    if (mealId) {
      setTodayMeals({
        breakfast: true,
        lunch: true,
        dinner: true,
        snack: true,
      });
    }
  }, []);

  const selectIngredients = async () => {
    // const selected = ingredients.filter(each => each.chosen === true).map(({ id, ...rest }) => rest)
    // setSelectedIngredients(selected)
    console.log("Ấn rồi");
    if (meal === "") {
      Burnt.toast({
        title: "Please select a meal type",
        message: "Please select a meal type",
        type: "error",
      });
      return;
    }
    const currentDate = new Date();
    const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
    const adjustedDate = new Date(currentDate.getTime() + offset);
    const body = {
      type: mealId ? mealType : meal,
      datetime: adjustedDate.toISOString(),
      ingredients: selectedIngredients.map((each) => {
        return { name: each.name.toLowerCase(), amount: each.amount };
      }),
      aggregate: true,
    };
    let res;
    if (mealId) {
      body.meal_id = mealId;
      console.log("BODY >>> ", body);
      res = await updateMealApi(body);
    } else {
      console.log("BODY >>> ", body);
      res = await createMealApi(body);
    }
    if (res && (res.meal_id || res.message)) {
      console.log("SET INGREDIENTS RES >>> ", res);
      setSelectedIngredients([]);
      setIngredients(() => {
        return defaultIngredients;
      });
      setTodayMeals({ defaultToday });

      // navigation.navigate("home");
      // setTimeout(() => {
      //   navigation.dispatch(
      //     CommonActions.reset({
      //       index: 0,
      //       routes: [{ name: "home" }],
      //     })
      //   );
      // }, 100);
      navigation.dispatch(
        CommonActions.reset({
          index: 0,
          routes: [{ name: "home" }],
        })
      );
    }
  };

  const calNutrients = async () => {
    const body = {
      ingredients: selectedIngredients.map((each) => {
        return { name: each.name.toLowerCase(), amount: each.amount };
      }),
    };
    console.log("Body", body);
    const res = await calcNutrients(body);
    if (res) {
      console.log(res);
      setNutrients(
        res.reduce(
          (acc, nutrient) => {
            acc[nutrient.name] = parseFloat(nutrient.total_amount);
            return acc;
          },
          {
            calory: 0,
            water: 0,
            carbs: 0,
            sugar: 0,
            fiber: 0,
            protein: 0,
            fat: 0,
          }
        )
      );
    }
  };

  useEffect(() => {
    console.log(selectedIngredients);
    if (selectedIngredients.length > 0) calNutrients();
    console.log("INGREDIENT CONFIRM SCREEN");
    console.log("Meal >>> ", mealId, mealType);
  }, []);

  return (
    <>
      <ScreenView>
        <GreetText>Ingredients 🍗</GreetText>
        <Xmark />
        <View
          style={{
            marginHorizontal: 30,
            marginTop: 17,
            flex: 1,
            // backgroundColor: "pink",
            marginBottom: 450,
          }}
        >
          <ConfirmList
            ingredients={selectedIngredients}
            setIngredients={setSelectedIngredients}
          />
        </View>
        <NutrientContent
          calory={nutrients.calory}
          water={nutrients.water}
          carbs={nutrients.carbs}
          sugar={nutrients.sugar}
          fiber={nutrients.fiber}
          protein={nutrients.protein}
          fat={nutrients.fat}
        />
        <MealOption meal={meal} setMeal={mealId ? () => {} : setMeal} />
      </ScreenView>

      <Button
        title={"Back"}
        variant="default"
        style={[styles.botBut, { left: 52 }]}
        onPress={() =>
          navigation.navigate("ingre", { from: "IngredientConfirmScreen" })
        }
      />
      <Button
        title={"Confirm"}
        variant="action"
        style={[styles.botBut, { right: 51 }]}
        onPress={selectIngredients}
      />
    </>
  );
};

export default IngredientConfirmScreen;

const styles = StyleSheet.create({
  botBut: {
    position: "absolute",
    bottom: 73,
  },
});
