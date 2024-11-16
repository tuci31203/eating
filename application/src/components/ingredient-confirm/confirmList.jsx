import { FlatList, StyleSheet, Text, View } from 'react-native'
import React, { useContext } from 'react'
import IngredientConfirm from './IngredientConfirm'
import { StateContext } from '../../context/StateContext'

const ConfirmList = () => {
    const {
        selectedIngredients,
        setSelectedIngredients,
    } = useContext(StateContext)
    return (
        <FlatList
            data={selectedIngredients}
            keyExtractor={item => item.id.toString()}
            renderItem={({ item }) =>
                <IngredientConfirm
                    name={item.name}
                    amount={item.amount}
                    unit={item.unit}
                />
            }
        />

    )
}

export default ConfirmList

const styles = StyleSheet.create({})