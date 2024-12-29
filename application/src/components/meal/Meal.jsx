import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React, { useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import { ICONS } from "../../configs/constants/graphic";
import { deleteMealApi } from "../../configs/networking/server-api/meal/deleteMeal";
import { useNavigation } from "@react-navigation/native";

const Meal = ({ id, name, list, onChange, ScrollViewRef = null }) => {
  const navigation = useNavigation();
  const [expand, setExpand] = useState(false);
  const handleDelete = async () => {
    const res = await deleteMealApi(id);
    if (res) {
      console.log("DELETE RES: ", res);
      onChange();
    }
  };
  const handleEdit = () => {
    navigation.navigate("add", { screen: "ingre", id });
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity
        activeOpacity={0.9}
        onPress={() => {
          setExpand(!expand);
          ScrollViewRef();
        }}
      >
        <Text style={[styles.title, styles.text]}>{name}</Text>
      </TouchableOpacity>
      {expand && (
        <>
          {list && (
            <TouchableOpacity
              onPress={handleEdit}
              activeOpacity={0.4}
              style={styles.edit}
            >
              <Image
                source={ICONS.edit}
                style={{ width: 18, height: 18 }}
                tintColor={COLORS.text}
              />
            </TouchableOpacity>
          )}
          <View style={styles.ingredientsContainer}>
            <Text
              style={[styles.content, styles.text, !list && { opacity: 0.4 }]}
            >
              {list ? list : "Nothing has been added"}
            </Text>
            {list && (
              <TouchableOpacity
                onPress={handleDelete}
                activeOpacity={0.4}
                style={styles.delete}
              >
                <Image
                  source={ICONS.delete}
                  style={{ width: 18, height: 20 }}
                  tintColor={COLORS.iconDelete}
                />
              </TouchableOpacity>
            )}
          </View>
        </>
      )}
    </View>
  );
};

export default Meal;

const styles = StyleSheet.create({
  container: {
    width: "100%",
    paddingHorizontal: 30,
    paddingVertical: 13,
    borderTopWidth: 2,
    borderTopColor: COLORS.border,
    gap: 10,
  },
  ingredientsContainer: {
    paddingHorizontal: 20,
  },
  title: {
    fontFamily: "Inter-Bold",
    fontSize: 24,
  },
  content: {
    fontFamily: "Inter-Regular",
    fontSize: 20,
    width: 255,
  },
  text: {
    color: COLORS.text,
  },
  edit: {
    // backgroundColor: 'pink',
    width: 24,
    height: 24,
    position: "absolute",
    right: 30,
    top: 13,
  },
  delete: {
    // backgroundColor: 'pink',
    width: 24,
    height: 24,
  },
  ingredientsContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
    paddingHorizontal: 20,
    gap: 9,
  },
});
