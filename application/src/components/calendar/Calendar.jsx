import { StyleSheet, Text, View } from "react-native";
import { Calendar, CalendarList, Agenda } from "react-native-calendars";
import React, { useContext, useEffect, useState } from "react";
import { getToday } from "../../utils/getToday";
import { COLORS } from "../../configs/constants/colors";
import { StateContext } from "../../context/StateContext";
import { getMealsFromTo } from "../../configs/networking/server-api/meal/getMealFromTo";
import { noInfo, transformResults } from "../../utils/transformDayInfo";

const MyCalendar = () => {
  const today = getToday();
  const [selectedDate, setSelectedDate] = useState(today);
  const { dayInfo, setDayInfo } = useContext(StateContext);
  useEffect(() => {
    const fetchMeals = async () => {
      const start_time = new Date(selectedDate);
      start_time.setUTCHours(0, 0, 0, 0);
      let tend;
      if (selectedDate === today) {
        const tmp = new Date();
        const offset = 7 * 60 * 60 * 1000;
        tend = new Date(tmp.getTime() + offset);
      } else {
        tend = new Date(selectedDate).setUTCHours(23, 59, 59, 999);
      }
      const end_time = new Date(tend);

      console.log("Start Time:", start_time.toISOString());
      console.log("End Time:", end_time.toISOString());

      const res = await getMealsFromTo(
        start_time.toISOString(),
        end_time.toISOString()
      );
      console.log(transformResults(res));
      if (res && res.length > 0) {
        setDayInfo(transformResults(res));
      } else {
        setDayInfo(noInfo);
      }
    };

    fetchMeals();
  }, [selectedDate]);

  return (
    <View style={styles.container}>
      <Calendar
        markedDates={{ [selectedDate]: { selected: true } }}
        onDayPress={(day) => {
          setSelectedDate(day.dateString);
          console.log("selected day", day);
        }}
        theme={{
          backgroundColor: "transparent",
          calendarBackground: "transparent",
          textSectionTitleColor: "#9F7A6C",
          textSectionTitleDisabledColor: "#9F7A6C",
          selectedDayBackgroundColor: "#EDB092",
          selectedDayTextColor: COLORS.text,
          todayTextColor: "#E87874",
          dayTextColor: COLORS.text,
          textDisabledColor: "transparent",
          dotColor: "#00adf5",
          selectedDotColor: "#000000",
          arrowColor: "#AC968E",
          disabledArrowColor: "#9F7A6C",
          monthTextColor: COLORS.text,
          indicatorColor: "blue",
          textDayFontFamily: "Inter-Medium",
          textMonthFontFamily: "Inter-ExtraBold",
          textDayHeaderFontFamily: "Inter-Bold",
          textDayFontSize: 20,
          textMonthFontSize: 24,
          textDayHeaderFontSize: 14,
        }}
      />
    </View>
  );
};

export default MyCalendar;

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: 10,
    paddingBottom: 10,
    paddingTop: 5,
    borderWidth: 2,
    borderColor: COLORS.text,
    borderRadius: 22,
    marginHorizontal: 26,
    marginTop: 29,
  },
});
