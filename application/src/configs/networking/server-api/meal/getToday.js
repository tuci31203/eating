import apiClient from "../axiosInstance";

export const getTodayMealsApi = async () => {
  try {
    const res = await apiClient.get("/api/getTodayMeals");
    return res.data;
  } catch (e) {
    console.log("Error getting todays meal ", e);
  }
};
