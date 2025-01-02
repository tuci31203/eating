export const noww = () => {
  const now = new Date();
  console.log(now.toISOString());
  const offset = "+07:00";
  const localTime = new Date(now.getTime() - now.getTimezoneOffset() * 60000);
  const isoString = localTime.toISOString().slice(0, -1) + offset;
  console.log(isoString);
  const date = new Date(isoString);
  console.log(date);
  return isoString;
};
