--Find all weeks in services_weekly where no special event occurred.
SELECT week, event
FROM services_weekly
WHERE event IS NULL;
SELECT week, event
FROM services_weekly
WHERE event = 'none';
SELECT week, event,
COUNT(week) AS all_weeks,
WHERE event IS NUL;
--Count how many records have null or empty event values.
SELECT 
COUNT(*) AS count_records
FROM services_weekly
WHERE event IS null or event ='';
--List all services that had at least one week with a special event.
SELECT DISTINCT service
FROM services_weekly 
WHERE event IS NULL AND event ='';