/* Calculate the average length of stay (in days) for each service, 
showing only services where the average stay is more than 7 days. 
Also show the count of patients and order by average stay descending. */
SELECT service,
COUNT(*) AS count_patients,
ROUND(AVG(departure_date-arrival_date),0) AS avg_stay_day
FROM patients
GROUP BY service
HAVING avg(departure_date-arrival_date) >= 7 
ORDER BY avg_stay_day desc;	


