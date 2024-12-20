import React, { createContext, useState } from "react";

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
  const [dayInfo, setDayInfo] = useState({});
  const [week, setWeek] = useState("");
  const [allIngredients, setAllIngredients] = useState([]);

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
      }}
    >
      {children}
    </StateContext.Provider>
  );
};
