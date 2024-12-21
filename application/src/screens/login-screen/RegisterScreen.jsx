import {
  StyleSheet,
  Text,
  View,
  TextInput,
  TouchableOpacity,
} from "react-native";
import React, { useEffect } from "react";
import ScreenView from "../../components/ScreenView";
import { useState } from "react";
import { COLORS } from "../../configs/constants/colors";
import Button from "../../components/Button";
import { registerApi } from "../../configs/networking/server-api/auth/registerApi";
import { useNavigation } from "@react-navigation/native";
import * as Burnt from "burnt";
import { Ionicons } from "@expo/vector-icons";

const RegisterScreen = () => {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [registerFailed, setRegisterFailed] = useState(false);
  const navigation = useNavigation();
  const [showPassword, setShowPassword] = useState(false);
  const [showConfirmPassword, setShowConfirmPassword] = useState(false);
  const [errors, setErrors] = useState({});

  const validateInputs = () => {
    const newErrors = {};

    if (!username.trim()) {
      newErrors.username = "Username is required";
    }

    if (!password) {
      newErrors.password = "Password is required";
    } else if (password.length < 6) {
      newErrors.password = "Password must be at least 6 characters";
    }
    if (!confirmPassword) {
      newErrors.confirmPassword = "Confirm Password is required";
    } else if (password !== confirmPassword) {
      newErrors.confirmPassword = "Passwords do not match";
    }

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleLogin = async () => {
    if (!validateInputs()) {
      if (errors.password?.length > 0) {
        Burnt.toast({
          title: errors.password,
          preset: "error",
        });
      }
      if (errors.username?.length > 0) {
        Burnt.toast({
          title: errors.username,
          preset: "error",
        });
      }
      if (errors.confirmPassword?.length > 0) {
        Burnt.toast({
          title: errors.confirmPassword,
          preset: "error",
        });
      }
      return;
    }

    const body = {
      username: username.trim(),
      password,
      gender: "M",
    };
    const res = await registerApi(body);
    if (res && res.message) {
      console.log(res);
      navigation.goBack();
      setRegisterFailed(false);
      Burnt.toast({
        title: "Success!",
        message: "Account created successfully",
        preset: "done",
        duration: 2,
      });
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
            <View style={styles.passwordContainer}>
              <TextInput
                selectionColor={COLORS.blink}
                value={password}
                style={styles.input}
                onChangeText={(text) => {
                  setPassword(text);
                  setErrors((prev) => ({ ...prev, password: null }));
                }}
                keyboardType="text"
                secureTextEntry={!showPassword}
                autoCapitalize="none"
              />
              <TouchableOpacity
                style={styles.eyeIcon}
                onPress={() => setShowPassword(!showPassword)}
              >
                <Ionicons
                  name={showPassword ? "eye-off" : "eye"}
                  size={24}
                  color={COLORS.text}
                />
              </TouchableOpacity>
            </View>
          </View>
          <View style={styles.inputContainer}>
            <Text style={styles.label}>Confirm Password</Text>
            <View style={styles.passwordContainer}>
              <TextInput
                selectionColor={COLORS.blink}
                value={confirmPassword}
                style={styles.input}
                onChangeText={(text) => {
                  setConfirmPassword(text);
                  setErrors((prev) => ({ ...prev, password: null }));
                }}
                keyboardType="text"
                secureTextEntry={!showConfirmPassword}
                autoCapitalize="none"
              />
              <TouchableOpacity
                style={styles.eyeIcon}
                onPress={() => setShowConfirmPassword(!showConfirmPassword)}
              >
                <Ionicons
                  name={showConfirmPassword ? "eye-off" : "eye"}
                  size={24}
                  color={COLORS.text}
                />
              </TouchableOpacity>
            </View>
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
    backgroundColor: COLORS.bg,
    padding: 25,
    borderRadius: 25,
    shadowColor: COLORS.text,
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
    width: "100%",
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
  passwordContainer: {
    position: "relative",
    flexDirection: "row",
    alignItems: "center",
  },
  eyeIcon: {
    position: "absolute",
    right: 12,
    top: 15,
  },
});
