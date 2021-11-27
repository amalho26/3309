-- CREATINGS VIEWS SQL FILE --
USE police;
-- create a view for the number of witness statements that criminal with SIN 329535483 is reported in
CREATE VIEW criminalWitnessStatements
AS SELECT COUNT(w.socialInsuranceNumber) AS witnessOccurences, p.fName AS `first name`, p.lName AS `Last name`
FROM witness_statement w, people p, criminal c
WHERE p.fName = 'Lindsy' AND p.lname = 'Elintune'
AND c.criminalSocialInsuranceNumber = p.socialInsuranceNumber
AND w.socialInsuranceNumber = c.criminalSocialInsuranceNumber;

SELECT * FROM criminalHistory;

-- Create view that shows the gangs active in Toronto and the number 
CREATE VIEW gangReport
AS SELECT c.gangName AS `Active gangs`, r.city AS `city`, COUNT(c.gangName) AS `number of incidents`
FROM criminal c, report r , crime_incident ci
WHERE r.city = "TORONTO"
AND c.criminalSocialInsuranceNumber = ci.criminalSocialInsuranceNumber
AND r.caseID = ci.caseID
AND c.gangName != "0"
GROUP BY c.gangName, ci.caseID;


-- create view so that officer with social insurance number 341624401 can view the evidence that they logged
CREATE VIEW OfficerView
AS SELECT *
FROM evidence_log
WHERE officerSIN = 341624401;

SELECT * FROM OfficerView
