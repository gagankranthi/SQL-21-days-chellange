SELECT DISTINCT service FROM services_weekly ;
SELECT * FROM services_weekly LIMIT 10 ;
SELECT * FROM patients ;
SELECT patient_id, name, age
FROM patients;

SELECT age, service
FROM patients;
SELECT * FROM patients WHERE age > 60;
SELECT * FROM patients
WHERE age > 60 AND service = 'Cardiology';
SELECT * FROM patients
WHERE service = 'Emergency' OR service = 'Cardiology';
SELECT * FROM patients
WHERE service IN ('Emergency', 'Cardiology', 'Neurology');

SELECT patient_id, name, age, satisfaction
FROM patients
WHERE service = 'Surgery'