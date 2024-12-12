import { Dimensions, StyleSheet, Text, View } from "react-native";
import React, { useContext, useEffect } from "react";
import Recipe from "./Recipe";
import { FlatList } from "react-native-gesture-handler";
import { getRecipesApi } from "../../configs/networking/server-api/recipe/getRecipes";
import { StateContext } from "../../context/StateContext";
import { replaceLinhWithNewline } from "../../utils/newLine";

const { height } = Dimensions.get("screen");
const RecipeList = ({ setTmp }) => {
  const { ingredients } = useContext(StateContext);
  useEffect(() => {
    getRecipes();
  }, [ingredients]);
  const [recipes, setRecipes] = React.useState([]);
  const getRecipes = async () => {
    const ingre = ingredients
      .slice(0, -1)
      .map((item) => item.name.toLowerCase().trim())
      .join(",");
    console.log(ingre);
    const res = await getRecipesApi(ingre);
    if (res) {
      //   console.log(res);
      const recps = res.map((item) => ({
        id: item.recipe_id,
        title: item.title,
        ingredients: item.ingredients.map((each) => each.name),
        quantities: item.ingredients.map((each) => each.amount),
        instructions: replaceLinhWithNewline(item.instructions),
        totalTime: item.total_time,
      }));

      setRecipes(recps);
    }
  };

  return (
    <View style={styles.container}>
      <FlatList
        style={styles.list}
        data={recipes}
        showsVerticalScrollIndicator={false}
        keyExtractor={(item) => item.id.toString()}
        renderItem={({ item }) => <Recipe setTmp={setTmp} recipe={item} />}
      />
    </View>
  );
};

export default RecipeList;

const styles = StyleSheet.create({
  container: {
    marginTop: 27,
    height: height - 100 - 150,
    marginHorizontal: 30,
  },
  list: {},
});
