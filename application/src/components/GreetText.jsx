import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { COLORS } from '../configs/constants/colors'

const GreetText = ({ children }) => {
    return (
        <View style={{ marginTop: 46, paddingLeft: 30, paddingRight: 30, }}>
            <Text
                style={{
                    fontSize: 36,
                    fontFamily: 'Inter-ExtraBold',
                    color: COLORS.text,
                }}
            >{children}</Text>
        </View>
    )
}

export default GreetText

const styles = StyleSheet.create({})