export const formatWithCommaNutrients = (number) => {
  return number
    .toFixed(0)
    .toString()
    .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
};
