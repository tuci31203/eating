import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import Button from '../Button'

const MealOption = ({ meal, setMeal }) => {

    return (
        <View style={styles.container}>
            <Button
                variant={meal === "breakfast" ? 'mealAct' : 'mealDef'}
                onPress={() => setMeal("breakfast")}
                title={"Breakfast"}
            />
            <Button
                variant={meal === "lunch" ? 'mealAct' : 'mealDef'}
                onPress={() => setMeal("lunch")}
                title={"Lunch"}
            />
            <Button
                variant={meal === "dinner" ? 'mealAct' : 'mealDef'}
                onPress={() => setMeal("dinner")}
                title={"Dinner"}
            />
            <Button
                variant={meal === "snack" ? 'mealAct' : 'mealDef'}
                onPress={() => setMeal("snack")}
                title={"Snack"}
            />
        </View>
    )
}

export default MealOption

const styles = StyleSheet.create({
    container: {
        position: 'absolute',
        right: 8,
        bottom: 151,
        width: 130,
        height: 271,
        justifyContent: 'space-between',
        alignItems: 'flex-start',
    },

})