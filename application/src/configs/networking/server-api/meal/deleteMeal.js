import apiClient from "../axiosInstance";

export const deleteMealApi = async (meal_id) => {
  try {
    const res = await apiClient.delete("/api/deleteMeal", {
      data: { meal_id },
    });
    return res.data;
  } catch (e) {
    console.log("DELETE_ERROR ", e);
  }
};
