--Calculate running total of patients admitted by week for each service
SELECT 
	week,
	service,
	patients_admitted,
	SUM(patients_admitted) OVER (PARTITION BY service ORDER BY week) AS running_total
FROM services_weekly
ORDER BY week,
	service,
	patients_admitted;
--Find the moving average of patient satisfaction over 4-week periods.
SELECT 
	week,
	service,
	patient_satisfaction,
	ROUND(AVG(patient_satisfaction) OVER (PARTITION BY service 
	ORDER BY week ROWS BETWEEN 3 PRECEDING AND CURRENT ROW),2) AS avg_patient_sat
FROM services_weekly
ORDER BY week,
	service,
	patient_satisfaction;
--Show cumulative patient refusals by week across all services
SELECT service,
    week,
    patients_refused,
    SUM(patients_refused) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS cumulative_admissions
FROM services_weekly
ORDER BY service, week;
SELECT * FROM services_weekly;