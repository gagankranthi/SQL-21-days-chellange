SELECT * FROM patients;
--Basic Syntax:
SELECT name, age
FROM patients
GROUP BY name, age;
-- Count patients per serviceSELECT service, COUNT(*) AS patient_count
SELECT service, COUNT(*) AS patient_count
FROM patients
GROUP BY service;
-- Multiple aggregates per groupSELECT
SELECT service, age,
    COUNT(*) AS total_patients,
    AVG(age) AS avg_age,
    AVG(satisfaction) AS avg_satisfaction
FROM patients
GROUP BY service, age
ORDER BY service, age DESC;
-- Group by multiple columnsSELECT
SELECT service,
    CASE WHEN age >= 65 THEN 'Senior' ELSE 'Adult' END AS age_group,
    COUNT(*) AS count FROM patients
GROUP BY service, age_group
order by service, age_group desc;
-- One row per service-month combination
select service, month
from services_weekly GROUP BY service, month; 

-- Order by the aggregated count
SELECT service, COUNT(*) AS count
FROM patients
GROUP BY service
ORDER BY count DESC; 
--1.Count the number of patients by each service.
SELECT service,
COUNT(*) AS count
FROM patients
GROUP BY service;
--2.Calculate the average age of patients grouped by service.
SELECT service,
AVG(age) AS avg_age
FROM patients
GROUP BY service;
--3.Find the total number of staff members per role.
SELECT * from staff_schedule;
SELECT * from staff;
SELECT role,
COUNT(role) as total
FROM staff
GROUP BY role;


