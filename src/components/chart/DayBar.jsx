import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const DayBar = ({ num, height, date, variant }) => {
    return (
        <View
            style={{
                display: 'flex',
                flexDirection: "column",
                justifyContent: "center",
                alignItems: "center"
            }}
        >
            <Text
                style={{
                    fontFamily: 'Inter-Medium', fontSize: 16,
                    color: variant === "Calory" ? COLORS.text : variant === "Fiber" ? COLORS.textFiber : COLORS.textWater
                }}
            >{num}</Text>
            <View
                style={{
                    width: 12,
                    height: height,
                    backgroundColor: variant === "Calory" ? COLORS.colCalory : variant === "Fiber" ? COLORS.colFiber : COLORS.colWater,
                    borderTopLeftRadius: 6,
                    borderTopRightRadius: 6,
                }}
            ></View>
            <Text
                style={{
                    fontFamily: 'Inter-Medium', fontSize: 16,
                    color: variant === "Calory" ? COLORS.text : variant === "Fiber" ? COLORS.textFiber : COLORS.textWater
                }}
            >{date}</Text>
        </View>
    )
}

export default DayBar

const styles = StyleSheet.create({})