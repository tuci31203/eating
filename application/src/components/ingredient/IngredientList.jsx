import {
  Dimensions,
  FlatList,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from "react-native";
import React, { useContext, useEffect, useState } from "react";
import IngredientItem from "./IngredientItem";
import { useRoute } from "@react-navigation/native";
import { StateContext } from "../../context/StateContext";
import { COLORS } from "../../configs/constants/colors";
const IngredientList = ({ ingredients, setIngredients }) => {
  const route = useRoute();
  const { allIngredients } = useContext(StateContext);
  const [activeId, setActiveId] = useState(null);
  const [activeIndex, setActiveIndex] = useState(null);
  const [suggestions, setSuggestions] = useState([]);
  const [place, setPlace] = useState(136);
  const flat = React.useRef(null);
  useEffect(() => {
    if (flat?.current && ingredients.length > 0) {
      setTimeout(() => {
        flat?.current?.scrollToEnd({ animated: true });
      }, 100);
    }
  }, [ingredients.length]);
  const generateId = () => {
    const maxId = Math.max(...ingredients.map((item) => item.id), 0);
    return maxId + 1;
  };

  const createEmptyIngredient = () => ({
    id: generateId(),
    name: "",
    amount: null,
    unit: "g",
    chosen: false,
  });

  useEffect(() => {
    if (ingredients.length === 1 && ingredients[0].name === "") {
      return;
    }
    if (route.params?.from === "IngredientConfirmScreen") {
      return;
    }
    const lastItem = ingredients[ingredients.length - 1];
    if (lastItem && lastItem.name.trim() !== "") {
      setIngredients((prev) => [...prev, createEmptyIngredient()]);
    }
  }, [ingredients, setIngredients]);

  const handleChosen = (id) => {
    setIngredients((prev) =>
      prev.map((each) =>
        each.id === id ? { ...each, chosen: !each.chosen } : each
      )
    );
  };

  const handleChangeName = (id, newIn) => {
    setActiveId(id);
    if (newIn.trim()) {
      const filteredSuggestions = allIngredients.filter((item) =>
        item.name.toLowerCase().includes(newIn.toLowerCase())
      );
      setSuggestions(filteredSuggestions);
    } else {
      setSuggestions([]);
    }

    setIngredients((prev) =>
      prev.map((each) => (each.id === id ? { ...each, name: newIn } : each))
    );
  };
  const handleChangeAmount = (id, newIn) => {
    const sanitizedText = newIn.replace(/[^0-9.]/g, "");

    const parts = sanitizedText.split(".");
    const cleanText = parts[0] + (parts.length > 1 ? "." + parts[1] : "");

    if (
      cleanText === "" ||
      (Number(cleanText) >= 0 && !isNaN(Number(cleanText)))
    ) {
      setIngredients((prev) =>
        prev.map((each) =>
          each.id === id ? { ...each, amount: cleanText } : each
        )
      );
    }
    // setIngredients((prev) =>
    //   prev.map((each) => (each.id === id ? { ...each, amount: newIn } : each))
    // );
  };
  const handleChangeUnit = (id) => {
    // setIngredients((prev) =>
    //   prev.map((each) =>
    //     each.id === id
    //       ? { ...each, unit: each.unit === "g" ? "ml" : "g" }
    //       : each
    //   )
    // );
  };

  const handleDelete = (id) => {
    if (ingredients.length === 1 && !ingredients[0].name.trim()) {
      return;
    }
    setIngredients((prev) => {
      const filtered = prev.filter((item) => item.id !== id);
      if (filtered.length === 0) {
        return [createEmptyIngredient()];
      }
      return filtered;
    });
  };

  const handleSuggestionSelect = (id, selected) => {
    setIngredients((prev) =>
      prev.map((each) => (each.id === id ? { ...each, name: selected } : each))
    );
    setSuggestions([]);
    setActiveId(null);
  };

  const Suggestion = (id, place) => {
    if (activeId !== id || suggestions.length === 0) {
      return null;
    }
    const pos =
      place > 451 ? { bottom: place > 500 ? 88 : 144 } : { top: place - 88 };
    return (
      <ScrollView style={[styles.suggestionsList, pos]}>
        {suggestions.map((item, index) => (
          <TouchableOpacity
            key={index}
            style={[styles.suggestionItem]}
            onPress={() => handleSuggestionSelect(id, item.name)}
          >
            <Text style={styles.suggestionText}>{item.name}</Text>
          </TouchableOpacity>
        ))}
      </ScrollView>
    );
  };

  return (
    <View style={{ position: "relative" }}>
      <FlatList
        ref={flat}
        style={{ position: "relative" }}
        data={ingredients}
        keyExtractor={(item) => item.id.toString()}
        nestedScrollEnabled={true}
        keyboardShouldPersistTaps="handled"
        showsVerticalScrollIndicator={false}
        renderItem={({ item, index }) => (
          <IngredientItem
            id={item.id}
            name={item.name}
            amount={item.amount}
            chosen={item.chosen}
            unit={item.unit}
            onChoose={() => handleChosen(item.id)}
            onChangeName={(moi) => {
              handleChangeName(item.id, moi);
              setActiveIndex(index);
            }}
            onChangeAmount={(moi) => handleChangeAmount(item.id, moi)}
            onChangeUnit={() => handleChangeUnit(item.id)}
            onDelete={() => handleDelete(item.id)}
            onSubmit={() => {
              setActiveId(null);
              setSuggestions([]);
            }}
            onBlur={() => {
              setTimeout(() => {
                setActiveId(null);
                setSuggestions([]);
              }, 1000);
            }}
            setPlace={setPlace}
          />
        )}
      />
      {Suggestion(activeId, place)}
    </View>
  );
};

export default IngredientList;

const styles = StyleSheet.create({
  suggestionsList: {
    width: "50%",
    maxHeight: 200,
    backgroundColor: COLORS.bg,
    borderRadius: 7,
    borderWidth: 2,
    borderColor: COLORS.text,
    position: "absolute",
    right: 0,
    zIndex: 1001,
    elevation: 5,
  },
  suggestionItem: {
    padding: 10,
    borderBottomWidth: 1,
    borderBottomColor: COLORS.border,
  },
  suggestionText: {
    color: COLORS.text,
    fontSize: 18,
  },
});
