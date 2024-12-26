import { useState } from "react";
import NutritionInputModal from "./NutritientModal";
import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import { ICONS } from "../../configs/constants/graphic";
import { COLORS } from "../../configs/constants/colors";

const ModalButton = ({ goals, setGoals }) => {
  const [modalVisible, setModalVisible] = useState(false);
  const handleSave = async (nutritionData) => {
    console.log("Nutrition Data:", nutritionData);
    setGoals(nutritionData);
  };

  return (
    <View style={styles.container}>
      <TouchableOpacity
        onPress={() => setModalVisible(true)}
        style={styles.button}
      >
        <Image
          source={ICONS.edit}
          style={{ width: 20, height: 20 }}
          tintColor={COLORS.text}
        />
      </TouchableOpacity>

      <NutritionInputModal
        visible={modalVisible}
        onClose={() => setModalVisible(false)}
        onSave={handleSave}
        initialValues={goals}
      />
    </View>
  );
};

const styles = StyleSheet.create({
  button: {
    borderWidth: 2,
    borderColor: COLORS.text,
    backgroundColor: COLORS.bg,
    zIndex: 3,
    width: 40,
    height: 40,
    borderRadius: 20,
    justifyContent: "center",
    alignItems: "center",
  },
  container: {
    position: "absolute",
    top: 10,
    right: 25,
  },
});

export default ModalButton;
