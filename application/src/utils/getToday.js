export const getToday = () => {
  const currentDate = new Date();
  const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
  const adjustedDate = new Date(currentDate.getTime() + offset);
  return adjustedDate.toISOString().split("T")[0];
};
