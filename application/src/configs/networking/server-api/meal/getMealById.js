import apiClient from "../axiosInstance";

export const getMealByIdApi = async (meal_id) => {
  try {
    const res = await apiClient.get(`/api/getMealbyId?meal_id=${meal_id}`);
    return res.data;
  } catch (e) {
    console.log("Error getting meal by id ", e);
  }
};
