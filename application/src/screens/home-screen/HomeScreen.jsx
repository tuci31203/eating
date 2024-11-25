import { Dimensions, StyleSheet, View } from 'react-native'
import React from 'react'
import { ScrollView } from 'react-native'
import Carousel from '../../components/chart/Carousel'
import MealList from '../../components/meal/MealList'
import { GreetText, ScreenView } from '../../components'
const { width, height } = Dimensions.get("screen")

const HomeScreen = () => {
    return (
        <ScreenView>
            <ScrollView>
                <View style={{ gap: 38 }}>
                    <GreetText>What do you eat today?</GreetText>
                    <Carousel />
                    <MealList />
                </View>
            </ScrollView>
        </ScreenView>
    )
}

export default HomeScreen

const styles = StyleSheet.create({})