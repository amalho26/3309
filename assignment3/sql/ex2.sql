USE police;

CREATE TABLE IF NOT EXISTS area (
  city varchar(50) NOT NULL,
  populationSize int NOT NULL,
  PRIMARY KEY (city),
  KEY idx_area_city (city)
);

CREATE TABLE IF NOT EXISTS station (
  stationNo int NOT NULL,
  noOfOfficers int NOT NULL,
  city varchar(50) NOT NULL,
  PRIMARY KEY (stationNo),
  KEY cityname_idx (city),
  KEY idx_station_stationNo (stationNo),
  CONSTRAINT cityname FOREIGN KEY (city) REFERENCES area (city)
);

CREATE TABLE IF NOT EXISTS `people` (
  `socialInsuranceNumber` int NOT NULL,
  `fName` varchar(50) NOT NULL,
  `lName` varchar(50) NOT NULL,
  `homePhoneNumber` varchar(15) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `address` varchar(250) NOT NULL,
  `ethnicity` varchar(50) NOT NULL,
  `sex` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`socialInsuranceNumber`),
  UNIQUE KEY `socialInsuranceNumber_UNIQUE` (`socialInsuranceNumber`),
  KEY `city_idx` (`city`),
  KEY `idx_people_socialInsuranceNumber` (`socialInsuranceNumber`),
  CONSTRAINT `city` FOREIGN KEY (`city`) REFERENCES `area` (`city`)
);

CREATE TABLE IF NOT EXISTS `officer` (
  `rank` varchar(50) NOT NULL,
  `salary` int unsigned NOT NULL,
  `noOfYrsEmployed` int NOT NULL,
  `stationNo` int NOT NULL,
  `officerSocialInsuranceNumber` int NOT NULL,
  PRIMARY KEY (`officerSocialInsuranceNumber`),
  UNIQUE KEY `officerSocialInsuranceNumber_UNIQUE` (`officerSocialInsuranceNumber`),
  KEY `stationNo_idx` (`stationNo`),
  KEY `officerSocialInsuranceNumber_idx` (`officerSocialInsuranceNumber`),
  CONSTRAINT `officerSocialInsuranceNumber` FOREIGN KEY (`officerSocialInsuranceNumber`) REFERENCES `people` (`socialInsuranceNumber`),
  CONSTRAINT `stationNo` FOREIGN KEY (`stationNo`) REFERENCES `station` (`stationNo`)
);

CREATE TABLE IF NOT EXISTS `criminal` (
  `criminalHistory` tinyint NOT NULL,
  `gangName` varchar(200) DEFAULT NULL,
  `criminalSocialInsuranceNumber` int NOT NULL,
  PRIMARY KEY (`criminalSocialInsuranceNumber`),
  UNIQUE KEY `criminalSocialInsuranceNumber_UNIQUE` (`criminalSocialInsuranceNumber`),
  KEY `criminalSocialInsuranceNumber_idx` (`criminalSocialInsuranceNumber`),
  CONSTRAINT `criminalSocialInsuranceNumber` FOREIGN KEY (`criminalSocialInsuranceNumber`) REFERENCES `people` (`socialInsuranceNumber`)
);

CREATE TABLE IF NOT EXISTS `crime_incident` (
  `crimeDate` date NOT NULL,
  `crimeRole` varchar(50) NOT NULL,
  `description` text,
  `criminalSocialInsuranceNumber` int NOT NULL,
  `caseID` int NOT NULL,
  PRIMARY KEY (`crimeDate`,`criminalSocialInsuranceNumber`,`caseID`),
  UNIQUE KEY `criminalSocialInsuranceNumber_UNIQUE` (`criminalSocialInsuranceNumber`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  KEY `socialInsuranceNumber_idx` (`criminalSocialInsuranceNumber`),
  CONSTRAINT `criminalSIN` FOREIGN KEY (`criminalSocialInsuranceNumber`) REFERENCES `criminal` (`criminalSocialInsuranceNumber`),
  CONSTRAINT `incidentID` FOREIGN KEY (`caseID`) REFERENCES `report` (`caseID`)
);

CREATE TABLE IF NOT EXISTS `report` (
  `caseID` int NOT NULL,
  `date` date NOT NULL,
  `arrivalTime` time NOT NULL,
  `timeOnScene` int NOT NULL,
  `city` varchar(50) NOT NULL,
  `officerSocialInsuranceNumber` int NOT NULL,
  PRIMARY KEY (`caseID`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  UNIQUE KEY `officerSocialInsuranceNumber_UNIQUE` (`officerSocialInsuranceNumber`),
  KEY `cityy_idx` (`city`),
  KEY `officerSocialInsuranceNumberr_idx` (`officerSocialInsuranceNumber`),
  KEY `caseID` (`caseID`),
  CONSTRAINT `cityy` FOREIGN KEY (`city`) REFERENCES `area` (`city`),
  CONSTRAINT `officerSocialInsuranceNumberr` FOREIGN KEY (`officerSocialInsuranceNumber`) REFERENCES `officer` (`officerSocialInsuranceNumber`)
);

CREATE TABLE IF NOT EXISTS `witness_statement` (
  `date` date NOT NULL,
  `comment` text,
  `socialInsurancenNumber` int NOT NULL,
  `caseID` int NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`date`,`socialInsurancenNumber`,`time`),
  UNIQUE KEY `socialInsurancenNumber_UNIQUE` (`socialInsurancenNumber`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  KEY `socialInsuranceNumber_idx` (`socialInsurancenNumber`),
  CONSTRAINT `socialInsuranceNumber` FOREIGN KEY (`socialInsurancenNumber`) REFERENCES `people` (`socialInsuranceNumber`),
  CONSTRAINT `witnessCaseID` FOREIGN KEY (`caseID`) REFERENCES `report` (`caseID`)
);

CREATE TABLE IF NOT EXISTS `crime_type` (
  `crimeTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`crimeTypeName`),
  KEY `crimeType` (`crimeTypeName`)
);

CREATE TABLE IF NOT EXISTS `consequence` (
  `jailTime` varchar(15) DEFAULT NULL,
  `fine` double DEFAULT NULL,
  `parole` int DEFAULT NULL,
  `caseID` int NOT NULL,
  `crimeTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`caseID`,`crimeTypeName`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  KEY `idx_consequence_caseID` (`caseID`),
  KEY `idx_consequence_crimeTypeName` (`crimeTypeNapeoplepeopleme`),
  CONSTRAINT `conCaseID` FOREIGN KEY (`caseID`) REFERENCES `report` (`caseID`),
  CONSTRAINT `crimeName` FOREIGN KEY (`crimeTypeName`) REFERENCES `crime_type` (`crimeTypeName`)
); 

CREATE TABLE IF NOT EXISTS `crime_severity` (
  `weaponType` VARCHAR (100) DEFAULT NULL,
  `noOfPeopleInjured` VARCHAR (20) DEFAULT NULL,
  `amountStolen` VARCHAR(50) DEFAULT NULL,
  `noOfPeopleMurdered` VARCHAR (10) DEFAULT NULL,
  `murderType` varchar(25) DEFAULT NULL,
  `caseID` int NOT NULL,
  `crimeTypeName` varchar(100) NOT NULL,
  PRIMARY KEY (`caseID`,`crimeTypeName`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  KEY `idx_crime_severity_noOfPeopleInjured` (`noOfPeopleInjured`),
  KEY `crimeType_idx` (`crimeTypeName`),
  CONSTRAINT `crimeCaseID` FOREIGN KEY (`caseID`) REFERENCES `consequence` (`caseID`),
  CONSTRAINT `crimeType` FOREIGN KEY (`crimeTypeName`) REFERENCES `consequence` (`crimeTypeName`)
);

CREATE TABLE IF NOT EXISTS `storage` (
  `storageNo` int NOT NULL,
  `storageSize` varchar(100) DEFAULT NULL,
  `stationNo` int NOT NULL,
  PRIMARY KEY (`storageNo`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `idx_storage_storageNo` (`storageNo`),
  KEY `idx_storage_stationNo` (`stationNo`),
  CONSTRAINT `stationNumber` FOREIGN KEY (`stationNo`) REFERENCES `station` (`stationNo`)
);

CREATE TABLE IF NOT EXISTS `equipment_storage` (
  `totalNoOfEquipment` int DEFAULT NULL,
  `lockerNo` int NOT NULL,
  `storageNo` int NOT NULL,
  PRIMARY KEY (`storageNo`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `idx_equipment_storage_storageNo` (`storageNo`),
  CONSTRAINT `storageNum` FOREIGN KEY (`storageNo`) REFERENCES `storage` (`storageNo`)
);

CREATE TABLE IF NOT EXISTS `car_storage` (
  `carsInStation` int DEFAULT NULL,
  `storageNo` int NOT NULL,
  PRIMARY KEY (`storageNo`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `storageNumb_idx` (`storageNo`),
  CONSTRAINT `storageNumb` FOREIGN KEY (`storageNo`) REFERENCES `storage` (`storageNo`)
);

CREATE TABLE IF NOT EXISTS `car` (
  `licensePlate` varchar(20) NOT NULL,
  `model` varchar(150) NOT NULL,
  `storageNo` int NOT NULL,
  PRIMARY KEY (`licensePlate`),
  UNIQUE KEY `licensePlate_UNIQUE` (`licensePlate`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  CONSTRAINT `storageNumbe` FOREIGN KEY (`storageNo`) REFERENCES `storage` (`storageNo`)
);

CREATE TABLE IF NOT EXISTS `evidence_storage` (
  `lockerNo` int NOT NULL,
  `storageNo` int NOT NULL,
  `totalNoOfLockers` int DEFAULT NULL,
  PRIMARY KEY (`storageNo`),
  UNIQUE KEY `idx_evidence_storage_lockerNo` (`lockerNo`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `storageNo_idx` (`storageNo`),
  CONSTRAINT `storageNo` FOREIGN KEY (`storageNo`) REFERENCES `storage` (`storageNo`)
); 

CREATE TABLE IF NOT EXISTS `evidence_log` (
  `date` date NOT NULL,
  `evidenceCollected` varchar(150) DEFAULT NULL,
  `description` text,
  `noOfEvidenceCollected` int DEFAULT NULL,
  `officerSIN` int NOT NULL,
  `time` time NOT NULL,
  `logType` varchar(50) NOT NULL,
  PRIMARY KEY (`date`,`time`),
  UNIQUE KEY `officerSIN_UNIQUE` (`officerSIN`),
  KEY `idx_evidence_log_date` (`date`),
  KEY `idx_evidence_log_time` (`time`),
  CONSTRAINT `officerSIN` FOREIGN KEY (`officerSIN`) REFERENCES `officer` (`officerSocialInsuranceNumber`)
);


CREATE TABLE IF NOT EXISTS `evidence` (
  `evidenceID` int unsigned NOT NULL,
  `lockerNo` int NOT NULL,
  `caseID` int NOT NULL,
  `evidenceName` varchar(200) DEFAULT NULL,
  `storageNo` int NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`evidenceID`),
  UNIQUE KEY `evidenceID_UNIQUE` (`evidenceID`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  UNIQUE KEY `storageNo_UNIQUE` (`storageNo`),
  KEY `eDate_idx` (`date`),
  KEY `eTime_idx` (`time`),
  CONSTRAINT `eCaseID` FOREIGN KEY (`caseID`) REFERENCES `report` (`caseID`),
  CONSTRAINT `eDate` FOREIGN KEY (`date`) REFERENCES `evidence_log` (`date`),
  CONSTRAINT `eTime` FOREIGN KEY (`time`) REFERENCES `evidence_log` (`time`),
  CONSTRAINT `storageNumber` FOREIGN KEY (`storageNo`) REFERENCES `evidence_storage` (`storageNo`)
);
