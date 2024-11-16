import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { createStackNavigator } from '@react-navigation/stack'
import { NavigationContainer } from '@react-navigation/native'
import IngredientScreen from '../../screens/ingredient-screen/IngredientScreen'
import IngredientConfirmScreen from '../../screens/ingredient-confirm-screen/IngredientConfirmScreen'

const Stack = createStackNavigator()

const SnackIngredient = () => {
    return (
        <Stack.Navigator
            screenOptions={
                { headerShown: false, }
            }
        >
            <Stack.Screen name="ingre" component={IngredientScreen} />
            <Stack.Screen name="confirm" component={IngredientConfirmScreen} />
        </Stack.Navigator>
    )
}

export default SnackIngredient

const styles = StyleSheet.create({})