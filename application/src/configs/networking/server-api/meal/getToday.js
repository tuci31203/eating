import apiClient from "../axiosInstance";

export const getTodayMealsApi = async () => {
  try {
    // const res = await apiClient.get("/api/getTodayMeals");
    // return res.data;
    const today = new Date();
    const start = today.setUTCHours(0, 0, 0, 0);
    const start_time = new Date(start).toISOString();
    const end = today.setUTCHours(23, 59, 59, 999);
    const end_time = new Date(end).toISOString();
    console.log("Getting TODAY meals from ", start_time, " to ", end_time);
    const res = await apiClient.get(
      `/api/getMealsByTimeRange?start_time=${start_time}&end_time=${end_time}`
    );
    return res.data;
  } catch (e) {
    console.log("Error getting todays meal ", e);
  }
};
