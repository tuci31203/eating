import axios from "axios";
import { getItem } from "../../../utils/AsyncStorage";

const apiClient = axios.create({
  baseURL: "https://eating-aa9c7969e33d.herokuapp.com",
  headers: {
    "Content-Type": "application/json",
  },
});

apiClient.interceptors.request.use(
  async (config) => {
    const token = await getItem("token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

apiClient.interceptors.response.use(
  (response) => {
    return response;
  },
  (error) => {
    const { status } = error.response;

    switch (status) {
      case 401:
        // Handle unauthorized error
        console.error("Unauthorized access - perhaps you need to log in?");
        break;
      case 403:
        // Handle forbidden error
        console.error(
          "Access forbidden - you do not have permission to access this resource."
        );
        break;
      case 404:
        // Handle not found error
        console.error(
          "Resource not found - the requested resource does not exist."
        );
        break;
      default:
        // Handle other errors
        console.error("An error occurred:", error.message);
        break;
    }

    return Promise.reject(error);
  }
);

export default apiClient;
