-- evidence used to get caseID and area 
SELECT caseID FROM report; -- used for case ID
SELECT area.city As City, consequence.crimeTypeName AS Crime, COUNT(consequence.crimeTypeName) AS Occurance
                FROM consequence INNER JOIN report ON consequence.caseID = report.caseID
                INNER JOIN area ON report.city = area.city
                WHERE area.city = 'ajax'
                GROUP BY area.city, consequence.crimeTypeName
                ORDER BY Occurance DESC
                LIMIT 1;
-- login authorization	
SELECT fname, lname FROM loginInfo WHERE loginId = id;
SELECT loginOfficerID FROM loginInfo WHERE loginId = id;
SELECT loginID FROM loginInfo WHERE userName = '${requestBody.email}' AND pwd = '${requestBody.password}';

-- evidence trends
SELECT stationNo FROM station;
SELECT 
    e.evidenceType,
    COUNT(e.evidenceType) AS count
    FROM evidence_log e
    JOIN officer o ON e.officerSIN = o.officerSocialInsuranceNumber
    JOIN station s ON o.stationNo = s.stationNo
    WHERE s.stationNo = ${station} AND e.date BETWEEN '2019-01-01' AND '2021-01-01'
    GROUP BY e.evidenceType;
    
-- officer
SELECT officerSIN FROM loginInfo
    WHERE username = userName;
    
-- reports
SELECT caseID, date, arrivalTime, timeOnScene, city FROM report
    WHERE caseID = CaseID;

 INSERT INTO report VALUES(req.body.rCase, req.body.rDate, req.body.rArrivalTime, req.body.rTimeOnScene, req.body.rsin, req.body.rcity);
 
 -- trends
 SELECT city FROM area;
 SELECT consequence.crimeTypeName AS Crime, COUNT(consequence.crimeTypeName) AS Occurance
                FROM consequence INNER JOIN report ON consequence.caseID = report.caseID
                INNER JOIN area ON report.city = area.city
                WHERE area.city = city
                GROUP BY area.city, consequence.crimeTypeName
                ORDER BY Occurance DESC;
-- witness statement view
DROP VIEW criminalWitnessStatements;
CREATE VIEW criminalWitnessStatements
    AS SELECT COUNT(w.socialInsuranceNumber) AS witnessOccurences, p.fName, p.lName
    FROM witness_statement w, people p, criminal c
    WHERE p.fName = fname AND p.lname = lname
    AND c.criminalSocialInsuranceNumber = p.socialInsuranceNumber
    AND w.socialInsuranceNumber = c.criminalSocialInsuranceNumber;
    
    SELECT * FROM criminalWitnessStatements