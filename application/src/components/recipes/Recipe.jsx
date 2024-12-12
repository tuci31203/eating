import { StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React, { useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import { formatWithCommaNutrients } from "../../utils/formatNumNutrientCalc";

const Recipe = ({ recipe, setTmp }) => {
  const [open, setOpen] = useState(false);
  const [chosen, setChosen] = useState(false);

  const onChoose = () => {
    if (chosen) {
      setTmp([]);
      setChosen(false);
    } else {
      setTmp([...recipe.ingredients]);
      setChosen(true);
    }
  };
  const openCloseRecipe = () => {
    setOpen(!open);
    setChosen(false);
    setTmp([]);
  };
  // const ingres = recipe.ingredients.map((ingre, index) => {
  //     return (
  //         `${recipe.quantities[index]}${recipe.units[index] ? ` ${recipe.units[index]}` : ''} ${ingre}`
  //     )
  // })
  const ingres = recipe.ingredients
    .map(
      (each, index) =>
        `${formatWithCommaNutrients(recipe.quantities[index])} g ${each}`
    )
    .join("\n");
  const instructions = recipe.instructions;
  // const instructions = recipe.instructions.join('\n\n');
  return (
    <View style={styles.container}>
      <TouchableOpacity
        style={styles.header}
        activeOpacity={0.8}
        onPress={openCloseRecipe}
      >
        <Text style={[styles.text, styles.title]}>{recipe.title}</Text>
      </TouchableOpacity>
      {open && (
        <>
          <TouchableOpacity
            style={[
              styles.checkbox,
              {
                backgroundColor: chosen ? COLORS.blink : COLORS.bg,
              },
            ]}
            value={chosen}
            onPress={onChoose}
            activeOpacity={100}
          />
          <View style={styles.content}>
            <Text style={[styles.text, styles.ingre]}>{ingres}</Text>
            <Text style={[styles.text, styles.instruction]}>
              {instructions}
            </Text>
            <Text style={[styles.text, styles.time]}>
              Total time: {recipe.totalTime}
            </Text>
          </View>
        </>
      )}
    </View>
  );
};

export default Recipe;

const styles = StyleSheet.create({
  container: {
    borderTopColor: COLORS.text,
    borderTopWidth: 2,
  },
  header: {
    paddingVertical: 5,
    // backgroundColor: "pink",
    justifyContent: "center",
  },
  content: {
    marginHorizontal: 20,
    gap: 14,
    marginBottom: 20,
  },
  checkbox: {
    borderRadius: 4,
    borderWidth: 2,
    borderColor: COLORS.text,
    width: 20,
    height: 20,
    position: "absolute",
    top: 19,
    right: 14,
  },
  text: {
    color: COLORS.text,
  },
  title: {
    fontFamily: "Inter-SemiBold",
    fontSize: 24,
    // backgroundColor: 'pink',
    width: "85%",
    paddingStart: 15,
  },
  ingre: {
    fontFamily: "Inter-Regular",
    fontSize: 20,
  },
  instruction: {
    fontFamily: "Inter-Regular",
    fontSize: 16,
    textAlign: "justify",
  },
  time: {
    fontFamily: "Inter-SemiBold",
    fontSize: 16,
  },
});
