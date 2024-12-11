import React from "react";
import { createStackNavigator } from "@react-navigation/stack";
import RegisterScreen from "../../screens/auth/RegisterScreen";
import LoginScreen from "../../screens/login-screen/LoginScreen";

const Stack = createStackNavigator();

const AuthNavigator = ({ onLoginSuccess }) => {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen
        name="Login"
        component={LoginScreen}
        initialParams={{ onLoginSuccess }}
      />
      <Stack.Screen name="Register" component={RegisterScreen} />
    </Stack.Navigator>
  );
};

export default AuthNavigator;
