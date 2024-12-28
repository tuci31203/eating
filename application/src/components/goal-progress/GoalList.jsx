import { StyleSheet, Text, View } from "react-native";
import React from "react";
import WeekTrack from "./WeekTrack";

const GoalList = ({ goals, progress }) => {
  return (
    <View style={styles.container}>
      {progress.map((item) => (
        <WeekTrack
          key={item.name}
          name={item.name}
          amount={item.amount}
          goal={goals[item.name.toLowerCase()]}
        />
      ))}
    </View>
  );
};

export default GoalList;

const styles = StyleSheet.create({
  container: {
    marginTop: 20,
    gap: 24,
    marginBottom: 130,
    // marginBottom: 100,
  },
});
