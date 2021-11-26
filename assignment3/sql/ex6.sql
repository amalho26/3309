-- MODIFICATIONS SQL FILE --

-- MODIFICATION #1 --
-- This query This query demonstrates the use of DELETE from a table by giving a WHERE clause. --
-- This query searches the evidence table and deletes any tuple that has marijuana as the evidenceType and date less than January 1st 2020. --
DELETE FROM evidence 
WHERE (evidenceName = 'marijuana')
AND `date` < '2020-01-01'
AND evidenceID <> 0;

-- MODIFICATION #2 -- 
-- This query demonstrates the use of UPDATE by using SET with a WHERE clause. -- 
-- This searches officer table and any officer that has the rank “Constable” and more than 5 years experience will then get the rank “Staff Sergeant and Detective Sergeant”-- 
UPDATE officer
SET `rank` = 'Staff Sergeant and Detective Sergeant'
WHERE (`rank` = 'Constable' AND noOfYrsEmployed > 5 AND officerSocialInsuranceNumber<>0 );

-- MODIFICATION #3 -- 
-- In this query we represent how multiple attributes in a tuple may be updated in one query. --
-- The query that is not commented is meant to represent a situation where a designated officer is getting promoted after another year of service and is getting transferred to a new station while also receiving an increased pay. This officer is chosen by inputting their SIN. --
UPDATE officer 
SET noOfYrsEmployed=47, salary = 120000, `rank`='Chief of Police ', stationNo=1
WHERE (officerSocialInsuranceNumber = 325195305);