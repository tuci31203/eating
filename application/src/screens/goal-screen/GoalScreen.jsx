import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import ScreenView from '../../components/ScreenView'
import GreetText from '../../components/GreetText'

const GoalScreen = () => {
    return (
        <ScreenView>
            <GreetText>
                Your goal
            </GreetText>
        </ScreenView>
    )
}

export default GoalScreen

const styles = StyleSheet.create({})