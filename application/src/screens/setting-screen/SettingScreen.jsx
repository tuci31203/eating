import { StyleSheet, Text, View } from "react-native";
import React from "react";
import ScreenView from "../../components/ScreenView";
import GreetText from "../../components/GreetText";
import UserInfoRow from "./UserInfoRow";
import SettingOption from "./SettingOption";

const SettingScreen = ({ route, navigation }) => {
  const { onLogout } = route.params;
  return (
    <ScreenView>
      <GreetText>Settings</GreetText>
      <UserInfoRow onLogout={onLogout} />
      <SettingOption />
    </ScreenView>
  );
};

export default SettingScreen;

const styles = StyleSheet.create({});
