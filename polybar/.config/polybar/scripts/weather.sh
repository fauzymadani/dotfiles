
#!/bin/bash

# SETTINGS

# API settings
APIKEY=$(cat $HOME/.owm-key)
CITY_NAME='Samarang'
COUNTRY_CODE='ID'
LANG="en"
UNITS="metric"

# Nord Theme Colors
COLOR_CLOUD="#a6adc8"       # overlay1
COLOR_THUNDER="#313244"     # surface0
COLOR_LIGHT_RAIN="#bac2de"  # overlay2
COLOR_HEAVY_RAIN="#45475a"  # surface1
COLOR_SNOW="#f2cdcd"        # rosewater
COLOR_FOG="#585b70"         # surface2
COLOR_TORNADO="#cdd6f4"     # text
COLOR_SUN="#f9e2af"         # yellow
COLOR_MOON="#1e1e2e"        # base
COLOR_ERR="#f38ba8"         # red

# Fetch weather data
if [ -z "$CITY_NAME" ]; then
  IP=$(curl -s ifconfig.me)
  IPCURL=$(curl -s https://ipinfo.io/$IP)
  CITY_NAME=$(echo $IPCURL | jq -r ".city")
  COUNTRY_CODE=$(echo $IPCURL | jq -r ".country")
fi

URL="api.openweathermap.org/data/2.5/weather?appid=$APIKEY&units=$UNITS&lang=$LANG&q=$(echo $CITY_NAME | sed 's/ /%20/g'),${COUNTRY_CODE}"
RESPONSE=$(curl -s $URL)
CODE="$?"

if [ $CODE -ne 0 ]; then
  echo "%{F$COLOR_ERR}Error fetching data%{F-}"
  exit 1
fi

# Parse data
WID=$(echo $RESPONSE | jq .weather[0].id)
TEMP=$(echo $RESPONSE | jq .main.temp | cut -d "." -f 1)

# Set icon and color
if [ $WID -le 232 ]; then
  ICON=" "  # Thunderstorm
  ICON_COLOR=$COLOR_THUNDER
elif [ $WID -le 531 ]; then
  ICON=" "  # Rain
  ICON_COLOR=$COLOR_HEAVY_RAIN
elif [ $WID -le 622 ]; then
  ICON=" "  # Snow
  ICON_COLOR=$COLOR_SNOW
elif [ $WID -eq 800 ]; then
  ICON=" "  # Clear Sky
  ICON_COLOR=$COLOR_SUN
elif [ $WID -eq 801 ]; then
  ICON=" "  # Few Clouds
  ICON_COLOR=$COLOR_SUN
else
  ICON=" "  # Clouds
  ICON_COLOR=$COLOR_CLOUD
fi

# Output
echo "%{F$ICON_COLOR}$ICON%{F-} $TEMP°C"
