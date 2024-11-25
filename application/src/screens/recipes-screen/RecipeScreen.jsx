import { StyleSheet, View } from 'react-native'
import React, { useContext, useState } from 'react'
import { Button, GreetText, ScreenView, Xmark } from '../../components'
import RecipeList from '../../components/recipes/RecipeList'
import { StateContext } from '../../context/StateContext'
import { useNavigation } from '@react-navigation/native'

const RecipeScreen = () => {
    const { ingredients, setIngredients } = useContext(StateContext)
    const navigation = useNavigation()
    const [tmp, setTmp] = useState([])
    const handleChoose = () => {
        // console.log(tmp)
        if (tmp.length > 0) {
            const ingres = tmp.map((item, index) => ({
                id: index + 1,
                name: item,
                amount: null,
                chosen: true,
                unit: 'g',
            }))
            // console.log('======> Retrieved:\n', ingres)
            setIngredients(ingres)
            navigation.goBack()
        }
    }
    return (
        <>
            <ScreenView>
                <GreetText>Recipes 📚</GreetText>
                <Xmark />
                <View>
                    <RecipeList setTmp={setTmp} />
                </View>
            </ScreenView>
            <Button
                title={"Choose"}
                variant='action'
                style={styles.botBut}
                onPress={handleChoose}
            />
        </>
    )
}

export default RecipeScreen

const styles = StyleSheet.create({
    botBut: {
        position: 'absolute',
        bottom: 53,
        right: 40,
    },
})