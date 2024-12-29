export const getDateApi = () => {
  const currentDate = new Date();
  // const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
  const adjustedDate = new Date(currentDate.getTime());
  const today = adjustedDate;
  const currentDay = today.getDay();

  const start_time = new Date(today);
  start_time.setDate(
    today.getDate() - currentDay + (currentDay === 0 ? -6 : 1)
  );
  start_time.setUTCHours(0, 0, 0, 0);

  const end_time = new Date(start_time);
  end_time.setDate(start_time.getDate() + 6);
  end_time.setUTCHours(23, 59, 59, 999);

  return {
    start_time: start_time.toISOString(),
    end_time: end_time.toISOString(),
  };
};
