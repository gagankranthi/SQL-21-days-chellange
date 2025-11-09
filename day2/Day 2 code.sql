-- Day2 challenge:
SELECT DISTINCT service FROM patients;
-- showing their patient_id, name, age, and satisfaction score.
SELECT patient_id, name, age, satisfaction
FROM patients
-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70
WHERE service= 'surgery'
  AND satisfaction < 70;