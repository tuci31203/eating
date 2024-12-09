import { NavigationContainer } from '@react-navigation/native';
import { StyleSheet, Text } from 'react-native';
import * as Font from 'expo-font';
import Tabs from './src/components/navigation/NavTab';
import { useState, useEffect } from 'react';
import { StateProvider } from './src/context/StateContext';
import { SafeAreaProvider, SafeAreaView } from 'react-native-safe-area-context';
import LoginScreen from './src/screens/login-screen/LoginScreen';

export default function App() {
  const [isAppReady, setIsAppReady] = useState(false);
  const [isLoggedIn, setIsLoggedIn] = useState(false); // Trạng thái kiểm tra người dùng đã đăng nhập chưa


  const [fontsLoaded] = Font.useFonts({
    'Inter-Black': require('./assets/fonts/Inter-Black.ttf'),
    'Inter-Bold': require('./assets/fonts/Inter-Bold.ttf'),
    'Inter-ExtraBold': require('./assets/fonts/Inter-ExtraBold.ttf'),
    'Inter-ExtraLight': require('./assets/fonts/Inter-ExtraLight.ttf'),
    'Inter-Light': require('./assets/fonts/Inter-Light.ttf'),
    'Inter-Medium': require('./assets/fonts/Inter-Medium.ttf'),
    'Inter-Regular': require('./assets/fonts/Inter-Regular.ttf'),
    'Inter-SemiBold': require('./assets/fonts/Inter-SemiBold.ttf'),
    'Inter-Thin': require('./assets/fonts/Inter-Thin.ttf'),
  });


  useEffect(() => {
    if (fontsLoaded) {
      Text.defaultProps = Text.defaultProps || {};
      Text.defaultProps.style = { fontFamily: 'Inter-Regular' };
    }
  }, [fontsLoaded]);

  if (!fontsLoaded) {
    return null;
  }

  if (!isLoggedIn) {
    // Hiển thị màn hình LoginScreen nếu chưa đăng nhập
    return <LoginScreen onLoginSuccess={() => setIsLoggedIn(true)} />;
  
  }
  return (
    <StateProvider>
      {/* <SafeAreaProvider>
        <SafeAreaView style={{ flex: 1, height: '100%' }} edges={['right', 'left', 'top', 'bottom']}> */}
      <NavigationContainer>
        <Tabs />
      </NavigationContainer>
      {/* </SafeAreaView>
      </SafeAreaProvider> */}
    </StateProvider>
  );
}

const styles = StyleSheet.create({
});




