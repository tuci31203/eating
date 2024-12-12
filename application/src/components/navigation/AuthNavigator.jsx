import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import LoginScreen from "../../screens/login-screen/LoginScreen";
import RegisterScreen from "../../screens/login-screen/RegisterScreen";

const Stack = createStackNavigator();

const AuthNavigator = () => {
  return (
    <Stack.Navigator
      screenOptions={{ headerShown: false }}
      initialRouteName="Login"
    >
      <Stack.Screen name="Login" component={LoginScreen} />
      <Stack.Screen name="Register" component={RegisterScreen} />
    </Stack.Navigator>
  );
};

export default AuthNavigator;
