/*Create a patient summary that shows patient_id, full name in 
uppercase, service in lowercase, age category (if age >= 65 then 'Senior', 
if age >= 18 then 'Adult', else 'Minor'), 
and name length. Only show patients whose name length is greater than 10 characters.*/
SELECT * FROM patients;
SELECT patient_id,
UPPER(name) AS full_name,
LOWER(service) AS lower_service,
age,
CASE WHEN age >= 65 THEN 'Senior' WHEN age >= 18 THEN 'Adult' ELSE 'minor' END AS age_group ,
LENGTH(name) AS length_name
FROM patients
WHERE LENGTH(name) > 10;
