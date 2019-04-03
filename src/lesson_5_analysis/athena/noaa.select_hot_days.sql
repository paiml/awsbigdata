-- query to scan 231+ years of climate data to report on hot days
--  data temperature is an integer multiple of 1/10 degree celcius, so we divide by 10 to get actual temp
-- filter on temps >40 deg celsius which is about 105 deg fahrenheit
SELECT yearmonthday, round(temperature/10) from historic_climate_gz
WHERE element = 'TMAX' AND (temperature/10) > 40
LIMIT 10000;


