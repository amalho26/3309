-- CREATINGS VIEWS SQL FILE --
USE police;
-- create a view for the number of witness statements that criminal with SIN 329535483 is reported in
CREATE VIEW criminalHistory
AS SELECT COUNT(*)
FROM witness_statement
WHERE socialInsuranceNumber = 329535483;

SELECT * FROM criminalHistory;


-- create a view with what gang names are reported in London
CREATE VIEW gangReport
AS SELECT c.gangName, r.city
FROM criminal c, Report r, crime_incident ci
WHERE c.criminalSocialInsuranceNumber = ci.criminalSocialInsuranceNumber
AND ci.caseID = r.caseID
AND r.city = "LONDON"
GROUP BY c.gangName;

SELECT * FROM gangReport;

-- create view so that officer with social insurance number 341624401 can view the evidence that they logged
CREATE VIEW OfficerView
AS SELECT *
FROM evidence_log
WHERE officerSIN = 341624401;

SELECT * FROM OfficerView
