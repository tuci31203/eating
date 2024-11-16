import { StyleSheet, TouchableOpacity, Text, View, Image } from 'react-native'
import React, { useState } from 'react'
import { ICONS } from '../../configs/constants/graphic'
import { COLORS } from '../../configs/constants/colors'
import * as ImagePicker from 'expo-image-picker';

const CameraButton = () => {
    const [photo, setPhoto] = useState(null);

    // Function to open the camera
    const captureImage = async () => {
        const permissionResult = await ImagePicker.requestCameraPermissionsAsync();

        if (!permissionResult.granted) {
            alert('Camera permission is required to use this feature');
            return;
        }

        const result = await ImagePicker.launchCameraAsync({
            mediaTypes: 'images',
            quality: 0.8,
            allowsEditing: true,
        });

        if (!result.canceled) {
            setPhoto(result.assets[0]);
        }
    };
    return (
        <View>
            <TouchableOpacity

                activeOpacity={0.8}
                style={[
                    {
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
                ]}
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

const styles = StyleSheet.create({})