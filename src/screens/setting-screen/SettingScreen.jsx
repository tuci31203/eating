import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import ScreenView from '../../components/ScreenView'
import GreetText from '../../components/GreetText'

const SettingScreen = () => {
    return (
        <ScreenView>
            <GreetText>
                Settings
            </GreetText>
        </ScreenView>
    )
}

export default SettingScreen

const styles = StyleSheet.create({})

