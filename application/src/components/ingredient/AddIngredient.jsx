import { StyleSheet, Text, TextInput, View } from "react-native";
import React, { useContext, useEffect, useState } from "react";
import { StateContext } from "../../context/StateContext";
import { COLORS } from "../../configs/constants/colors";

const AddIngredient = ({ ingredients, setIngredients }) => {
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [suggestions, setSuggestions] = useState([]);
  const [name, onChangeName] = useState("");
  const { allIngredients } = useContext(StateContext);
  const [fc, setFc] = useState(false);

  useEffect(() => {
    if (name.length > 0 && fc) {
      const filteredSuggestions = allIngredients.filter((item) =>
        item.name.toLowerCase().includes(name.toLowerCase())
      );
      setSuggestions(filteredSuggestions);
      setShowSuggestions(true);
    } else {
      setSuggestions([]);
      setShowSuggestions(false);
    }
  }, [name, allIngredients]);
  const handleSelect = (selectedItem) => {
    onChangeName(selectedItem.name);
    setShowSuggestions(false);
    setFc(false);
  };
  const handleChangeName = (id, newIn) => {
    setIngredients((prev) =>
      prev.map((each) => (each.id === id ? { ...each, name: newIn } : each))
    );
  };
  return (
    <View>
      <Text>AddIngredient</Text>
      <TextInput
        autoCapitalize="none"
        selectionColor={COLORS.blink}
        style={[
          styles.text,
          {
            marginStart: 10,
            width: "100%",
            height: 58,
          },
        ]}
        value={name}
        // onBlur={() => {
        //   setShowSuggestions(false);
        //   setFc(false);
        // }}
        onChangeText={onChangeName}
        placeholder="Type something!"
        placeholderTextColor={"#9A7C71"}
        scrollEnabled={false}
      />
      {showSuggestions && suggestions.length > 0 && (
        <View style={styles.suggestionsContainer}>
          <ScrollView
            //   contentContainerStyle={{ flexGrow: 1 }}

            style={styles.suggestionsList}
          >
            {suggestions.map((item) => (
              <TouchableOpacity
                key={item.ingredient_id}
                style={styles.suggestionItem}
                onPress={() => handleSelect(item)}
                // onPress={() => handleSelect(item)}
              >
                <Text style={styles.suggestionText}>{item.name}</Text>
              </TouchableOpacity>
            ))}
          </ScrollView>
        </View>
      )}
    </View>
  );
};

export default AddIngredient;

const styles = StyleSheet.create({
  text: {
    fontFamily: "Inter-Regular",
    fontSize: 20,
    color: COLORS.text,
  },
  suggestionsContainer: {
    position: "absolute",
    top: 60,
    left: 0,
    right: 0,
    zIndex: 1,
    // maxHeight: 200,
  },
  suggestionsList: {
    // maxHeight: 200,
    overflow: "scroll",
    backgroundColor: COLORS.bg,
    borderRadius: 7,
    borderWidth: 2,
    borderColor: COLORS.text,
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
