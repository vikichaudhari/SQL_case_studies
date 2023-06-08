 
 
#Revolve Solutions SQL Assessment 
 
#Questions- 
#1.	Which manufacturer's planes had most no of flights? And how many flights? 

SELECT p.manufacturer, COUNT(f.flight) AS num_flights
FROM planes p
JOIN flights f ON p.tailnum = f.tailnum
GROUP BY p.manufacturer
ORDER BY num_flights DESC
LIMIT 1; 


#2.	Which manufacturer's planes had most no of flying hours? And how many hours? 

SELECT p.manufacturer, SUM(CAST(f.hour AS numeric)) 
AS total_flying_hours
FROM planes p
JOIN flights f ON p.tailnum = f.tailnum
GROUP BY p.manufacturer
ORDER BY total_flying_hours DESC
LIMIT 1;






#3.	Which plane flew the most number of hours? And how many hours? 

SELECT p.tailnum, p.model, SUM(CAST(f.hour AS numeric)) AS total_flying_hours
FROM planes p
JOIN flights f ON p.tailnum = f.tailnum
GROUP BY p.tailnum, p.model
ORDER BY total_flying_hours DESC
LIMIT 1;

#4.	Which destination had most delay in flights? 

SELECT dest, COUNT(*) AS delay_count
FROM flights
WHERE CAST(arr_delay AS numeric) > 0 OR CAST(dep_delay AS numeric) > 0
GROUP BY dest
ORDER BY delay_count DESC
LIMIT 1;

#5.	Which manufactures planes had covered most distance? And how much distance? 
SELECT p.manufacturer, SUM(f.distance) AS total_distance
FROM planes p
JOIN flights f ON p.tailnum = f.tailnum
GROUP BY p.manufacturer
ORDER BY total_distance DESC
LIMIT 1;


#6.	Which airport had most flights on weekends? 

#for weekend 1 is for Sunday and 7 is for Saturday.
SELECT a."AIRPORT", COUNT(*) AS weekend_flight_count
FROM airports a
JOIN flights f ON a."IATA_CODE" = f.origin
WHERE f.day IN (1, 7)
GROUP BY a."AIRPORT"
ORDER BY weekend_flight_count DESC
LIMIT 1; 
