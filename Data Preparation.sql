--- data preparation

--- scan the data to identify anything wrong
select * from `Tripbike.2022_tripbike`limit 50

--- checking data type for all column
SELECT column_name, data_type
FROM `Tripbike.`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = '2022_tripbike';

--- check how many null values in all of the columns
SELECT 
  COUNT (*)- COUNT(ride_id) ride_id,
  COUNT (*)- COUNT(rideable_type)rideable_type,
  COUNT (*)- COUNT(started_at)started_at,
  COUNT (*)- COUNT(ended_at) ended_at,
  COUNT (*)- COUNT (start_station_name)start_station_name,
  COUNT (*)- COUNT(start_station_id)start_station_id,
  COUNT (*)- COUNT(end_station_name)end_station_name,
  COUNT (*)- COUNT(end_station_id) end_station_id,
  COUNT (*)- COUNT (start_lat)start_lat,
  COUNT (*)- COUNT(start_lng)start_lng,
  COUNT (*)- COUNT(end_lat)end_lat,
  COUNT (*)- COUNT(end_lng) end_lng,
  COUNT (*)- COUNT (member_casual)member_casual
FROM `Tripbike.2022_tripbike`;

---checking if there's missing character in id
select count(ride_id) as missing_value_ID
from `Tripbike.2022_tripbike`
where length(ride_id)< 16

--- checking duplicate values
SELECT
   COUNT (*)- COUNT(DISTINCT ride_id) ride_id,
  COUNT (*)- COUNT(DISTINCT rideable_type)rideable_type,
  COUNT (*)- COUNT(DISTINCT started_at)started_at,
  COUNT (*)- COUNT(DISTINCT ended_at) ended_at,
  COUNT (*)- COUNT (DISTINCT start_station_name)start_station_name,
   COUNT (*)- COUNT(DISTINCT start_station_id)start_station_id,
  COUNT (*)- COUNT(DISTINCT end_station_name)end_station_name,
  COUNT (*)- COUNT(DISTINCT end_station_id) end_station_id,
  COUNT (*)- COUNT (DISTINCT start_lat)start_lat,
   COUNT (*)- COUNT(DISTINCT start_lng)start_lng,
  COUNT (*)- COUNT(DISTINCT end_lat)end_lat,
  COUNT (*)- COUNT(DISTINCT end_lng) end_lng,
  COUNT (*)- COUNT (DISTINCT member_casual)member_casual
FROM `Tripbike.2022_tripbike`

--- checking if there's a trailing space in ride_id
SELECT 
  SUM(CASE WHEN RIGHT(ride_id,1)=' ' THEN 1 ELSE 0 END) AS TRAIL,
  SUM(CASE WHEN RIGHT(ride_id,1)=' ' THEN 0 ELSE 1 END) AS CLEAN
FROM `Tripbike.2022_tripbike`

--- searching for inconsistent datetime
SELECT 
  COUNT(*) AS Inconsistent_date
FROM `Tripbike.2022_tripbike`
WHERE started_at > ended_at

SELECT 
  started_at,
  ended_at
FROM `Tripbike.2022_tripbike`
WHERE started_at > ended_at


--- gaining insights

--- there is 3 types of bike and i wanna search the most used bike
select rideable_type,count(rideable_type)as number_of_trips
from `Tripbike.2022_tripbike`
group by rideable_type
---electric bike has the most usage

---search for the quantity of member and casual 
select member_casual,count(member_casual) as number_of_user
from `Tripbike.2022_tripbike`
group by member_casual---member has the most quantity

--- gaining insights of different type of member usage
SELECT
  rideable_type,
  COUNT(rideable_type) no_of_trip,
  SUM(CASE WHEN member_casual="member" then 1 else 0 END)Member,
  SUM(CASE WHEN member_casual="casual" then 1 else 0 END)Casual
FROM `Tripbike.2022_tripbike`
GROUP BY rideable_type
ORDER BY 2 DESC;
--- querying average time usage of each member types grouped by types of bicycle
SELECT 
  rideable_type,
  count(rideable_type)no_of_trips,
  SUM(CASE WHEN member_casual="member" THEN 1 ELSE 0 END)MEMBER,
  SUM(CASE WHEN member_casual="casual" THEN 1 ELSE 0 END)CASUAL,
   AVG(EXTRACT(HOUR FROM (ended_at-started_at)*60)+
    EXTRACT(MINUTE FROM (ended_at-started_at))+
    EXTRACT(SECOND FROM(ended_at-started_at)/60)) as time_usage_in_mins
FROM `Tripbike.2022_tripbike`
WHERE ended_at > started_at
group by 1;


--- querying time usage and number of trip for user
SELECT 
    member_casual,
    COUNT(member_casual)as number_of_trip,
   AVG(EXTRACT(HOUR FROM (ended_at-started_at)*60)+
    EXTRACT(MINUTE FROM (ended_at-started_at))+
    EXTRACT(SECOND FROM(ended_at-started_at)/60)) as time_usage_in_mins
FROM `Tripbike.2022_tripbike`
WHERE ended_at > started_at
GROUP BY 1

