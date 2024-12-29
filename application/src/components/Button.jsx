// Button.jsx
import { LinearGradient } from "expo-linear-gradient";
import React from "react";
import {
  StyleSheet,
  Text,
  TouchableOpacity,
  Platform,
  View,
} from "react-native";

const Button = ({
  title,
  variant = "default", // 'default' | 'action' | 'mealDef' | 'mealAct'
  onPress,
  style,
  textStyle,
  disabled,
  leftIcon,
  rightIcon,
}) => {
  return (
    <View
      style={{
        // flex: 1,
        justifyContent: "center",
        alignItems: "center",
      }}
    >
      <TouchableOpacity
        onPress={onPress}
        disabled={disabled}
        activeOpacity={0.8}
        style={[
          styles.button,
          styles[variant],
          disabled && styles.disabled,
          style,
        ]}
      >
        {variant === "action" && (
          <LinearGradient
            colors={["#FFBD7B", "#EB602E"]}
            style={[StyleSheet.absoluteFillObject]}
            start={[0, 0]}
            end={[1, 1]}
          />
        )}
        {leftIcon}
        <Text
          style={[
            styles.text,
            styles[`${variant}Text`],
            disabled && styles.disabledText,
            textStyle,
          ]}
        >
          {title}
        </Text>
        {rightIcon}
      </TouchableOpacity>
    </View>
  );
};

const styles = StyleSheet.create({
  button: {
    alignSelf: "flex-start",
    flexDirection: "row",
    paddingVertical: 11,
    paddingHorizontal: 15,
    justifyContent: "center",
    alignItems: "center",
    gap: 10,
    borderRadius: 15,
    overflow: "hidden",
  },
  // Action variant styles
  action: {
    // backgroundColor: "transparent",
    backgroundColor: "#DD5929",
    borderWidth: 3,
    borderColor: "#F89B5F",
  },
  actionText: {
    color: "white",
    fontSize: 20,
    fontFamily: "Inter-SemiBold",
  },

  mealDef: {
    backgroundColor: "#FFF",
    ...Platform.select({
      ios: {
        shadowColor: "rgba(0, 0, 0, 0.25)",
        shadowOffset: {
          width: 0,
          height: 0,
        },
        shadowOpacity: 1,
        shadowRadius: 5,
      },
      android: {
        elevation: 2,
        shadowColor: "#000000",
      },
    }),
  },
  mealDefText: {
    color: "#4B1704",
    fontSize: 20,
    fontFamily: "Inter-SemiBold",
  },
  mealAct: {
    backgroundColor: "#FFF",
    borderWidth: 3,
    borderColor: "#F89B5F",
  },
  mealActText: {
    color: "#4B1704",
    fontSize: 20,
    fontFamily: "Inter-SemiBold",
  },
  // Default variant styles
  default: {
    backgroundColor: "#FFF",
    ...Platform.select({
      ios: {
        shadowColor: "rgba(176, 9, 9, 0.40)",
        shadowOffset: {
          width: 0,
          height: 0,
        },
        shadowOpacity: 1,
        shadowRadius: 5,
      },
      android: {
        elevation: 4,
        shadowColor: "#B00909",
      },
    }),
  },
  defaultText: {
    color: "#DD5929",
    fontSize: 20,
    fontFamily: "Inter-SemiBold",
  },
  // Disabled state
  disabled: {
    opacity: 0.6,
  },
  disabledText: {
    opacity: 0.6,
  },
});

export default Button;
