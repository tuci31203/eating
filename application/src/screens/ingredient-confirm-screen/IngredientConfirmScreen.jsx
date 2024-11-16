import { StyleSheet, View } from 'react-native'
import React, { useContext, useEffect } from 'react'
import ScreenView from '../../components/ScreenView'
import GreetText from '../../components/GreetText'
import Xmark from '../../components/navigation/Xmark'
import IngredientList from '../../components/ingredient/IngredientList'
import Button from '../../components/Button'
import CameraButton from '../../components/camera-button/CameraButton'
import { StateContext } from '../../context/StateContext'
import IngredientConfirm from '../../components/ingredient-confirm/IngredientConfirm'
import ConfirmList from '../../components/ingredient-confirm/confirmList'

const IngredientConfirmScreen = ({ navigation }) => {
    // const [ingredients, setIngredients] = useState(defaultIngredients)
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
                <View style={{
                    marginHorizontal: 30,
                    marginTop: 27,
                    flex: 1,
                    marginBottom: 300,
                }}>

                    <ConfirmList
                        ingredients={selectedIngredients}
                        setIngredients={setSelectedIngredients}
                    />
                </View>
            </ScreenView>
            <Button
                title={"back"}
                variant='default'
                style={[
                    styles.botBut,
                    { left: 52 }
                ]}
                onPress={() => navigation.navigate("ingre")}
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