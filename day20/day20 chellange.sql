/*Create a trend analysis showing for each service and week: week number,
patients_admitted, running total of patients admitted (cumulative),
3-week moving average of patient satisfaction (current week and 2 prior weeks), 
and the difference between current week admissions and the service average. 
Filter for weeks 10-20 only.*/
SELECT week, service, patients_admitted, patient_satisfaction,
	 SUM(patients_admitted) OVER (PARTITION BY service
     ORDER BY week) AS cumulative_admissions,
	 ROUND(AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS moving_avg_3week,
		patients_admitted - AVG(patients_admitted) OVER (
        PARTITION BY service
    ) AS diff_from_service_avg
FROM services_weekly
WHERE week BETWEEN 10 AND 20
ORDER BY service,week;
	 