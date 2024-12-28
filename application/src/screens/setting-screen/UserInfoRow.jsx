import { Image, StyleSheet, Text, TouchableOpacity, View } from "react-native";
import React, { useEffect, useState } from "react";
import { AVA, ICONS } from "../../configs/constants/graphic";
import { COLORS } from "../../configs/constants/colors";
import { CommonActions, useNavigation } from "@react-navigation/native";
import { useAuth } from "../../context/AuthContext";
import { getItem } from "../../utils/AsyncStorage";

const UserInfoRow = () => {
  const navigation = useNavigation();
  const { handleLogout } = useAuth();
  const getName = async () => await getItem("username");
  const [user, setUser] = useState({
    name: "",
    email: "Hello! We are eating!",
    avatar: AVA,
  });

  useEffect(() => {
    const loadName = async () => {
      const name = await getName();
      setUser((prev) => ({ ...prev, name }));
    };
    loadName();
  }, []);
  const onLogout = async () => {
    await handleLogout();
    console.log("logout");
    navigation.dispatch(
      CommonActions.reset({
        index: 0,
        routes: [{ name: "home" }],
      })
    );
  };
  return (
    <View style={styles.container}>
      <View style={styles.info}>
        <Image source={user.avatar} style={styles.avatar} />
        <View>
          <Text style={[styles.text, styles.name]}>{user.name}</Text>
          <Text style={[styles.text, styles.email]}>{user.email}</Text>
        </View>
      </View>
      <TouchableOpacity onPress={onLogout}>
        <Image
          source={ICONS.logout}
          style={styles.icon}
          resizeMethod="contain"
          tintColor={COLORS.text}
        />
      </TouchableOpacity>
    </View>
  );
};

export default UserInfoRow;

const styles = StyleSheet.create({
  container: {
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between",
    marginHorizontal: 48,
    marginTop: 50,
  },
  info: {
    flexDirection: "row",
    alignItems: "center",
    gap: 19,
  },
  avatar: {
    width: 68,
    height: 68,
    borderRadius: 34,
    borderWidth: 2,
    borderColor: COLORS.text,
  },
  name: {
    fontFamily: "Inter-Bold",
    fontSize: 20,
  },
  email: {
    fontFamily: "Inter-Regular",
    fontSize: 14,
  },
  text: {
    color: COLORS.text,
  },
  icon: {
    height: 20,
    width: 23.7,
  },
});
