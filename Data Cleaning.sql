
CREATE TABLE `Tripbike.2022_tripbike_cleaned` AS(
  SELECT
  ride_id,
  rideable_type,
 CASE EXTRACT(MONTH FROM started_at)
  WHEN 1 THEN 'JAN'
  WHEN 2 THEN 'FEB'
  WHEN 3 THEN 'MAR'
  WHEN 4 THEN 'APR'
  WHEN 5 THEN 'MAY'
  WHEN 6 THEN 'JUN'
  WHEN 7 THEN 'JUL'
  WHEN 8 THEN 'AUG'
  WHEN 9 THEN 'SEP'
  WHEN 10 THEN 'OCT'
  WHEN 11 THEN 'NOV'
  WHEN 12 THEN 'DEC' END AS Month,
  CASE EXTRACT(DAYOFWEEK FROM started_at)
    WHEN 1 THEN 'SUN'
    WHEN 2 THEN 'MON'
    WHEN 3 THEN 'TUE'
    WHEN 4 THEN 'WED'
    WHEN 5 THEN 'THU'
    WHEN 6 THEN 'FRI'
    WHEN 7 THEN 'SAT'
    END AS day_of_week,
  started_at,
  ended_at,
  ROUND((EXTRACT(hour from (ended_at-started_at))*60 +
  EXTRACT(minute from (ended_at-started_at))+
  EXTRACT(second from (ended_at-started_at))/60),1)
  as ride_length,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  start_lat,
  start_lng,
  end_lat,
  end_lng,
  member_casual
FROM `Tripbike.2022_tripbike`
WHERE
  start_station_id IS NOT NULL AND
  start_station_id IS NOT NULL AND
  end_station_name IS NOT NULL AND
  end_station_id IS NOT NULL AND
  start_lat IS NOT NULL AND
  start_lng IS NOT NULL AND
  end_lat IS NOT NULL AND
  end_lng IS NOT NULL AND
  ended_at > started_at
);

--- checking all of the numbers of rows left
SELECT COUNT(*) no_of_rows FROM `Tripbike.2022_tripbike_cleaned` 
