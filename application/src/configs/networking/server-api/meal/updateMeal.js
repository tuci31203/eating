import apiClient from "../axiosInstance";

export const updateMealApi = async (body) => {
  try {
    const res = await apiClient.put("/api/updateMeal", body);
    return res.data;
  } catch (e) {
    console.log("ERROR UPDATE MEAL API: ", e);
    throw e;
  }
};
