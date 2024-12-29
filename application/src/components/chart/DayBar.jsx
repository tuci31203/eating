import { Animated, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useRef, useState } from "react";
import { COLORS } from "../../configs/constants/colors";

const DayBar = ({ num, height, date, variant }) => {
  const animatedHeight = useRef(new Animated.Value(0)).current;
  const safeHeight = Math.max(0, Number(height) || 0);
  useEffect(() => {
    animatedHeight.setValue(0);
    console.log("Starting animation with height:", safeHeight);
    Animated.spring(animatedHeight, {
      toValue: safeHeight,
      useNativeDriver: false,
      bounciness: 8,
      speed: 12,
    }).start(({ finished }) => {
      console.log("Animation finished:", finished, "Final height:", safeHeight);
    });
  }, [safeHeight]);
  return (
    <View
      style={{
        display: "flex",
        flexDirection: "column",
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <Text
        style={{
          fontFamily: "Inter-Medium",
          fontSize: 16,
          color:
            variant === "Calory"
              ? COLORS.text
              : variant === "Fiber"
              ? COLORS.textFiber
              : COLORS.textWater,
        }}
      >
        {num}
      </Text>
      <Animated.View
        style={{
          width: 12,
          height: animatedHeight,
          backgroundColor:
            variant === "Calory"
              ? COLORS.colCalory
              : variant === "Fiber"
              ? COLORS.colFiber
              : COLORS.colWater,
          borderTopLeftRadius: 6,
          borderTopRightRadius: 6,
        }}
      ></Animated.View>
      <Text
        style={{
          fontFamily: "Inter-Medium",
          fontSize: 16,
          color:
            variant === "Calory"
              ? COLORS.text
              : variant === "Fiber"
              ? COLORS.textFiber
              : COLORS.textWater,
        }}
      >
        {date}
      </Text>
    </View>
  );
};

export default DayBar;

const styles = StyleSheet.create({});
