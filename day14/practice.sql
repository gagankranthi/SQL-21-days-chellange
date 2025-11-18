--Show all staff members and their schedule information (including those with no schedule entries).
SELECT s.staff_id,
	s.staff_name, 
	s.role,
	s.service,
	ss.week
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id;
/*List all services from services_weekly and 
their corresponding staff (show services even if no staff assigned)*/
SELECT sw.service,
staff_name
FROM services_weekly sw
LEFT JOIN staff s ON sw.service = s.service;
--Display all patients and their service's weekly statistics (if available).
SELECT p.service,
p.name,
sw.week
FROM patients p
LEFT JOIN services_weekly sw ON p.service = sw.service;
