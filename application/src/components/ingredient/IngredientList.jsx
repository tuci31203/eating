import { FlatList, StyleSheet, Text, View } from 'react-native'
import React, { useEffect, useState } from 'react'
import IngredientItem from './IngredientItem'
import { useRoute } from '@react-navigation/native'

const IngredientList = ({ ingredients, setIngredients }) => {
    const route = useRoute()

    const generateId = () => {
        const maxId = Math.max(...ingredients.map(item => item.id), 0);
        return maxId + 1;
    };

    const createEmptyIngredient = () => ({
        id: generateId(),
        name: '',
        amount: null,
        unit: 'g',
        chosen: false
    })

    useEffect(() => {
        if (ingredients.length === 1 && ingredients[0].name === '') {
            // console.log("None >>> ")
            return
        }
        if (route.params?.from === 'IngredientConfirmScreen') {
            return;
        }
        // console.log("Update length", ingredients.length)
        const lastItem = ingredients[ingredients.length - 1]
        if (lastItem && lastItem.name.trim() !== '') {
            setIngredients(prev => [...prev, createEmptyIngredient()]);
        }

    }, [ingredients, setIngredients])

    const handleChosen = (id) => {
        setIngredients(prev =>
            prev.map((each) =>
                each.id === id ? { ...each, chosen: !each.chosen } : each
            )
        )
    }

    const handleChangeName = (id, newIn) => {
        setIngredients(
            prev =>
                prev.map((each) =>
                    each.id === id ? { ...each, name: newIn } : each
                )
        )
        // console.log(newIn)
    }
    const handleChangeAmount = (id, newIn) => {
        setIngredients(
            prev =>
                prev.map((each) =>
                    each.id === id ? { ...each, amount: newIn } : each
                )
        )
    }
    const handleChangeUnit = (id) => {
        setIngredients(
            prev =>
                prev.map((each) =>
                    each.id === id ? { ...each, unit: each.unit === "g" ? "ml" : "g" } : each
                )
        )
    }

    const handleDelete = (id) => {
        if (ingredients.length === 1 && !ingredients[0].name.trim()) {
            return;
        }
        setIngredients(prev => {
            const filtered = prev.filter(item => item.id !== id)
            if (filtered.length === 0) {
                return [createEmptyIngredient()];
            }
            return filtered
        }
        )
    }

    return (

        <FlatList
            data={ingredients}
            keyExtractor={item => item.id.toString()}
            // scrollEnabled

            keyboardShouldPersistTaps="handled"
            showsVerticalScrollIndicator={false}
            // getItemLayout={(data, index) => {
            //     return { index, length: 58, offset: 58 * index }
            // }}
            // style={{ flex: 1 }}
            renderItem={({ item }) =>
                <IngredientItem
                    id={item.id}
                    name={item.name}
                    amount={item.amount}
                    chosen={item.chosen}
                    unit={item.unit}
                    onChoose={() => handleChosen(item.id)}
                    onChangeName={moi => handleChangeName(item.id, moi)}
                    onChangeAmount={moi => handleChangeAmount(item.id, moi)}
                    onChangeUnit={() => handleChangeUnit(item.id)}
                    onDelete={() => handleDelete(item.id)}
                />
            }
        />

    )
}

export default IngredientList

const styles = StyleSheet.create({})