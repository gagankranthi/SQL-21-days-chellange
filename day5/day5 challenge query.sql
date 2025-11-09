/*Calculate the total number of patients admitted, total patients refused, and the average patient
satisfaction across all services and weeks. Round the average satisfaction to 2 decimal places.*/
select * from patients;
SELECT * from services_weekly;
SELECT service, week, patients_admitted, patients_refused as total
from services_weekly
order by services_weekly limit 10;


SELECT 
SUM(patients_admitted) as total_admitted,
SUM(patients_refused) as total_refused, 
avg(patient_satisfaction) as avg_satisfaction,
round(avg(patient_satisfaction), 2) as round_the_avg_satisfaction
from services_weekly 