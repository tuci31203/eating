import { Dimensions, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { ScrollView } from 'react-native'
import GreetText from '../../components/GreetText'
import { COLORS } from '../../configs/constants/colors'
import HomeChart from '../../components/chart/HomeChart'
import Carousel from '../../components/chart/Carousel'
import ScreenView from '../../components/ScreenView'
import MealList from '../../components/meal/MealList'

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