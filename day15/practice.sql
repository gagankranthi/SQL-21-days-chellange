--Join patients, staff, and staff_schedule to show patient service and staff availability.
SELECT p.name,
p.service,
p.arrival_date,
COUNT(DISTINCT s.staff_id) AS staff_availability
FROM patients p
JOIN staff s ON p.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY p.name,
p.service, p.arrival_date;

--Combine services_weekly with staff and staff_schedule for comprehensive service analysis.
SELECT sw.service,
	sw.week,
	sw.patients_admitted,
	COUNT(DISTINCT s.staff_id) AS total_staff
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
 AND sw.week = ss.week
GROUP BY  sw.service,
	sw.week,
	sw.patients_admitted;
--Create a multi-table report showing patient admissions with staff information.
SELECT 
	p.name AS patient_name,
	p.service,
	p.arrival_date,
	s.staff_id,
	s.staff_name,
	s.role
FROM patients p
LEFT JOIN staff s ON p.service = s.service;
