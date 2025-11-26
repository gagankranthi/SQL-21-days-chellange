-- Running total of patients admitted per service
SELECT
    service,
    week,
    patients_admitted,
    SUM(patients_admitted) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS cumulative_admissions
FROM services_weekly
ORDER BY service, week;
-- 3-week moving average of satisfaction
SELECT
    service,
    week,
    patient_satisfaction,
    ROUND(AVG(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW    ), 2) AS moving_avg_3week
FROM services_weekly
ORDER BY service, week;
-- Compare to service average
SELECT
    service,
    week,
    patients_admitted,
    AVG(patients_admitted) OVER (PARTITION BY service) AS service_avg,
    patients_admitted - AVG(patients_admitted) OVER (PARTITION BY service) AS diff_from_avg
FROM services_weekly;
-- Running min/max
SELECT
    service,
    week,
    patient_satisfaction,
    MIN(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS min_so_far,
    MAX(patient_satisfaction) OVER (
        PARTITION BY service
        ORDER BY week
    ) AS max_so_far
FROM services_weekly;