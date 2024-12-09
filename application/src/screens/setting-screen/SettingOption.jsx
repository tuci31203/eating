import { StyleSheet, Text, TouchableOpacity, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const SettingOption = () => {
    return (
        <View style={styles.container}>
            <TouchableOpacity
                activeOpacity={0.7}
            >
                <Text style={styles.text}>Notification</Text>
            </TouchableOpacity>
            <TouchableOpacity
                activeOpacity={0.7}
            >
                <Text style={styles.text}>Change password</Text>
            </TouchableOpacity>


        </View>
    )
}

export default SettingOption

const styles = StyleSheet.create({
    container: {
        marginHorizontal: 58,
        marginTop: 60,
        gap: 20,
        // backgroundColor: 'pink'
    },
    text: {
        fontFamily: 'Inter-Medium',
        fontSize: 20,
        color: COLORS.text,
    }
})