-- 4 INSERT STATEMENTS --

-- INSERT STATEMENT #1 --

SELECT * FROM police.crime_severity;

INSERT INTO police.crime_severity 
(weaponType, noOfPeopleInjured, 
amountStolen, noOfPeopleMurdered,
 murderDegree, caseID, crimeTypeName)
 
 VALUES("gun" , "2", "0", "first", "91581", "MURDER");
 
-- INSERT STATEMENT #2 --
SELECT * FROM police.people;

INSERT INTO people (socialInsuranceNumber, fName, lName, homephoneNumber, dateOfBirth, sex, address, ethnicity, city)

VALUES ("648272", "GARYESD", "Husjust" , "7409998272", 'MALE', '', '','', '' '' ) ;

-- INSERT STATEMENT #3 --

SELECT * FROM police.storage;
INSERT INTO police.storage(storageNo,storageSize,stationNo) values (80,5964,(SELECT stationNo FROM police.station WHERE city = 'Sarnia'));



-- INSERT STATEMENT #4 --

SELECT * FROM police.car;
INSERT INTO police.car(licensePlate,model,storageNo) values ("2A3KDCSK5KS927592","Dodge Charger",
(SELECT storageNo FROM police.car_storage WHERE (carsinStation > 19 AND storageNo > 50 )));
SELECT * FROM police.car;