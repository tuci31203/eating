import { Platform, StyleSheet, Text, TextInput, TouchableOpacity, View } from 'react-native'
import React from 'react'
import { COLORS } from '../../configs/constants/colors'

const IngredientItem = ({
    id, name, amount, chosen, unit, onChoose, onChangeName,
    onChangeAmount, onChangeUnit, onDelete
}) => {

    const handleKeyPress = ({ nativeEvent }) => {
        // console.log(nativeEvent.key)
        if (nativeEvent.key === 'Backspace' && name.trim() === '') {
            onDelete();
        }
    }

    return (
        <View
            style={[
                styles.ngang,
                {
                    paddingLeft: 10,
                    height: chosen === true && name.trim() ? 58 : 44,

                }
            ]}
        >
            <View
                style={[
                    styles.ngang,
                    {
                        width: 194,
                    }
                ]}
            >

                <TouchableOpacity
                    style={[styles.checkbox,
                    {
                        backgroundColor: chosen ? COLORS.blink : 'transparent'
                    }]
                    }
                    value={chosen}
                    onPress={onChoose}
                    activeOpacity={100}
                />

                <TextInput
                    selectionColor={COLORS.blink}
                    style={[styles.text,
                    {
                        marginStart: 10,
                        width: '100%',
                        height: 58,
                    }
                    ]}
                    value={name}
                    onChangeText={onChangeName}
                    onKeyPress={handleKeyPress}
                    placeholder='Type something!'
                    placeholderTextColor={'#9A7C71'}
                    scrollEnabled={false}
                />
            </View>
            {chosen && name.trim() &&
                <View
                    style={[
                        styles.ngang,
                        {
                            width: 'auto',
                            height: 38,
                            borderRadius: 7,
                            borderWidth: 2,
                            borderColor: COLORS.text,
                            position: 'absolute',
                            right: 10,
                            backgroundColor: COLORS.bg,
                        }
                    ]}
                >

                    <TextInput
                        selectionColor={COLORS.blink}
                        style={[styles.text,
                        {
                            paddingHorizontal: 11,
                            height: 58,
                        }
                        ]}
                        value={amount}
                        onChangeText={onChangeAmount}
                        keyboardType={Platform.OS == 'android' ? 'numeric' : "number-pad"}
                        multiline={false}
                        numberOfLines={1}
                    />
                    <TouchableOpacity
                        style={
                            [
                                {
                                    borderStartWidth: 2,
                                    borderColor: COLORS.text,
                                    height: '100%',
                                    width: 37,
                                    alignItems: 'center',
                                    justifyContent: 'center',
                                    paddingBottom: unit === "ml" ? 3 : 5,
                                },

                            ]}
                        activeOpacity={100}
                        onPress={onChangeUnit}
                    >

                        <Text
                            style={[styles.text,
                            {
                                lineHeight: 22,
                            }
                            ]}
                        >
                            {unit}
                        </Text>
                    </TouchableOpacity>
                </View>
            }
        </View>
    )
}

export default IngredientItem

const styles = StyleSheet.create({
    text: {
        fontFamily: 'Inter-Regular',
        fontSize: 20,
        color: COLORS.text,

    },
    checkbox: {
        borderRadius: 4,
        borderWidth: 2,
        borderColor: COLORS.text,
        width: 20,
        height: 20,
    },
    ngang: {
        flexDirection: "row",
        alignItems: "center",
        alignContent: "center"
    }
})