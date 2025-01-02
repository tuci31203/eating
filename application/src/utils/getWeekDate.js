import { getToday } from "./getToday";

export const getCurrentWeekDates = () => {
  const today = getToday();
  const currentDate = new Date(today);

  // Get the current day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
  const currentDay = currentDate.getDay();

  // Calculate how many days we need to go back to get to Monday
  // If current day is Sunday (0), we need to go back 6 days
  // If current day is Monday (1), we need to go back 0 days, etc.
  const daysToMonday = currentDay === 0 ? 6 : currentDay - 1;

  // Set time to midnight to ensure consistent dates
  currentDate.setHours(0, 0, 0, 0);

  // Calculate Monday by subtracting the required days
  const monday = new Date(currentDate);
  monday.setDate(currentDate.getDate() - daysToMonday);

  // Calculate Sunday by adding 6 days to Monday
  const sunday = new Date(monday);
  sunday.setDate(monday.getDate() + 6);

  // Set Sunday to end of day
  sunday.setHours(23, 59, 59, 999);

  // const currentDate = new Date();
  // // const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
  // const adjustedDate = new Date(currentDate.getTime());
  // const today = adjustedDate;
  // const currentDay = today.getDay();

  // // Calculate Monday (start of week)
  // const monday = new Date(today);
  // monday.setDate(today.getDate() - currentDay + (currentDay === 0 ? -6 : 1));

  // // Calculate Sunday (end of week)
  // const sunday = new Date(monday);
  // sunday.setDate(monday.getDate() + 6);

  // Format dates as "MMM DD"
  const formatDate = (date) => {
    return date.toLocaleDateString("en-US", {
      month: "short",
      day: "numeric",
    });
  };

  return {
    start: formatDate(monday),
    end: formatDate(sunday),
    monday: monday,
  };
};
