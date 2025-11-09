--Day 3 chellange and practice query
--practice 1 order by columns not in SELECT:
SELECT  name, age, service
FROM patients
ORDER BY satisfaction ASC;

--practice 2 Multi-column sorting order matters:
SELECT name, age, service
FROM patients 
ORDER BY service, age ;

--practice 3 DESC for “Top N” queries:
SELECT * FROM patients
ORDER BY satisfaction DESC
LIMIT 10;
--practice 4 List all patients sorted by age in descending order.
SELECT * FROM patients 
ORDER BY age DESC;
--practice 5 Show all services_weekly data sorted by week number ascending and patients_request descending.
SELECT * FROM services_weekly
ORDER BY week, patients_request DESC;
--practice 6 Display staff members sorted alphabetically by their names.
SELECT * FROM staff
ORDER BY staff_name ASC;