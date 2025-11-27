-- Build a CTE for staff utilization and join it with patient data
WITH 
staff_cte AS (
    SELECT 
        service,
        COUNT(*) AS total_staff
    FROM staff
    GROUP BY service
),
patients_cte AS (
    SELECT 
        service,
        COUNT(*) AS total_patients,
        AVG(satisfaction) AS avg_satisfaction
    FROM patients
    GROUP BY service
),
staff_utilization AS (
    SELECT 
        sc.service,
        sc.total_staff,
        pc.total_patients,
        ROUND(1.0 * pc.total_patients / sc.total_staff, 2) AS patients_per_staff
    FROM staff_cte sc
    JOIN patients_cte pc ON sc.service = pc.service
)
SELECT 
    su.service,
    su.total_staff,
    su.total_patients,
    su.patients_per_staff,
    pc.avg_satisfaction
FROM staff_utilization su
JOIN patients_cte pc ON su.service = pc.service
ORDER BY su.patients_per_staff DESC;