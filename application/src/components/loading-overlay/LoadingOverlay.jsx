import { Modal, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import LottieView from 'lottie-react-native'
import { ANIMS } from '../../configs/constants/graphic'

const LoadingOverlay = ({ isVisible }) => {
    return (
        <Modal
            transparent={true}
            animationType='fade'
            visible={isVisible}
            statusBarTranslucent={true}
        >
            <View style={styles.overlay}>
                <LottieView
                    source={ANIMS.searching}
                    autoPlay
                    loop
                    style={styles.lottie}
                />
            </View>
        </Modal>
    )
}

export default LoadingOverlay

const styles = StyleSheet.create({
    overlay: {
        flex: 1,
        backgroundColor: 'rgba(255, 214, 181,0.5)',
        justifyContent: 'center',
        alignItems: 'center',
    },
    lottie: {
        width: 250,
        height: 250,
    }
})