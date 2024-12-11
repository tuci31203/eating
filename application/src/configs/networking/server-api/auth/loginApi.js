import apiClient from "../axiosInstance";

export const loginApi = async (username, password) => {
  try {
    const res = await apiClient.post("/api/logIn", {
      username,
      password,
    });
    return res.data;
  } catch (err) {
    console.log("Error in loginApi", err);
    throw err;
  }
};
