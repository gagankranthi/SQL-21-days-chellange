/* For each service, rank the weeks by patient satisfaction score 
(highest first). Show service, week, patient_satisfaction, 
patients_admitted, and the rank. Include only the top 3 weeks per service.*/
SELECT * FROM services_weekly;
SELECT * FROM (
    SELECT
        service,
        week,
        patient_satisfaction,
		patients_admitted,
        RANK() OVER (PARTITION BY service ORDER BY patient_satisfaction DESC) AS satisfaction_rank
    FROM services_weekly
)
WHERE satisfaction_rank <= 3;
	