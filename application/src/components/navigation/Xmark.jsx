import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React, { useContext } from "react";
import { ICONS } from "../../configs/constants/graphic";
import { COLORS } from "../../configs/constants/colors";
import { StateContext } from "../../context/StateContext";
import { CommonActions, useNavigation } from "@react-navigation/native";

const Xmark = () => {
  const navigation = useNavigation();
  const {
    ingredients,
    setIngredients,
    defaultIngredients,
    selectedIngredients,
    setSelectedIngredients,
  } = useContext(StateContext);

  const handleClose = () => {
    const currRoute =
      navigation.getState().routes[navigation.getState().index].name;
    // console.log(currRoute)
    if (currRoute === "recipes") {
      navigation.goBack();
    } else {
      setIngredients(() => {
        return defaultIngredients;
      });
      setSelectedIngredients([]);
      navigation.dispatch(
        CommonActions.reset({
          index: 0,
          routes: [{ name: "home" }],
        })
      );
    }
  };
  return (
    <TouchableOpacity
      style={{
        position: "absolute",
        top: 25,
        right: 35,
        width: 30,
        height: 30,
        // backgroundColor: 'pink',
        alignItems: "center",
        display: "flex",
        justifyContent: "center",
      }}
      onPress={handleClose}
    >
      <Image
        source={ICONS.close}
        style={{
          width: 18,
          height: 18,
        }}
        resizeMethod="contain"
        tintColor={COLORS.text}
      />
    </TouchableOpacity>
  );
};

export default Xmark;

const styles = StyleSheet.create({});
