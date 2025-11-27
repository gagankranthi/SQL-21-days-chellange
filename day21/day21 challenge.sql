/*Create a comprehensive hospital performance dashboard using CTEs. 
Calculate: 1) Service-level metrics (total admissions, refusals, avg satisfaction), 
2) Staff metrics per service (total staff, avg weeks present),
3) Patient demographics per service (avg age, count). 
Then combine all three CTEs to create a final report showing service name,
all calculated metrics, and an overall performance 
score (weighted average of admission rate and satisfaction).
Order by performance score descending.*/
WITH service_metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        AVG(patient_satisfaction) AS avg_service_satisfaction
    FROM services_weekly
    GROUP BY service
),
staff_metrics AS (
    SELECT
        service,
        COUNT(*) AS total_staff
    FROM staff
    GROUP BY service
),
patient_metrics AS (
    SELECT
        service,
        COUNT(*) AS total_patients,
        AVG(age) AS avg_age,
        AVG(satisfaction) AS avg_patient_satisfaction
    FROM patients
    GROUP BY service
),
combined AS (
    SELECT
        pm.service,
        pm.total_patients,
        pm.avg_age,
        pm.avg_patient_satisfaction,
        sm.total_staff,
        sv.total_admitted,
        sv.total_refused,
        sv.avg_service_satisfaction,
        ROUND(100.0 * sv.total_admitted / NULLIF(sv.total_admitted + sv.total_refused, 0), 2) AS admission_rate
    FROM patient_metrics pm
    LEFT JOIN staff_metrics sm ON pm.service = sm.service
    LEFT JOIN service_metrics sv ON pm.service = sv.service
)
SELECT
    service,
    total_patients,
    avg_age,
    avg_patient_satisfaction,
    total_staff,
    total_admitted,
    total_refused,
    avg_service_satisfaction,
    admission_rate,
    ROUND(0.6 * admission_rate + 0.4 * avg_service_satisfaction, 2) AS performance_score
FROM combined
ORDER BY performance_score DESC;