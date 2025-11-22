/*Create a report showing each service with: service name, 
total patients admitted, the difference between their total 
admissions and the average admissions across all services, 
and a rank indicator ('Above Average', 'Average', 'Below Average').
Order by total patients admitted descending.*/
SELECT * FROM services_weekly;
SELECT service, total_admitted AS total_patients_admitted, 
	ROUND(total_admitted-avg_admitted, 2) AS difference_between,
	CASE WHEN total_admitted > avg_admitted THEN 'Above Average'
	WHEN total_admitted = avg_admitted THEN 'Average'
	ELSE 'Below Average' END AS performance
FROM (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted,
        (SELECT AVG(total)
         FROM (SELECT SUM(patients_admitted) AS total
               FROM services_weekly
               GROUP BY service)) AS avg_admitted
    FROM services_weekly
    GROUP BY service
) AS service_stats
ORDER BY total_admitted DESC;