import { StyleSheet, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'
import { formatWithComma } from '../../utils/formatNum'
import NutrientRow from './NutrientRow'

const NutrientContent = ({ calory, water, carbs, sugar, fiber, protein, fat }) => {
    const caloryFmt = formatWithComma(calory)
    const waterFmt = formatWithComma(water)
    const carbsFmt = formatWithComma(carbs)
    const sugarFmt = formatWithComma(sugar)
    const fiberFmt = formatWithComma(fiber)
    const proteinFmt = formatWithComma(protein)
    const fatFmt = formatWithComma(fat)
    return (
        <View style={styles.container}>
            <NutrientRow
                name="Calory"
                amount={caloryFmt}
                unit="kcal"
            />
            <NutrientRow
                name="Water"
                amount={waterFmt}
                unit="ml"
            />
            <NutrientRow
                name="Carbs"
                amount={carbsFmt}
                unit="g"
            />
            <NutrientRow
                name="Sugar"
                amount={sugarFmt}
                unit="g"
            />
            <NutrientRow
                name="Fiber"
                amount={fiberFmt}
                unit="g"
            />
            <NutrientRow
                name="Protein"
                amount={proteinFmt}
                unit="g"
            />
            <NutrientRow
                name="Fat"
                amount={fatFmt}
                unit="g"
            />
        </View>
    )
}

export default NutrientContent

const styles = StyleSheet.create({
    container: {
        position: 'absolute',
        bottom: 138,
        left: -30,
        backgroundColor: COLORS.bg,
        height: 297,
        width: 267,
        borderWidth: 2,
        borderColor: COLORS.text,
        borderRadius: 20,
        justifyContent: 'space-between',
        paddingVertical: 25,
        paddingEnd: 10,
    },
})