import HomeScreen from "../../screens/home-screen/HomeScreen";
import RecordScreen from "../../screens/record-screen/RecordScreen";
import IngredientScreen from "../../screens/ingredient-screen/IngredientScreen";
import GoalScreen from "../../screens/goal-screen/GoalScreen";
import SettingScreen from "../../screens/setting-screen/SettingScreen";
import { createBottomTabNavigator } from "@react-navigation/bottom-tabs";
import { COLORS } from "../../configs/constants/colors";
import { Image, StyleSheet, TouchableOpacity, View } from "react-native";
import { ICONS } from "../../configs/constants/graphic";
import IngredientConfirmScreen from "../../screens/ingredient-confirm-screen/IngredientConfirmScreen";
import SnackIngredient from "./SnackIngredient";
import { CommonActions, useNavigation } from "@react-navigation/native";

const Tab = createBottomTabNavigator()

const Tabs = () => {
    const navigation = useNavigation()
    const resetToHome = () => {
        navigation.dispatch(
            CommonActions.reset({
                index: 0,
                routes: [{ name: 'home' }]
            })
        )
    }
    return (
        <Tab.Navigator
            screenOptions={{
                tabBarLabelStyle: { display: "none" },
                headerShown: false,
                tabBarStyle: {
                    // /*
                    position: 'absolute',
                    bottom: 31,

                    marginHorizontal: 38,

                    elevation: 0,
                    zIndex: 3,
                    // alignSelf: "center",
                    // width: 336,
                    height: 55,
                    borderRadius: 19,
                    backgroundColor: COLORS.bgNav,
                    // */
                }
            }}
        >
            <Tab.Screen
                name="home"
                component={HomeScreen}
                options={{
                    tabBarLabelStyle: { display: "none" },
                    tabBarIcon: ({ focused }) => (
                        <View style={styles.iconContainer}>
                            <Image
                                source={ICONS.home}
                                resizeMethod="contain"
                                style={[{ width: 26, height: 26, marginTop: 12 },
                                { tintColor: focused ? COLORS.iconActive : COLORS.iconDefault }
                                ]}
                            />
                        </View>
                    ),
                    tabBarButton: (props) => (
                        <TouchableOpacity
                            {...props}
                            onPress={() => {
                                resetToHome();
                                props.onPress();
                            }}
                        />
                    ),
                }}
            />
            <Tab.Screen name="record" component={RecordScreen}
                options={{
                    tabBarLabelStyle: { display: "none" },
                    tabBarIcon: ({ focused }) => (
                        <View style={styles.iconContainer}>
                            <Image
                                source={ICONS.record}
                                resizeMethod="contain"
                                style={[{ width: 22, height: 26, marginTop: 12 },
                                { tintColor: focused ? COLORS.iconActive : COLORS.iconDefault }
                                ]}
                            />
                        </View>
                    ),
                }}
            />
            <Tab.Screen name="add" component={SnackIngredient}
                options={{
                    tabBarStyle: { display: "none" },
                    tabBarLabelStyle: { display: "none" },
                    tabBarIcon: ({ focused }) => (
                        <View style={[styles.iconContainer,
                        {
                            width: 64,
                            height: 64,
                            borderRadius: 32,
                            backgroundColor: COLORS.plusBtn,
                            marginTop: 17
                        }
                        ]}>
                            <Image
                                source={ICONS.add}
                                resizeMethod="contain"
                                style={[{ width: 34, height: 34, },
                                { tintColor: focused ? 'white' : COLORS.iconDefault }
                                ]}
                            />
                        </View>
                    ),
                }}
            />
            <Tab.Screen name="goal" component={GoalScreen}
                options={{
                    tabBarLabelStyle: { display: "none" },
                    tabBarIcon: ({ focused }) => (
                        <View style={styles.iconContainer}>
                            <Image
                                source={ICONS.goal}
                                resizeMethod="contain"
                                style={[{ width: 27, height: 27, marginTop: 12 },
                                { tintColor: focused ? COLORS.iconActive : COLORS.iconDefault }
                                ]}
                            />
                        </View>
                    ),
                }}
            />
            <Tab.Screen name="setting" component={SettingScreen}
                options={{
                    tabBarLabelStyle: { display: "none" },
                    tabBarIcon: ({ focused }) => (
                        <View style={styles.iconContainer}>
                            <Image
                                source={ICONS.setting}
                                resizeMethod="contain"
                                style={[{ width: 28, height: 28, marginTop: 12 },
                                { tintColor: focused ? COLORS.iconActive : COLORS.iconDefault }
                                ]}
                            />
                        </View>
                    ),
                }}
            />
        </Tab.Navigator>
    )
}

const styles = StyleSheet.create({
    iconContainer: {
        alignItems: 'center',
        justifyContent: 'center',
    },
})

export default Tabs