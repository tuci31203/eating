import apiClient from "../axiosInstance";

export const getAllIngredients = async () => {
  try {
    const res = await apiClient.get(`/api/getAllIngredients`);
    return res.data;
  } catch (e) {
    console.log("Error getting ingredients ", e);
  }
};
