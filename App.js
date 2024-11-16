import { NavigationContainer } from '@react-navigation/native';
import { Dimensions, StyleSheet, Text, View } from 'react-native';
import * as Font from 'expo-font';
import Tabs from './src/components/navigation/NavTab';
import { useEffect } from 'react';
import { StateProvider } from './src/context/StateContext';

export default function App() {
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
  return (
    <StateProvider>
      <NavigationContainer>
        <Tabs />
      </NavigationContainer>
    </StateProvider>
  );
}

const styles = StyleSheet.create({
});
