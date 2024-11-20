import { StyleSheet, Text, View } from 'react-native'
import React, { useState } from 'react'
import NutrientItem from '../nutrient-icons/NutrientItem'
import { COLORS } from '../../configs/constants/colors'
import { thousandDecimal } from '../../utils/thousandDecimal'
import { thousandShorten } from '../../utils/thousandShorten'

const WeekTrack = ({ name, amount, goal }) => {
    const weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    const [compare, setCompare] = useState(() => {
        return amount.map((item, index) => {
            if (item === 0) return 0
            if (name === "Calory") return thousandDecimal(item - goal)
            else return item - goal
        })
    })
    const [judge, setJudge] = useState(() => {
        return amount.map((item) => {

            if (item === 0) return "none"
            const tmp = item - goal
            const tobe = Math.abs(tmp)
            switch (name) {
                case "Calory":
                    if (tobe <= 200) return "good"
                    break
                case "Carbs":
                    if (tobe <= 80) return "good"
                    break
                case "Protein":
                    if (tobe <= 80) return "good"
                    break
                case "Fat":
                    if (tobe <= 15) return "good"
                    break
                case "Water":
                    if (tobe <= 300) return "good"
                    break
                case "Fiber":
                    if (tobe <= 8) return "good"
                    break
                default: if (tobe <= 15) return "good"
            }
            // if (Math.abs(tmp) / goal < 0.3) return "good"
            if (tmp < 0) return "less"
            return "more"
        })
    })
    return (
        <View style={styles.container}>
            <View style={styles.row}>
                <NutrientItem variant={name} amount={name !== 'Calory' ? goal : thousandShorten(goal)}
                    style={[
                        name === "Calory" && styles.calo,
                        name === "Carbs" && styles.carbs,
                    ]}
                />
                <View style={styles.weekContainer}>
                    <View style={styles.week}>
                        {
                            compare.map((item, index) => (
                                <View
                                    key={index}
                                    style={styles.day}
                                >
                                    <Text style={[
                                        judge[index] === "good" && styles.good,
                                        judge[index] === "less" && styles.less,
                                        judge[index] === "more" && styles.more,
                                        judge[index] === "none" && styles.non,
                                    ]}>{item > 0 && "+"}{item}</Text>
                                    <Text style={styles.text}>{weekdays[index]}</Text>
                                </View>
                            ))
                        }
                    </View>
                </View>
            </View>
        </View>
    )
}

export default WeekTrack

const styles = StyleSheet.create({
    container: {

    },
    row: {
        flexDirection: 'row',
        justifyContent: 'space-between',
        marginHorizontal: 20,
    },
    week: {
        flexDirection: 'row',
        width: 265,
        justifyContent: 'space-between',
        alignItems: 'flex-end',
    },
    weekContainer: {
        justifyContent: 'center',
    },
    day: {
        justifyContent: 'center',
        alignItems: 'center',

    },
    calo: {
        marginStart: -15,
    },
    carbs: {
        marginStart: -6,
    },
    text: {
        color: COLORS.text,
        fontFamily: 'Inter-Regular',
        fontSize: 14,
    },
    good: {
        fontFamily: 'Inter-Bold',
        fontSize: 14,
        color: COLORS.textGood,
    },
    less: {
        fontFamily: 'Inter-Bold',
        fontSize: 14,
        color: COLORS.textLess,
    },
    more: {
        fontFamily: 'Inter-Bold',
        fontSize: 14,
        color: COLORS.textMore,
    },
    non: {
        display: 'none',
    },
})