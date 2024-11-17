import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import Meal from './Meal'

const MealList = () => {
    const meals = {
        "breakfast": {
            "mealId": 1,
            "ingredients": "Oats, Milk, Banana"
        },
        "lunch": {
            "mealId": 3,
            "ingredients": "Pork, Noodle, Lettuce, Chilli, Carrot, Raddish, Orange"
        },
        "dinner": {
            "mealId": 4,
            "ingredients": ""
        },
        "snack": {
            "mealId": 2,
            "ingredients": "Potato, Tomato, Beef"
        }
    }
    return (
        <View style={styles.container}>
            <Meal
                name="Breakfast"
                list={meals.breakfast.ingredients}
                id={meals.breakfast.mealId}
            />
            <Meal
                name="Lunch"
                list={meals.lunch.ingredients}
                id={meals.lunch.mealId}
            />
            <Meal
                name="Dinner"
                list={meals.dinner.ingredients}
                id={meals.dinner.mealId}
            />
            <Meal
                name="Snacks"
                list={meals.snack.ingredients}
                id={meals.snack.mealId}
            />
        </View>
    )
}

export default MealList

const styles = StyleSheet.create({
    container: {
        marginBottom: 100,
    }
})