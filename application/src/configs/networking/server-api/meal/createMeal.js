import apiClient from "../axiosInstance";

export const createMealApi = async (body) => {
  try {
    const res = await apiClient.post("/api/createMeal", body);
    return res.data;
  } catch (err) {
    console.log("Error in createMealApi", err);
    throw err;
  }
};
