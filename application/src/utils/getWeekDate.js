export const getCurrentWeekDates = () => {
    const today = new Date();
    const currentDay = today.getDay();

    // Calculate Monday (start of week)
    const monday = new Date(today);
    monday.setDate(today.getDate() - currentDay + (currentDay === 0 ? -6 : 1));

    // Calculate Sunday (end of week)
    const sunday = new Date(monday);
    sunday.setDate(monday.getDate() + 6);

    // Format dates as "MMM DD"
    const formatDate = (date) => {
        return date.toLocaleDateString('en-US', {
            month: 'short',
            day: 'numeric'
        });
    };

    return {
        start: formatDate(monday),
        end: formatDate(sunday),
        monday: monday,
    };
}


// console.log(`${weekDates.start} - ${weekDates.end}`);
// // Output: "Nov 11 - Nov 17"