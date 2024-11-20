import { StyleSheet, Text, View } from 'react-native'
import React, { useContext } from 'react'
import { COLORS } from '../../configs/constants/colors'
import { StateContext } from '../../context/StateContext'

const InfoDay = () => {
    const { week, setWeek } = useContext(StateContext)
    return (
        <View style={styles.container}>
            <Text style={[styles.period]}>per day</Text>
            <Text style={[styles.date]}>{week}</Text>
        </View>
    )
}

export default InfoDay

const styles = StyleSheet.create({
    container: {
        // backgroundColor: COLORS.bg,
        // flexDirection: 'row',
        marginTop: 20,
    },
    period: {
        fontFamily: 'Inter-Light',
        fontSize: 16,
        color: COLORS.text,
        // textAlign: 'center',
        // position: 'absolute',
        left: 190,
    },
    date: {
        fontFamily: 'Inter-ExtraBold',
        fontSize: 14,
        color: COLORS.undertone,
        marginStart: 20,
        position: 'absolute',
        top: 2,
        left: 8,
    }
})