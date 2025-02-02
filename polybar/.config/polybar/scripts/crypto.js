const currArr = ["monero"];

const fetchPrice = async (curr) => {
  const response = await fetch(
    `https://api.coingecko.com/api/v3/coins/${curr}`
  );
  const bluenord = "#81a1c1";
  const data = await response.json();
  console.log(`%{F${bluenord}}XMR%{F-} $${data.market_data.current_price.usd}`);
  return `XMR Price - ${data.market_data.current_price.usd}`;
};

currArr.forEach(async (curr) => {
  return await fetchPrice(curr);
});
