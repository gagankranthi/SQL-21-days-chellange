SELECT * FROM patients; 
--Basic syntax
SELECT name, age,
count(*) AS total
FROM patients
GROUP BY name, age
HAVING age = 70; --HAVING aggregate_condition

-- Services with more than 100 patients
SELECT service, 
COUNT(*) AS patient_count
FROM patients
GROUP BY service
HAVING COUNT(*) > 100;

-- Combining WHERE and HAVINGSELECT service, COUNT(*) AS elderly_count
SELECT service, COUNT(*) AS elderly_count
FROM patients
WHERE age >= 65 
GROUP BY service-- Filter rows firstGROUP BY service
HAVING COUNT(*) > 20;       -- Filter groups after , 
-- Multiple HAVING conditionsSELECT
SELECT service,
    AVG(satisfaction) AS avg_sat,
	round(sum(satisfaction),2) AS round,
    COUNT(*) AS count FROM patients
GROUP BY service
HAVING AVG(satisfaction) > 80 AND COUNT(*) > 50;
--
SELECT service, COUNT(*) as count 
FROM patients 
WHERE age > 65
GROUP BY service
HAVING age > 100;
-- 
SELECT service, 
COUNT(*) as count
FROM patients
GROUP BY service
HAVING COUNT(*) > 100;