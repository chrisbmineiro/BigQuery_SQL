SELECT
    station_name,
    ridership_2013,
    ridership_2014,
    ridership_2014-ridership_2013 AS change_2014_raw 
FROM 
  `bigquery-public-data.new_york_subway.subway_ridership_2013_present`