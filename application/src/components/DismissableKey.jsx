import { Keyboard, StyleSheet, Text, TouchableWithoutFeedback, View } from 'react-native'
import React from 'react'

const DismissableKey = ({ children }) => {
    return (
        <TouchableWithoutFeedback
            onPress={() => Keyboard.dismiss()}
        >
            {children}
        </TouchableWithoutFeedback>
    )
}

export default DismissableKey

const styles = StyleSheet.create({})