import {
  FlatList,
  Platform,
  ScrollView,
  StyleSheet,
  Text,
  TextInput,
  TouchableOpacity,
  View,
} from "react-native";
import React, { useContext, useEffect, useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import { StateContext } from "../../context/StateContext";

const IngredientItem = ({
  id,
  name,
  amount,
  chosen,
  unit,
  onChoose,
  onChangeName,
  onChangeAmount,
  onChangeUnit,
  onDelete,
}) => {
  const [showSuggestions, setShowSuggestions] = useState(false);
  const [suggestions, setSuggestions] = useState([]);
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
  const handleKeyPress = ({ nativeEvent }) => {
    // console.log(nativeEvent.key)
    if (nativeEvent.key === "Backspace" && name.trim() === "") {
      setShowSuggestions(false);
      onDelete();
    }
  };

  const handleSelect = (selectedItem) => {
    onChangeName(selectedItem.name);
    setShowSuggestions(false);
    setFc(false);
  };

  return (
    <>
      <View
        style={[
          styles.ngang,
          {
            paddingLeft: 10,
            height: chosen === true && name.trim() ? 58 : 44,
            position: "relative",
          },
        ]}
      >
        <View
          style={[
            styles.ngang,
            {
              width: 194,
            },
          ]}
        >
          <TouchableOpacity
            style={[
              styles.checkbox,
              {
                backgroundColor: chosen ? COLORS.blink : "transparent",
              },
            ]}
            value={chosen}
            onPress={onChoose}
            activeOpacity={100}
          />

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
            onKeyPress={handleKeyPress}
            onFocus={() => setFc(true)}
            placeholder="Type something!"
            placeholderTextColor={"#9A7C71"}
            scrollEnabled={false}
          />
        </View>
        {chosen && name.trim() && (
          <View
            style={[
              styles.ngang,
              {
                width: "auto",
                height: 38,
                borderRadius: 7,
                borderWidth: 2,
                borderColor: COLORS.text,
                position: "absolute",
                right: 10,
                backgroundColor: COLORS.bg,
              },
            ]}
          >
            <TextInput
              selectionColor={COLORS.blink}
              style={[
                styles.text,
                {
                  paddingHorizontal: 11,
                  height: 58,
                },
              ]}
              value={amount}
              onChangeText={onChangeAmount}
              keyboardType={Platform.OS == "android" ? "numeric" : "number-pad"}
              multiline={false}
              numberOfLines={1}
            />
            <TouchableOpacity
              style={[
                {
                  borderStartWidth: 2,
                  borderColor: COLORS.text,
                  height: "100%",
                  width: 37,
                  alignItems: "center",
                  justifyContent: "center",
                  paddingBottom: unit === "ml" ? 3 : 5,
                },
              ]}
              activeOpacity={100}
              onPress={onChangeUnit}
            >
              <Text
                style={[
                  styles.text,
                  {
                    lineHeight: 22,
                  },
                ]}
              >
                {unit}
              </Text>
            </TouchableOpacity>
          </View>
        )}
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
                >
                  <Text style={styles.suggestionText}>{item.name}</Text>
                </TouchableOpacity>
              ))}
            </ScrollView>
          </View>
        )}
      </View>
    </>
  );
};

export default IngredientItem;

const styles = StyleSheet.create({
  text: {
    fontFamily: "Inter-Regular",
    fontSize: 20,
    color: COLORS.text,
  },
  checkbox: {
    borderRadius: 4,
    borderWidth: 2,
    borderColor: COLORS.text,
    width: 20,
    height: 20,
  },
  ngang: {
    flexDirection: "row",
    alignItems: "center",
    alignContent: "center",
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
