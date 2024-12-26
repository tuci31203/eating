import { Dimensions, Image, StyleSheet, Text, View } from "react-native";
import React, { useEffect, useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import { NUTRIENTS } from "../../configs/constants/graphic";
import DayBar from "./DayBar";

const { width } = Dimensions.get("screen");

const HomeChart = ({ inData, variant, goal }) => {
  const dates = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  const maxHeight = 130;
  // inData = [1.0, 1.3, 1.2, 1.3, 1.0, 0, 0]
  const [max, setMax] = useState(() => Math.max(...inData));
  useEffect(() => {
    setMax(Math.max(...inData));
  }, [inData]);
  const height = inData.map((i) => {
    return Math.round((i / max) * maxHeight);
  });

  return (
    <View
    // style={{
    //     justifyContent: 'center',
    //     alignItems: 'center',
    //     width: width
    // }}
    >
      <View
        style={{
          height: 298,
          width: 329,
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          backgroundColor:
            variant === "Calory"
              ? COLORS.bgCalory
              : variant === "Fiber"
              ? COLORS.bgFiber
              : COLORS.bgWater,
          borderWidth: 2,
          borderColor: COLORS.text,
          borderRadius: 22,
          padding: 20,
          // marginLeft: 14,
          // marginRight: 14,
        }}
      >
        {/* Top part */}
        <View
          style={{
            display: "flex",
            flexDirection: "row",
            justifyContent: "space-between",
            alignItems: "center",
          }}
        >
          <View>
            <Text
              style={{
                fontSize: 24,
                // fontWeight: 700,
                color:
                  variant === "Calory"
                    ? COLORS.text
                    : variant === "Fiber"
                    ? COLORS.textFiber
                    : COLORS.textWater,
                fontFamily: "Inter-Bold",
              }}
            >
              {variant}
            </Text>
            <View
              style={{
                display: "flex",
                flexDirection: "row",
                alignItems: "baseline",
              }}
            >
              <Text
                style={{
                  fontSize: 24,
                  // fontWeight: 700,
                  color:
                    variant === "Calory"
                      ? COLORS.text
                      : variant === "Fiber"
                      ? COLORS.textFiber
                      : COLORS.textWater,
                  fontFamily: "Inter-Bold",
                }}
              >
                Goal:
              </Text>
              <Text
                style={{
                  fontFamily: "Inter-Regular",
                  fontSize: 24,
                  fontWeight: 400,
                  color:
                    variant === "Calory"
                      ? COLORS.text
                      : variant === "Fiber"
                      ? COLORS.textFiber
                      : COLORS.textWater,
                  marginLeft: 6,
                }}
              >
                {goal}
              </Text>
              <Text
                style={{
                  fontFamily: "Inter-Medium",
                  fontSize: 15,
                  fontWeight: 500,
                  color:
                    variant === "Calory"
                      ? COLORS.text
                      : variant === "Fiber"
                      ? COLORS.textFiber
                      : COLORS.textWater,
                  marginLeft: 6,
                }}
              >
                {variant === "Calory"
                  ? "kcal/day"
                  : variant === "Fiber"
                  ? "g/day"
                  : "l/day"}
              </Text>
            </View>
          </View>

          <Image
            source={
              variant === "Calory"
                ? NUTRIENTS.calory
                : variant === "Fiber"
                ? NUTRIENTS.fiber
                : NUTRIENTS.water
            }
            resizeMethod="contain"
            style={{
              width: 54,
              height: 54,
            }}
          />
        </View>

        {/* Chart part maxHeight = 130 */}
        <View
          style={{
            display: "flex",
            flexDirection: "row",
            alignItems: "flex-end",
            justifyContent: "space-between",
            // backgroundColor: 'red',
          }}
        >
          {dates.map((item, index) => (
            <DayBar
              key={index}
              variant={variant}
              num={
                inData[index] > 0
                  ? variant === "Fiber"
                    ? inData[index]
                    : inData[index].toFixed(1)
                  : ""
              }
              height={height[index]}
              date={item}
            />
          ))}
        </View>
      </View>
    </View>
  );
};

export default HomeChart;

const styles = StyleSheet.create({});
