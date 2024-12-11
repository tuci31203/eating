import { Image, StyleSheet, Text, View } from "react-native";
import React from "react";
import { NUTRIENTS } from "../../configs/constants/graphic";
import { COLORS } from "../../configs/constants/colors";
import { formatWithComma } from "../../utils/formatNum";

const NutrientItem = ({ variant, amount, style }) => {
  const amountFmt = formatWithComma(amount);
  return (
    <View style={[styles.container, style]}>
      <Image
        source={NUTRIENTS[`${variant.toLowerCase()}`]}
        style={styles[`${variant.toLowerCase()}`]}
        resizeMethod="contain"
      />
      <Text style={[styles.title, styles.text]}>{variant}</Text>
      <Text style={[styles.amount, styles.text]}>{amountFmt}</Text>
      <Text style={[styles.unit, styles.text]}>
        {variant === "Calory" ? "kcal" : variant === "Water" ? "g" : "g"}
      </Text>
    </View>
  );
};

export default NutrientItem;

const styles = StyleSheet.create({
  container: {
    alignItems: "center",
    // backgroundColor: 'pink',
  },
  calory: {
    width: 91,
    height: 91,
  },
  water: {
    width: 55,
    height: 55,
  },
  sugar: {
    width: 48,
    height: 48,
  },
  protein: {
    width: 52,
    height: 52,
  },
  fiber: {
    width: 50,
    height: 50,
  },
  fat: {
    width: 51,
    height: 51,
  },
  carbs: {
    width: 73,
    height: 47,
  },
  title: {
    fontFamily: "Inter-Bold",
    fontSize: 16,
  },
  amount: {
    fontFamily: "Inter-Regular",
    fontSize: 16,
  },
  unit: {
    fontFamily: "Inter-Regular",
    fontSize: 13,
  },
  text: {
    color: COLORS.text,
    textAlign: "center",
  },
});
