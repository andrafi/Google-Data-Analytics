--- data analysis


--- percentage of user types
SELECT 
  member_casual,
  COUNT(member_casual) sum_of_usertypes,
  CONCAT(ROUND((COUNT(member_casual)/4369360)*100,1),"%") as percentage_user_type
from `Tripbike.2022_tripbike_cleaned`
GROUP BY 1

---rideable type usage
SELECT
  rideable_type,
  member_casual,
  count(rideable_type) no_of_trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1,2;

--- total time usage of each membertypes
SELECT
  member_casual,
  CEIL(SUM(ride_length)) total_time_usage
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1;

--- avg time usage in casual and member types
SELECT 
  member_casual,
  AVG(ride_length) AS time_usage
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1

--- number of trips grouped by month
SELECT 
  month,
  member_casual,
  count(ride_id) no_of_trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1,2
ORDER BY 3 DESC;

--- number of trips grouped by day of week
SELECT 
  day_of_week,
  member_casual,
  count(ride_id) no_of_trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1,2
ORDER BY 1 DESC;
--- number of trips per hour
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, COUNT(ride_id) AS No_of_Trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY hour_of_day, member_casual
ORDER BY 1;

--- Ride duration perhour
SELECT EXTRACT(HOUR FROM started_at) AS hour_of_day, member_casual, AVG(ride_length) AS avg_ride_duration
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY hour_of_day, member_casual
ORDER BY 1;

--- trips more than 30
SELECT
  member_casual,
  SUM(CASE WHEN ride_length > 30.0 THEN 1 ELSE 0 END) AS more_than_30,
  SUM(CASE WHEN ride_length < 30.0 THEN 1 ELSE 0 END) AS Less_than_30
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1;

---  top 5 start location with the most user 

SELECT
  start_station_name,
  start_lat,
  start_lng,
  count(ride_id) total_trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1,2,3
ORDER BY 3 desc
LIMIT 5;

--- top 5 ended station with the most user
SELECT
  end_station_name,
  end_lat,
  end_lng,
  count(ride_id) total_trips
FROM `Tripbike.2022_tripbike_cleaned`
GROUP BY 1,2,3
ORDER BY 2 desc
LIMIT 5;
