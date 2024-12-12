import { StyleSheet, Text, View } from "react-native";
import React from "react";
import ScreenView from "../../components/ScreenView";
import GreetText from "../../components/GreetText";
import UserInfoRow from "./UserInfoRow";
import SettingOption from "./SettingOption";

const SettingScreen = () => {
  return (
    <ScreenView>
      <GreetText>Settings</GreetText>
      <UserInfoRow />
      <SettingOption />
    </ScreenView>
  );
};

export default SettingScreen;

const styles = StyleSheet.create({});
