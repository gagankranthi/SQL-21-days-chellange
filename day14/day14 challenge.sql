/*Create a staff utilisation report showing all staff members 
(staff_id, staff_name, role, service) and 
the count of weeks they were present (from staff_schedule). 
Include staff members even if they have no schedule records. 
Order by weeks present descending.*/
SELECT s.staff_id,
	s.staff_name,
	s.role,
	s.service,
	COUNT(ss.week) AS present_week
FROM staff s
LEFT JOIN staff_schedule ss ON s.staff_id = ss.staff_id
GROUP BY s.staff_id,
	s.staff_name,
	s.role,
	s.service
ORDER BY
	present_week DESC;

