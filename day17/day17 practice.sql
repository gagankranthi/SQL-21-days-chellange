--Show each patient with their service's average satisfaction as an additional column.
SELECT * FROM patients;
SELECT name,service, ROUND(
	(SELECT AVG(satisfaction) 
	FROM patients),2) AS satisfaction
FROM patients;
--Create a derived table of service statistics and query from it.
SELECT service, satisfaction
FROM (SELECT service,
	AVG(satisfaction) AS satisfaction,
	COUNT(*) AS count_patient
	FROM patients p
	GROUP BY service) 
AS dt;
--Display staff with their service's total patient count as a calculated field.
SELECT* FROM staff;
SELECT s.staff_name,s.service, cc.total_patients
FROM staff as s
JOIN (SELECT service, COUNT(*) AS total_patients
FROM patients
GROUP BY service) AS cc ON s.service = cc.service; 
