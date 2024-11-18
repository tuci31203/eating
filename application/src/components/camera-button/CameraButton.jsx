import { StyleSheet, TouchableOpacity, View, Image, Alert } from 'react-native'
import React, { useContext, useState } from 'react'
import { ICONS } from '../../configs/constants/graphic'
import { API_KEY, IMAGE_MODEL } from '@env';
import * as ImagePicker from 'expo-image-picker';
import axios from 'axios';
import { StateContext } from '../../context/StateContext';

const CameraButton = () => {

    const [photo, setPhoto] = useState(null);
    const { ingredients, setIngredients } = useContext(StateContext)

    const captureImage = async () => {
        const result = await ImagePicker.launchCameraAsync({
            mediaTypes: ImagePicker.MediaTypeOptions.Images,
            quality: 0.8,
            allowsEditing: true,
        });

        if (!result.canceled) {
            setPhoto(result.assets[0]);
            uploadImage(result.assets[0]);
        }
    };

    const uploadImage = async (image) => {
        const formData = new FormData();
        formData.append('model', IMAGE_MODEL);
        formData.append('imgsz', '640');
        formData.append('conf', '0.2');
        formData.append('iou', '0.8');
        formData.append('file', {
            uri: image.uri,
            type: 'image/jpeg',
            name: 'photo.jpg',
        });

        try {
            const response = await axios.post('https://predict.ultralytics.com', formData, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                    'x-api-key': API_KEY,
                },
            });
            const res = await response.data
            if (res && res.error) {
                console.log(res.error)
                return
            }
            if (res && res["images"]) {
                const imgs = res["images"][0]["results"]
                console.log('======> IMAGES:\n', imgs)
                const names = [...new Set(imgs.map(item => item.name))]
                const ingres = names.map((item, index) => ({
                    id: index + 1,
                    name: item,
                    amount: null,
                    chosen: false,
                    unit: 'g',
                }))
                console.log('======> NAMES:\n', names, '\n======> INGREDIENTS\n', ingres)
                setIngredients(ingres);

            }

            console.log('Upload successful:');
        } catch (error) {
            console.error('Error uploading image:', error.response?.data || error.message);
        }
    }

    return (
        <View>
            <TouchableOpacity

                activeOpacity={0.8}
                style={[styles.camera,]}
                onPress={captureImage}
            >
                <Image
                    source={ICONS.camera}
                    resizeMethod="contain"
                    style={[{ width: 47.5, height: 47.5 },
                    ]}
                />
            </TouchableOpacity>
        </View>
    )
}

export default CameraButton

const styles = StyleSheet.create({
    camera: {
        position: 'absolute',
        bottom: 127,
        alignSelf: 'center',
        width: 63,
        height: 63,
        backgroundColor: '#DD5929',
        justifyContent: 'center',
        alignItems: 'center',
        borderRadius: 32
    }
})