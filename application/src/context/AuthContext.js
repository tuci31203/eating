import React, { createContext, useContext, useState } from "react";
import { getItem, removeItem } from "../utils/AsyncStorage";

export const AuthContext = createContext();

export const useAuth = () => {
  return useContext(AuthContext);
};

export const AuthProvider = ({ children }) => {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const checkLoginStatus = async () => {
    const token = await getItem("authToken");
    if (token) {
      setIsLoggedIn(true);
    }
  };

  const handleLogout = async () => {
    await removeItem("authToken");
    setIsLoggedIn(false);
  };

  return (
    <AuthContext.Provider
      value={{ isLoggedIn, setIsLoggedIn, checkLoginStatus, handleLogout }}
    >
      {children}
    </AuthContext.Provider>
  );
};
