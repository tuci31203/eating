import { StyleSheet, Text, View } from 'react-native'
import { Calendar, CalendarList, Agenda } from 'react-native-calendars';
import React, { useContext, useState } from 'react'
import { getToday } from '../../utils/getToday';
import { COLORS } from '../../configs/constants/colors';
import { StateContext } from '../../context/StateContext';

const MyCalendar = () => {
    const today = getToday()
    const [selectedDate, setSelectedDate] = useState(today)
    const { dayInfo, setDayInfo } = useContext(StateContext)
    return (
        <View
            style={styles.container}
        >
            <Calendar
                markedDates={{ [selectedDate]: { selected: true } }}
                onDayPress={(day) => {
                    setSelectedDate(day.dateString);
                    console.log('selected day', day);
                }}
                theme={{
                    backgroundColor: COLORS.bg,
                    calendarBackground: '#ffffff',
                    textSectionTitleColor: '#9F7A6C',
                    textSectionTitleDisabledColor: '#9F7A6C',
                    selectedDayBackgroundColor: '#EDB092',
                    selectedDayTextColor: COLORS.text,
                    todayTextColor: '#E87874',
                    dayTextColor: COLORS.text,
                    textDisabledColor: 'transparent',
                    dotColor: '#00adf5',
                    selectedDotColor: '#000000',
                    arrowColor: '#AC968E',
                    disabledArrowColor: '#9F7A6C',
                    monthTextColor: COLORS.text,
                    indicatorColor: 'blue',
                    textDayFontFamily: 'Inter-Medium',
                    textMonthFontFamily: 'Inter-ExtraBold',
                    textDayHeaderFontFamily: 'Inter-Bold',
                    textDayFontSize: 20,
                    textMonthFontSize: 24,
                    textDayHeaderFontSize: 14,
                    arrowHeight: 23,
                    arrowWidth: 23,
                }}
            />
        </View>
    )
}

export default MyCalendar

const styles = StyleSheet.create({
    container: {
        padding: 8,
        borderWidth: 2,
        borderColor: COLORS.text,
        borderRadius: 14,
        marginHorizontal: 26,
        marginTop: 29,
    }
})