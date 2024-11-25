import { Dimensions, StyleSheet, Text, View } from 'react-native'
import React from 'react'
import Recipe from './Recipe'
import { FlatList } from 'react-native-gesture-handler'

const { height } = Dimensions.get("screen")
const RecipeList = ({ setTmp }) => {
    const recipes = [
        {
            id: 1,
            title: "Apple pie",
            ingredients: ["Apple", "Pie crust", "Sugar", "Cinnamon"],
            quantities: ["2", "1", "1", "1"],
            units: ["", "", "cup", "tsp"],
            instructions: ["Make the filling: On the stove, make a paste with flour and butter. Add the sugar and water and bring to a boil. Simmer, then remove from heat.",
                "Assemble the pie: Press one crust into a pie plate. Place the sliced apples on the bottom crust. Use the top crust to make a lattice crust according to the recipe below. Pour the butter-sugar mixture over the lattice crust.",
                "Bake the pie: Bake the pie in a preheated oven until the apples are soft and the crust is golden brown."],
            totalTime: "1 hour",

        },
        {
            id: 2,
            title: "Chocolate cake",
            ingredients: ["Flour", "Sugar", "Cocoa powder", "Baking soda", "Salt", "Egg", "Milk", "Vegetable oil", "Vanilla extract", "Boiling water"],
            quantities: ["1 3/4", "2", "3/4", "1 1/2", "1/2", "1", "1", "1/2", "2", "1"],
            units: ["cup", "cup", "cup", "tsp", "tsp", "", "cup", "cup", "tsp", "cup"],
            instructions: ["Preheat the oven to 350°F. Grease and flour two 9-inch round baking pans.",
                "Stir together sugar, flour, cocoa, baking powder, baking soda, and salt in a large bowl. Add eggs, milk, oil, and vanilla; beat on medium speed of mixer 2 minutes. Stir in boiling water (batter will be thin). Pour batter into prepared pans.",
                "Bake 30 to 35 minutes or until wooden pick inserted in center comes out clean. Cool 10 minutes; remove from pans to wire racks. Cool completely."],
            totalTime: "1 hour 15 minutes",
        },
        {
            id: 3,
            title: "Pancakes",
            ingredients: ["Flour", "Sugar", "Baking powder", "Salt", "Egg", "Milk", "Vegetable oil"],
            quantities: ["1", "1", "1", "1/2", "1", "1", "2"],
            units: ["cup", "tbsp", "tbsp", "tsp", "", "cup", "tbsp"],
            instructions: ["In a large bowl, sift together the flour, sugar, baking powder, and salt. Make a well in the center and pour in the milk, egg, and oil. Mix until smooth.",
                "Heat a lightly oiled griddle or frying pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot."],
            totalTime: "30 minutes",
        },
        {
            id: 4,
            title: "Pasta",
            ingredients: ["Pasta", "Salt", "Olive oil", "Garlic", "Tomato", "Basil", "Parmesan cheese"],
            quantities: ["8", "1", "2", "2", "2", "1", "1/2"],
            units: ["oz", "tsp", "tbsp", "cloves", "", "tbsp", "cup"],
            instructions: ["Bring a large pot of salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain.",
                "In a large skillet, heat oil over medium heat. Add garlic and saute for 1 minute. Add tomatoes and cook for 2 minutes. Stir in basil and cook for 2 minutes.",
                "Toss pasta with tomato mixture. Sprinkle with cheese and serve."],
            totalTime: "30 minutes",
        },
        {
            id: 5,
            title: "Salad",
            ingredients: ["Lettuce", "Tomato", "Cucumber", "Onion", "Carrot", "Bell pepper", "Olive oil", "Vinegar", "Salt", "Pepper"],
            quantities: ["1", "1", "1", "1", "1", "1", "2", "1", "1", "1"],
            units: ["head", "", "", "", "", "", "tbsp", "tbsp", "tsp", "tsp"],
            instructions: ["In a large bowl, combine lettuce, tomato, cucumber, onion, carrot, and bell pepper.",
                "In a small bowl, whisk together oil, vinegar, salt, and pepper. Pour over salad and toss to coat."],
            totalTime: "15 minutes",
        },
        {
            id: 6,
            title: "Smoothie",
            ingredients: ["Banana", "Strawberry", "Milk", "Yogurt", "Honey"],
            quantities: ["1", "1/2", "1", "1/2", "1"],
            units: ["", "cup", "cup", "cup", "tbsp"],
            instructions: ["In a blender, combine banana, strawberry, milk, yogurt, and honey. Blend until smooth."],
            totalTime: "5 minutes",
        },
        {
            id: 7,
            title: "Soup",
            ingredients: ["Onion", "Carrot", "Celery", "Garlic", "Tomato", "Vegetable broth", "Salt", "Pepper", "Parsley"],
            quantities: ["1", "1", "1", "2", "2", "4", "1", "1", "1"],
            units: ["", "", "", "cloves", "", "cups", "tsp", "tsp", "tbsp"],
            instructions: ["In a large pot, heat oil over medium heat. Add onion, carrot, and celery; cook and stir until onion is tender.",
                "Stir in garlic, tomatoes, and broth. Season with salt and pepper. Bring to a boil, then reduce heat and simmer 15 minutes.",
                "Stir in parsley before serving."],
            totalTime: "30 minutes",
        },
        {
            id: 8,
            title: "Stir-fry",
            ingredients: ["Chicken", "Bell pepper", "Onion", "Garlic", "Ginger", "Soy sauce", "Oyster sauce", "Cornstarch", "Water", "Oil"],
            quantities: ["1", "1", "1", "2", "1", "2", "2", "1", "1", "2"],
            units: ["lb", "", "", "cloves", "tbsp", "tbsp", "tbsp", "tbsp", "cup", "tbsp"],
            instructions: ["In a bowl, combine soy sauce, oyster sauce, cornstarch, and water. Set aside.",
                "In a large skillet, heat oil over medium-high heat. Add chicken and cook until no longer pink. Remove from skillet and set aside.",
                "In the same skillet, heat oil over medium heat. Add onion, bell pepper, garlic, and ginger. Cook until onion is tender.",
                "Return chicken to skillet. Add sauce and cook until heated through."],
            totalTime: "30 minutes",
        },
        {
            id: 9,
            title: "Tacos",
            ingredients: ["Ground beef", "Onion", "Garlic", "Chili powder", "Cumin", "Salt", "Pepper", "Tomato", "Lettuce", "Cheese", "Tortilla"],
            quantities: ["1", "1", "2", "1", "1", "1", "1", "2", "1", "1", "8"],
            units: ["lb", "", "cloves", "tbsp", "tsp", "tsp", "tsp", "", "", "", ""],
            instructions: ["In a large skillet, cook beef, onion, and garlic over medium heat until beef is browned. Drain.",
                "Stir in chili powder, cumin, salt, and pepper. Add tomato and cook until heated through.",
                "Serve beef mixture in tortillas with lettuce and cheese."],
            totalTime: "30 minutes",
        },
        {
            id: 10,
            title: "Tea",
            ingredients: ["Water", "Tea leaves", "Sugar", "Milk"],
            quantities: ["2", "1", "1", "1"],
            units: ["cups", "tbsp", "tsp", "cup"],
            instructions: ["In a saucepan, bring water to a boil. Add tea leaves and sugar. Simmer for 5 minutes.",
                "Add milk and bring to a boil. Strain and serve hot."],
            totalTime: "10 minutes",
        },
        {
            id: 11,
            title: "Burger",
            ingredients: ["Ground beef", "Onion", "Garlic", "Salt", "Pepper", "Bun", "Lettuce", "Tomato", "Cheese", "Ketchup", "Mustard"],
            quantities: ["1", "1", "2", "1", "1", "1", "1", "1", "1", "1", "1"],
            units: ["lb", "", "cloves", "tsp", "tsp", "", "", "", "", "", ""],
            instructions: ["In a large bowl, combine beef, onion, garlic, salt, and pepper. Form into patties.",
                "In a skillet, cook patties over medium heat until browned on both sides.",
                "Serve patties on buns with lettuce, tomato, cheese, ketchup, and mustard."],
            totalTime: "30 minutes",
        },
        {
            id: 12,
            title: "Pizza",
            ingredients: ["Pizza dough", "Tomato sauce", "Mozzarella cheese", "Pepperoni", "Mushroom", "Bell pepper", "Onion", "Olive oil"],
            quantities: ["1", "1", "1", "1", "1", "1", "1", "2"],
            units: ["lb", "cup", "cup", "cup", "", "", "", "tbsp"],
            instructions: ["Preheat the oven to 450°F. Roll out the dough on a floured surface.",
                "Spread the sauce over the dough. Top with cheese, pepperoni, mushrooms, bell pepper, and onion.",
                "Drizzle with olive oil. Bake for 15 minutes or until crust is golden brown."],
            totalTime: "30 minutes",
        },
        {
            id: 13,
            title: "Sandwich",
            ingredients: ["Bread", "Turkey", "Lettuce", "Tomato", "Mayonnaise", "Mustard"],
            quantities: ["2", "4", "2", "2", "1", "1"],
            units: ["slices", "oz", "", "", "tbsp", "tbsp"],
            instructions: ["Spread mayonnaise on one slice of bread and mustard on the other slice.",
                "Layer turkey, lettuce, and tomato on one slice of bread. Top with the other slice of bread."],
            totalTime: "5 minutes",
        },
        {
            id: 14,
            title: "Curry",
            ingredients: ["Chicken", "Onion", "Garlic", "Ginger", "Curry powder", "Coconut milk", "Tomato", "Potato", "Carrot", "Bell pepper", "Salt", "Pepper"],
            quantities: ["1", "1", "2", "1", "2", "1", "2", "2", "1", "1", "1", "1"],
            units: ["lb", "", "cloves", "tbsp", "tbsp", "cup", "", "", "", "", "tsp", "tsp"],
            instructions: ["In a large pot, heat oil over medium heat. Add onion, garlic, and ginger; cook until onion is tender.",
                "Stir in curry powder and cook for 1 minute. Add chicken and cook until browned.",
                "Add coconut milk, tomato, potato, carrot, bell pepper, salt, and pepper. Bring to a boil, then reduce heat and simmer 30 minutes."],
            totalTime: "1 hour",
        },
        {
            id: 15,
            title: "Rice",
            ingredients: ["Rice", "Water", "Salt"],
            quantities: ["1", "2", "1/2"],
            units: ["cup", "cup", "tsp"],
            instructions: ["In a saucepan, bring water to a boil. Add rice and salt. Cover and simmer for 18 minutes."],
            totalTime: "20 minutes",
        }
    ]
    return (
        <View style={styles.container}>
            <FlatList
                style={styles.list}
                data={recipes}
                showsVerticalScrollIndicator={false}
                keyExtractor={(item) => item.id.toString()}
                renderItem={({ item }) => <Recipe setTmp={setTmp} recipe={item} />}
            />

        </View>
    )
}

export default RecipeList

const styles = StyleSheet.create({
    container: {
        marginTop: 27,
        height: height - 100 - 150,
        marginHorizontal: 30,
    },
    list: {

    }
})