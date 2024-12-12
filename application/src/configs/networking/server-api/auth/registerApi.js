import apiClient from "../axiosInstance";

export const registerApi = async (body) => {
  try {
    const res = await apiClient.post("/api/signUp", body);
    return res.data;
  } catch (e) {
    console.log("ERROR REGISTERING ", e);
    throw e;
  }
};
