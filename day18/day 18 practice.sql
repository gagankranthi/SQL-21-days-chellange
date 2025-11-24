--Combine patient names and staff names into a single list.
SELECT name as full_name FROM patients
UNION ALL SELECT staff_name as full_name FROM staff;
--Create a union of high satisfaction patients (>90) and low satisfaction patients (<50).
SELECT name, satisfaction, 'High satisfaction' AS category FROM patients
WHERE satisfaction >= 90 
UNION SELECT  name, satisfaction, 'Low satisfaction' AS category 
FROM patients
WHERE satisfaction < 50; 
--List all unique names from both patients and staff tables.
SELECT DISTINCT name FROM patients
UNION SELECT DISTINCT staff_name FROM staff;