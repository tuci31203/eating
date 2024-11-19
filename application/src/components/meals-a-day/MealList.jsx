import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import Meal from './Meal'

const MealList = ({ meals }) => {
    return (
        <View style={styles.container}>
            <Meal
                title="Breakfast"
                content={meals.breakfast}
            />
            <Meal
                title="Lunch"
                content={meals.lunch}
            />
            <Meal
                title="Dinner"
                content={meals.dinner}
            />
            <Meal
                title="Snacks"
                content={meals.snacks}
            />
        </View>
    )
}

export default MealList

const styles = StyleSheet.create({
    container: {
        marginBottom: 100,
        marginHorizontal: 'auto',
        marginTop: 33,
        gap: 10,
    }
})