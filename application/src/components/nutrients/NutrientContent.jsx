import { StyleSheet, View } from "react-native";
import React from "react";
import { COLORS } from "../../configs/constants/colors";
import NutrientRow from "./NutrientRow";
import { formatWithCommaNutrients } from "../../utils/formatNumNutrientCalc";

const NutrientContent = ({
  calory,
  water,
  carbs,
  sugar,
  fiber,
  protein,
  fat,
}) => {
  const caloryFmt = formatWithCommaNutrients(calory);
  const waterFmt = formatWithCommaNutrients(water);
  const carbsFmt = formatWithCommaNutrients(carbs);
  const sugarFmt = formatWithCommaNutrients(sugar);
  const fiberFmt = formatWithCommaNutrients(fiber);
  const proteinFmt = formatWithCommaNutrients(protein);
  const fatFmt = formatWithCommaNutrients(fat);
  return (
    <View style={styles.container}>
      <NutrientRow name="Calory" amount={caloryFmt} unit="kcal" />
      <NutrientRow name="Water" amount={waterFmt} unit="g" />
      <NutrientRow name="Carbs" amount={carbsFmt} unit="g" />
      <NutrientRow name="Sugar" amount={sugarFmt} unit="g" />
      <NutrientRow name="Fiber" amount={fiberFmt} unit="g" />
      <NutrientRow name="Protein" amount={proteinFmt} unit="g" />
      <NutrientRow name="Fat" amount={fatFmt} unit="g" />
    </View>
  );
};

export default NutrientContent;

const styles = StyleSheet.create({
  container: {
    position: "absolute",
    bottom: 138,
    left: -30,
    backgroundColor: COLORS.bg,
    height: 297,
    width: 267,
    borderWidth: 2,
    borderColor: COLORS.text,
    borderRadius: 20,
    justifyContent: "space-between",
    paddingVertical: 25,
    paddingEnd: 10,
  },
});
