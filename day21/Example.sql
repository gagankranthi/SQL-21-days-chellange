-- Simple CTE for service statistics
WITH service_stats AS (
    SELECT
        service,
        COUNT(*) AS patient_count,
        AVG(satisfaction) AS avg_satisfaction
    FROM patients
    GROUP BY service
)
SELECT *FROM service_stats
WHERE avg_satisfaction > 75 ORDER BY patient_count DESC;
-- Multiple CTEs for complex analysis
WITH
patient_metrics AS (
    SELECT
        service,
        COUNT(*) AS total_patients,
        AVG(age) AS avg_age,
        AVG(satisfaction) AS avg_satisfaction
    FROM patients
    GROUP BY service
),
staff_metrics AS (
    SELECT
        service,
        COUNT(*) AS total_staff
    FROM staff
    GROUP BY service
),
weekly_metrics AS (
    SELECT
        service,
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused
    FROM services_weekly
    GROUP BY service
)
SELECT
    pm.service,
    pm.total_patients,
    pm.avg_age,
    pm.avg_satisfaction,
    sm.total_staff,
    wm.total_admitted,
    wm.total_refused,
    ROUND(100.0 * wm.total_admitted /
          (wm.total_admitted + wm.total_refused), 2) AS admission_rate
FROM patient_metrics pm
LEFT JOIN staff_metrics sm ON pm.service = sm.service
LEFT JOIN weekly_metrics wm ON pm.service = wm.service
ORDER BY pm.avg_satisfaction DESC;
-- CTE referencing another CTE
WITH
all_admissions AS (
    SELECT
        service,
        SUM(patients_admitted) AS total
    FROM services_weekly
    GROUP BY service
),
high_performing_services AS (
    SELECT service
    FROM all_admissions
    WHERE total > (SELECT AVG(total) FROM all_admissions)
)
SELECT *FROM patients
WHERE service IN (SELECT service FROM high_performing_services);

WITH service_avg AS (
    SELECT service, AVG(satisfaction) AS avg_sat
    FROM patients
    GROUP BY service
)
SELECT *FROM patients p
JOIN service_avg sa ON p.service = sa.service
WHERE p.satisfaction > sa.avg_sat;  -- Reference CTE twice