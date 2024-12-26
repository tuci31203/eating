import axios from "axios";
import { API_KEY, IMAGE_MODEL } from "@env";
import { capitalizeFirstLetter } from "../../../utils/capitalizeLetter";

export const uploadImage = async (image, setIsLoading) => {
  const formData = new FormData();
  formData.append("model", IMAGE_MODEL);
  formData.append("imgsz", "640");
  formData.append("conf", "0.2");
  formData.append("iou", "0.8");
  formData.append("file", {
    uri: image.uri,
    type: "image/jpeg",
    name: "photo.jpg",
  });

  try {
    setIsLoading(true);
    const response = await axios.post(
      "https://predict.ultralytics.com",
      formData,
      {
        headers: {
          "Content-Type": "multipart/form-data",
          "x-api-key": API_KEY,
        },
      }
    );
    const res = await response.data;
    if (res && res.error) {
      console.log(res.error);
      return;
    }
    if (res && res["images"]) {
      const imgs = res["images"][0]["results"];
      // console.log('======> IMAGES:\n', imgs)
      const names = [...new Set(imgs.map((item) => item.name.toLowerCase()))];
      const ingres = names.map((item, index) => ({
        id: index + 1,
        name: item,
        amount: null,
        chosen: false,
        unit: "g",
      }));
      console.log("======> NAMES:\n", names);
      return ingres;
    }
    return;
    console.log("Upload successful:");
  } catch (error) {
    console.error(
      "Error uploading image:",
      error.response?.data || error.message
    );
    return;
  } finally {
    setIsLoading(false);
  }
};
