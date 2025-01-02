export const getDateApi = () => {
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
  const start_time = new Date(currentDate);
  start_time.setDate(currentDate.getDate() - daysToMonday);

  // Calculate Sunday by adding 6 days to Monday
  const end_time = new Date(start_time);
  end_time.setDate(start_time.getDate() + 6);

  // Set Sunday to end of day
  end_time.setHours(23, 59, 59, 999);

  // const currentDate = new Date();
  // // const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
  // const adjustedDate = new Date(currentDate.getTime());
  // const today = adjustedDate;
  // const currentDay = today.getDay();

  // const start_time = new Date(today);
  // start_time.setDate(
  //   today.getDate() - currentDay + (currentDay === 0 ? -6 : 1)
  // );
  // start_time.setUTCHours(0, 0, 0, 0);

  // const end_time = new Date(start_time);
  // end_time.setDate(start_time.getDate() + 6);
  // end_time.setUTCHours(23, 59, 59, 999);

  return {
    start_time: start_time.toISOString(),
    end_time: end_time.toISOString(),
  };
};
