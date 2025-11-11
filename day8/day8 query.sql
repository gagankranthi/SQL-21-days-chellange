-- Convert to uppercase
SELECT UPPER(name)- Convert to uppercaseLOWER(column)           
-- Convert to lowercaseLENGTH(column)         
-- Get string lengthCONCAT(str1, str2)     
-- Combine stringsSUBSTRING(str, pos, len) -- Extract substringTRIM(column)           
-- Remove leading/trailing spacesREPLACE(str, old, new)  -- Replace text
FROM patients;

-- Concatenate columns
SELECT CONCAT(name, ' - ', service) AS patient_info FROM patients;

-- Get name length
SELECT name, LENGTH(name) AS name_length
FROM patients
WHERE LENGTH(name) > 15;
SELECT SUBSTRING(name, 1, 3) AS name_abbr FROM patients;
-- Extract substring (first 3 characters)
SELECT SUBSTRING(name, 1, 3) AS name_abbr FROM patients;
-- Replace text
SELECT REPLACE(service, 'Emergency', 'ER') AS service_abbr
FROM patients;
--
SELECT LOWER(name)
FROM patients
WHERE LOWER(name) = LOWER('john smith');
--
SELECT
    name,
    CASE
        WHEN LENGTH(name) > 20 THEN SUBSTRING(name, 1, 20) || '...'        ELSE name
    END AS display_name
FROM patients;
