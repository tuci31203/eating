import _ from "lodash";

export function formatNutrientData(data) {
  const getMonday = (date) => {
    const d = new Date(date);
    const day = d.getDay();
    const diff = d.getDate() - day + (day === 0 ? -6 : 1);
    return new Date(d.setDate(diff));
  };

  const mondayDate = getMonday(new Date(data[0].datetime));
  const weekDates = Array.from({ length: 7 }, (_, i) => {
    const date = new Date(mondayDate);
    date.setDate(mondayDate.getDate() + i);
    return date.toISOString().split("T")[0];
  });

  const mealsByDate = _.groupBy(
    data,
    (meal) => new Date(meal.datetime).toISOString().split("T")[0]
  );

  const nutrients = [
    "calory",
    "carbs",
    "water",
    "fat",
    "sugar",
    "protein",
    "fiber",
  ];

  return nutrients.map((nutrient) => ({
    name: nutrient.charAt(0).toUpperCase() + nutrient.slice(1),
    amount: weekDates.map((date) => {
      const dayMeals = mealsByDate[date] || [];
      return Math.round(
        _.sumBy(
          dayMeals,
          (meal) => _.find(meal.nutrients, { name: nutrient })?.amount || 0
        )
      );
    }),
  }));
}
