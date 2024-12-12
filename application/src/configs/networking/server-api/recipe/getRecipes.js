import apiClient from "../axiosInstance";

export const getRecipesApi = async (ingredients, mode = "only") => {
  try {
    const res = await apiClient.get(
      `/api/getRecipes?ingredients=${ingredients}&ingredientMatchType=${mode}`
    );
    return res.data;
  } catch (e) {
    console.log("ERROR GET RECIPES API: ", e);
    throw e;
  }
};
