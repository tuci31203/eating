import { ScrollView, StyleSheet, Text, View } from "react-native";
import React, { useContext, useEffect, useState } from "react";
import { ScreenView, GreetText } from "../../components";
import ModalButton from "../../components/goal-modal/ModalButton";
import InfoDay from "../../components/day-info-goal/InfoDay";
import GoalList from "../../components/goal-progress/GoalList";
import AsyncStorage from "@react-native-async-storage/async-storage";
import { goal } from "../../utils/defaultValues";
import { StateContext } from "../../context/StateContext";

const GoalScreen = () => {
  const { track } = useContext(StateContext);
  const [goals, setGoals] = useState(() => goal);
  useEffect(() => {
    const fetchGoal = async () => {
      try {
        const goalData = await AsyncStorage.getItem("goal");
        if (goalData) {
          setGoals(JSON.parse(goalData));
        }
      } catch (error) {
        console.error("Failed to load goal data:", error);
      }
    };

    fetchGoal();
  }, []);
  useEffect(() => {
    const saveGoal = async () => {
      try {
        await AsyncStorage.setItem("goal", JSON.stringify(goals));
      } catch (error) {
        console.error("Failed to save goal data:", error);
      }
    };
    saveGoal();
  }, [goals]);
  const progress = track;

  return (
    <ScreenView>
      <GreetText>Your goal</GreetText>
      <View>
        <InfoDay />
        <ModalButton goals={goals} setGoals={setGoals} />
      </View>
      <ScrollView>
        <GoalList progress={progress} goals={goals} />
      </ScrollView>
    </ScreenView>
  );
};

export default GoalScreen;

const styles = StyleSheet.create({});
