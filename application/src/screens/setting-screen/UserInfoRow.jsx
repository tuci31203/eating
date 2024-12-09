import { Image, StyleSheet, Text, TouchableOpacity, View } from 'react-native'
import React, { useState } from 'react'
import { AVA, ICONS } from '../../configs/constants/graphic'
import { COLORS } from '../../configs/constants/colors'

const UserInfoRow = () => {
    const [user, setUser] = useState({
        name: 'Chiến',
        email: 'diachi@gmail.com',
        avatar: AVA
    })
    return (
        <View style={styles.container}>
            <View style={styles.info}>
                <Image
                    source={user.avatar}
                    style={styles.avatar}
                />
                <View>
                    <Text style={[styles.text, styles.name]}>{user.name}</Text>
                    <Text style={[styles.text, styles.email]}>{user.email}</Text>
                </View>
            </View>
            <TouchableOpacity>
                <Image
                    source={ICONS.logout}
                    style={styles.icon}
                    resizeMethod='contain'
                    tintColor={COLORS.text}
                />
            </TouchableOpacity>
        </View>
    )
}

export default UserInfoRow

const styles = StyleSheet.create({
    container: {
        flexDirection: 'row',
        alignItems: 'center',
        justifyContent: 'space-between',
        marginHorizontal: 48,
        marginTop: 50,
    },
    info: {
        flexDirection: 'row',
        alignItems: 'center',
        gap: 19,
    },
    avatar: {
        width: 68,
        height: 68,
        borderRadius: 34,
        borderWidth: 2,
        borderColor: COLORS.text,
    },
    name: {
        fontFamily: 'Inter-Bold',
        fontSize: 20,
    },
    email: {
        fontFamily: 'Inter-Regular',
        fontSize: 14,
    },
    text: {
        color: COLORS.text
    },
    icon: {
        height: 20,
        width: 23.7,
    }
})