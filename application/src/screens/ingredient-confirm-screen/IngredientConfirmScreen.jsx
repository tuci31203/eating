import { StyleSheet, View } from 'react-native'
import React, { useContext, useEffect, useState } from 'react'
import ScreenView from '../../components/ScreenView'
import GreetText from '../../components/GreetText'
import Xmark from '../../components/navigation/Xmark'
import Button from '../../components/Button'
import { StateContext } from '../../context/StateContext'
import ConfirmList from '../../components/ingredient-confirm/confirmList'
import NutrientContent from '../../components/nutrients/NutrientContent'
import MealOption from '../../components/meal-check/MealOption'

const IngredientConfirmScreen = ({ navigation }) => {
    // const [ingredients, setIngredients] = useState(defaultIngredients)
    const [meal, setMeal] = useState("")

    const {
        selectedIngredients,
        setSelectedIngredients,
    } = useContext(StateContext)
    useEffect(() => {
        console.log("INGREDIENT CONFIRM SCREEN")
    }, [])

    const selectIngredients = () => {
        // const selected = ingredients.filter(each => each.chosen === true).map(({ id, ...rest }) => rest)
        // setSelectedIngredients(selected)
        console.log("Ấn rồi")
    }

    return (
        <>
            <ScreenView>
                <GreetText>
                    Ingredients 🍗
                </GreetText>
                <Xmark />
                <View
                    style={{
                        marginHorizontal: 30,
                        marginTop: 27,
                        flex: 1,
                        // backgroundColor: 'pink',
                        marginBottom: 400,
                    }}>

                    <ConfirmList
                        ingredients={selectedIngredients}
                        setIngredients={setSelectedIngredients}
                    />
                </View>
                <NutrientContent
                    calory={10000}
                    water={10}
                    carbs={10}
                    sugar={10}
                    fiber={10}
                    protein={10}
                    fat={10}
                />
                <MealOption
                    meal={meal}
                    setMeal={setMeal}
                />
            </ScreenView>

            <Button
                title={"Back"}
                variant='default'
                style={[
                    styles.botBut,
                    { left: 52 }
                ]}
                onPress={() => navigation.navigate("ingre", { from: 'IngredientConfirmScreen' })}
            />
            <Button
                title={"Confirm"}
                variant='action'
                style={[
                    styles.botBut,
                    { right: 51 }
                ]}
                onPress={selectIngredients}
            />
        </>
    )
}

export default IngredientConfirmScreen

const styles = StyleSheet.create({
    botBut: {
        position: 'absolute',
        bottom: 53
    }
})