import apiClient from "../axiosInstance";

export const getMealsFromTo = async (start_time, end_time) => {
  try {
    console.log("Getting meals from ", start_time, " to ", end_time);
    const res = await apiClient.get(
      `/api/getMealsByTimeRange?start_time=${start_time}&end_time=${end_time}`
    );
    return res.data;
  } catch (e) {
    console.log("Error getting meals in time range ", e);
  }
};
