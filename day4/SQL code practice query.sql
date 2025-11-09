SELECT age,patient_id, name FROM patients
LIMIT 10;
SELECT age,patient_id, name FROM patients
LIMIT 10 OFFSET 20;

--first 10 records 
select * from patients
limit 10 offset 0;
--next 10 records
select * from patients
limit 10 offset 10;
--2. next 20 records Show patients 11-20 using OFFSET
select * from patients
limit 10 offset 20;
select * from patients
ORDER BY name
LIMIT 10 OFFSET 20;
--1. Display the first 5 patients from the patients table
select * from patients
ORDER BY name
LIMIT 5;
--3. Get the 10 most recent patient admissions based on arrival_date.
select * from patients
order by arrival_date DESC
limit 10  offset 20 ;
