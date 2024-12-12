import { StyleSheet, Text, View, TextInput } from "react-native";
import React from "react";
import ScreenView from "../../components/ScreenView";
import { useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import Button from "../../components/Button";
import { registerApi } from "../../configs/networking/server-api/auth/registerApi";
import { useNavigation } from "@react-navigation/native";

const RegisterScreen = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [registerFailed, setRegisterFailed] = useState(false);
  const navigation = useNavigation();

  const handleLogin = async () => {
    const body = {
      username,
      password,
      gender: "M",
    };
    const res = await registerApi(body);
    if (res && res.message) {
      console.log(res);
      navigation.goBack();
      setRegisterFailed(false);
    } else {
      setRegisterFailed(true);
    }
  };

  return (
    <ScreenView>
      <View style={styles.outerContainer}>
        <View style={styles.container}>
          <Text style={styles.welcomeText}>Welcome to eating!</Text>

          <View style={styles.inputContainer}>
            <Text style={styles.label}>Username</Text>
            <TextInput
              value={username}
              style={styles.input}
              onChangeText={(text) => setUsername(text)}
              placeholder=""
              keyboardType="text"
            />
          </View>

          <View style={styles.inputContainer}>
            <Text style={styles.label}>Password</Text>
            <TextInput
              value={password}
              style={styles.input}
              onChangeText={(text) => setPassword(text)}
              placeholder=""
              keyboardType="text"
              secureTextEntry={true}
            />
          </View>

          {registerFailed && (
            <Text style={styles.errorText}>Failed. Try again</Text>
          )}

          <Button
            title={"Sign up"}
            variant="action"
            style={[styles.botBut]}
            onPress={handleLogin}
          />

          {/* Sign Up Text */}
          <View style={styles.signUpContainer}>
            <Text style={styles.signUpText}>Already have an account?</Text>
            <Text style={styles.signUpLink} onPress={() => navigation.goBack()}>
              {" "}
              Sign in
            </Text>
          </View>
        </View>
      </View>
    </ScreenView>
  );
};

export default RegisterScreen;

const styles = StyleSheet.create({
  outerContainer: {
    flex: 1,
    justifyContent: "center",
    alignItems: "center",
    backgroundColor: "#FFEFE0",
    padding: 10,
  },
  container: {
    width: "90%",
    backgroundColor: "white",
    padding: 25,
    borderWidth: 1,
    borderColor: "#E0E0E0",
    borderRadius: 15,
    shadowColor: "#000",
    shadowOffset: { width: 0, height: 5 },
    shadowOpacity: 0.1,
    shadowRadius: 10,
    elevation: 5,
  },
  welcomeText: {
    fontSize: 18,
    fontFamily: "Inter-Bold",
    color: COLORS.text,
    marginBottom: 20,
    textTransform: "uppercase",
    alignSelf: "center",
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
    borderColor: COLORS.border,
    borderRadius: 9,
    paddingLeft: 10,
    marginTop: 5,
  },
  loginButton: {
    backgroundColor: COLORS.buttonBackground,
    borderRadius: 15,
    paddingVertical: 15,
    paddingHorizontal: 40,
    marginTop: 20,
  },
  botBut: {
    alignSelf: "center",
    backgroundColor: "#FF7F50",
    paddingVertical: 5,
    paddingHorizontal: 20,

    borderRadius: 20,
    marginTop: 15,
  },
  buttonText: {
    fontSize: 10,
    fontFamily: "Inter-SemiBold",
    color: COLORS.buttonText,
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
    color: COLORS.text,
  },
  signUpLink: {
    fontSize: 14,
    fontFamily: "Inter-SemiBold",
    color: COLORS.text,
  },
});
