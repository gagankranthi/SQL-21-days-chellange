--1 — Identify where and when the crime happened
SELECT * FROM evidence;
SELECT room, description, found_time
FROM evidence
WHERE room = 'CEO Office';
--2 - Analyze who accessed critical areas at the time
SELECT * FROM employees;
SELECT * FROM keycard_logs;
SELECT e.name, e.department, e.role, kl.entry_time, kl.exit_time
FROM keycard_logs kl
JOIN employees e ON kl.employee_id = e.employee_id
WHERE kl.room = 'CEO Office'
	AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:10';
-- 3 — Cross-check alibis with actual logs
SELECT * FROM employees;
SELECT * FROM alibis;
SELECT e.name,e.role, a.claimed_location, a.claim_time
FROM alibis a
JOIN employees e ON a.employee_id = e.employee_id
JOIN keycard_logs kl ON a.employee_id = kl.employee_id
WHERE kl.room = 'CEO Office'
	AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:10';
-- 4 -Investigate suspicious calls made around the time
SELECT * FROM calls;
SELECT 
	c.call_id,
	e1.name AS caller,
	e2.name AS receiver,
	c.call_time,
	c.duration_sec
FROM calls c
JOIN employees e1 ON c.caller_id = e1.employee_id
JOIN employees e2 ON c.receiver_id = e2.employee_id
WHERE c.call_time BETWEEN '2025-10-15 20:00' AND '2025-10-15 21:15';
-- 5 — Match evidence with movements and claims
SELECT 
	e.name,
	e.role,
	ed.room,
	ed.description, 
	ed.found_time
FROM evidence ed
JOIN keycard_logs kl ON ed.room = kl.room
JOIN employees e ON e.employee_id = kl.employee_id
WHERE ed.room = 'CEO Office'
	AND kl.entry_time BETWEEN '2025-10-15 20:45' AND '2025-10-15 21:10';.

-- 6 - Combine all findings to identify the killer
-- Suspects in CEO Office
SELECT e.name AS killer ,role, kl.employee_id FROM keycard_logs kl
JOIN employees e ON kl.employee_id = e.employee_id
WHERE room = 'CEO Office'
  AND entry_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00'

INTERSECT

-- Suspects with false alibi
SELECT e.name AS killer ,role, a.employee_id FROM alibis a
JOIN employees e ON a.employee_id = e.employee_id
WHERE claimed_location <> 'CEO Office'
  AND claim_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00'

INTERSECT

-- Suspects making calls in window
SELECT e.name AS killer,role, c.caller_id AS employee_id FROM calls c
JOIN employees e ON c.caller_id = e.employee_id
WHERE call_time BETWEEN '2025-10-15 20:40' AND '2025-10-15 21:00';


--Case solved query
SELECT DISTINCT e.name AS killer
FROM employees e
JOIN keycard_logs k
  ON k.employee_id = e.employee_id
 AND k.room = 'CEO Office'
 AND k.entry_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00'
JOIN alibis a
  ON a.employee_id = e.employee_id
 AND a.claim_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00'
 AND a.claimed_location <> 'CEO Office'
JOIN calls c
  ON (c.caller_id = e.employee_id OR c.receiver_id = e.employee_id)
 AND c.call_time BETWEEN '2025-10-15 20:50' AND '2025-10-15 21:00';