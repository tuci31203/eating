import apiClient from "../axiosInstance";

export const calcNutrients = async (body) => {
  try {
    const res = await apiClient.post("/api/getNutrientCount", body);
    return res.data;
  } catch (e) {
    console.log("Error calculating nutrients ", e);
  }
};
