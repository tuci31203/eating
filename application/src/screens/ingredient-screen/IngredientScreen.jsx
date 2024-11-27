import { StyleSheet, View } from 'react-native'
import React, { useCallback, useContext, useEffect } from 'react'
import IngredientList from '../../components/ingredient/IngredientList'
import CameraButton from '../../components/camera-button/CameraButton'
import { StateContext } from '../../context/StateContext'
import { useRoute } from '@react-navigation/native'
import { Button, GreetText, ScreenView, Xmark } from '../../components'

const IngredientScreen = ({ navigation }) => {
    // const [ingredients, setIngredients] = useState(defaultIngredients)
    const {
        selectedIngredients,
        setSelectedIngredients,
        ingredients,
        setIngredients,
        defaultIngredients
    } = useContext(StateContext)

    useEffect(() => {
        console.log("INGREDIENT SCREEN changes >>> ")
        // setIngredients(defaultIngredients)
    }, [ingredients])


    const selectIngredients = () => {
        const selected = ingredients.filter(each => each.chosen === true).map(({ chosen, ...rest }) => rest)
        if (selected.length > 0) {
            setSelectedIngredients(selected)
            // console.log(selected)
            navigation.navigate("confirm")
        }
    }
    const searchRecipes = () => {
        navigation.navigate("recipes")
    }

    return (
        <>
            <ScreenView>
                <GreetText>
                    Ingredients 🍗
                </GreetText>
                <Xmark />
                <View style={styles.ingreContainer}>

                    <IngredientList
                        ingredients={ingredients}
                        setIngredients={setIngredients}
                    />
                </View>
            </ScreenView>
            <Button
                title={"Recipes"}
                variant='default'
                style={[
                    styles.botBut,
                    { left: 40 }
                ]}
                onPress={searchRecipes}
            />
            <Button
                title={"Add"}
                variant='action'
                style={[
                    styles.botBut,
                    { right: 52 }
                ]}
                onPress={selectIngredients}
            />
            <CameraButton
            />
        </>
    )
}

export default IngredientScreen

const styles = StyleSheet.create({
    botBut: {
        position: 'absolute',
        bottom: 53
    },
    ingreContainer: {
        marginHorizontal: 30,
        marginTop: 27,
        flex: 1,
        marginBottom: 230,
    }
})