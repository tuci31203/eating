import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const NutrientRow = ({ name, amount, unit }) => {
    return (
        <View style={styles.row}>
            <Text style={[styles.text, styles.title]}
            >{name}</Text>
            <Text style={[styles.text, styles.colon]}
            >:</Text>
            <Text style={[styles.text, styles.num]}
            >{amount}</Text>

            <Text style={[styles.text, styles.unit]}
            >{unit}</Text>
        </View>
    )
}

export default NutrientRow

const styles = StyleSheet.create({
    title: {
        fontSize: 20,
        fontFamily: 'Inter-Bold',
        width: 72,

    },
    colon: {
        fontSize: 20,
        fontFamily: 'Inter-Bold',
        marginLeft: 5,
    },
    num: {
        fontSize: 20,
        fontFamily: 'Inter-Regular',
        width: 76,
        marginLeft: 5,
        textAlign: 'right',
    },
    unit: {
        fontSize: 14,
        fontFamily: "Inter-Medium",
        marginLeft: 5,
        // backgroundColor: 'pink',
    },
    text: {
        // color: 'red',
        color: COLORS.text,
    },
    row: {
        marginStart: 49,
        flexDirection: 'row',
        alignItems: 'baseline',
        // backgroundColor: 'pink',
    }
})