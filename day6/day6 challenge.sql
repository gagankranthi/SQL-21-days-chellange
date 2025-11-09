/*For each hospital service, calculate the total number of patients admitted, total patients refused, and
the admission rate (percentage of requests that were admitted). Order by admission rate descending.*/
SELECT * FROM services_weekly;
SELECT service,
SUM(patients_admitted) AS admitted,
SUM(patients_refused) AS refused,
ROUND(SUM(patients_admitted)*100.0/
NULLIF(SUM(patients_admitted)+SUM(patients_refused), 0), 2) AS admission_rate
FROM services_weekly
GROUP BY service
ORDER BY admission_rate DESC;

