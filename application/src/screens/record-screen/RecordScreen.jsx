import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import ScreenView from '../../components/ScreenView'
import GreetText from '../../components/GreetText'

const RecordScreen = () => {
    return (
        <ScreenView>
            <GreetText>
                Your intake record
            </GreetText>
        </ScreenView>
    )
}

export default RecordScreen

const styles = StyleSheet.create({})