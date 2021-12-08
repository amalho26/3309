-- MySQL dump 10.13  Distrib 8.0.27, for macos11 (x86_64)
--
-- Host: localhost    Database: police
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `witness_statement`
--

DROP TABLE IF EXISTS `witness_statement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `witness_statement` (
  `comment` text,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `caseID` int NOT NULL,
  `socialInsuranceNumber` int NOT NULL,
  PRIMARY KEY (`date`,`time`,`socialInsuranceNumber`),
  UNIQUE KEY `socialInsurancenNumber_UNIQUE` (`socialInsuranceNumber`),
  UNIQUE KEY `caseID_UNIQUE` (`caseID`),
  KEY `socialInsuranceNumber_idx` (`socialInsuranceNumber`),
  CONSTRAINT `socialInsuranceNumber` FOREIGN KEY (`socialInsuranceNumber`) REFERENCES `people` (`socialInsuranceNumber`),
  CONSTRAINT `witnessCaseID` FOREIGN KEY (`caseID`) REFERENCES `report` (`caseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `witness_statement`
--

LOCK TABLES `witness_statement` WRITE;
/*!40000 ALTER TABLE `witness_statement` DISABLE KEYS */;
INSERT INTO `witness_statement` VALUES ('0','2006-07-23','13:09:42',36500,828844737),('0','2006-08-23','19:04:08',32917,573896844),('0','2006-09-05','06:46:40',78405,812434784),('0','2006-09-06','08:01:23',31381,649165632),('0','2006-11-11','20:01:15',42651,581712780),('0','2006-12-15','07:29:12',82995,868131598),('0','2007-01-04','01:28:00',69535,397780643),('0','2007-02-20','15:16:54',43218,836759998),('0','2007-02-21','05:13:36',76093,717015853),('0','2007-03-29','09:59:24',91346,519466803),('0','2007-05-10','06:25:26',59250,833935709),('0','2007-10-09','12:54:09',87413,533116434),('0','2007-10-25','02:54:34',92294,743688523),('0','2007-11-06','17:40:49',67841,483776076),('0','2007-11-12','01:37:39',50663,350484465),('0','2007-12-02','15:19:50',59667,792917963),('0','2008-03-28','14:22:51',91581,508408069),('0','2008-04-01','14:04:12',99595,656127785),('0','2008-05-03','19:25:50',24275,764884645),('0','2008-05-15','02:25:06',27160,639565365),('0','2008-06-09','07:00:32',63374,764353413),('0','2008-07-11','02:59:03',68452,581105990),('0','2008-07-30','13:58:25',72739,768607571),('0','2008-07-31','17:44:32',80982,731178874),('0','2008-09-13','00:44:58',64676,327519267),('0','2008-09-20','03:59:51',51404,371983132),('0','2009-02-01','01:42:13',47343,496796581),('0','2009-04-24','17:51:54',99470,670014154),('0','2009-05-19','19:38:30',90492,408083999),('0','2009-06-13','04:21:48',70564,392963197),('0','2009-07-24','15:16:32',77895,411712831),('0','2009-08-17','12:57:08',43998,408285670),('0','2009-08-30','09:26:09',65731,878964914),('0','2009-09-01','13:42:52',90448,813022337),('0','2009-09-08','10:48:37',70393,432725302),('0','2009-10-07','21:55:31',77967,773693876),('0','2009-11-24','20:57:45',83606,485633004),('0','2009-12-09','18:07:47',94559,887815143),('0','2010-02-10','21:52:17',75849,335906980),('0','2010-02-23','09:43:49',89750,468548158),('0','2010-03-17','16:57:18',65820,334279932),('0','2010-05-02','11:18:47',33098,422690926),('0','2010-05-07','23:30:41',35967,410355878),('0','2010-07-13','17:28:36',38698,448140174),('0','2010-07-21','05:30:40',21381,794984724),('0','2010-08-08','21:42:33',79423,761789490),('0','2010-08-10','23:08:50',36763,525973444),('0','2010-08-16','17:38:21',37045,589632348),('0','2010-09-04','07:02:59',88380,418941955),('0','2010-11-05','18:55:57',86240,880099900),('0','2010-11-13','20:31:25',80173,565591256),('0','2011-01-08','17:31:13',54343,673324561),('0','2011-01-17','17:54:37',78157,451839619),('0','2011-02-10','12:47:28',37989,362980901),('0','2011-02-27','13:41:40',79194,382194738),('0','2011-03-19','15:58:23',51166,618056466),('0','2011-05-17','13:39:57',68746,395500476),('0','2011-07-05','01:18:57',62974,525686722),('0','2011-08-12','04:20:52',21538,552260723),('0','2011-10-11','18:41:29',83157,815061832),('0','2011-12-04','20:59:59',76850,357623594),('0','2011-12-26','17:19:15',38723,564809088),('0','2012-01-13','01:27:03',44831,720167936),('0','2012-01-23','14:51:26',43936,822751832),('0','2012-04-14','23:33:20',39875,685348382),('0','2012-05-14','03:10:25',20440,340035589),('0','2012-05-25','15:02:07',28196,614437387),('0','2012-06-03','01:52:59',35051,488063328),('0','2012-07-04','08:22:20',90475,720604387),('0','2012-10-30','07:54:59',39718,813213662),('0','2012-11-05','01:06:26',57259,339575345),('0','2012-11-29','22:43:12',93213,546499028),('0','2012-12-25','19:33:07',41291,765472579),('0','2013-01-06','22:09:33',69795,854132051),('0','2013-01-27','04:58:18',58769,597053986),('0','2013-02-20','12:33:59',65157,662729806),('0','2013-03-27','11:26:49',29479,477375312),('0','2013-04-30','12:55:59',21216,459185659),('0','2013-05-01','09:20:24',95736,833286335),('0','2013-05-02','01:06:07',66608,485862048),('0','2013-05-10','19:47:45',70319,438513612),('0','2013-08-06','13:57:40',24841,785417332),('0','2013-09-26','06:14:30',29804,848422387),('0','2014-01-26','13:31:05',85373,870553552),('0','2014-04-11','20:25:34',29145,571013194),('0','2014-05-25','08:44:47',32028,867914300),('0','2014-07-06','05:06:15',89634,766856984),('0','2014-08-10','18:33:26',61578,333163112),('0','2014-10-12','16:28:42',46257,817815813),('0','2015-07-22','11:36:15',37602,462671869),('0','2015-07-30','00:48:14',76019,863923991),('0','2015-08-12','23:47:49',28949,579587898),('0','2015-08-26','02:57:35',39847,466498449),('0','2015-09-26','04:40:06',25712,667430054),('0','2015-11-23','18:40:29',58879,390316657),('0','2015-12-25','02:11:24',37134,667027529),('0','2016-01-14','19:01:56',78429,404627793),('0','2016-04-29','10:00:53',75355,659780947),('0','2016-05-21','11:00:06',66233,880361281),('0','2016-06-18','07:38:10',70703,866669295),('0','2016-07-28','22:29:52',84373,416750427),('0','2016-09-03','10:17:59',51840,590087373),('0','2016-09-05','00:10:17',80044,604432422),('0','2016-10-25','10:46:26',94827,815548927),('0','2016-11-21','17:56:21',81968,599846988),('0','2016-12-03','08:29:29',70474,821257804),('0','2016-12-10','02:37:30',26390,741885910),('0','2017-01-14','11:01:59',43361,695448520),('0','2017-05-19','15:00:57',45019,725214918),('0','2017-05-21','08:48:21',37820,533587547),('0','2017-06-08','02:51:45',93101,868387205),('0','2017-07-01','04:37:23',86296,489209206),('0','2017-07-05','18:08:31',73698,506653029),('0','2017-08-05','08:19:45',83294,337532899),('0','2017-08-23','16:46:28',79477,734592255),('0','2017-10-07','11:35:30',51893,745784910),('0','2018-02-07','01:28:33',68943,731932681),('0','2018-02-09','17:16:05',23169,768830967),('0','2018-03-13','23:45:17',62257,833852622),('0','2018-04-03','08:59:06',36514,540951313),('0','2018-04-23','00:21:54',38258,748821584),('0','2018-05-15','14:18:06',28288,576881173),('0','2018-05-20','12:44:09',64445,802064636),('0','2018-06-02','17:13:18',63414,850841286),('0','2018-08-20','07:29:11',55289,849895855),('0','2018-09-10','20:59:31',71367,325980901),('If he was lucky enough to avoid the electric chair, Weinberger was a likely candidate for a life sentence without the possibility of parole, which was the mandatory punishment for a murder that took place during a robbery.','2019-01-05','17:08:40',77220,680983306),('And what business owner would set up shop in a neighborhood where he is under constant threat of vandalism, robbery, and murder?','2019-01-06','15:30:07',52162,888953408),('Murder, rape, robbery, and a 1-in-14 chance of being a victim, all just a 10-minute walk from Ballou.','2019-01-08','04:53:48',79390,867654674),('Murder and robbery are criminal acts.','2019-01-09','03:34:51',82643,605461867),('A thief and a murderer are treated the same if the thief is HIV positive, where otherwise the thief might have been eligible for imprisonment in say, a medium-security facility.','2019-01-10','19:37:15',53398,383970517),('Maybe it\'s a sign of the times that gender is no bar when it comes to murder, robbery and other crimes.\" Meanwhile, another 41 gang members were arrested by Brooklyn authorities in Bushwick.','2019-01-11','10:16:41',60251,656775723),('The evidence hidden by the state were blood samples -- not from Thompson\'s blood -- found at the scene of the robbery.','2019-01-12','06:47:28',32112,636057379),('He killed Tom AND Johnny, a park ranger I USED TO BABYSIT (who, I might add, grew up quite nicely.) Armed robbery I could deal with, but not murder.','2019-01-14','08:55:52',37126,507955340),('He and his wife had two life insurances policies on their son.  Harris faces eight criminal counts: malice murder, cruelty to children in the first degree, cruelty to children in the second degree, criminal attempt to commit felony exploitation of children, two counts of felony murder, and two counts of dissemination of harmful material to minors.','2019-01-18','11:34:23',90759,329535483),('Our report looks at reducing the length of stay for some of the more serious crimes such as robbery, murder, aggravated assault, serious burglary, and that’s how we get to our 39 percent unnecessarily incarcerated number.','2019-01-20','11:13:55',59773,682161848),('On the one hand, it presents us yet again with the robbery-murder of young Bruce Wayne’s parents, perhaps the scene in all popular cinema that least needed to be portrayed anew.','2019-01-21','11:19:28',55227,479371313),('Our report looks at reducing the length of stay for some of the more serious crimes such as robbery, murder, aggravated assault, serious burglary, and that’s how we get to our 39 percent unnecessarily incarcerated number.','2019-01-25','02:08:37',72753,792570311),('He did what their distracted, overworked, and somewhat traumatized parents couldn’t do, Rayna says, which was “really connect to us.” In November 2012, a jury convicted Brogan Rafferty of two dozen criminal counts, including murder, robbery, and kidnapping.','2019-01-25','11:48:27',68265,866138454),('he quickly admitted his role in the robbery-murder of 87-year-old Vincent Morelli in his own home, a crime that had happened five days before Langley\'s killing.','2019-01-26','07:33:21',90520,564111758),('Belmokhtar has compiled an extensive dossier of illegal activity, according to the UN, including kidnappings, gunrunning, robbery, \"forming terrorist groups,\" and murder.','2019-01-26','19:18:09',88695,515907725),('@MikeGrunwald I am perplexed as to your motive to publicly incite the murder Julian who us not charged with any criminal offence #Assange @MikeGrunwald You will get more journalistic kudos by being well informed than by inciting the murder of a successful journalist.','2019-01-28','20:20:13',31575,632097324),('I think it was the opposite, personally--murder disguised as robbery.','2019-02-02','06:57:54',69012,633761895),('On the one hand, it presents us yet again with the robbery-murder of young Bruce Wayne’s parents, perhaps the scene in all popular cinema that least needed to be portrayed anew.','2019-02-04','03:09:49',88826,659098010),('If district attorneys can get a single conviction—for the robbery, for murder, for attempted murder, or for the hit-and-run—Knight is likely to end his life in jail.','2019-02-11','07:30:17',65626,690014082),('Our report looks at reducing the length of stay for some of the more serious crimes such as robbery, murder, aggravated assault, serious burglary, and that’s how we get to our 39 percent unnecessarily incarcerated number.','2019-02-14','12:49:32',29939,584405128),('The sharpest increase during the past decade was in aggravated assaults, followed by a rise in reports of robbery, murder, and rape.','2019-02-14','16:53:20',66310,504589516),('And what business owner would set up shop in a neighborhood where he is under constant threat of vandalism, robbery, and murder?','2019-02-14','20:16:53',61093,883191173),('Maybe it\'s a sign of the times that gender is no bar when it comes to murder, robbery and other crimes.\" Meanwhile, another 41 gang members were arrested by Brooklyn authorities in Bushwick.','2019-02-15','03:56:54',50842,476210809),('Last September, as Arizona was preparing to execute Jeffrey Landrigan for the murder of a man during an armed robbery, the state found it there was no sodium thiopental domestically.','2019-02-16','16:32:28',52974,610216489),('[...] Ebel has a criminal record dating to 2003 that includes convictions on robbery, menacing and weapons charges.','2019-02-17','10:39:43',85532,743245997),('Last September, as Arizona was preparing to execute Jeffrey Landrigan for the murder of a man during an armed robbery, the state found it there was no sodium thiopental domestically.','2019-02-19','08:22:02',97841,353640605),('He was arrested and, a year later, was convicted on 12 criminal counts, including armed robbery, kidnapping, and assault with a deadly weapon.','2019-02-20','15:36:52',75724,757029395),('On the one hand, it presents us yet again with the robbery-murder of young Bruce Wayne’s parents, perhaps the scene in all popular cinema that least needed to be portrayed anew.','2019-02-25','18:01:05',60125,664854068),('A thief and a murderer are treated the same if the thief is HIV positive, where otherwise the thief might have been eligible for imprisonment in say, a medium-security facility.','2019-03-02','09:28:45',87155,721004573),('The sharpest increase during the past decade was in aggravated assaults, followed by a rise in reports of robbery, murder, and rape.','2019-03-03','00:35:46',47107,397618438),('One staffer, Greg Marshburn, was in and out of prison over a period of 17 years for a number of crimes, including attempted murder and robbery.','2019-03-03','21:07:11',79391,718306667),('He was arrested and, a year later, was convicted on 12 criminal counts, including armed robbery, kidnapping, and assault with a deadly weapon.','2019-03-05','04:18:40',62882,722335907),('The corruption statute stipulates a great deal of crimes—the list begins with “murder, capital murder, arson, aggravated robbery, robbery, burglary, theft” and goes on for quite a while—but defendants in this case could likely be put behind bars if prosecutors can just prove that they were members of a criminal gang (in this case, the Cossacks or Bandidos) and that there was an agreement to commit a crime.','2019-03-05','20:36:12',45300,453179081),('he quickly admitted his role in the robbery-murder of 87-year-old Vincent Morelli in his own home, a crime that had happened five days before Langley\'s killing.','2019-03-08','09:55:45',23820,520150741),('Ford was convicted in 1985 for the murder of Isadore Rozeman, but was released after new evidence supported what he\'d been saying all along: that he wasn\'t even at the scene of the crime, and had only a tangential connection to the robbery that prompted it.','2019-03-11','19:24:14',27781,589054719),('Local law enforcement, though well-intentioned, is impotent to rid communities of gang infestation because leaders scare witnesses into silence after they commit murder, assault, or robbery.','2019-03-12','12:14:08',72547,616159997),('Our report looks at reducing the length of stay for some of the more serious crimes such as robbery, murder, aggravated assault, serious burglary, and that’s how we get to our 39 percent unnecessarily incarcerated number.','2019-03-12','17:14:13',65753,713071901),('He was arrested and, a year later, was convicted on 12 criminal counts, including armed robbery, kidnapping, and assault with a deadly weapon.','2019-03-13','07:34:06',70844,372578192),('“When you have hundreds of thousands of government regulations and now 5,000 separate, distinct federal criminal statutes, the ones that are founded in the common law, like murder and rape and robbery, there it’s presumed that people know -- you don’t have to show criminal intent there.','2019-03-14','20:21:17',25169,347266897),('Murder, rape, robbery, and a 1-in-14 chance of being a victim, all just a 10-minute walk from Ballou.','2019-03-18','02:42:01',74780,347599814),('he quickly admitted his role in the robbery-murder of 87-year-old Vincent Morelli in his own home, a crime that had happened five days before Langley\'s killing.','2019-03-19','05:18:05',29851,449451881),('Dorian Johnson, the man police have said they believe was Brown\'s accomplice in the robbery, has been cleared of criminal wrongdoing, Jackson said.','2019-03-20','14:55:06',75064,407954769),('[...] Ebel has a criminal record dating to 2003 that includes convictions on robbery, menacing and weapons charges.','2019-03-22','15:31:15',52398,792224278),('0','2019-03-25','11:18:17',83805,448122828),('The result was widespread intimidation and terror as guerrillas plundered homesteads, sacked towns, and staged ambushes that led to robbery and murder.','2019-03-26','01:26:55',39272,665251604),('Local law enforcement, though well-intentioned, is impotent to rid communities of gang infestation because leaders scare witnesses into silence after they commit murder, assault, or robbery.','2019-03-31','15:26:44',24607,850957018),('All are charged by state authorities with malice murder, felony murder, criminal gang activity, aggravated assault and using a firearm while committing a felony.','2019-04-02','06:13:23',62426,579819449),('The attacks, which ranged from a botched robbery to a kidnapping and murder, targeted employees at a Captain D\'s, a McDonald\'s and a Baskin Robbins either after closing or before opening.','2019-04-02','16:21:33',59872,405487332),('The attacks, which ranged from a botched robbery to a kidnapping and murder, targeted employees at a Captain D\'s, a McDonald\'s and a Baskin Robbins either after closing or before opening.','2019-04-04','05:08:40',43200,819161146),('The National Security Agency\'s defenders would have us believe that Snowden is a thief and a criminal at best, and perhaps a traitorous Russian spy.','2019-04-04','19:50:31',97887,650385806),('The blood libel is an anti-Semitic myth dating to the middle ages that Jews murder Christian children to use their blood in religious ceremonies;','2019-04-06','22:30:17',37788,495460336),('And for the most criminal and vicious members of society, the rationale of \"protecting\" their own rights would be a convenient justification for straight-up looting, robbery, and bloodshed.','2019-04-08','01:20:47',49694,534939737),('Glenn Ford has spent the past three decades on Louisiana\'s death row for the 1983 murder of jewelry store owner Isadore Rozeman, but according to previously undisclosed evidence in the case, Ford wasn\'t even at the scene of the robbery where the murder took place.','2019-04-10','06:46:34',23583,705210308),('Police in India have submitted 50 pages of criminal charges against five men on Thursday, including murder, rape, robbery, assault, and kidnapping for the brutal gang rape of a young woman that has generated worldwide outrage.','2019-04-17','12:28:31',97226,469731361),('The result was widespread intimidation and terror as guerrillas plundered homesteads, sacked towns, and staged ambushes that led to robbery and murder.','2019-04-20','20:42:16',77119,340739824),('0','2019-04-21','00:01:08',92631,518861787),('All are charged by state authorities with malice murder, felony murder, criminal gang activity, aggravated assault and using a firearm while committing a felony.','2019-04-22','05:17:38',22685,531591432),('Later, as she starts to cut her swathe of robbery and then murder, they fuss and expostulate, but refuse to turn her in because doing so might bring their dubious medical experiment to light.','2019-04-22','11:45:53',86071,611729000),('Last September, as Arizona was preparing to execute Jeffrey Landrigan for the murder of a man during an armed robbery, the state found it there was no sodium thiopental domestically.','2019-04-24','16:22:18',49879,822327771),('Local law enforcement, though well-intentioned, is impotent to rid communities of gang infestation because leaders scare witnesses into silence after they commit murder, assault, or robbery.','2019-04-26','01:31:29',23660,411724636),('Glenn Ford has spent the past three decades on Louisiana\'s death row for the 1983 murder of jewelry store owner Isadore Rozeman, but according to previously undisclosed evidence in the case, Ford wasn\'t even at the scene of the robbery where the murder took place.','2019-04-26','22:43:56',36601,626095295),('Last September, as Arizona was preparing to execute Jeffrey Landrigan for the murder of a man during an armed robbery, the state found it there was no sodium thiopental domestically.','2019-04-30','06:37:58',46093,816257584),('Five offenses are considered violent crimes in the FBI’s Uniform Crime Report Program: murder, non-negligent manslaughter, forcible rape, robbery, and aggravated assault.','2019-05-01','21:59:03',70051,417005959),('“I’m not going to take a chance on a person who’s been convicted of murder and aggravated robbery—when somebody died?','2019-05-03','12:49:16',96698,337843056),('Along with charges connected to the robbery, Mustelier has warrants out from an old bank robbery, and an attempted murder.','2019-05-05','14:51:15',55841,816561263),('Murder, rape, robbery, and a 1-in-14 chance of being a victim, all just a 10-minute walk from Ballou.','2019-05-06','23:11:35',99863,813581799),('Dorian Johnson, the man police have said they believe was Brown\'s accomplice in the robbery, has been cleared of criminal wrongdoing, Jackson said.','2019-05-08','02:11:36',76393,567503543),('Garner\'s arrest wasn\'t for murder or arson or bank robbery, but on suspicion of selling untaxed cigarettes—hardly the most serious of crimes.','2019-05-09','14:14:50',68109,722432958),('Frank Teague, convicted of attempted murder and robbery, challenged the prosecution’s exclusion of African Americans from the jury.','2019-05-11','02:40:27',99390,697393517),('Frank Teague, convicted of attempted murder and robbery, challenged the prosecution’s exclusion of African Americans from the jury.','2019-05-14','12:13:25',36906,664402551),('He and his wife had two life insurances policies on their son.  Harris faces eight criminal counts: malice murder, cruelty to children in the first degree, cruelty to children in the second degree, criminal attempt to commit felony exploitation of children, two counts of felony murder, and two counts of dissemination of harmful material to minors.','2019-05-15','16:47:01',75299,533637409),('All three of these men have been in the Michigan prison system for more than a decade on long sentences for murder or armed robbery, and all three are familiar with what it is like to go into segregation and have little sense of when they would be coming out.','2019-05-18','03:21:06',28004,409709720),('I think it was the opposite, personally--murder disguised as robbery.','2019-05-19','07:39:30',26495,401698352),('Last September, as Arizona was preparing to execute Jeffrey Landrigan for the murder of a man during an armed robbery, the state found it there was no sodium thiopental domestically.','2019-05-20','12:37:10',81843,652900052),('Later, as she starts to cut her swathe of robbery and then murder, they fuss and expostulate, but refuse to turn her in because doing so might bring their dubious medical experiment to light.','2019-05-22','01:33:10',50034,633708702),('Belmokhtar has compiled an extensive dossier of illegal activity, according to the UN, including kidnappings, gunrunning, robbery, \"forming terrorist groups,\" and murder.','2019-05-24','03:14:17',24426,635539029),('Garner\'s arrest wasn\'t for murder or arson or bank robbery, but on suspicion of selling untaxed cigarettes—hardly the most serious of crimes.','2019-05-25','13:17:46',60636,451429552),('Convicted of murder, and on Louisiana\'s death row for 14 years, John Thompson was just one month away from being executed when defense investigators discovered exculpatory evidence that prosecutors had failed to share with Thompson\'s lawyers in the two cases (one for armed robbery, one for murder) which led him to death row.','2019-05-26','11:19:18',39592,815685728),('All three of these men have been in the Michigan prison system for more than a decade on long sentences for murder or armed robbery, and all three are familiar with what it is like to go into segregation and have little sense of when they would be coming out.','2019-05-27','17:58:12',65920,484230289),('One staffer, Greg Marshburn, was in and out of prison over a period of 17 years for a number of crimes, including attempted murder and robbery.','2019-05-27','23:45:04',98785,504236335),('Our report looks at reducing the length of stay for some of the more serious crimes such as robbery, murder, aggravated assault, serious burglary, and that’s how we get to our 39 percent unnecessarily incarcerated number.','2019-06-02','21:00:51',89838,602032181),('The blood libel is an anti-Semitic myth dating to the middle ages that Jews murder Christian children to use their blood in religious ceremonies;','2019-06-03','08:58:25',82014,756409705),('He killed Tom AND Johnny, a park ranger I USED TO BABYSIT (who, I might add, grew up quite nicely.) Armed robbery I could deal with, but not murder.','2019-06-04','11:13:10',98524,797311127),('“I’m not going to take a chance on a person who’s been convicted of murder and aggravated robbery—when somebody died?','2019-06-04','15:31:09',55372,829514490),('Sylvanus assumed he was talking about the Langley robbery and murder;','2019-06-05','05:28:56',84886,881039994),('If he was lucky enough to avoid the electric chair, Weinberger was a likely candidate for a life sentence without the possibility of parole, which was the mandatory punishment for a murder that took place during a robbery.','2019-06-06','05:10:05',96769,491418221),('Local law enforcement, though well-intentioned, is impotent to rid communities of gang infestation because leaders scare witnesses into silence after they commit murder, assault, or robbery.','2019-06-06','05:50:13',31654,426482775),('0','2019-06-06','06:37:03',74888,362456327),('The sharpest increase during the past decade was in aggravated assaults, followed by a rise in reports of robbery, murder, and rape.','2019-06-06','19:16:46',97314,429175379),('0','2019-06-06','22:17:12',45756,398354625),('Sylvanus assumed he was talking about the Langley robbery and murder;','2019-06-07','00:18:58',84377,881587608),('@MikeGrunwald I am perplexed as to your motive to publicly incite the murder Julian who us not charged with any criminal offence #Assange @MikeGrunwald You will get more journalistic kudos by being well informed than by inciting the murder of a successful journalist.','2019-06-07','01:37:40',65000,376924936),('Belmokhtar has compiled an extensive dossier of illegal activity, according to the UN, including kidnappings, gunrunning, robbery, \"forming terrorist groups,\" and murder.','2019-06-07','11:19:03',93602,888820314),('If he was lucky enough to avoid the electric chair, Weinberger was a likely candidate for a life sentence without the possibility of parole, which was the mandatory punishment for a murder that took place during a robbery.','2019-06-10','01:54:38',36198,338890061),('Murder, rape, robbery, and a 1-in-14 chance of being a victim, all just a 10-minute walk from Ballou.','2019-06-11','23:53:23',43131,392796140),('It would cover some other crimes, considered a felony in the civilian justice system, that are punishable by a year or more in confinement—including robbery, forgery, extortion and even murder.','2019-06-16','14:07:17',37268,638725211),('The National Security Agency\'s defenders would have us believe that Snowden is a thief and a criminal at best, and perhaps a traitorous Russian spy.','2019-06-16','16:45:48',83000,402904528),('A little, old woman foiled the robbery by whacking the thief on the head with her cane.','2019-06-18','01:05:50',76527,896466646),('They have been charged with first-degree robbery and armed criminal action.','2019-06-18','01:58:52',21719,833532166),('He and his wife had two life insurances policies on their son.  Harris faces eight criminal counts: malice murder, cruelty to children in the first degree, cruelty to children in the second degree, criminal attempt to commit felony exploitation of children, two counts of felony murder, and two counts of dissemination of harmful material to minors.','2019-06-18','07:12:25',23917,533345015),('On the one hand, it presents us yet again with the robbery-murder of young Bruce Wayne’s parents, perhaps the scene in all popular cinema that least needed to be portrayed anew.','2019-06-18','07:51:26',28245,386952001),('They have been charged with first-degree robbery and armed criminal action.','2019-06-24','12:04:21',99967,603238516),('A little, old woman foiled the robbery by whacking the thief on the head with her cane.','2019-06-25','21:43:04',41614,346151223),('Convicted of murder, and on Louisiana\'s death row for 14 years, John Thompson was just one month away from being executed when defense investigators discovered exculpatory evidence that prosecutors had failed to share with Thompson\'s lawyers in the two cases (one for armed robbery, one for murder) which led him to death row.','2019-06-27','00:50:56',34281,350462737),('0','2019-07-19','22:20:33',51297,354328085),('0','2019-09-05','04:07:28',86859,819777036),('0','2019-09-12','11:18:21',86610,862572805),('0','2019-10-27','15:34:40',92674,755432632),('0','2019-11-22','20:21:53',46022,564037667),('0','2020-02-06','01:23:31',85447,426783724),('0','2020-02-29','11:07:13',33974,685574792),('0','2020-03-22','14:05:59',55670,524507024),('0','2020-06-05','13:01:42',29173,830849068),('0','2020-06-06','12:30:54',79084,840002223),('0','2020-07-09','16:25:21',96853,573463752),('0','2020-07-16','23:15:47',75749,859123058),('0','2020-09-02','13:30:28',72376,620750107),('0','2020-09-28','16:18:48',28743,333842037),('0','2020-11-28','06:56:55',81835,423106965),('0','2021-05-20','20:53:52',98909,498786416),('0','2021-05-31','22:58:49',25055,770984021),('0','2021-08-28','03:43:48',42594,428583708),('0','2021-09-23','09:12:10',45323,662699695),('0','2021-10-05','06:15:33',28003,657502609);
/*!40000 ALTER TABLE `witness_statement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07 17:40:02
