SELECT COUNT(*) AS total,
AVG(age) AS avg_age,
MIN(age) AS youngest,
MAX(age) AS oldest,
SUM(satisfaction) AS total_satisfaction
FROM patients;

SELECT name, age, satisfaction, service
FROM patients 
WHERE service = 'ICU';
select count(service) from patients;
--Count the total number of patients in the hospital.
SELECT count(name) as total_number
from patients;

--Calculate the average satisfaction score of all patients.
select avg(satisfaction) from patients;

--Find the minimum and maximum age of patients.
select min(age) as youngest, max(age) as oldest
from patients;

SELECT ROUND(AVG(age), 2) AS avg_age FROM patients;
SELECT COUNT(DISTINCT service) AS unique_services FROM patients;