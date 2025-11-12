--Extract the year from all patient arrival dates.
SELECT name,
TO_CHAR(arrival_date, 'yyyy') AS year
FROM patients;
--Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT name,
arrival_date,
departure_date,
(departure_date-arrival_date) AS stay_day
FROM patients;
--Find all patients who arrived in a specific month.
SELECT * FROM patients
WHERE TO_CHAR(arrival_date,'mm') = '08'; --AUG
