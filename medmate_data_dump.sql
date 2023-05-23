CREATE DATABASE  IF NOT EXISTS `medmate` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `medmate`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: medmate
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `billingdetails`
--

DROP TABLE IF EXISTS `billingdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billingdetails` (
  `medicineOrderID` int NOT NULL,
  `totalPrice` int NOT NULL,
  `modeOfPayment` varchar(255) NOT NULL,
  `billingAddress` varchar(255) NOT NULL,
  KEY `medicineOrderID` (`medicineOrderID`),
  CONSTRAINT `billingdetails_ibfk_1` FOREIGN KEY (`medicineOrderID`) REFERENCES `orderdetails` (`orderID`) ON DELETE CASCADE,
  CONSTRAINT `paymentCheck` CHECK ((`modeOfPayment` in (_cp850'COD',_cp850'UPI',_cp850'CARD',_cp850''))),
  CONSTRAINT `totalPriceCheck` CHECK ((`totalPrice` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billingdetails`
--

LOCK TABLES `billingdetails` WRITE;
/*!40000 ALTER TABLE `billingdetails` DISABLE KEYS */;
INSERT INTO `billingdetails` VALUES (29,5065,'UPI','6136 Mallard Place'),(175,2321,'UPI','633 Erie Alley'),(158,7332,'CARD','3 Derek Center'),(115,2554,'COD','936 Pine View Trail'),(105,5139,'UPI','338 Bellgrove Court'),(180,7002,'UPI','5 Ridgeway Circle'),(186,3097,'UPI','5307 Laurel Court'),(179,7605,'UPI','680 2nd Road'),(2,892,'CARD','3783 Elka Lane'),(87,3282,'COD','73197 Old Shore Road'),(75,9519,'CARD','9 Waxwing Trail'),(49,6010,'CARD','159 Surrey Court'),(33,7058,'COD','2 Bellgrove Junction'),(159,4045,'CARD','68966 Beilfuss Trail'),(151,6746,'UPI','63422 Sycamore Road'),(198,5281,'UPI','87396 Portage Drive'),(144,2331,'COD','6 Buell Court'),(196,269,'COD','3 Grim Lane'),(55,8299,'CARD','4775 Jenifer Hill'),(122,3919,'CARD','5354 Bartelt Alley'),(186,480,'CARD','244 Fallview Avenue'),(75,4522,'COD','52842 Division Parkway'),(181,378,'COD','0 Hauk Park'),(50,3055,'CARD','6 Clove Parkway'),(121,8287,'COD','2371 Morningstar Lane'),(76,5700,'COD','40 Troy Park'),(77,7583,'UPI','46698 Hanover Lane'),(146,2601,'COD','96201 Westerfield Way'),(140,2877,'UPI','14860 Glendale Alley'),(25,2903,'COD','8 Aberg Crossing'),(9,5546,'UPI','80 Maple Terrace'),(4,1334,'COD','0246 Pennsylvania Way'),(73,7788,'COD','233 Sauthoff Pass'),(41,6519,'COD','1 West Trail'),(141,8936,'COD','1884 Prairieview Circle'),(169,5163,'CARD','178 Mallard Avenue'),(134,1480,'COD','94471 Troy Drive'),(143,7781,'UPI','01901 Claremont Hill'),(60,8052,'UPI','27487 Hintze Circle'),(139,800,'COD','39731 New Castle Plaza'),(135,3323,'COD','59936 Westport Terrace'),(48,458,'UPI','8910 7th Point'),(44,1214,'UPI','9 Killdeer Park'),(115,3029,'CARD','03699 Clarendon Avenue'),(87,6625,'UPI','72 Pleasure Place'),(156,2131,'UPI','61172 Carey Drive'),(174,2333,'COD','5662 Hallows Park'),(62,2213,'COD','336 Lakewood Gardens Place'),(150,7623,'UPI','08729 Eagan Place'),(9,5385,'UPI','289 Twin Pines Point'),(130,6427,'UPI','506 2nd Lane'),(131,6638,'CARD','9922 Everett Trail'),(30,7904,'COD','27843 Mallard Point'),(33,8640,'COD','53225 Bayside Crossing'),(3,7201,'COD','6 Superior Court'),(189,3351,'UPI','282 Mallory Center'),(122,6287,'UPI','42919 Fair Oaks Way'),(67,8897,'CARD','949 Florence Court'),(194,8288,'UPI','723 Artisan Plaza'),(187,3243,'UPI','492 Lakewood Trail'),(73,7899,'CARD','97 Cody Plaza'),(89,8049,'CARD','4432 Mallard Pass'),(35,2207,'CARD','756 Dahle Circle'),(121,8674,'CARD','461 Westend Pass'),(34,8885,'CARD','520 Glendale Circle'),(20,1980,'UPI','377 Marquette Point'),(39,3198,'COD','5027 Hollow Ridge Parkway'),(29,6352,'UPI','151 3rd Avenue'),(164,6061,'COD','10 Pearson Court'),(70,4127,'COD','73725 Mendota Circle'),(84,3198,'COD','2939 Rigney Way'),(177,9004,'CARD','7 Loftsgordon Drive'),(41,3258,'UPI','427 Arrowood Trail'),(104,7905,'COD','5 Valley Edge Crossing'),(89,4608,'UPI','737 Stoughton Hill'),(153,9940,'CARD','22215 Debra Lane'),(130,3582,'UPI','0 6th Drive'),(90,2408,'COD','7421 Starling Junction'),(51,9168,'CARD','332 Goodland Court'),(122,3675,'CARD','0522 Maywood Hill'),(92,2246,'UPI','61 Eliot Way'),(104,2785,'UPI','335 American Avenue'),(114,4626,'UPI','408 Sunbrook Hill'),(141,1917,'UPI','7 Maple Street'),(53,2129,'COD','400 Graedel Center'),(118,5893,'CARD','4 Wayridge Street'),(164,4833,'COD','2624 Hansons Point'),(70,447,'UPI','05 Twin Pines Lane'),(10,2633,'CARD','6 Petterle Pass'),(20,1398,'CARD','53711 Spaight Parkway'),(100,3449,'COD','86 Brown Terrace'),(1,3146,'CARD','27524 South Alley'),(192,9142,'UPI','12 Granby Junction'),(44,1233,'CARD','2486 Lillian Alley'),(61,83,'COD','0 Barby Plaza'),(151,586,'CARD','0920 Carberry Court'),(5,5589,'UPI','5 Becker Trail'),(176,1441,'UPI','0272 Onsgard Avenue'),(78,3170,'COD','3605 Menomonie Point'),(114,9787,'CARD','6828 Eagle Crest Center'),(55,5681,'COD','07812 Fairview Pass'),(192,7160,'CARD','9818 Scofield Terrace'),(144,285,'UPI','0 Carioca Road'),(187,9021,'COD','03419 Chive Crossing'),(90,4453,'COD','0486 Roxbury Junction'),(3,1495,'UPI','29 Logan Center'),(87,5915,'CARD','6376 Gina Road'),(108,4412,'CARD','66 Mayfield Terrace'),(104,9431,'COD','04946 Golf View Junction'),(35,7416,'CARD','0538 Luster Lane'),(29,5542,'UPI','54894 Mockingbird Drive'),(66,4339,'UPI','31 Orin Crossing'),(192,6242,'UPI','97 Moulton Street'),(2,3370,'CARD','07367 Hauk Junction'),(82,5164,'UPI','971 Aberg Alley'),(137,4446,'UPI','846 Arapahoe Drive'),(61,8161,'CARD','5809 Burrows Junction'),(41,4922,'CARD','1928 Kingsford Point'),(185,6277,'COD','66562 Ludington Alley'),(11,1142,'UPI','02 Lakewood Crossing'),(36,7465,'COD','0 Melvin Parkway'),(6,1440,'UPI','546 Erie Plaza'),(128,6675,'UPI','9727 Summerview Place'),(171,751,'CARD','6 Express Way'),(195,8040,'COD','49 Glendale Park'),(42,5548,'UPI','81150 Derek Plaza'),(13,1362,'COD','581 Jenna Court'),(158,1358,'COD','42 Artisan Lane'),(125,6764,'UPI','524 Old Shore Center'),(194,8839,'CARD','944 Monument Alley'),(154,2832,'COD','97 Mallory Crossing'),(129,4219,'CARD','8 Porter Pass'),(53,1622,'UPI','077 Duke Crossing'),(198,4816,'COD','1292 Schlimgen Center'),(194,5623,'UPI','5 Grasskamp Place'),(178,567,'UPI','55 Drewry Pass'),(13,3203,'CARD','1 Derek Center'),(109,1312,'COD','25 Ridge Oak Lane'),(42,159,'CARD','3714 Cottonwood Way'),(186,5366,'COD','1967 Drewry Point'),(8316,7246,'','abs'),(123,8472,'','abs'),(7316,4783,'','edj'),(746,2734,'','absd'),(1111,1111,'','idk'),(8317,203,'','vasant kunj'),(8318,3255,'','iiit ddelhi'),(8319,4781,'','pata nahi'),(8320,915,'','gurgaon'),(8321,4679,'','kahi bhi'),(8322,3560,'','bruhh'),(8323,305,'COD','iiit delhi'),(8324,10555,'UPI','abcd'),(8325,2753,'','& C:/Users/ASUS/AppData/Local/Programs/Python/Python310/python.exe c:/Users/ASUS/Desktop/PYTHON/dbms/medmate_cli.py'),(8326,2753,'','mumbaiiii'),(8327,2753,'','mumbaii'),(8328,2753,'',''),(8329,2753,'','& C:/Users/ASUS/AppData/Local/Programs/Python/Python310/python.exe c:/Users/ASUS/Desktop/PYTHON/dbms/medmate_cli.py'),(8330,2753,'CARD','idk'),(8331,2753,'COD','yes'),(8332,2753,'COD','india');
/*!40000 ALTER TABLE `billingdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cartCustomerID` int NOT NULL,
  `totalCost` int DEFAULT NULL,
  PRIMARY KEY (`cartCustomerID`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cartCustomerID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE,
  CONSTRAINT `cartCostPos` CHECK ((`totalCost` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,118027),(2,7272),(3,8662),(4,2011),(5,4700),(6,3989),(7,7770),(8,8995),(9,6184),(10,876),(11,6604),(12,1175),(13,5640),(14,8613),(15,6930),(16,2334),(17,8099),(18,3213),(19,2573),(20,9027),(21,6140),(22,7175),(23,9928),(24,9075),(25,2299),(26,1079),(27,7665),(28,5575),(29,9545),(30,9977),(31,1079),(32,5597),(33,1317),(34,6978),(35,5021),(36,3841),(37,1601),(38,1901),(39,2514),(40,3210),(41,2624),(42,5401),(43,3829),(44,2496),(45,7129),(46,6123),(47,7480),(48,4625),(49,8672),(50,7124),(51,594),(52,8032),(53,9378),(54,6453),(55,9438),(56,3725),(57,4972),(58,5086),(59,5181),(60,1315),(61,1187),(62,2460),(63,1378),(64,9298),(65,2173),(66,1135),(67,5924),(68,5984),(69,4388),(70,4811),(71,1397),(72,107),(73,5462),(74,153),(75,8877),(76,113),(77,3927),(78,4370),(79,3726),(80,9967),(81,3768),(82,1095),(83,6707),(84,1673),(85,2866),(86,2814),(87,9),(88,4778),(89,8918),(90,1200),(91,921),(92,7738),(93,1993),(94,8910),(95,9852),(96,4680),(97,2244),(98,71),(99,8625),(100,3444),(209,0),(211,305),(212,70),(213,10555),(214,0),(215,0),(216,0);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `companyID` int NOT NULL AUTO_INCREMENT,
  `companyName` varchar(255) NOT NULL,
  `monthlySales` int NOT NULL,
  PRIMARY KEY (`companyID`),
  UNIQUE KEY `companyName` (`companyName`),
  CONSTRAINT `salesCheck` CHECK ((`monthlySales` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'MedMate',1000000);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contains`
--

DROP TABLE IF EXISTS `contains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contains` (
  `medID` int NOT NULL,
  `custID` int NOT NULL,
  PRIMARY KEY (`medID`,`custID`),
  KEY `custID` (`custID`),
  CONSTRAINT `contains_ibfk_1` FOREIGN KEY (`medID`) REFERENCES `medicine` (`drugID`) ON DELETE CASCADE,
  CONSTRAINT `contains_ibfk_2` FOREIGN KEY (`custID`) REFERENCES `customer` (`customerID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contains`
--

LOCK TABLES `contains` WRITE;
/*!40000 ALTER TABLE `contains` DISABLE KEYS */;
INSERT INTO `contains` VALUES (65,3),(176,3),(197,3),(27,4),(86,4),(115,4),(82,5),(11,7),(145,7),(161,7),(12,8),(60,8),(1,9),(142,9),(115,10),(142,10),(150,10),(13,11),(14,11),(196,11),(10,13),(181,14),(121,15),(126,15),(30,16),(175,17),(57,18),(86,18),(189,19),(90,20),(172,20),(124,21),(72,22),(14,23),(196,24),(95,25),(118,25),(134,25),(44,27),(80,27),(55,29),(172,30),(106,31),(141,32),(195,32),(182,33),(146,34),(186,34),(41,36),(164,36),(82,37),(47,39),(172,39),(21,41),(133,42),(74,43),(18,44),(39,44),(134,44),(157,46),(167,48),(59,49),(172,50),(145,51),(137,52),(197,52),(10,55),(1,56),(102,56),(135,56),(110,57),(44,59),(45,59),(66,59),(153,59),(74,60),(110,60),(8,61),(21,61),(188,61),(196,61),(172,62),(12,63),(137,65),(141,66),(77,67),(86,67),(3,69),(79,69),(117,69),(118,69),(59,70),(191,70),(34,71),(91,71),(96,71),(171,71),(176,71),(162,72),(124,73),(36,74),(68,74),(189,76),(45,77),(123,77),(36,78),(9,80),(39,80),(47,80),(78,80),(49,81),(135,81),(181,81),(28,83),(68,83),(173,83),(50,84),(82,84),(120,84),(154,85),(28,86),(82,86),(118,86),(172,87),(9,91),(53,91),(110,91),(21,92),(27,92),(61,92),(19,93),(105,93),(154,94),(102,95),(119,96),(170,96),(184,96),(60,97),(163,97),(175,98),(126,99),(167,100);
/*!40000 ALTER TABLE `contains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `custName` varchar(255) NOT NULL,
  `custPassword` varchar(255) NOT NULL,
  `custAddress` varchar(255) NOT NULL,
  `custPhoneNumber` bigint NOT NULL,
  `custAge` int DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `custPhoneNumber` (`custPhoneNumber`),
  CONSTRAINT `ageCheck` CHECK ((`custAge` >= 13)),
  CONSTRAINT `phoneNumberCheck` CHECK (((`custPhoneNumber` >= 1000000000) and (`custPhoneNumber` <= 9999999999)))
) ENGINE=InnoDB AUTO_INCREMENT=217 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Derrek Karchowski','VesSxJrdIOar','70 Johnson Street',5375663307,93),(2,'Risa Glassard','ZqlgdxGlx','0973 Caliangt Center',5595097734,37),(3,'Howie Kidwell','6q4l6l2mEE','7 Straubel Alley',9746703311,70),(4,'Dion Abys','HasIsA','43976 Summit Plaza',1695788109,92),(5,'Bard Leggate','u4eYrHSY','5 Eagle Crest Lane',1313518840,84),(6,'Ethelred Ladbury','ir2HlJfG2','52921 Hayes Parkway',6236657983,36),(7,'Jillene Jeays','EGEzNlL','2 Almo Court',6461515238,66),(8,'Pierette Cogswell','pNJT5Q','9 Sherman Hill',5022464355,28),(9,'Marla Woodage','5EyswkzcNt','3 Warner Court',1917711339,85),(10,'Kenn Grimmer','0f2AuDbWF','85 Kim Circle',2474411855,53),(11,'Ira Silverthorne','eWifkpAe','32 Sutteridge Place',2106366080,52),(12,'Anthony Sanders','glyIAsvAbKG','8 Prairie Rose Plaza',4293149717,78),(13,'Camala Stanion','11s1L9b5i','39782 Birchwood Center',1913273213,21),(14,'Joellyn McGibbon','8BGzRhc5tfrZ','6352 Forest Drive',1096381179,88),(15,'Travers Rozec','7qbfkzyiXa0','0 Melby Park',7047845081,74),(16,'Dalli Gerbl','1Vf0qow','03 Dorton Alley',1005031446,41),(17,'Evered Marsie','AqRwxGdgn','47848 Menomonie Avenue',1323672344,31),(18,'Sherie Surgison','XXocR0gBrO','194 Pond Lane',5103015218,100),(19,'Melita Rylstone','w3sclNjyTQ0e','04 Eliot Park',3261324494,64),(20,'Ariel Halkyard','peMf1dJIMX','491 Luster Pass',2373401374,93),(21,'Dane Moores','vxWpaxtxhcmq','9 Dexter Pass',4625581878,92),(22,'Vicki Allwright','DLjYDo4wQq','326 Mcbride Avenue',3684049366,47),(23,'Stephen Botterell','rApqYnZsrZRt','5 Sundown Hill',9629100471,99),(24,'Callida Mark','IHBs79H','047 Ronald Regan Center',8236342235,53),(25,'Betteanne Paschke','assvf2O1rt','454 Hauk Center',4608850247,25),(26,'Marthena Dunsleve','4e4Y5YU1sBZ','8081 Browning Lane',8282107750,82),(27,'Roseanna Ruben','gHByu6m','7164 Dapin Trail',6507896540,20),(28,'Pate Bark','9bnDsXGTGMS','29667 Farragut Drive',8166332448,70),(29,'Ethel Hafford','VXtzUKm4','027 Tennessee Point',6544557229,98),(30,'Katherina Kenafaque','NjsrWIi','84 Knutson Street',1723675485,56),(31,'Marlene Harman','E2qd3qowwIg','94 Manley Point',9535075874,51),(32,'Humfried Probat','8Ho3XAE','4264 Bultman Alley',3526802400,29),(33,'Arlen Morton','Hs0BWF7','73263 Lerdahl Road',9821862877,91),(34,'Gwenneth Moyne','YWPGHf3WB','68 John Wall Court',8087663132,38),(35,'Rhody Ferney','ccFvrH0ppzLZ','8097 Rockefeller Hill',5721961172,28),(36,'Margaux Quantrill','gLC4zZX6IkO','4142 Nelson Court',1247470776,31),(37,'Babette Buddle','8MfVStz41Y','939 Dwight Alley',2255166185,54),(38,'Meggi Sillars','zD056f','266 Bartelt Plaza',2253063012,30),(39,'Mommy Benazet','23legalSROZ','5216 7th Hill',8847890012,77),(40,'Zoe Dallicoat','VqGN0oyc','03 Starling Place',7052973191,42),(41,'Sydney Greger','c1src19I','2872 Fremont Park',9283561262,44),(42,'Di Stamper','6nC5uZe6t','40 Garrison Hill',2565528049,52),(43,'Lew MacCaghan','xMvlSf4t','6 Acker Park',7743420516,73),(44,'Marje Phizakarley','qNtTfnUH4','95 Judy Circle',7888828531,79),(45,'Cherice Enefer','h2JTe8LL6d','5 Forest Run Parkway',8227529813,72),(46,'Ansley Siggin','mi01Tq','36819 Goodland Drive',2865145130,25),(47,'Shirline Gonsalvez','IzELwi36rCPM','73 Blue Bill Park Crossing',6408295981,51),(48,'Brigham Safhill','lvvXUFnEXP1','6334 Park Meadow Crossing',6914948245,60),(49,'Iolande Ackenson','aIhO8I3','592 Burning Wood Point',1836082680,16),(50,'Fletch Wicklin','drTP0Mn4PEx9','048 Lien Court',1527298461,28),(51,'Claudius Badsey','UKN39P3xfYuK','33123 Forest Court',9871003652,78),(52,'Cyrus Saltwell','xf6J8Oh60','730 Hazelcrest Plaza',3223696760,16),(53,'Delmore Mabbitt','wgJ2iJc','044 Melody Road',5826793746,54),(54,'Rufe Lansdale','xXlsraIGq25M','55975 Anzinger Circle',2595850194,28),(55,'Dorelia Brassill','DU7e7wCzFdb','114 Novick Plaza',6044838685,44),(56,'Lezley Brookzie','iffw6T1','8581 Hollow Ridge Trail',3963258400,64),(57,'Mallorie Glisenan','X4NvryP','3 Center Park',4671366157,60),(58,'Gothart Borzone','QvKaE5wpG','399 Scofield Plaza',6465801771,98),(59,'Celestina Rollinson','kNwd6p','56392 South Lane',1612122118,41),(60,'Marybelle Jacson','bPuSWISXkqAq','43 Manley Court',4284614465,92),(61,'Merrel Margery','y2GUOmFW','1 Kings Trail',9169672039,43),(62,'Bernard Burk','s1ikh1eQ6uh','941 Arapahoe Circle',4492660734,31),(63,'Jarrad Davidow','ZLhSvr','5748 Alpine Plaza',3526475528,85),(64,'Yuma Skamell','20u3uwLp','09 Washington Center',8969383512,47),(65,'Ilario Frensch','t2F7fCWTS3p','05 Southridge Alley',1145285946,69),(66,'Yardley Worboy','KmbRzAqzc','97 Caliangt Hill',3005831020,37),(67,'Rowe Lait','nibHtK','0409 Glendale Circle',5478847520,91),(68,'Lynsey McInally','C3pG6j5OR','19379 Moulton Trail',5943830044,54),(69,'Clyve Donson','tM4lk0BS7X','91 Oak Place',3195158032,25),(70,'Amabel Axcell','FYUqGS69o','06 Shopko Crossing',8874219458,73),(71,'Bess Bonwell','PmHwl4YVD','69 Schlimgen Junction',6241102896,23),(72,'Vikky Devonside','gZRans0NR5L','1278 Bonner Road',4021612789,31),(73,'Marcello Matzl','tnMig0XmqVW9','23 Killdeer Lane',1252543973,41),(74,'Brooke Brandts','mo4TAjqa7U6M','93 Browning Parkway',5378581391,50),(75,'Karlyn Noonan','4violPwCak','77 Hanson Crossing',7891954418,75),(76,'Mahmud O\'Spillane','1g00pi','8 John Wall Alley',4416278301,20),(77,'Tynan Dominicacci','3B0sxh8Uclue','070 Dayton Hill',5766645909,59),(78,'Gregoire Jovis','TmFmRQsKvT','9418 Prentice Court',8379517120,43),(79,'Biddy Sidney','cp5DSmhNcmE','9 Monterey Drive',7505378762,99),(80,'Liv Speariett','aw3x4eu','85082 Emmet Drive',8825780279,80),(81,'Toinette Jordine','5Ld01J7tofGm','16395 Kropf Point',2938221154,17),(82,'Merlina Sleford','n5TBEt','1093 Dahle Plaza',3014444632,63),(83,'Florencia Cowperthwaite','mX6cNutSrI','48156 Morning Lane',9861948325,86),(84,'Shelby Dreigher','CquIgt','4 Briar Crest Crossing',7174581871,55),(85,'Bordy Atkinson','46k963XTpO','83 Mesta Court',9754082829,66),(86,'Alvan Yurchishin','GvyVsOLQo','5 Spenser Alley',2896048004,16),(87,'Felicdad Coupar','nfbZ2a','1 Eastwood Circle',3033884147,30),(88,'Laurice Glaze','yfsufZHJSSq','7534 Nobel Point',7712784050,62),(89,'Gay Lennox','6h11VpHW','69802 Fairview Junction',7113134417,17),(90,'Barr Karby','YN3ghn0','8 Sachs Drive',8368618621,80),(91,'Shannah Elcox','f3Cwh9Hf','54259 Moulton Court',6884882464,14),(92,'Patsy Lewnden','RyAN1HPYXcS','80 Loomis Lane',5528508732,83),(93,'Payton Walby','SnNQCy4I8','1414 Mockingbird Terrace',1566287613,87),(94,'Rickie Ruffle','4L7jEh','88 Vernon Avenue',3229843076,61),(95,'Baily Rollins','8hUFzuXstc','72 Sachs Alley',5496036462,78),(96,'Leshia Barnewelle','zlRx0BKXoS4S','43220 Transport Parkway',5714627728,76),(97,'Neil Vannacci','YOKCUwtVSS','51 Elka Lane',7256012318,30),(98,'Cori Battany','wBArCeZIIemk','400 Maryland Drive',6488695409,87),(99,'Hyman Peal','HNodJXIQXTrE','69787 Calypso Court',8853022294,59),(100,'Haydon McClinton','yn51s1MAsL6p','299 Northfield Court',3085219944,97),(209,'prajna','hello','ggn',8920120715,20),(211,'mahima','taylor_swift','south delhi',1223344545,23),(212,'arnav','hi','idk bruh',7878787878,28),(213,'prashasti','hi','idk',3445566778,20),(214,'kritika','huhu','dwarka',5667788990,19),(215,'chehak','hehe','noida',1111111111,20),(216,'abcd','hi','idk',3434343434,60);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `customer_AFTER_INSERT` AFTER INSERT ON `customer` FOR EACH ROW BEGIN
	INSERT INTO cart (cartCustomerID, totalCost) VALUES (NEW.customerID,0);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `deliverypartner`
--

DROP TABLE IF EXISTS `deliverypartner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverypartner` (
  `deliveryPartnerID` int NOT NULL AUTO_INCREMENT,
  `deliveryPartnerName` varchar(255) NOT NULL,
  PRIMARY KEY (`deliveryPartnerID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverypartner`
--

LOCK TABLES `deliverypartner` WRITE;
/*!40000 ALTER TABLE `deliverypartner` DISABLE KEYS */;
INSERT INTO `deliverypartner` VALUES (1,'Petunia Karlmann'),(2,'Gerda Thewys'),(3,'Earle Hodgin'),(4,'Porter Mc Mechan'),(5,'Chrisse Mogey'),(6,'Iolande Seyers'),(7,'Karola Rannells'),(8,'Bibbye Whitebrook'),(9,'Owen Nibley'),(10,'Alexandr Danielli'),(11,'Moira Quinell'),(12,'Ranee Forrester'),(13,'Gleda Mantrup'),(14,'Glenda Blakeley'),(15,'Erhart Harget'),(16,'Dewain Buncom'),(17,'Ruperta Snaden'),(18,'Wandie Font'),(19,'Guntar Khomich'),(20,'Jeno Topper'),(21,'Beauregard Alvis'),(22,'Chere Feld'),(23,'Jennee Maultby'),(24,'Brady Cline'),(25,'Davis Iacobetto'),(26,'Wald Dinse'),(27,'Wolfie McGauhy'),(28,'Inglis Mustill'),(29,'Lucy Cockrill'),(30,'Darsie Lodo'),(31,'Kingsley Stovin'),(32,'Lucinda Gieves'),(33,'Damita Carnalan'),(34,'Ozzie Jenik'),(35,'Caril Kitlee'),(36,'Leontine Liquorish'),(37,'Celle Kobel'),(38,'Fran Leopard'),(39,'Carlie Daughton'),(40,'Charlene D\'Alesco'),(41,'Octavius Herculeson'),(42,'Thaddeus Eldon'),(43,'Bamby Fairfoul'),(44,'Wiley Kroch'),(45,'Minerva Cuttings'),(46,'Tammie Ochterlony'),(47,'Tito Ruckman'),(48,'Barrie Ickovicz'),(49,'Shelbi Charville'),(50,'Maryjo Jahnel'),(51,'Amalle Poizer'),(52,'Nero Borghese'),(53,'Chrissie Benois'),(54,'Samaria Visco'),(55,'Miran Brithman'),(56,'Trenna McLemon'),(57,'Michelina Stillgoe'),(58,'Eugine Shaylor'),(59,'Cesya Thurman'),(60,'Charissa Mattheeuw'),(61,'Prisca Mowling'),(62,'Barnebas Aggis'),(63,'Lodovico Garthland'),(64,'Joyce Lomond'),(65,'Cecilia Janman'),(66,'Free Ganing'),(67,'Cedric Cordeau]'),(68,'Annalee Abbots'),(69,'Enos Hise'),(70,'Jana Spowart'),(71,'Dorolisa Laudham'),(72,'Reine Westoll'),(73,'Boone Casillas'),(74,'Luther Keeton'),(75,'Aurlie Sebrook'),(76,'Mae Rudiger'),(77,'Noah Petera'),(78,'Adria Ganniclifft'),(79,'Karleen Amos'),(80,'Dalston Bolger'),(81,'Nicholas Lindwall'),(82,'Stephanus Castenda'),(83,'Ari Ogglebie'),(84,'Reynolds Vipan'),(85,'Belinda Gannon'),(86,'Ellerey Coulton'),(87,'Marysa Adamovicz'),(88,'Torey Heape'),(89,'Jeri Wyke'),(90,'Bee Habert'),(91,'Celia Todaro'),(92,'Tierney Bauduccio'),(93,'Blinnie Brawson'),(94,'Madeline Melsome'),(95,'Marrilee Morrott'),(96,'Whitby Trood'),(97,'Orella Eye'),(98,'Sacha Fender'),(99,'Hatti Benesevich'),(100,'Perla Barnwell');
/*!40000 ALTER TABLE `deliverypartner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount`
--

DROP TABLE IF EXISTS `discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount` (
  `discountID` int NOT NULL AUTO_INCREMENT,
  `discountPercentage` int NOT NULL,
  PRIMARY KEY (`discountID`),
  CONSTRAINT `discountPercentageCheck` CHECK (((`discountPercentage` > 0) and (`discountPercentage` < 100)))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount`
--

LOCK TABLES `discount` WRITE;
/*!40000 ALTER TABLE `discount` DISABLE KEYS */;
INSERT INTO `discount` VALUES (1,69),(2,76),(3,5),(4,53),(5,34),(6,41),(7,52),(8,45),(9,46),(10,1),(11,44),(12,67),(13,75),(14,68),(15,10),(16,67),(17,41),(18,25),(19,21),(20,81),(21,85),(22,54),(23,17),(24,60),(25,96),(26,50),(27,29),(28,23),(29,54),(30,78),(31,48),(32,63),(33,50),(34,47),(35,96),(36,1),(37,51),(38,26),(39,87),(40,68),(41,21),(42,43),(43,70),(44,39),(45,5),(46,90),(47,18),(48,20),(49,39),(50,79),(51,98),(52,34),(53,56),(54,91),(55,57),(56,41),(57,76),(58,54),(59,29),(60,3),(61,11),(62,39),(63,7),(64,26),(65,38),(66,97),(67,58),(68,85),(69,65),(70,34),(71,9),(72,29),(73,19),(74,17),(75,16),(76,28),(77,45),(78,2),(79,1),(80,89),(81,42),(82,93),(83,57),(84,61),(85,44),(86,54),(87,14),(88,61),(89,39),(90,60),(91,91),(92,18),(93,44),(94,11),(95,48),(96,75),(97,42),(98,47),(99,76),(100,3);
/*!40000 ALTER TABLE `discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drugmanufacturer`
--

DROP TABLE IF EXISTS `drugmanufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugmanufacturer` (
  `manuCompanyID` int NOT NULL AUTO_INCREMENT,
  `manuCompanyName` varchar(255) NOT NULL,
  `manuLicenseNumber` bigint NOT NULL,
  PRIMARY KEY (`manuCompanyID`),
  CONSTRAINT `licenseCheck` CHECK ((`manuLicenseNumber` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugmanufacturer`
--

LOCK TABLES `drugmanufacturer` WRITE;
/*!40000 ALTER TABLE `drugmanufacturer` DISABLE KEYS */;
INSERT INTO `drugmanufacturer` VALUES (1,'Hydralazine Hydrochloride',9710687840),(2,'Oxycodone Hydrochloride',1578111730),(3,'Perphenazine and Amitriptyline Hydrochloride',1352231042),(4,'Spinach',6333910376),(5,'Daypro',7674856984),(6,'Quetiapine fumarate',4736893206),(7,'miconazole 1',4611750671),(8,'Dexamethasone Sodium Phosphate',4504552175),(9,'Ibuprofen',3977418785),(10,'Epivir',6505296107),(11,'SULWHASOO EVENFAIR COMPACT NO.26',268567328),(12,'Amoxicillin',9282959554),(13,'XtraCare with cooling action Oatmeal Skin Relief Calmin',4341012754),(14,'Solar Protection Formula SPF 65',7009908583),(15,'Nettle Pollen',8006900469),(16,'Quik Gel',9444867005),(17,'Cystotone',3532167425),(18,'Ativan',5511579645),(19,'XANTHIUM STRUMARIUM VAR CANADENSE POLLEN',8179490270),(20,'MediChoice PVP Swabsticks',3750360715),(21,'Viro Plus',479591091),(22,'Sinuforce',418576815),(23,'Oxygen',8240344968),(24,'Fungicure',5136761520),(25,'Amiodarone Hydrochloride',2466792184),(26,'Nabumetone',8242345899),(27,'Tacrolimus',4037637944),(28,'Terazosin Hydrochloride',7375043744),(29,'Libera Tos',9480662191),(30,'Nifedipine',2968706357),(31,'Simvastatin',6087245014),(32,'One Seed Juniper',9154277868),(33,'Treatment Set TS348403',4551081434),(34,'DawMist Antiperspirant Deodorant',8858699890),(35,'Perfecting Liquid Foundation Toffee Bronze',1236479254),(36,'Valsartan and Hydrochlorothiazide',1028829302),(37,'Ultracare For Hands',7534527570),(38,'Warfarin Sodium',4278942443),(39,'Glyburide',1593865074),(40,'LipiGesic M',1522514694),(41,'Superdent',3524626491),(42,'BZK Plus Prep Pad',2071402057),(43,'Nisoldipine',9653625462),(44,'Aspergillus terreus',486830683),(45,'Olanzapine',3377322442),(46,'Aspirin',7555606852),(47,'CLE DE PEAU BEAUTE CR COMPACT FOUNDATION',6640016265),(48,'ENALAPRIL MALEATE',7729795116),(49,'Trazodone Hydrochloride',5712905051),(50,'Cialis',2791674381),(51,'Oxygen',3945267803),(52,'Amlodipine Besylate',8106280594),(53,'Watermelon',3285029242),(54,'Category IV',3526461678),(55,'temazepam',470430621),(56,'Cerebral Composition',1941664296),(57,'Nitrogen',6829464234),(58,'Warfarin Sodium',8198480005),(59,'THERAPEUTIC',3315372330),(60,'Tobramycin and Dexamethasone',1519411464),(61,'Oxygen',3216031160),(62,'MORPHINE SULFATE',7725161015),(63,'Nicotine Polacrilex',950244538),(64,'Glipizide',8432055522),(65,'Earths Best Cold Relief Vapor',6286083502),(66,'Demerol',8226530504),(67,'Clear Advantage',3018576489),(68,'Anti-Diarrheal',507537564),(69,'XtraCare instant Hand Sanitizer',5537602520),(70,'Sprayology Body Balance',4240628431),(71,'Felodipine',891392416),(72,'Mirena',9878825884),(73,'Scrub Pine',5615631767),(74,'Warfarin Sodium',1463074190),(75,'Alka-Seltzer Plus Day Cold and Flu',7831917241),(76,'Lumene Bright Now Vitamin C BB SPF 20 Sunscreen Broad Spectrum 02 Medium',3532630818),(77,'STOPAIN COLD PAIN RELIEVING',9888221477),(78,'Stool Softener',7925299207),(79,'Alprazolam',3391779640),(80,'Russian Olive',8217985170),(81,'Imipramine Pamoate',355571382),(82,'Colgate',1299207545),(83,'Potassium Chloride in Lactated Ringers and Dextrose',27208427),(84,'Lisinopril',5729893876),(85,'IXEMPRA',5815596205),(86,'Gabapentin',658187619),(87,'ANTIPYRINE AND BENZOCAINE',8363150959),(88,'EpiSoft',1490556176),(89,'Mirtazapine',4224142139),(90,'IPKN HYDRO AND PORE BB 02 MEDIUM',9992745703),(91,'Equitance Sunscreen Broad Spectrum SPF 36',2597909743),(92,'Bupropion Hydrochloride',1941721583),(93,'Lidocaine Hydrochloride',4678864725),(94,'Telmisartan and Hydrochlorothiazide',8373527036),(95,'Cetirizine Hydrochloride',7559040764),(96,'Berberis Populus',1843879328),(97,'Metronidazole',3998578749),(98,'Antiseptic',2329046553),(99,'Cefdinir',3663580075),(100,'RENOKIN LASH LASH',3677468485);
/*!40000 ALTER TABLE `drugmanufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `employeeUsername` varchar(255) NOT NULL,
  `employeePassword` varchar(255) NOT NULL,
  `employeePhoneNumber` bigint NOT NULL,
  `employeeSalary` int NOT NULL,
  `employeeAddress` varchar(255) NOT NULL,
  `managerID` int NOT NULL,
  PRIMARY KEY (`employeeID`),
  UNIQUE KEY `employeePhoneNumber` (`employeePhoneNumber`),
  CONSTRAINT `numberCheck` CHECK (((`employeePhoneNumber` >= 1000000000) and (`employeePhoneNumber` <= 9999999999))),
  CONSTRAINT `salaryCheck` CHECK ((`employeeSalary` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nadya Escofier','A5FDWrPp',1608172823,3740688,'73 Miller Park',1),(2,'Kaitlin Etuck','K5RM7N',7452970727,264511,'3875 Ramsey Hill',0),(3,'Virgie Shuttell','phjC4qv',3365365898,422163,'2 International Circle',0),(4,'Kaleb Altham','AmFDKipEG',4468733577,2954231,'2863 Manitowish Circle',1),(5,'Channa Kiley','FRcEc0e',9894799672,376215,'85 Marquette Place',0),(6,'Gustave Chapling','KoWSj3hG8d',6154284053,497696,'70748 Center Place',0),(7,'Malanie Iglesiaz','jvGUz1wunLdr',7163618648,3119702,'2922 Dixon Avenue',1),(8,'Curtice Fardoe','rmSmRNi2rWyy',5454693440,341237,'9 Gale Park',0),(9,'Thaddeus Chieze','1SgLa3XKxrB',6096099837,271276,'86325 Oriole Point',0),(10,'Marissa Grundon','8wif3SW9v0Z9',9827871039,3866628,'65 Eagle Crest Court',1),(11,'Xylina MacShane','aGSGFNd7NXQ',4216026889,5165141,'6346 Blaine Junction',1),(12,'Alikee Bartosek','wISnrdORvp',8416049460,370941,'4838 Beilfuss Point',0),(13,'Sela McEvay','F5vKWIE',9358249104,103095,'51248 Northport Plaza',0),(14,'Cyb Petyakov','WAKo8cQ',7141503555,441191,'816 Jay Drive',0),(15,'Hermione Marchetti','bmUz48FY7',8673400728,100831,'53974 Bashford Crossing',0),(16,'Leanora Reddihough','aYE49pJmg9Kv',9782560484,440554,'0 Golden Leaf Park',0),(17,'Hilde Somerled','MErhkwc',8004531800,142262,'459 Anniversary Avenue',0),(18,'Muriel Mulvey','Zdflh3ihy0QH',8429620768,422292,'5 Bellgrove Road',0),(19,'Danette Klimkiewich','xg4q5v',9308633816,4785876,'58406 Autumn Leaf Center',1),(20,'Bartlett Kyffin','2pHYAXpy70',7127158062,1219236,'0898 Morrow Trail',1),(21,'Minette Richards','OH56xCybZL',8412758649,306126,'00 Menomonie Crossing',0),(22,'Herb Serridge','uiSR3hM',3976659375,2358877,'4 Waxwing Junction',1),(23,'Cathrine Flageul','FNIQt0',4993474362,297620,'96 Fisk Trail',0),(24,'Arlena Axten','iefnA0v',7356692776,3028127,'21 Pearson Circle',1),(25,'Zulema Lugden','PWJ0R9mC',9212131631,4286414,'797 Eastwood Drive',1),(26,'Sidonnie McPake','gtYCic01f',6463042653,1422160,'1 Ilene Road',1),(27,'Egan Brombell','Piemedwe',6879066776,3151621,'72657 Victoria Road',1),(28,'Boycey Gude','m8TGAzun',7742818327,3032892,'50 Summerview Center',1),(29,'Chery Hesser','3hl6ledE',6571255032,4270254,'53382 Shelley Hill',1),(30,'Thom Borsay','sHhc7IR2gy',6243126754,4330499,'47286 Birchwood Way',1),(31,'Evania Corinton','Iv4iSpKU1',6606875833,4156327,'4 Sunbrook Road',1),(32,'Crista Maymand','PaYcoi',7421215083,184829,'88300 Kennedy Center',0),(33,'Pavlov Standering','yatEwr',3339670994,2194603,'08 Myrtle Alley',1),(34,'Kelvin Spradbrow','iueHLsvWPkT',9931582998,2283949,'3 Meadow Ridge Drive',1),(35,'Kippy Egalton','mu4hb8Xq37L',6382739884,344630,'0538 Packers Drive',0),(36,'Kelcey Colvine','xxQarhjjspRA',9152385785,173624,'54042 Cody Point',0),(37,'Pace Bowness','b4deUnUe35',5175245570,345200,'9 Huxley Avenue',0),(38,'Bancroft Scamadine','wC4QP7qx',4304494652,3202034,'416 Troy Avenue',1),(39,'Farand Arnaudi','RnMgVinue',9878760768,434920,'75287 Texas Point',0),(40,'Peterus Cockram','2MZ6qm7P',4032315720,155133,'5 Alpine Plaza',0),(41,'Delmer Fulstow','EflxPl',5944787375,4143880,'19076 Carpenter Place',1),(42,'Zahara Ciraldo','dlebgIrarq',3156582003,143196,'1682 Morningstar Court',0),(43,'Dewain Meegin','SrWowars',3413932146,3681805,'415 Arizona Way',1),(44,'Paddy Merdew','bCJdWc',3085818734,413753,'15981 Corry Center',0),(45,'Jase De Andisie','fgpNjD95WZD',4954292163,148774,'70601 Dottie Point',0),(46,'Sophi Thridgould','6fEl7qols',1471874760,258339,'7995 High Crossing Center',0),(47,'Roderich Withams','TL4AlDB3iIc',1086817087,4730982,'5 Hoffman Court',1),(48,'Malia MacAirt','SYlGwB',4691459256,219756,'751 Buena Vista Circle',0),(49,'Marti Hansbury','Ig9d3ap64',6262783400,314275,'49638 Anniversary Plaza',0),(50,'Eileen King','23PYUAd',8201046777,210098,'5535 Arkansas Road',0),(51,'Frederique Meadows','cs6Iiinz',4197991377,4197356,'64595 Kim Alley',1),(52,'Anthony Hitscher','Zx6AqMu6yK5',7737227483,5037466,'45658 Golf Course Hill',1),(53,'George Naptine','AzkEPb303',8663310315,191227,'639 Swallow Way',0),(54,'Jordain Sharnock','FTYaVZZ',2062174408,3682111,'7618 Ruskin Center',1),(55,'Marwin Luckcuck','pr0Bgre7',9368668844,448059,'3107 Hazelcrest Street',0),(56,'Yank Hintzer','YBVseNm',1881079638,127573,'9 Park Meadow Avenue',0),(57,'Alonzo Beasleigh','FlQyNkwxHeB',2266042479,174716,'37296 Kingsford Plaza',0),(58,'Marley Boxall','jb0UTRmm',5701164268,3471118,'2 Blaine Terrace',1),(59,'Manya Morgan','27pR7L7Vgnyv',7426485074,127108,'1591 Stang Hill',0),(60,'Etienne Benza','JXCswkO',3787742671,176689,'608 Loomis Way',0),(61,'Annadiane Lidington','QIYHtFK97',9517094225,202896,'136 Ridgeview Trail',0),(62,'Romy Tal','AnEzGrHIQr',6133094930,4698779,'1708 Debs Avenue',1),(63,'Renado Tollerfield','Rmy20w',7313164790,2229511,'2694 Crescent Oaks Center',1),(64,'Lockwood Canet','iQLyqCPT',9814938415,313192,'88 Dryden Alley',0),(65,'Jo Provis','ItkZuo',2501202984,2640608,'19950 Thackeray Hill',1),(66,'Reeba Scrivens','erDVzP5OclL',3107922371,3328205,'94 Kedzie Junction',1),(67,'Sidonia Casin','L3CU2ht',7087177401,4533892,'3455 North Lane',1),(68,'Mariette Engledow','U9UCJtewc',6356596212,3032969,'9662 Maryland Alley',1),(69,'Itch Geroldo','cJR4WWLW4ebp',8303732392,183774,'625 Fisk Center',0),(70,'Clem Filipson','7336uc',8465151522,3277032,'2965 Macpherson Street',1),(71,'Everett Hawyes','0lyb2YqDDl',6509279939,1569869,'21708 Northfield Parkway',1),(72,'Jaynell Marginson','d4VD8E',4741466062,4587817,'312 Northview Park',1),(73,'Tiffany Durtnell','fQPUpIYnRp8',1928138780,154689,'71759 Monument Trail',0),(74,'Dee dee Currin','23w0TzLk7Th',4922652130,5279903,'5 Forest Pass',1),(75,'Rockey Holme','PTxbv0Xd',9566556572,1741978,'2 Golf View Trail',1),(76,'Shelagh Work','Ydwb7Ro',3222177972,356786,'6 Superior Terrace',0),(77,'Raven Fusco','O3r6Ssd',2158221495,473541,'795 Badeau Park',0),(78,'Ursula Challen','AL6PU6c3Na',6169304461,5316226,'48603 Warrior Center',1),(79,'Anabelle Townrow','qQ1awqBHD',5705104481,275010,'52 Russell Place',0),(80,'Alissa Braidwood','K0Rwg4',1523528701,218608,'159 Sloan Center',0),(81,'Hinda Warrener','3PTLfB1ZVc',5984837718,417462,'32 Melody Parkway',0),(82,'Delinda Affron','z4iLDMU',7286294939,3296269,'9 Bonner Pass',1),(83,'Ezequiel Libero','bgZmFfXZ',8515035182,4594546,'55 Becker Avenue',1),(84,'Charmane Eastup','Ij1V6Cet9syH',2566571313,4227155,'773 Eagan Place',1),(85,'Kristyn Haldene','CvHyzi1Iqz',6393717643,4698196,'70159 Straubel Center',1),(86,'Brit Floyed','9482zka',7594551906,470763,'9 Crowley Place',0),(87,'Cherice Mahedy','gig9vNoum',2716977407,4937189,'231 Gerald Way',1),(88,'Ike Heel','DfpV6ba4',7389632096,175655,'3 Graedel Road',0),(89,'Halsey Bamfield','Fc9GpI',5037628990,3753814,'1241 Lakewood Drive',1),(90,'Hiram Brewerton','GcipjR',6271767283,130316,'4245 Scoville Pass',0),(91,'Grayce Crasswell','8Z5Rv3TV9',4479962067,148825,'088 Eastlawn Point',0),(92,'Obadias Pie','8KblPDYe',4919861980,3147724,'50082 Dorton Point',1),(93,'Stanly Lukianov','6zo2Ceki15Y',9347250061,299992,'524 Huxley Way',0),(94,'Robinet Skerritt','3NHrMv2f',4108664208,165163,'98 Nevada Plaza',0),(95,'Melessa Malinowski','mokoWTXy8',5393335343,379025,'50 Sundown Alley',0),(96,'Melinda Aitchinson','vQtdKnoo1PV9',5059194505,161789,'80 Lotheville Plaza',0),(97,'Alecia Goude','l13uGpUnx',3973213436,2692039,'885 Marquette Court',1),(98,'Garth Ketcher','lsighj',2894590442,332519,'78657 Knutson Crossing',0),(99,'Jillian Swyndley','LEREzdBr',3837815405,253567,'4 Scofield Alley',0),(100,'Briano Vannikov','qYuxyBR',5208045629,4934753,'213 Doe Crossing Street',1);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `drugID` int NOT NULL AUTO_INCREMENT,
  `drugName` varchar(750) NOT NULL,
  `drugPrice` int NOT NULL,
  `drugManufacturingDate` date NOT NULL,
  `drugExpiryDate` date NOT NULL,
  `drugQuantity` int DEFAULT NULL,
  `drugCompanyID` int DEFAULT NULL,
  PRIMARY KEY (`drugID`),
  UNIQUE KEY `drugName` (`drugName`),
  KEY `drugCompanyID` (`drugCompanyID`),
  KEY `drugid_index` (`drugID`),
  CONSTRAINT `medicine_ibfk_1` FOREIGN KEY (`drugCompanyID`) REFERENCES `drugmanufacturer` (`manuCompanyID`) ON DELETE CASCADE,
  CONSTRAINT `manuDateCheck` CHECK ((`drugManufacturingDate` <= `drugExpiryDate`)),
  CONSTRAINT `priceCheck` CHECK ((`drugPrice` > 0)),
  CONSTRAINT `quantityCheck` CHECK ((`drugQuantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'SALICYLIC ACID',1421,'2022-02-13','2023-07-15',15,93),(2,'Carelessweed',1023,'2022-02-23','2023-12-20',20,26),(3,'Tolnaftate',973,'2022-11-23','2023-10-19',61,38),(4,'ARMODAFINIL',958,'2022-02-23','2023-06-12',97,73),(5,'Buckwheat Grain',729,'2022-08-25','2023-04-30',9,4),(6,'Johnson Grass Smut',1432,'2022-04-04','2023-03-17',21,49),(8,'ALCOHOL',513,'2022-03-03','2023-08-15',14,51),(9,'Hydrocortisone',853,'2022-05-24','2023-03-30',21,64),(10,'BENZALKONIUM CHLORIDE',1220,'2022-03-29','2023-04-12',54,83),(11,'Gerbil Epithelium',1109,'2022-02-13','2023-11-25',19,80),(12,'Bitter Dock',1117,'2022-12-01','2023-07-23',91,46),(13,'Levetiracetam',300,'2022-09-08','2023-05-29',89,5),(14,'Diclofenac Sodium',117,'2022-02-04','2024-02-15',97,37),(15,'ZONISAMIDE',72,'2022-03-04','2024-04-09',32,88),(18,'Heparin Sodium',1079,'2022-01-23','2023-12-13',70,14),(19,'amlodipine besylate',1139,'2022-11-24','2023-04-18',32,65),(20,'OCTINOXATE, TITANIUM DIOX',406,'2022-02-24','2023-08-22',80,84),(21,'dantrolene sodium',1453,'2022-05-14','2023-04-06',59,96),(22,'Metformin Hydrochloride',397,'2022-12-20','2024-02-09',60,6),(27,'Fosphenytoin Sodium',797,'2023-01-20','2023-09-12',29,21),(28,'Dimethicone',218,'2022-11-13','2023-09-27',23,19),(29,'Carvedilol',905,'2022-06-10','2023-08-06',71,15),(30,'Echinacea Essence',616,'2023-01-10','2023-08-05',12,71),(31,'IBUPROFEN AND DIPHENHYDRA',986,'2022-05-02','2024-02-19',82,16),(32,'Avobenzone, Octisalate an',792,'2022-04-17','2023-07-20',31,15),(34,'desonide',1404,'2022-12-02','2023-08-17',16,22),(36,'Water',78,'2022-12-08','2023-07-01',95,87),(37,'IODINE, SODIUM IODIDE, AL',749,'2022-08-03','2023-05-10',11,4),(38,'acetaminophen and phenyle',653,'2022-01-08','2023-04-27',19,12),(39,'Oxycodone Hydchloride',918,'2022-09-17','2023-06-01',49,19),(41,'DOCUSATE SODIUM',492,'2022-08-19','2023-07-04',68,6),(42,'POTASSIUM CHLORIDE',221,'2022-02-15','2023-10-04',21,52),(44,'Beet',75,'2022-03-19','2024-03-20',35,29),(45,'ENALAPRIL MALEATE',287,'2022-10-04','2023-05-20',25,86),(47,'Ibuprofen',1472,'2022-03-23','2023-09-21',11,57),(49,'Codeine Phosphate and Chl',1284,'2022-10-06','2023-06-12',70,60),(50,'OCTINOXATE',1256,'2022-07-21','2023-06-26',83,44),(51,'Zinc Oxide, Octinoxate, O',1098,'2022-01-19','2024-02-03',45,10),(53,'ziprasidone hydrochloride',1373,'2022-06-07','2023-12-18',90,19),(54,'Azathioprine',184,'2022-02-20','2024-01-18',2,34),(55,'hydroxyzine hydrochloride',950,'2023-01-05','2024-02-05',55,33),(56,'Ondansetron',1160,'2022-12-09','2024-04-16',80,1),(57,'ketoprofen',804,'2022-05-20','2023-09-29',92,54),(59,'Valacyclovir Hydrochlorid',130,'2022-09-13','2023-05-13',49,73),(60,'BUTALBITAL AND ACETAMINOP',930,'2022-05-27','2024-03-28',68,98),(61,'lamotrigine',1446,'2022-05-09','2023-05-12',85,66),(62,'Diphenhydramine Hydrochlo',1205,'2022-06-30','2023-08-06',13,16),(65,'Eastern White Pine',1451,'2022-01-22','2024-03-28',84,35),(66,'Hydrocodone Bitartrate An',704,'2022-06-20','2024-02-23',12,60),(67,'Burrobrush',1237,'2022-07-27','2024-03-02',60,36),(68,'Coumarinum, Phenyl Isothi',39,'2022-05-24','2023-04-27',87,48),(69,'Ethyl Alcohol',992,'2022-03-08','2023-06-18',83,85),(71,'Oxycodone Hydrochloride',374,'2022-02-23','2024-01-23',44,50),(72,'METHYLPREDNISOLONE',757,'2022-05-18','2024-03-07',42,34),(73,'Pepto Bismol Cherry',1038,'2022-12-08','2024-01-07',66,77),(74,'Aluminum Sesquichlorohydr',1443,'2023-01-05','2023-07-01',13,72),(76,'Acetaminophen',356,'2022-02-02','2023-07-20',28,33),(77,'AVOBENZONE, HOMOSALATE, O',383,'2022-12-31','2024-03-24',13,43),(78,'TRICLOSAN',776,'2022-05-19','2023-10-27',38,3),(79,'Standardized Orchard Gras',1135,'2022-08-18','2023-06-04',50,90),(80,'Fluconazole',1034,'2022-11-26','2023-08-10',96,64),(81,'diltiazem hydrochloride',478,'2023-02-08','2023-12-13',70,97),(82,'Amitriptyline Hydrochlori',1193,'2022-07-25','2024-02-06',51,65),(83,'Acetaminophen, guaifenesi',1028,'2022-09-13','2023-05-20',73,64),(84,'Folic Acid',913,'2022-05-24','2024-02-29',81,36),(85,'ALUMINUM ZIRCONIUM OCTACH',835,'2022-11-09','2023-06-12',56,77),(86,'potassium citrate',237,'2022-08-11','2023-05-04',57,26),(87,'azithromycin',728,'2022-05-31','2023-12-21',95,83),(89,'TERBINAFINE HYDROCHLORIDE',1328,'2022-08-08','2023-04-02',98,53),(90,'triamcinolone acetonide',267,'2022-09-23','2023-12-04',75,47),(91,'Hydrocortisone Acetate',603,'2022-12-04','2023-09-19',4,86),(95,'DIAZEPAM',1294,'2022-09-19','2023-12-03',29,99),(96,'Argentum 8',1072,'2022-05-23','2023-10-17',74,30),(97,'Nitrogen',754,'2022-11-27','2023-12-31',49,17),(98,'venlafaxine hydrochloride',300,'2023-01-29','2023-09-12',54,71),(100,'tizanidine hydrochloride',606,'2023-01-12','2023-11-18',88,3),(102,'Glycopyrrolate',232,'2023-02-01','2024-03-07',36,93),(103,'nifedipine',986,'2022-01-24','2024-04-01',43,48),(105,'Minocycline Hydrochloride',565,'2023-01-17','2023-07-06',17,66),(106,'Clotrimazole and Betameth',636,'2022-07-13','2023-10-12',68,62),(107,'Husky 514',1302,'2022-07-19','2024-04-15',52,95),(108,'ASPIRIN',1152,'2022-10-26','2023-04-07',6,80),(110,'DIPYRIDAMOLE',717,'2022-10-28','2023-11-03',88,29),(111,'Ciclopirox',1048,'2022-01-13','2023-07-06',30,20),(113,'Budesonide',590,'2022-06-29','2023-08-19',56,86),(115,'imiquimod',715,'2022-12-20','2023-03-29',33,68),(117,'Ranitidine',245,'2022-04-06','2023-12-22',94,67),(118,'Sodium Fluoride',612,'2022-06-20','2023-10-24',73,69),(119,'Acetaminophen, Phenyltolo',537,'2022-11-17','2023-05-25',35,54),(120,'Meperidine Hydrochloride',891,'2022-02-21','2024-04-15',21,13),(121,'Mucinex Fast Max Cold, Fl',594,'2022-08-19','2023-11-12',2,86),(123,'levofloxacin',445,'2022-12-12','2023-12-10',67,76),(124,'TITANIUM DIOXIDE, ZINC OX',626,'2022-09-24','2023-07-29',45,38),(125,'Zinc Oxide, Titanium Diox',651,'2022-06-27','2023-09-26',12,3),(126,'Avobenzone, Octocrylene, ',1137,'2022-01-27','2024-03-15',30,84),(127,'Bicalutamide',1073,'2022-12-29','2023-03-21',72,92),(129,'SUS SCROFA SKIN',722,'2022-09-27','2023-04-16',85,75),(132,'DAPAGLIFLOZIN',274,'2022-09-24','2023-04-11',26,11),(133,'Acetaminophen, Chlorpehni',1269,'2022-04-22','2023-12-10',95,20),(134,'Lithium Carbonate',701,'2022-10-22','2023-09-20',79,99),(135,'Desoximetasone',720,'2022-11-21','2023-12-15',72,100),(137,'Ammonium carbonicum, Asaf',120,'2022-09-19','2024-03-18',27,56),(141,'Benzoicum acidum, Pulsati',98,'2022-12-09','2023-04-14',55,60),(142,'conium maculatum flowerin',896,'2022-08-06','2023-12-06',40,61),(143,'Isoniazid',1179,'2022-07-23','2023-05-12',52,67),(144,'Acetaminophen and Diphenh',1185,'2022-05-07','2024-03-01',96,51),(145,'Sulfamethoxazole and Trim',702,'2022-02-24','2023-03-27',56,15),(146,'Ibutilide Fumarate',1270,'2022-01-13','2023-04-03',25,57),(147,'Tomato',1176,'2022-04-03','2024-03-22',10,36),(148,'L Dopa',331,'2022-01-26','2024-04-15',61,27),(149,'ARNICA MONTANA ROOT, ATRO',1466,'2022-10-20','2024-02-05',41,2),(150,'POVIDONE-IODINE',608,'2022-07-07','2023-05-24',30,76),(153,'Omeprazole Magnesium 20.6',509,'2022-03-07','2023-06-30',56,97),(154,'Cetirizine Hydrochloride',461,'2022-09-12','2023-08-10',92,70),(156,'Glycerin',839,'2022-07-02','2023-05-13',18,2),(157,'Ensulizole, Octinoxate, O',62,'2022-12-31','2023-04-07',98,57),(161,'Benzethonium Chloride',1080,'2022-02-04','2023-09-29',3,50),(162,'Loratadine',1087,'2022-06-25','2024-01-01',3,5),(163,'Menthol',127,'2022-03-05','2023-10-22',80,73),(164,'piperacillin and tazobact',1282,'2022-03-16','2024-01-21',34,39),(165,'Trazodone Hydrochloride',608,'2022-06-26','2023-11-02',29,47),(167,'zolmitriptan',62,'2022-07-20','2023-12-29',50,33),(169,'OCTINOXATE and TITANIUM D',135,'2022-08-28','2023-08-10',44,79),(170,'Diphenhydramine HCl',339,'2022-12-04','2023-07-28',16,70),(171,'Poverty Weed',1185,'2022-09-07','2023-10-15',60,7),(172,'Methyl Salicylate',1325,'2022-02-17','2023-07-03',31,90),(173,'Terazosin Hydrochloride',1417,'2023-01-30','2024-01-30',99,8),(174,'Phentermine Hydrochloride',1044,'2022-12-04','2023-04-28',63,79),(175,'Titanium Dioxide',163,'2022-03-29','2023-12-02',90,70),(176,'OCTINOXATE, OXYBENZONE',912,'2023-02-02','2023-07-31',88,45),(179,'NOT APPLICABLE',256,'2022-08-31','2023-04-26',36,60),(180,'SODIUM CHLORIDE and POTAS',748,'2022-01-05','2023-11-04',24,99),(181,'Queen Palm',1376,'2022-02-07','2023-08-19',69,33),(182,'OXYGEN',745,'2022-02-27','2024-02-10',16,80),(183,'calcium carbonate',1131,'2022-09-08','2024-03-26',88,7),(184,'Cefazolin',389,'2022-05-24','2023-08-21',69,59),(186,'Amoxicillin/Clavulanate P',1023,'2022-10-04','2024-03-18',44,93),(187,'Aralia Quinquefolia, Echi',1455,'2022-09-25','2023-04-20',46,65),(188,'UREA',900,'2022-11-03','2023-05-05',32,43),(189,'Acyclovir',1096,'2022-02-20','2023-05-10',50,79),(190,'lansoprazole',473,'2022-06-05','2024-02-28',52,50),(191,'Hydroquinone',614,'2022-07-16','2023-10-27',14,76),(192,'Tretinoin',991,'2022-10-08','2023-04-18',46,90),(195,'prazosin hydrochloride',301,'2022-07-26','2023-06-08',80,30),(196,'clobetasol propionate',41,'2023-02-08','2024-01-08',51,93),(197,'Canadian Bluegrass',70,'2023-02-09','2023-08-27',28,2),(202,'ccrocin',400,'2022-01-01','2024-01-01',18,1);
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `medicine_BEFORE_UPDATE` BEFORE UPDATE ON `medicine` FOR EACH ROW BEGIN
	if NEW.drugQuantity<10 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Drug Quantity low';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `medicine_AFTER_UPDATE` AFTER UPDATE ON `medicine` FOR EACH ROW BEGIN
	if NEW.drugQuantity<10 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Drug Quantity low';
	end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `medicinesgoingoutofstock`
--

DROP TABLE IF EXISTS `medicinesgoingoutofstock`;
/*!50001 DROP VIEW IF EXISTS `medicinesgoingoutofstock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `medicinesgoingoutofstock` AS SELECT 
 1 AS `drugName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `checkoutPrice` int NOT NULL,
  `deliveryAddress` varchar(255) NOT NULL,
  `orderDate` date NOT NULL,
  `cartID` int NOT NULL,
  PRIMARY KEY (`orderID`),
  CONSTRAINT `checkoutPriceCheck` CHECK ((`checkoutPrice` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=8333 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,8100,'2 Westerfield Way','2023-11-11',0),(2,9584,'64 Warner Junction','2023-09-09',0),(3,5088,'056 Lillian Pass','2023-07-20',0),(4,8447,'33 Nevada Avenue','2023-06-19',0),(5,1031,'0 Myrtle Alley','2023-11-07',0),(6,3045,'3822 Lerdahl Place','2023-10-07',0),(8,8426,'5 Manitowish Avenue','2023-03-26',0),(9,1950,'1 American Road','2023-08-06',0),(10,9432,'5474 Old Gate Point','2023-05-27',0),(11,5210,'56 Granby Place','2023-10-26',0),(13,2144,'0831 Mockingbird Trail','2023-05-31',0),(14,2705,'28 Veith Road','2023-08-26',0),(18,5510,'444 Jenifer Circle','2023-08-19',0),(19,1058,'681 Warner Junction','2023-10-21',0),(20,3631,'56 Utah Circle','2023-04-24',0),(21,7114,'99 Jenna Court','2023-10-20',0),(22,1000,'79329 Pierstorff Center','2023-04-09',0),(25,9755,'670 Green Ridge Plaza','2023-06-19',0),(26,3383,'54 Butternut Junction','2023-10-01',0),(28,8373,'38 Rockefeller Circle','2023-11-27',0),(29,636,'0 Lerdahl Alley','2023-08-12',0),(30,6426,'51 Brickson Park Alley','2023-07-27',0),(33,7965,'0 Laurel Trail','2023-10-22',0),(34,969,'8 Stuart Terrace','2023-07-23',0),(35,996,'48891 Center Park','2023-09-08',0),(36,7086,'45 Elmside Junction','2023-04-12',0),(37,3321,'49358 Miller Junction','2023-03-23',0),(38,4107,'850 Muir Alley','2023-09-24',0),(39,5231,'1077 Hayes Alley','2023-09-08',0),(41,4194,'6711 Sunbrook Park','2023-07-09',0),(42,125,'604 6th Pass','2023-09-03',0),(44,9450,'5941 Corscot Court','2023-02-28',0),(45,3477,'651 Vidon Parkway','2023-07-07',0),(46,8230,'65 5th Way','2023-09-23',0),(47,8392,'87446 Bellgrove Street','2023-09-24',0),(48,4720,'4081 Meadow Vale Avenue','2023-09-08',0),(49,6952,'8 Hansons Parkway','2023-06-05',0),(50,3516,'60490 Fairfield Plaza','2023-09-23',0),(51,3752,'1 Hallows Lane','2023-10-21',0),(52,6713,'6836 Dorton Drive','2023-10-02',0),(53,6230,'95 6th Parkway','2023-06-19',0),(55,1507,'84 Maryland Circle','2023-05-21',0),(57,7631,'5 Petterle Trail','2023-03-23',0),(58,351,'74404 Dawn Junction','2023-05-22',0),(59,5502,'178 Maywood Road','2023-05-27',0),(60,6442,'386 Dovetail Street','2023-09-17',0),(61,541,'48046 Dovetail Parkway','2023-06-30',0),(62,1736,'1628 Sutherland Lane','2023-06-03',0),(63,4200,'87 Barnett Plaza','2023-11-17',0),(64,5274,'59 Clarendon Trail','2023-04-04',0),(66,9001,'28 6th Drive','2023-11-07',0),(67,9035,'498 Independence Terrace','2023-03-15',0),(68,2547,'09 Debra Plaza','2023-03-03',0),(69,7896,'6902 Anhalt Avenue','2023-07-17',0),(70,4001,'56 Brown Plaza','2023-09-09',0),(71,3021,'0438 Del Sol Road','2023-11-04',0),(72,3397,'94 Sutteridge Terrace','2023-02-21',0),(73,6891,'2 Spohn Avenue','2023-09-08',0),(75,1287,'0 Union Hill','2023-03-08',0),(76,2910,'44 Arapahoe Avenue','2023-03-06',0),(77,1524,'05232 Dunning Lane','2023-04-20',0),(78,4453,'261 Blue Bill Park Junction','2023-11-04',0),(79,6541,'330 Shasta Crossing','2023-09-18',0),(80,2702,'1 Haas Trail','2023-07-25',0),(81,18,'1 Mitchell Place','2023-09-13',0),(82,6025,'640 Aberg Street','2023-10-27',0),(84,2172,'8627 Southridge Circle','2023-08-08',0),(85,9210,'172 Columbus Junction','2023-06-01',0),(86,7969,'55 Rigney Terrace','2023-05-09',0),(87,7805,'58058 Fuller Parkway','2023-08-07',0),(89,4776,'81 Vermont Avenue','2023-05-10',0),(90,3642,'67 Dapin Drive','2023-08-02',0),(92,3323,'1520 Donald Terrace','2023-08-30',0),(93,4394,'2 Esch Circle','2023-05-12',0),(95,9055,'2 Morningstar Terrace','2023-03-27',0),(96,6916,'409 Eastlawn Way','2023-08-27',0),(100,1154,'481 Banding Park','2023-07-24',0),(101,3182,'59801 Mccormick Pass','2023-11-01',0),(103,3827,'2813 2nd Court','2023-04-13',0),(104,5135,'592 Homewood Circle','2023-09-02',0),(105,5662,'475 Northwestern Junction','2023-06-09',0),(106,2078,'487 Spaight Alley','2023-05-03',0),(108,1035,'24372 Luster Park','2023-10-14',0),(109,1771,'0843 Bonner Pass','2023-06-01',0),(110,176,'66 Cottonwood Park','2023-08-21',0),(113,921,'9402 Norway Maple Lane','2023-05-21',0),(114,1843,'37 Clemons Hill','2023-11-08',0),(115,8094,'2 Sage Drive','2023-08-20',0),(116,9430,'4498 Sommers Crossing','2023-04-12',0),(117,6528,'14 Colorado Plaza','2023-10-28',0),(118,2520,'797 Chive Center','2023-05-24',0),(121,2282,'5 Oakridge Way','2023-06-07',0),(122,8820,'4 Hallows Circle','2023-02-14',0),(123,8472,'abs','2023-01-02',0),(125,7345,'49410 Stephen Plaza','2023-05-21',0),(127,7499,'330 South Junction','2023-07-21',0),(128,5564,'3 Elmside Parkway','2023-05-12',0),(129,1229,'29202 Golden Leaf Trail','2023-03-19',0),(130,9701,'6978 Sommers Junction','2023-04-12',0),(131,4655,'374 Daystar Place','2023-04-22',0),(133,8117,'344 Dottie Parkway','2023-11-13',0),(134,5831,'52785 Meadow Valley Trail','2023-10-29',0),(135,5590,'81 Texas Street','2023-09-19',0),(136,4834,'99592 Del Sol Road','2023-10-14',0),(137,1500,'4 Lien Trail','2023-03-28',0),(139,5505,'5 Mandrake Lane','2023-10-26',0),(140,8600,'4 Laurel Road','2023-04-30',0),(141,1607,'612 Gerald Avenue','2023-08-09',0),(143,3212,'05 Esch Lane','2023-05-20',0),(144,1553,'1 Vidon Avenue','2023-04-17',0),(146,410,'4 Dixon Terrace','2023-08-16',0),(150,568,'4 Derek Pass','2023-05-15',0),(151,6307,'42978 Messerschmidt Way','2023-03-27',0),(153,6981,'205 Sachtjen Center','2023-03-10',0),(154,3705,'67855 Bunting Point','2023-04-12',0),(155,1216,'637 Alpine Hill','2023-07-20',0),(156,1656,'5 Messerschmidt Point','2023-05-16',0),(158,1817,'0 Reinke Park','2023-11-11',0),(159,9813,'5 Red Cloud Park','2023-06-25',0),(160,4925,'278 Chive Lane','2023-07-08',0),(162,95,'48718 Florence Junction','2023-11-18',0),(163,1211,'74 Hazelcrest Plaza','2023-07-28',0),(164,2673,'084 1st Place','2023-02-19',0),(165,3013,'7682 Green Ridge Center','2023-02-19',0),(166,7452,'3 Porter Alley','2023-11-20',0),(169,8785,'0 Commercial Terrace','2023-10-05',0),(170,5591,'69388 Mandrake Hill','2023-07-10',0),(171,7816,'350 Talmadge Parkway','2023-04-03',0),(172,1618,'560 Westend Hill','2023-05-14',0),(174,5613,'82 Ryan Circle','2023-04-30',0),(175,1960,'20319 Manley Drive','2023-03-27',0),(176,2257,'977 Schmedeman Pass','2023-09-01',0),(177,7855,'99562 Elgar Pass','2023-10-02',0),(178,1240,'28 Ryan Way','2023-08-25',0),(179,1760,'0 Prairie Rose Parkway','2023-04-13',0),(180,632,'45 Prairie Rose Avenue','2023-07-09',0),(181,9500,'3 Scoville Pass','2023-10-13',0),(185,1971,'9 Homewood Way','2023-11-17',0),(186,5395,'36312 Hagan Lane','2023-03-27',0),(187,6914,'11 Columbus Drive','2023-11-24',0),(189,8244,'24 Bonner Park','2023-07-17',0),(190,3824,'806 Hagan Street','2023-03-28',0),(192,5035,'16 Anhalt Crossing','2023-03-06',0),(193,5436,'8988 Scoville Alley','2023-08-23',0),(194,3483,'2 Elgar Terrace','2023-04-14',0),(195,487,'1154 Old Gate Pass','2023-10-22',0),(196,4855,'9896 Toban Park','2023-03-01',0),(197,2533,'0 Moland Junction','2023-07-16',0),(198,906,'4683 Cardinal Park','2023-11-15',0),(746,2734,'absd','2022-01-01',0),(1111,1111,'idk','2023-08-08',2),(7316,4783,'edj','2022-01-01',0),(8316,7246,'abs','2022-01-21',0),(8317,203,'vasant kunj','2023-04-23',211),(8318,3255,'iiit ddelhi','2023-04-23',211),(8319,4781,'pata nahi','2023-04-23',211),(8320,915,'gurgaon','2023-04-23',211),(8321,4679,'kahi bhi','2023-04-23',211),(8322,3560,'bruhh','2023-04-23',211),(8323,305,'iiit delhi','2023-04-23',211),(8324,10555,'abcd','2023-04-23',213),(8325,2753,'& C:/Users/ASUS/AppData/Local/Programs/Python/Python310/python.exe c:/Users/ASUS/Desktop/PYTHON/dbms/medmate_cli.py','2023-04-24',209),(8326,2753,'mumbaiiii','2023-04-24',209),(8327,2753,'mumbaii','2023-04-24',209),(8328,2753,'','2023-04-24',209),(8329,2753,'& C:/Users/ASUS/AppData/Local/Programs/Python/Python310/python.exe c:/Users/ASUS/Desktop/PYTHON/dbms/medmate_cli.py','2023-04-24',209),(8330,2753,'idk','2023-04-24',209),(8331,2753,'yes','2023-04-24',209),(8332,2753,'india','2023-04-24',209);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orderdetails_AFTER_INSERT` AFTER INSERT ON `orderdetails` FOR EACH ROW BEGIN
	INSERT INTO billingdetails (medicineOrderID, totalPrice, modeOfPayment, billingAddress)
    VALUES (NEW.orderID, NEW.checkoutPrice, '', NEW.deliveryAddress);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productinfo`
--

DROP TABLE IF EXISTS `productinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productinfo` (
  `cartCustomerID` int NOT NULL,
  `cartDrugID` int NOT NULL,
  `cartDrugQuantity` int NOT NULL,
  PRIMARY KEY (`cartCustomerID`,`cartDrugID`,`cartDrugQuantity`),
  CONSTRAINT `productinfo_ibfk_1` FOREIGN KEY (`cartCustomerID`) REFERENCES `cart` (`cartCustomerID`) ON DELETE CASCADE,
  CONSTRAINT `cartDrugCheck` CHECK ((`cartDrugQuantity` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productinfo`
--

LOCK TABLES `productinfo` WRITE;
/*!40000 ALTER TABLE `productinfo` DISABLE KEYS */;
INSERT INTO `productinfo` VALUES (1,38,63),(1,53,56),(2,3,18),(2,57,28),(3,17,65),(3,83,9),(4,12,37),(4,97,8),(5,18,58),(5,65,67),(6,16,20),(6,58,65),(7,54,16),(7,97,83),(8,57,46),(8,58,35),(9,65,19),(9,87,7),(10,1,80),(10,100,82),(11,16,16),(11,22,47),(12,33,47),(12,60,11),(13,80,90),(13,100,52),(14,44,84),(14,84,24),(15,62,45),(15,91,14),(16,31,5),(16,58,83),(17,24,33),(17,40,22),(18,4,34),(18,7,74),(19,86,95),(19,94,79),(20,10,19),(20,32,40),(21,5,86),(21,80,95),(22,6,46),(22,54,60),(23,33,29),(23,39,93),(24,16,40),(24,47,49),(25,4,73),(25,70,6),(26,27,8),(26,51,60),(27,27,69),(27,34,69),(28,45,8),(28,68,5),(29,59,46),(29,75,92),(30,55,12),(30,59,58),(31,36,6),(31,77,93),(32,30,1),(32,63,36),(33,2,42),(33,23,87),(34,30,41),(34,99,66),(35,20,46),(35,35,24),(36,10,40),(36,89,73),(37,5,92),(37,54,81),(38,54,81),(38,77,28),(39,17,43),(39,94,46),(40,27,80),(40,75,68),(41,22,94),(41,37,35),(42,16,3),(42,39,44),(43,74,96),(43,76,35),(44,25,29),(44,72,56),(45,54,92),(45,98,63),(46,20,57),(46,39,7),(47,52,46),(47,75,35),(48,27,87),(48,71,94),(49,19,22),(49,28,100),(50,18,48),(50,50,24),(51,43,54),(52,3,76),(53,71,90),(54,34,17),(55,20,73),(56,29,37),(57,67,37),(58,5,27),(59,16,84),(60,94,65),(61,78,76),(62,72,84),(63,98,54),(64,32,70),(65,78,1),(66,61,10),(67,61,8),(68,34,92),(69,11,68),(70,17,98),(71,49,57),(72,60,51),(73,96,41),(74,23,56),(75,89,82),(76,52,78),(77,33,35),(78,66,53),(79,21,98),(80,36,85),(81,32,73),(82,68,78),(83,89,85),(84,2,58),(85,72,55),(86,75,26),(87,22,3),(88,56,24),(89,75,19),(90,75,11),(91,17,63),(92,82,38),(93,19,36),(94,100,2),(95,96,26),(96,19,34),(97,92,46),(98,54,30),(99,33,83),(100,99,83),(211,3,10),(211,7,2),(211,42,2),(212,197,1),(213,143,10),(213,197,1);
/*!40000 ALTER TABLE `productinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'medmate'
--

--
-- Dumping routines for database 'medmate'
--

--
-- Final view structure for view `medicinesgoingoutofstock`
--

/*!50001 DROP VIEW IF EXISTS `medicinesgoingoutofstock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `medicinesgoingoutofstock` AS select `medicine`.`drugName` AS `drugName` from `medicine` where (`medicine`.`drugQuantity` < 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-23 17:37:56
