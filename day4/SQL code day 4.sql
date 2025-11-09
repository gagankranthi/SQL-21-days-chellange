select patient_id, name, service, satisfaction
from patients 
order by satisfaction DESC
limit 5 offset 2;

--LIMIT is applied last: FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY → LIMIT
SELECT patient_id, name, service, satisfaction
FROM patients
WHERE satisfaction IS NOT NULL
GROUP BY patient_id, name, service, satisfaction
HAVING satisfaction > 0
ORDER BY satisfaction DESC
LIMIT 5 OFFSET 2;