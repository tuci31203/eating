import { NavigationContainer } from "@react-navigation/native";
import { StyleSheet, Text } from "react-native";
import * as Font from "expo-font";
import Tabs from "./src/components/navigation/NavTab";
import { useState, useEffect } from "react";
import { StateProvider } from "./src/context/StateContext";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import LoginScreen from "./src/screens/login-screen/LoginScreen";
import { getItem, removeItem } from "./src/utils/AsyncStorage";
import AuthNavigator from "./src/components/navigation/AuthNavigator";

export default function App() {
  const [fontsLoaded] = Font.useFonts({
    "Inter-Black": require("./assets/fonts/Inter-Black.ttf"),
    "Inter-Bold": require("./assets/fonts/Inter-Bold.ttf"),
    "Inter-ExtraBold": require("./assets/fonts/Inter-ExtraBold.ttf"),
    "Inter-ExtraLight": require("./assets/fonts/Inter-ExtraLight.ttf"),
    "Inter-Light": require("./assets/fonts/Inter-Light.ttf"),
    "Inter-Medium": require("./assets/fonts/Inter-Medium.ttf"),
    "Inter-Regular": require("./assets/fonts/Inter-Regular.ttf"),
    "Inter-SemiBold": require("./assets/fonts/Inter-SemiBold.ttf"),
    "Inter-Thin": require("./assets/fonts/Inter-Thin.ttf"),
  });

  const [isLoggedIn, setIsLoggedIn] = useState(false);
  useEffect(() => {
    if (fontsLoaded) {
      Text.defaultProps = Text.defaultProps || {};
      Text.defaultProps.style = { fontFamily: "Inter-Regular" };
    }
  }, [fontsLoaded]);

  useEffect(() => {
    const checkLoginStatus = async () => {
      const token = await getItem("token");
      if (token) {
        setIsLoggedIn(true);
      }
    };
  }, []);

  if (!fontsLoaded) {
    return null;
  }

  const handleLogout = async () => {
    await removeItem("authToken");
    setIsLoggedIn(false);
  };

  return (
    <StateProvider>
      {/* <SafeAreaProvider>
        <SafeAreaView style={{ flex: 1, height: '100%' }} edges={['right', 'left', 'top', 'bottom']}> */}
      <NavigationContainer>
        {isLoggedIn ? (
          <Tabs onLogout={handleLogout} />
        ) : (
          <AuthNavigator onLoginSuccess={() => setIsLoggedIn(true)} />
        )}
      </NavigationContainer>
      {/* </SafeAreaView>
      </SafeAreaProvider> */}
    </StateProvider>
  );
}

const styles = StyleSheet.create({});
