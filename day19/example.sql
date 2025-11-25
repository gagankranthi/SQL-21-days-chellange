-- Number patients within each service
SELECT
    patient_id,
    name,
    service,
    satisfaction,
    ROW_NUMBER() OVER (PARTITION BY service ORDER BY satisfaction DESC) AS row_num
FROM patients;
-- Rank patients by satisfaction (with ties)
SELECT
    patient_id,
    name,
    satisfaction,
    RANK() OVER (ORDER BY satisfaction DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY satisfaction DESC) AS dense_rank FROM patients;
-- Top 3 weeks by satisfaction per service
SELECT * FROM (
    SELECT
        service,
        week,
        patient_satisfaction,
        RANK() OVER (PARTITION BY service ORDER BY patient_satisfaction DESC) AS sat_rank
    FROM services_weekly
)
WHERE sat_rank <= 3;
-- Rank services by total admissions
SELECT
    service,
    SUM(patients_admitted) AS total_admitted,
    RANK() OVER (ORDER BY SUM(patients_admitted) DESC) AS admission_rank
FROM services_weekly
GROUP BY service;
-- Can't use WHERE with window functions directly-- Use subquery:
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER (ORDER BY age DESC) AS rn
    FROM patients
) WHERE rn <= 10  -- Top 10 oldest patients

SELECT
    name,
    ROW_NUMBER() OVER (ORDER BY age DESC) AS rn -- For numbering
	FROM patients
ORDER BY name;  -- For final result display