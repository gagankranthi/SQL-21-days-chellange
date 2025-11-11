--Convert all patient names to uppercase.
SELECT upper(name)
FROM patients;

--Find the length of each staff member's name
SELECT staff_name, 
LENGTH(staff_name) AS length_name
FROM staff;
--Concatenate staff_id and staff_name with a hyphen separator.
SELECT CONCAT(staff_id, '-', staff_name) AS staff_info 
FROM staff;
