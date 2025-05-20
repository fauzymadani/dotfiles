const currArr = ["bitcoin"];

const fetchPrice = async (curr) => {
  const response = await fetch(
    `https://api.coingecko.com/api/v3/coins/${curr}`
  );
  const data = await response.json();

  //const primaryColor = "#ebcb8b";
  const bluenord = "#444444"
  console.log(`%{F${bluenord}}BTC%{F-} $${Math.floor(data.market_data.current_price.usd).toLocaleString()}`);
};

fetchPrice("bitcoin");
