# Google-Data-Analytics
311020231919
status :  on progress
Tags :
# Introduction
this is markdown for my progress in learning data analytics. this time i will analyze dataset from a fictional company called cyclist. in order answer business questions. six steps of data analytics from google data analytics professional certification were implemented in this project
# Background
I'm a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s future success depends on maximizing the number of annual memberships. 

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth.

Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a very good chance to convert casual riders into members. She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the marketing analyst team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics. Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

# 1. ASK
## Business Task
The key stakeholder in this projects are the director of marketing (Lily Moreno) and Cyclistic executive teams. They have a purposes to design marketing strategies aimed to conver casual rider to annual members, which the essential question to answer is :
1. How do annual member and casual rider use Cyclistic bikes differently?
The answer of this question will help and guide the marketing team to create a marketing strategies that targets casual rider to becomes annual members, to do this i must analyze historical trip data from Cyclistic in order to identify trends on how annual member and casual rider differ.

# 2. Prepare
## Data Combining
The data is stored in separated csv files, one for each month/year. For this project, 2022 data were used, from January to December, total of 12 .csv files. Considering there's a lot of trip bike CSV files to analyze, i used this query to combine all of the data into one combined data as `Tripbike.2022_tripbike`
# 3. Process
## Data Validation

Name    |   Potential harm
---         |    ---
Duplicate data | Skewed metrics, inflated and inaccurate count
Outdated Data | inacurrate insights, decision making, and analytics
Incomplete Data | Decreased Productivity or decision making
Incorrect/inacurrate data | Inacurrate insights based on bad information
Inconsistent Data | Contradictory data point to inability to classify

i've been following this metrics of data validation, first i familiarized myself with column data types
<img width="342" alt="Screenshot 2023-12-04 055409" src="https://github.com/andrafi/Google-Data-Analytics/assets/63025245/be05d42e-45f8-4d8e-8fc5-8dbe37ab1b0b">

2.  identified for the sum of null rows in all of the columns
![[Untitled.jpeg]]
the results stated that there is 6 columns (start_station_id, start_station_name, end_station_id, end_station_name, start_lat, start_lng end_lat and end_lng) where it has some null values.

3. to be sure that there is no incosistencies in ride_id, i validated that there's not any missing character, duplicate values or trailing space in ride_id:

[image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/ae615084-9ba6-4b1f-90ed-e586e9414da6)
<img width="233" alt="Screenshot 2023-12-04 061732" src="https://github.com/andrafi/Google-Data-Analytics/assets/63025245/d6f6732c-8caa-4a05-be06-89479f0370f4">

4. found an incosistent and inaccurate datetime format where starting date:hour is bigger than ending date:hour
<img width="135" alt="Screenshot 2023-12-04 061818" src="https://github.com/andrafi/Google-Data-Analytics/assets/63025245/fea847c0-fdcd-419a-9598-5463d99326a9">

Summary:
	1. Total of 833064 rows in both **start_station_name** and **start_station_id** missing
	2. Total of 892742 rows in both **end_station_name** and **end_station_id** missing
	3. Total of 5858 rows in both **end_lat** and **end_lng** missing
	4. Total of 100 rows in both **started_at** and **ended_at** missing

## Data Exploration
the purpose this data exploration is to gain insights of to help answer the business task : how do casual and member differ ?
here's a recap of my data exploration results
1. identified the quantity of different usertypes (member/casual). There is **3.345.685** casual user and **2.232.032** member user.
2. **none of member user uses docked bike**. Overall there are more casual user that uses the three types of bikes than member users. Probably because there are more casual user than member user
3. docked bike has the most time usage than the other bike types, on the other hand electric bike has the most number of trips.
4. casual user has the most time usage than member user. on the contrary, member user has the most number of trips than casual user.

## Data Cleaning
SQL Query :
1. There's about 30% of all rows that has a missing values, to eliminate inaccuracies in the data i removed them
2. Added day_of_week, month and ride_length as time metrics for the analysis
3. trips with datetime inaccuracies (started_at > ended_at) are removed
Results :  1.298.665 rows are deleted 
<img width="140" alt="Screenshot 2023-12-04 063645" src="https://github.com/andrafi/Google-Data-Analytics/assets/63025245/f65096ee-c6f5-4df4-ba8e-c22f441d8a0e">

# Analysis & Share
Following the business task of this project, graphs were created in Tableau after querying the insights needed from Bigquery to enlighten the trends and different behavior of users with different membership status
### 1. Cyclistic User Profile
![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/a8e3145c-0c40-4e12-bbcf-304f4b14c43e)

The first portion of the analysis consisted of this pie and bar charts that offers a various insights about the profile of bike usage in Cyclistic bike Company. First, annual member user has occupied the bigger slice in the first pie charts, they make about 59,8% while the remaining 40,2% consisted of casual rider. 

Second, only casual riders use a docked bike while annual member occupied the biggest number of trips in all of the remaining types of bikes. 

Third, contrary of number of trips grouped by rideable types and the quantity, casual riders has a lot more total and average time usage than annual members.  Casual riders made up about 9.668.630 minutes of total time usage difference with annual members and they have about 92% more average time usage than annual members.
### 2. Number of Trips and Average Ride Length by Month
![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/692ff00a-0650-4050-8991-78ab6f9ec0eb)

Second portion of the analysis are number of trip and average ride length by month. when we look at bar charts above we see that number of trips of annual member users are more consistent than the casual riders. annual members users increasing in frequency of trips since january and peaked at august then gradually decreasing until the end of the year. this convey a seasonal patterns that affects number of trips:
1. Spring :  Late March to late June, number of trips increase exponentially
2. Summer : Late June to Late September, number of trips peaked at this season
3. Fall: Late September to late December, gradually decreased number of trips
4. December: Late December to late March, all time low of number of trips but showing gradual increase.

The same thing happened to casual riders but with less predictable number of trips in season. Contrast to average ride length by month, casual rider is about two times more in average duration than annual members but with frantic duration deviation in january to july.
### 3. Number of Trips and Average Ride Length by Day
![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/77c1aa0f-5005-4425-b04e-d3a221012b6f)


Third portion of the analysis consist of total trips and average ride length by day. First line charts above inferred the differences of trips frequency and duration between annual members and casual riders, while casual riders more active during weekend (as highlighted by the label) meaning we can assume that casual rider using bike more frequently for leisure purposes. meanwhile annual members tends to use the bike to commute for work in the weekdays.
### 4. Number of Trips and Average Ride Length by Hour
![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/b0a5982d-8b06-4661-91b5-6b627c1045e7)
Analyzing total trips and average ride duration by hour we can gather an information about the behavior of Cyclistic usertypes.:
	1. Casual rider number of trips seems gradually increasing since its lowest point (04.00 o'clock) until it reached its peak in 17.00 in the evening the same can be said for annual members but with increase surge of trips in 08.00 o'clock in the morning. 
	2. Casual riders tends to commute longer than annual members. However these findings lead to conclusion that annual members used Cyclistic services because of necessity to commute owing to the consistency of the frequency in average ride duration.

### 5. Station Location Profile
the last portion of analysis below is to identify the top ten start and end station to further understand the differences between annual members and casual riders.
![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/92e05027-ee31-4c55-839b-89add6044605)


as we can see casual rider leaned to start from the station in the vicinity of recreational points (museum, harbor point, park and beach) on the other hand annual members frequently begun from the station near bank, residential buildings, university, churchs, gyms and offices. 

![image](https://github.com/andrafi/Google-Data-Analytics/assets/63025245/d1f2120e-bf31-40ac-9db0-059f1a312056)

The same can be said in top ten end station while casual members prefer to end their journey in station that close to recreational sites, annual member more likely frequent in ending their trip to a station that close to residential areas, offices, factory, and others. which means that casual riders tends to use bikes for recreational and leisure activities while annual members largely rely for them for daily commutes.

in summary : 
1. Casual riders tends to ride two times longer than annual members with the average of >20 minutes on the bike but less frequent in their trips 
2. Seasonal Pattern affects number of trips. number of trips peaked in summer of all of the usertypes 
4. Annual members has a surge of trips during 8 AM and 5 PM while casual riders has gradual increase of number of trips since 4 AM until peaked at 5 PM 
5. Casual riders start and end their trips near recreational sites while annual members usually start and end their trips close to residential buildings, offices, and university
Conclusion:
	Annual members extensively use bikes for daily commute while casual rider tend to use bike for leisure and recreational purpose
# ACT
### Final Conclusion
Converting casual riders to annual members can be effectively implemented by aiming at casual riders behavior on leisure commuting. Also, the fact that casual riders tend to commute longer more than 15 minutes and mostly active on weekend can be one of the focus in the act of marketing strategies.

---

