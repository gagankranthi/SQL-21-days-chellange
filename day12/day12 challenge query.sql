/*Analyze the event impact by comparing weeks with events vs weeks without events. 
Show: event status ('With Event' or 'No Event'), count of weeks,
average patient satisfaction, and average staff morale.
Order by average patient satisfaction descending.*/
SELECT
  CASE
    WHEN event IS NOT NULL AND event = '' THEN 'event'
    ELSE 'no_event'
  END AS event_status,
COUNT(*) AS week_count,
AVG(patient_satisfaction) AS avg_satisfaction,
AVG(staff_morale) AS avg_morale
FROM services_weekly
GROUP BY event_status
ORDER BY avg_satisfaction DESC;

