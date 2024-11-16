import { Dimensions, FlatList, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import HomeChart from './HomeChart'
import Meal from '../meal/Meal'

const { width } = Dimensions.get('screen')
const Carousel = () => {
    const input = [
        {
            variant: "Calory",
            inData: [1.0, 1.3, 1.2, 1.3, 1.0, 0, 0],
            goal: 1.5,
        },
        {
            variant: "Fiber",
            inData: [100, 130, 110, 138, 100, 0, 0],
            goal: 150,
        },
        {
            variant: "Water",
            inData: [1.0, 1.2, 1.1, 1.3, 1.0, 0, 0],
            goal: 2,
        },
    ]
    const _spacing = 20
    const _width = 329
    return (
        <View>
            <FlatList
                data={input}
                keyExtractor={(item) => item.variant}
                contentContainerStyle={{
                    gap: _spacing,
                    paddingHorizontal: (width - _width) / 2,
                }}
                decelerationRate={"fast"}
                snapToInterval={_spacing + _width}
                renderItem={({ item }) => <HomeChart variant={item.variant} inData={item.inData} goal={item.goal} />}
                horizontal
                showsHorizontalScrollIndicator={false}
            />
            
        </View>
    )
}

export default Carousel

const styles = StyleSheet.create({})