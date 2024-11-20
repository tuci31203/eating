import React, { useState } from 'react';
import {
    Modal,
    View,
    Text,
    TextInput,
    StyleSheet,
    ScrollView,
    KeyboardAvoidingView,
    Platform,
} from 'react-native';
import { COLORS } from '../../configs/constants/colors';
import Button from '../Button';

const NutritionInputModal = ({ visible, onClose, onSave, initialValues = {} }) => {
    const [nutritionData, setNutritionData] = useState({
        calory: initialValues?.calory?.toString() || '',
        water: initialValues?.water?.toString() || '',
        fiber: initialValues?.fiber?.toString() || '',
        fat: initialValues?.fat?.toString() || '',
        protein: initialValues?.protein?.toString() || '',
        carbs: initialValues?.carbs?.toString() || '',
        sugar: initialValues?.sugar?.toString() || '',
    });

    const handleChange = (key, value) => {
        // Only allow numbers and decimal point
        const numericValue = value.replace(/[^0-9.]/g, '');
        setNutritionData(prev => ({
            ...prev,
            [key]: numericValue
        }));
    };

    const handleSave = () => {
        // Convert strings to numbers before saving
        const processedData = Object.keys(nutritionData).reduce((acc, key) => {
            acc[key] = nutritionData[key] ? parseFloat(nutritionData[key]) : 0;
            return acc;
        }, {});

        onSave(processedData);
        onClose();
    };

    const renderInput = (label, key, unit = 'g') => (
        <View style={styles.inputContainer}>
            <Text style={styles.label}>{label}</Text>
            <View style={styles.inputWrapper}>
                <TextInput
                    selectionColor={COLORS.blink}
                    style={styles.input}
                    value={nutritionData[key]}
                    onChangeText={(value) => handleChange(key, value)}
                    keyboardType="decimal-pad"
                    placeholder="0"
                    placeholderTextColor={COLORS.placeholder}
                />
                <Text style={styles.unit}>{unit}</Text>
            </View>
        </View>
    );

    return (
        <Modal
            visible={visible}
            animationType="fade"
            transparent={true}
            statusBarTranslucent={true}
            onRequestClose={onClose}
        >
            <KeyboardAvoidingView
                behavior={Platform.OS === "ios" ? "padding" : "height"}
                style={styles.keyboardAvoidingView}
            >
                <View style={styles.modalContainer}>
                    <View style={styles.modalContent}>
                        <Text style={styles.title}>Set goal</Text>

                        <ScrollView showsVerticalScrollIndicator={false} style={styles.scrollView}>
                            {renderInput('Calory', 'calory', 'kcal')}
                            {renderInput('Carbs', 'carbs')}
                            {renderInput('Water', 'water', 'ml')}
                            {renderInput('Fat', 'fat')}
                            {renderInput('Sugar', 'sugar')}
                            {renderInput('Protein', 'protein')}
                            {renderInput('Fiber', 'fiber')}
                        </ScrollView>

                        <View style={styles.buttonContainer}>
                            <Button
                                title="Cancel"
                                variant="default"
                                onPress={onClose}
                            />
                            <Button
                                title="Save"
                                variant="action"
                                onPress={handleSave}
                            />
                        </View>
                    </View>
                </View>
            </KeyboardAvoidingView>
        </Modal>
    );
};

const styles = StyleSheet.create({
    keyboardAvoidingView: {
        flex: 1,
    },
    modalContainer: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: 'rgba(41, 15, 5, 0.5)',
    },
    modalContent: {
        width: '90%',
        maxHeight: '80%',
        backgroundColor: COLORS.bg,
        borderRadius: 25,
        paddingHorizontal: 20,
        paddingTop: 20,
        paddingBottom: 0,
        shadowColor: COLORS.text,
        shadowOffset: {
            width: 0,
            height: 2,
        },
        shadowOpacity: 0.25,
        shadowRadius: 4,
        elevation: 5,
    },
    title: {
        fontSize: 24,
        fontFamily: 'Inter-Bold',
        color: COLORS.text,
        marginBottom: 20,
        textAlign: 'center',
    },
    scrollView: {
        maxHeight: '70%',
    },
    inputContainer: {
        marginBottom: 16,
    },
    label: {
        fontFamily: 'Inter-Bold',
        fontSize: 16,
        marginBottom: 8,
        color: COLORS.text,
    },
    inputWrapper: {
        flexDirection: 'row',
        alignItems: 'center',
        borderWidth: 1,
        borderColor: "#c2b1ab",
        borderRadius: 8,
        paddingHorizontal: 12,
        ...Platform.select({
            ios: {
                paddingVertical: 8,
            }
        })
    },
    input: {
        flex: 1,
        fontSize: 20,
        color: COLORS.text,
    },
    unit: {
        marginLeft: 8,
        fontSize: 14,
        fontFamily: 'Inter-Bold',
        color: COLORS.blink,
    },
    buttonContainer: {
        flexDirection: 'row',
        justifyContent: 'space-around',
        marginTop: 20,
        // backgroundColor: 'pink'
    },
});

export default NutritionInputModal;