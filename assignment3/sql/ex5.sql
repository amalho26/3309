
-- simple functionalities
SELECT p.fName, p.lName, p.address
FROM People p JOIN Criminal c ON p.socialInsuranceNumber = c.criminalSocialInsuranceNumber
WHERE c.gangName LIKE '%Mafia%';

SELECT o.rank, COUNT(o.officerSocialInsuranceNumber) AS officersInRank, AVG(o.salary) AS averageRankSalary
FROM Station s JOIN Officer o ON s.stationNO = o.stationNo
GROUP BY o.rank
ORDER BY o.rank;

SELECT socialInsuranceNumber, fName, lName, ethnicity
FROM People p LEFT JOIN Officer o ON
p.socialInsuranceNumber = o.officerSocialInsuranceNumber
WHERE ethnicity IN('Asian', 'South Asian');


-- complex functionalities


 -- This complex functionality answers: "In a given city (in this case: Ajax), what is the most crime type, and how many times has it occured."
SELECT area.city As City, consequence.crimeTypeName AS Crime, COUNT(consequence.crimeTypeName) AS Occurance
FROM consequence
INNER JOIN report
ON consequence.caseID = report.caseID
INNER JOIN area
ON report.city = area.city
WHERE area.city = 'ajax'
GROUP BY area.city, consequence.crimeTypeName
ORDER BY Occurance DESC
LIMIT 1;


 -- This complex functionality answers: "In a given city with a given crime type, (in this case: Ajax, crime: Murder), what is the average fine for the criminals."
SELECT report.city As City, consequence.crimeTypeName AS Crime, 
ROUND(AVG(consequence.fine),2) AS 'Fine($)', AVG(consequence.jailTime) AS 'Sentence(Yrs)', AVG(consequence.parole) AS 'Parole(Mths)'
FROM report
INNER JOIN consequence
ON consequence.caseID = report.caseID
INNER JOIN area
ON report.city = area.city
WHERE area.city = 'ajax' AND consequence.crimeTypeName = 'Murder';



-- This complex functionality answers: "In a given station, a start and end date, (in this case: station: #18, start date: 2019-01-01, end date: 2021-01-01), 
-- what is the most logged evidence type, and how many occurances in that period of time?"
SELECT 
e.evidenceType, o.stationNo,
COUNT(e.evidenceType) AS count
FROM evidence_log e
JOIN officer o ON e.officerSIN = o.officerSocialInsuranceNumber
JOIN station s ON o.stationNo = s.stationNo
WHERE s.stationNo = 18 AND e.date BETWEEN '2019-01-01' AND '2021-01-01'
GROUP BY e.evidenceType
LIMIT 1;

-- This complex functionality answers: In a given station (in this case: 20), rank the officers by the number of years they’ve been employed and show how many 
-- reports they have completed.
SELECT 
e.officerSIN, 
COUNT(e.officerSIN) AS count
FROM evidence_log e
GROUP BY e.officerSIN
HAVING COUNT(e.officerSIN) = (SELECT MAX((SELECT COUNT(e.officerSIN) AS count FROM evidence_log e GROUP BY e.officerSIN ORDER BY count DESC LIMIT 1)))
LIMIT 1;


