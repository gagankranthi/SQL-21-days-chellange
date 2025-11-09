--DAY 3 challenge QUERY:
SELECT week, service, patients_refused, patients_request 
FROM services_weekly
ORDER BY patients_refused DESC
LIMIT 5;