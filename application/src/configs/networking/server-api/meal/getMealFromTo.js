import apiClient from "../axiosInstance";

export const getMealsFromTo = async (start_time, end_time) => {
  try {
    const res = await apiClient.get(
      `/api/getMealsByTimeRange?start_time=${start_time}&end_time=${end_time}`
    );
    return res.data;
  } catch (e) {
    console.log("Error getting meals in time range ", e);
  }
};
