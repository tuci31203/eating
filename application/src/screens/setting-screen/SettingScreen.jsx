import { StyleSheet, Text, View } from "react-native";
import React from "react";
import ScreenView from "../../components/ScreenView";
import GreetText from "../../components/GreetText";
import UserInfoRow from "./UserInfoRow";
import SettingOption from "./SettingOption";
import { COLORS } from "../../configs/constants/colors";

const SettingScreen = () => {
  return (
    <ScreenView>
      <GreetText>Settings</GreetText>
      <UserInfoRow />
      <SettingOption />

      <Text style={styles.text}>© 2024 Chien, Linh, Viet</Text>
    </ScreenView>
  );
};

export default SettingScreen;

const styles = StyleSheet.create({
  text: {
    fontFamily: "Inter-light",
    fontSize: 12,
    color: COLORS.undertone,
    textAlign: "center",
    position: "absolute",
    bottom: 150,
  },
});
