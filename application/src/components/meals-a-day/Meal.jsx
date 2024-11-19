import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const Meal = ({ title, content }) => {
    return (
        <View style={styles.container}>
            <Text style={[styles.text, styles.title]}>{title}</Text>
            <Text style={[styles.text, styles.content]}>{content}</Text>
        </View>
    )
}

export default Meal

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        // justifyContent: 'space-between',
        width: 335,
        justifyContent: 'space-between',
    },
    title: {
        fontFamily: 'Inter-Bold',
        marginStart: 10,
    },
    content: {
        fontFamily: 'Inter-Regular',
        width: 233,
    },
    text: {
        color: COLORS.text,
        fontSize: 16,
    }
})