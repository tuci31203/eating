import React, { createContext, useState } from "react";
import { noInfo } from "../utils/transformDayInfo";
import { progress } from "../utils/defaultValues";

export const StateContext = createContext();

export const StateProvider = ({ children }) => {
  const defaultIngredients = [
    {
      id: 1,
      name: "",
      amount: null,
      unit: "g",
      chosen: false,
    },
  ];
  const defaultToday = {
    breakfast: false,
    lunch: false,
    dinner: false,
    snack: false,
  };
  const [selectedIngredients, setSelectedIngredients] = useState([]);
  const [ingredients, setIngredients] = useState(defaultIngredients);
  const [dayInfo, setDayInfo] = useState(noInfo);
  const [week, setWeek] = useState("");
  const [allIngredients, setAllIngredients] = useState([]);
  const [track, setTrack] = useState(progress);
  const [change, setChange] = useState(false);
  const [todayMeals, setTodayMeals] = useState(defaultToday);

  return (
    <StateContext.Provider
      value={{
        selectedIngredients,
        setSelectedIngredients,
        ingredients,
        setIngredients,
        defaultIngredients,
        dayInfo,
        setDayInfo,
        week,
        setWeek,
        allIngredients,
        setAllIngredients,
        track,
        setTrack,
        change,
        setChange,
        todayMeals,
        setTodayMeals,
        defaultToday,
      }}
    >
      {children}
    </StateContext.Provider>
  );
};
