import { Dimensions, FlatList, StyleSheet, Text, View } from 'react-native'
import React, { useContext, useEffect, useState } from 'react'
import HomeChart from './HomeChart'
import Meal from '../meal/Meal'
import { COLORS } from '../../configs/constants/colors'
import { getCurrentWeekDates } from '../../utils/getWeekDate'
import { StateContext } from '../../context/StateContext'

const { width } = Dimensions.get('screen')
const Carousel = () => {
    const { week, setWeek } = useContext(StateContext)
    const [date, setDate] = useState(() => {
        const dates = getCurrentWeekDates()
        // setWeek(`${dates.start} - ${dates.end}`)
        return `${dates.start} - ${dates.end}`
    })
    useEffect(() => {
        setWeek(date)
    }, [date])

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
    const [index, setIndex] = useState(0)
    const _spacing = 20
    const _width = 329
    const handleScroll = ({ nativeEvent }) => {
        const tmp = Math.round(nativeEvent.contentOffset.x / (_width + _spacing))
        // console.log(tmp)
        setIndex(tmp)
    }
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
                onScroll={handleScroll}
            />

            <View style={styles.dots}>
                <View
                    style={[styles.indicator, index === 0 && styles.active]}
                ></View>
                <View
                    style={[styles.indicator, index === 1 && styles.active]}
                ></View>
                <View
                    style={[styles.indicator, index === 2 && styles.active]}
                ></View>
            </View>
            <Text style={styles.dates}>{date}</Text>

        </View>
    )
}

export default Carousel

const styles = StyleSheet.create({
    dots: {
        flexDirection: "row",
        justifyContent: "center",
        marginTop: 16,
        gap: 12,
    },
    indicator: {
        height: 12,
        width: 12,
        backgroundColor: "#F1F1F1",
        borderRadius: 6,
    },
    active: {
        backgroundColor: "#F4DFCA",
    },
    dates: {
        color: COLORS.textDate,
        fontFamily: "Inter-Bold",
        fontSize: 16,
        // backgroundColor: 'pink',
        textAlign: 'center',
        marginTop: 15
    }
})