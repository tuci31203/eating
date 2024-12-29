export const getCurrentWeekDates = () => {
  const currentDate = new Date();
  // const offset = 7 * 60 * 60 * 1000; // 7 hours in milliseconds
  const adjustedDate = new Date(currentDate.getTime());
  const today = adjustedDate;
  const currentDay = today.getDay();

  // Calculate Monday (start of week)
  const monday = new Date(today);
  monday.setDate(today.getDate() - currentDay + (currentDay === 0 ? -6 : 1));

  // Calculate Sunday (end of week)
  const sunday = new Date(monday);
  sunday.setDate(monday.getDate() + 6);

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
