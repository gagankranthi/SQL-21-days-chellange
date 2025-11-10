--Find services that have admitted more than 500 patients in total.

SELECT * FROM services_weekly;
SELECT service,
SUM(patients_admitted) as admitted
FROM services_weekly
GROUP BY service
HAVING SUM(patients_admitted) > 500

--Show services where average patient satisfaction is below 75.
SELECT service, 
AVG(patient_satisfaction) AS avg
FROM services_weekly
GROUP BY service
HAVING AVG(patient_satisfaction) < 75;
--List weeks where total staff presence across all services was less than 50.
SELECT * FROM staff_schedule;
SELECT week, 
SUM(present) AS total
FROM staff_schedule
GROUP BY week
HAVING SUM(present) < 50;


