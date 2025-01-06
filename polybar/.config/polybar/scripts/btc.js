const currArr = ["bitcoin"];

const fetchPrice = async (curr) => {
  const response = await fetch(
    `https://api.coingecko.com/api/v3/coins/${curr}`
  );
  const data = await response.json();

  const primaryColor = "#ebcb8b";
  console.log(`%{F${primaryColor}}%{F-} $${Math.floor(data.market_data.current_price.usd).toLocaleString()}`);
};

fetchPrice("bitcoin");
