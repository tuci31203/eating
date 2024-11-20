import { StyleSheet, TouchableOpacity, View, Image } from 'react-native'
import React, { useContext, useState } from 'react'
import { ICONS } from '../../configs/constants/graphic'
import * as ImagePicker from 'expo-image-picker';
import { StateContext } from '../../context/StateContext';
import { uploadImage } from '../../configs/networking/image-model/uploadImage';
import LoadingOverlay from '../loading-overlay/LoadingOverlay';

const CameraButton = () => {
    const [isLoading, setIsLoading] = useState(false);
    const { ingredients, setIngredients } = useContext(StateContext)

    const captureImage = async () => {
        const result = await ImagePicker.launchCameraAsync({
            mediaTypes: ImagePicker.MediaTypeOptions.Images,
            quality: 0.8,
            allowsEditing: true,
        });

        if (!result.canceled) {
            // setPhoto(result.assets[0]);
            const ingres = await uploadImage(result.assets[0], setIsLoading);
            if (ingres && ingres.length > 0) setIngredients(ingres);
        }
    };


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
            <LoadingOverlay isVisible={isLoading} />
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