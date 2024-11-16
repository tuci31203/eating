import { Dimensions, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { COLORS } from '../configs/constants/colors'

const { width, height } = Dimensions.get('screen')
const ScreenView = ({ children, style }) => {
    return (
        <View style={[{
            backgroundColor: COLORS.bg,
            height: height,
            width: width,
        }, style]}>
            {children}
        </View>
    )
}

export default ScreenView

const styles = StyleSheet.create({})