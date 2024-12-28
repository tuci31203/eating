import { NavigationContainer } from "@react-navigation/native";
import { StyleSheet, Text } from "react-native";
import * as Font from "expo-font";
import Tabs from "./src/components/navigation/NavTab";
import { useEffect } from "react";
import { StateProvider } from "./src/context/StateContext";
import { SafeAreaProvider, SafeAreaView } from "react-native-safe-area-context";
import AuthNavigator from "./src/components/navigation/AuthNavigator";
import { AuthProvider, useAuth } from "./src/context/AuthContext";

const MainApp = () => {
  const { isLoggedIn, checkLoginStatus } = useAuth();

  useEffect(() => {
    checkLoginStatus();
  }, []);

  if (!isLoggedIn) {
    return <AuthNavigator />;
  }

  return <Tabs />;
};

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

  useEffect(() => {
    if (fontsLoaded) {
      Text.defaultProps = Text.defaultProps || {};
      Text.defaultProps.style = { fontFamily: "Inter-Regular" };
    }
  }, [fontsLoaded]);

  if (!fontsLoaded) {
    return null;
  }

  return (
    <SafeAreaProvider>
      <SafeAreaView
        style={{ flex: 1, height: "100%" }}
        edges={["right", "left", "top", "bottom"]}
      >
        <AuthProvider>
          <StateProvider>
            <NavigationContainer>
              <MainApp />
            </NavigationContainer>
          </StateProvider>
        </AuthProvider>
      </SafeAreaView>
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({});
