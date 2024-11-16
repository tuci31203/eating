import { View, Text, StyleSheet } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const IngredientConfirm = ({ id, name, amount, unit }) => {
    return (
        <View style={styles.container}>
            <Text style={[styles.text,
            {
                width: 194
            }
            ]}>{name}</Text>
            <View
                style={styles.leftPart}
            >
                <Text style={styles.text}>{amount}</Text>
                <View style={styles.unit}>
                    <Text style={styles.text}>{unit}</Text>
                </View>
            </View>
        </View>
    )
}

export default IngredientConfirm

const styles = StyleSheet.create({
    text: {
        fontFamily: 'Inter-Regular',
        fontSize: 20,
        color: COLORS.text
    },
    container: {
        flexDirection: 'row',
        // backgroundColor: 'pink',
        alignItems: 'center',
        height: 58,
        paddingHorizontal: 34,
    },
    leftPart: {
        position: 'absolute',
        right: 20,
        flexDirection: 'row',
    },
    unit: {
        height: '100%',
        width: 37,
        alignItems: 'center',
    }
})