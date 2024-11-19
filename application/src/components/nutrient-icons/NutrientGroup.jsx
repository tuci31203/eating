import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import NutrientItem from './NutrientItem'

const NutrientGroup = ({ nutrients }) => {
  return (
    <View style={styles.container}>
      <View style={[styles.row, styles.first]}>
        <NutrientItem
          variant="Calory"
          amount={nutrients.calory}
        />
        <NutrientItem
          variant="Carbs"
          amount={nutrients.carbs}
          style={styles.middleFirst}
        />
        <NutrientItem
          variant="Water"
          amount={nutrients.water}
        />
      </View>
      <View style={[styles.row, styles.second]}>
        <NutrientItem
          variant="Fat"
          amount={nutrients.fat}
        />
        <NutrientItem
          variant="Sugar"
          amount={nutrients.carbs}
        />
        <NutrientItem
          variant="Protein"
          amount={nutrients.water}
        />
        <NutrientItem
          variant="Fiber"
          amount={nutrients.water}
        />
      </View>
    </View>
  )
}

export default NutrientGroup

const styles = StyleSheet.create({
  container: {
    marginHorizontal: 43,
    marginTop: 30
  },
  middleFirst: {
    marginLeft: 38, marginRight: 52
  },
  row: {
    flexDirection: 'row',
    alignItems: 'baseline',
  },
  first: {
    justifyContent: 'flex-end',
    // backgroundColor: 'pink',
  },
  second: {
    marginTop: 22,
    justifyContent: 'space-between'
  }
})