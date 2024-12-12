import { StyleSheet, Text, View, TextInput } from "react-native";
import React from "react";
import ScreenView from "../../components/ScreenView";
import { useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import Button from "../../components/Button";
import { loginApi } from "../../configs/networking/server-api/auth/loginApi";
import { setItem } from "../../utils/AsyncStorage";
import { useAuth } from "../../context/AuthContext";
import { useNavigation } from "@react-navigation/native";

const LoginScreen = () => {
  const { setIsLoggedIn } = useAuth();
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [loginFailed, setLoginFailed] = useState(false);
  const navigation = useNavigation();

  const handleLogin = async () => {
    const res = await loginApi(username, password);
    if (res.token) {
      await setItem("token", res.token);
      await setItem("username", username);
      setLoginFailed(false);
      setIsLoggedIn(true);
    } else {
      setLoginFailed(true);
    }
  };

  return (
    <ScreenView>
      <View style={styles.outerContainer}>
        <View style={styles.container}>
          {/* Welcome Text */}
          <Text style={styles.welcomeText}>Welcome to eating!</Text>

          {/* Username Input */}
          <View style={styles.inputContainer}>
            <Text style={styles.label}>Username</Text>
            {/* <View style={styles.input}></View> */}
            <TextInput
              value={username}
              style={styles.input}
              // onChangeText={onChangeNumber}
              onChangeText={(text) => setUsername(text)}
              // value={number}
              placeholder=""
              keyboardType="text"
            />
          </View>

          {/* Password Input */}
          <View style={styles.inputContainer}>
            <Text style={styles.label}>Password</Text>
            {/* <View style={styles.input}>nnnn</View> */}
            <TextInput
              value={password}
              style={styles.input}
              // onChangeText={onChangeNumber}
              // value={number}
              onChangeText={(text) => setPassword(text)}
              placeholder=""
              keyboardType="text"
              secureTextEntry={true}
            />
          </View>

          {loginFailed && (
            <Text style={styles.errorText}>Failed. Try again</Text>
          )}

          <Button
            title={"Login"}
            variant="action"
            style={[
              styles.botBut,
              // { center : 0 }
            ]}
            onPress={handleLogin} // handle logic on selectLogin function
          />

          {/* Sign Up Text */}
          <View style={styles.signUpContainer}>
            <Text style={styles.signUpText}>Don’t have an account?</Text>
            <Text
              style={styles.signUpLink}
              onPress={() => navigation.navigate("Register")}
            >
              {" "}
              Sign up
            </Text>
          </View>
        </View>
      </View>
    </ScreenView>
  );
};

export default LoginScreen;

// const styles = StyleSheet.create({})
// const styles = StyleSheet.create({});
const styles = StyleSheet.create({
  outerContainer: {
    flex: 1,
    justifyContent: "center", // Center nội dung theo chiều dọc
    alignItems: "center", // Center nội dung theo chiều ngang
    backgroundColor: "#FFEFE0", // Màu nền bên ngoài
    padding: 10,
  },
  container: {
    width: "90%", // Hoặc dùng giá trị cụ thể như 300
    backgroundColor: "white", // Màu nền của khung login
    padding: 25,
    borderWidth: 1,
    borderColor: "#E0E0E0",
    borderRadius: 15,
    shadowColor: "#000", // Tạo hiệu ứng đổ bóng
    shadowOffset: { width: 0, height: 5 },
    shadowOpacity: 0.1,
    shadowRadius: 10,
    elevation: 5, // Đổ bóng trên Android
  },
  welcomeText: {
    fontSize: 18,
    fontFamily: "Inter-Bold",
    marginBottom: 20,
    textTransform: "uppercase",
    alignSelf: "center",
    color: COLORS.text,
  },
  inputContainer: {
    marginBottom: 20,
  },
  label: {
    fontSize: 14,
    fontFamily: "Inter-SemiBold",
    color: COLORS.text,
  },
  input: {
    height: 45,
    borderWidth: 2,
    borderColor: COLORS.border, // Use your border color from COLORS
    borderRadius: 9,
    paddingLeft: 10,
    marginTop: 5,
  },
  loginButton: {
    backgroundColor: COLORS.buttonBackground, // Use button background color from COLORS
    borderRadius: 15,
    paddingVertical: 15,
    paddingHorizontal: 40,
    marginTop: 20,
  },
  botBut: {
    alignSelf: "center", // Đưa nút Login ra giữa theo chiều ngang
    backgroundColor: COLORS.plusBtn, // Màu nền nút
    paddingVertical: 5, // Chiều cao nút
    paddingHorizontal: 20, // Độ rộng nút

    borderRadius: 20, // Góc bo tròn của nút
    marginTop: 15, // Khoảng cách phía trên
  },
  buttonText: {
    fontSize: 10,
    fontFamily: "Inter-SemiBold",
    color: COLORS.buttonText, // Use button text color from COLORS
    textAlign: "center",
  },
  signUpContainer: {
    flexDirection: "row",
    justifyContent: "center",
    marginTop: 20,
  },
  signUpText: {
    fontSize: 14,
    fontFamily: "Inter-Regular",
    color: COLORS.text, // Use your secondary color from COLORS
  },
  signUpLink: {
    fontSize: 14,
    fontFamily: "Inter-SemiBold",
    color: COLORS.text, // Use link color from COLORS
  },
});
