import { ScrollView, StyleSheet, Text, View } from 'react-native'
import React, { useEffect, useState } from 'react'
import { ScreenView, GreetText } from '../../components'
import ModalButton from '../../components/goal-modal/ModalButton'
import InfoDay from '../../components/day-info-goal/InfoDay'
import GoalList from '../../components/goal-progress/GoalList'

const GoalScreen = () => {
    const goal = {
        calory: 1500,
        carbs: 150,
        water: 3000,
        fat: 50,
        sugar: 30,
        protein: 100,
        fiber: 20,
    }
    const progress = [
        {
            name: "Calory",
            amount: [2000, 1100, 1600, 1400, 0, 0, 0],
        },
        {
            name: "Carbs",
            amount: [190, 200, 500, 100, 0, 0, 0],
        },
        {
            name: "Water",
            amount: [2000, 2500, 3000, 1000, 0, 0, 0],
        },

        {
            name: "Fat",
            amount: [50, 100, 120, 20, 0, 0, 0],
        },
        {
            name: "Sugar",
            amount: [10, 20, 300, 40, 0, 0, 0],
        },
        {
            name: "Protein",
            amount: [150, 100, 129, 500, 0, 0, 0],
        },


        {
            name: "Fiber",
            amount: [100, 150, 200, 90, 0, 0, 0],
        },
    ]
    const [goals, setGoals] = useState(goal)
    return (
        <ScreenView>
            <GreetText>
                Your goal
            </GreetText>
            <View>
                <InfoDay />
                <ModalButton goals={goals} setGoals={setGoals} />
            </View>
            <ScrollView>
                <GoalList progress={progress} goals={goals} />
            </ScrollView>
        </ScreenView>
    )
}

export default GoalScreen

const styles = StyleSheet.create({})