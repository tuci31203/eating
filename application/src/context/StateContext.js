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
  const [selectedIngredients, setSelectedIngredients] = useState([]);
  const [ingredients, setIngredients] = useState(defaultIngredients);
  const [dayInfo, setDayInfo] = useState(noInfo);
  const [week, setWeek] = useState("");
  const [allIngredients, setAllIngredients] = useState([]);
  const [track, setTrack] = useState(progress);

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
      }}
    >
      {children}
    </StateContext.Provider>
  );
};
