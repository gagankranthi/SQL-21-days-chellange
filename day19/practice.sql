--Rank patients by satisfaction score within each service.
SELECT 
	name, 
	service, 
	satisfaction,
	RANK() OVER (ORDER BY satisfaction DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY satisfaction DESC) AS dense_rank 
FROM patients;
--Assign row numbers to staff ordered by their name.
SELECT * FROM staff;
SELECT 
	staff_id,
	staff_name,
	role,
	service,
	ROW_NUMBER() OVER (PARTITION BY staff_name ORDER BY staff_name) AS row_num
FROM staff;
--Rank services by total patients admitted.
SELECT  
	service,
    SUM(patients_admitted) AS total_admitted,
    RANK() OVER (ORDER BY SUM(patients_admitted) DESC) AS admission_rank
FROM services_weekly
GROUP BY service;
