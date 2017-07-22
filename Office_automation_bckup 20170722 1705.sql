-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.18-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema smart_office_auto
--

CREATE DATABASE IF NOT EXISTS smart_office_auto;
USE smart_office_auto;

--
-- Definition of table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `batchid` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `begin_date` date NOT NULL,
  `trainerid` varchar(45) default NULL,
  `max_strength` int(10) unsigned NOT NULL,
  `present_strength` int(11) default NULL,
  `slotid` varchar(20) character set latin1 collate latin1_bin default NULL,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`batchid`),
  KEY `FK_batch_1` (`course`),
  CONSTRAINT `FK_batch_1` FOREIGN KEY (`course`) REFERENCES `courses` (`course`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 4096 kB; (`course`) REFER `smart_office_auto/co';

--
-- Dumping data for table `batch`
--

/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
INSERT INTO `batch` (`batchid`,`course`,`begin_date`,`trainerid`,`max_strength`,`present_strength`,`slotid`,`status`) VALUES 
 ('BT1310360','Core Java','2013-10-30','Dheer@123',30,3,0x534C313331303039,'Not Started'),
 ('BT1310624','Networks','2013-10-23','Archit@123',20,0,0x534C313331303233,'Not Started'),
 ('BT1403386','Networks','2014-03-28','Archit@123',600,1,0x534C313331303039,'Running'),
 ('BT1404931','Intership','2014-04-14','Apurv@123',20,4,0x534C313430343038,'Running');
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;


--
-- Definition of table `batchallotment`
--

DROP TABLE IF EXISTS `batchallotment`;
CREATE TABLE `batchallotment` (
  `studentid` varchar(45) NOT NULL,
  `batchid` varchar(45) NOT NULL,
  `fee_paid` int(10) unsigned NOT NULL,
  `fee_left` int(10) unsigned NOT NULL,
  `certificate_status` varchar(45) NOT NULL,
  `project_id` varchar(45) default NULL,
  `submit` varchar(45) NOT NULL,
  PRIMARY KEY  (`studentid`,`batchid`),
  KEY `FK_batchallotment_1` (`batchid`),
  KEY `FK_batchallotment_2` (`project_id`),
  CONSTRAINT `FK_batchallotment_1` FOREIGN KEY (`batchid`) REFERENCES `batch` (`batchid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_batchallotment_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `batchallotment`
--

/*!40000 ALTER TABLE `batchallotment` DISABLE KEYS */;
INSERT INTO `batchallotment` (`studentid`,`batchid`,`fee_paid`,`fee_left`,`certificate_status`,`project_id`,`submit`) VALUES 
 ('ST1310098176','BT1310360',2500,3500,'Not Approved','PJ2014036469',''),
 ('ST1310231127','BT1310360',2000,4000,'Not Approved','PJ2014036469',''),
 ('ST1310685678','BT1310360',500,5500,'Not Approved','PJ2014036469',''),
 ('ST1403882449','BT1404931',880,11120,'Not Approved',NULL,'Not Applicable'),
 ('ST1404338094','BT1404931',9000,3000,'Not Approved',NULL,'Not Applicable');
/*!40000 ALTER TABLE `batchallotment` ENABLE KEYS */;


--
-- Definition of table `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE `courses` (
  `course` varchar(45) NOT NULL,
  `duration_hrs` int(10) unsigned NOT NULL,
  `fees` int(10) unsigned NOT NULL,
  PRIMARY KEY  USING BTREE (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `courses`
--

/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` (`course`,`duration_hrs`,`fees`) VALUES 
 ('.Net',120,5000),
 ('android',50,70000),
 ('C Language',90,7000),
 ('C++',80,50000),
 ('Core Java',600,6000),
 ('Framework',60,6000),
 ('Intership',60,12000),
 ('Networks',150,20000),
 ('PHP',90,4000),
 ('RCP',120,15000),
 ('Visual Basic',70,4500);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;


--
-- Definition of table `emp_reg`
--

DROP TABLE IF EXISTS `emp_reg`;
CREATE TABLE `emp_reg` (
  `emp_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `mobile` bigint(10) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `reg_date` date NOT NULL,
  PRIMARY KEY  USING BTREE (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `emp_reg`
--

/*!40000 ALTER TABLE `emp_reg` DISABLE KEYS */;
INSERT INTO `emp_reg` (`emp_id`,`name`,`gender`,`address`,`mobile`,`email`,`reg_date`) VALUES 
 ('EM2013101352','Kopal Verma','Female','merrut,UP',8854321233,'kopal.123@waomail.com','2013-10-13'),
 ('EM2013105123','Kirti Khanna','Female','23 G, Gomti Nagar,lko.',7896543219,'kir@mail.com','2013-10-13'),
 ('EM2013105344','Dheer Singh','Male','Alambagh, Lko',7788994321,'dheeru@yipee.com','2013-10-13'),
 ('EM2013105656','Apurv Kohali','Male','Chennai,Tamil Nadu',9876789909,'apur@mail.com','2013-10-13'),
 ('EM2013105730','Marin Dcruze','Female','Goa',7764567777,'marin@googly.com','2013-10-13'),
 ('EM2013105900','Usman Ansari','Male','Hasanganj,Lko',8894567899,'usman@googly.com','2013-10-13'),
 ('EM2013106439','Archit Gupta','Male','12,chowk, Lko',7890654321,'Arch@mail.com','2013-10-13'),
 ('EM2013106761','Gurdeep Kaur','Male','Chandani Chowk,Delhi',9936746533,'guru@googly.com','2013-10-13'),
 ('EM2013107654','Cyrus Batliwala','Male','Chembur,Mumbai',8896545454,'cyrus@waomail.com','2013-10-13'),
 ('EM2013108014','Anshi Shukla','Female','89, Vibhuti Khand,lko',8906543215,'Anshicute@mail.com','2013-10-13'),
 ('EM2013109815','Gaurav Patel','Male','hussainganj,lko',7899000345,'gaur@yippee.com','2013-10-13'),
 ('EM2014033347','Parul','Female','chowk',8090536001,'parul@gmail.com','2014-03-28'),
 ('EM2014034442','Kunal','Male','chowk',9044323709,'kunal@gmail.com','2014-03-28'),
 ('EM2014035318','Archii','Female','Matiyarii',8976054321,'archi@gmail.com','2014-03-28'),
 ('EM2014037873','Akash','Male','Pune',9807654123,'akamail.comsh_singh@g','2014-03-28'),
 ('EM2014039544','Priyanka','Female','Rajajipuram',8960123450,'shallu@gmail.com','2014-03-28'),
 ('EM2014039674','Parul','Female','chowk',8090536001,'parul@gmail.com','2014-03-27'),
 ('EM2014076110','Swasti sharma','Female','Lko',9088889999,'swasti@gmail.com','2014-07-01');
/*!40000 ALTER TABLE `emp_reg` ENABLE KEYS */;


--
-- Definition of table `enquiry`
--

DROP TABLE IF EXISTS `enquiry`;
CREATE TABLE `enquiry` (
  `enq_id` int(10) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `course_enq` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `mobile_num` bigint(20) unsigned NOT NULL,
  `address` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `college` varchar(45) NOT NULL,
  `about_us` varchar(45) NOT NULL,
  PRIMARY KEY  (`enq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry`
--

/*!40000 ALTER TABLE `enquiry` DISABLE KEYS */;
INSERT INTO `enquiry` (`enq_id`,`date`,`course_enq`,`name`,`mobile_num`,`address`,`email`,`qualification`,`college`,`about_us`) VALUES 
 (1,'2014-02-14','Core Java','hvcmc',809053986,'jhvhj','kjfjkh','kfgvk','kjfvkjh','teachers'),
 (2,'2014-03-09','Core Java','Parul',8090536001,'chowk								','Parulrastogi@GMAIL.COM','BTECH','iNTEGRAL','teachers'),
 (3,'2014-03-27','Core Java','Parul',8090536001,'','parulrastogi005@gmail.com','btech','Integral University','Newspaper'),
 (4,'2014-06-04','C Language','Amit00999',9087670000,'chwk','gupta.kunal2014@gmail.com','BE','SRMCEM','Friends');
/*!40000 ALTER TABLE `enquiry` ENABLE KEYS */;


--
-- Definition of table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `loginid` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(20) NOT NULL,
  `emp_id` varchar(45) NOT NULL,
  PRIMARY KEY  (`loginid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` (`loginid`,`password`,`role`,`emp_id`) VALUES 
 ('@dmin','admin123','admin','EM2013000001'),
 ('Anshi@123','anshi','Counselor','EM2013108014'),
 ('Apurv@123','apurv','Trainer','EM2013105656'),
 ('Archit@123','archit','Trainer','EM2013106439'),
 ('Dheer@123','Dheer','Trainer','EM2013105344'),
 ('kopal@','kopal@123','project_coordinator','EM2013101352'),
 ('kriti@','kriti@123','Counselor','EM2013105123'),
 ('parul@','parul','project_coordinator','EM2014039674');
/*!40000 ALTER TABLE `login` ENABLE KEYS */;


--
-- Definition of table `project`
--

DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `project_id` varchar(45) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `details` varchar(200) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY  (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`project_id`,`project_name`,`details`,`type`) VALUES 
 ('PJ2014036469','PArul','ver gooooood :)','Course Project');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


--
-- Definition of table `slots`
--

DROP TABLE IF EXISTS `slots`;
CREATE TABLE `slots` (
  `slotid` varchar(20) NOT NULL,
  `days` varchar(45) NOT NULL,
  `time` varchar(45) NOT NULL,
  PRIMARY KEY  (`slotid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slots`
--

/*!40000 ALTER TABLE `slots` DISABLE KEYS */;
INSERT INTO `slots` (`slotid`,`days`,`time`) VALUES 
 ('SL131009','M,W,F','2:00pm-4:00pm'),
 ('SL140408','M,W,F','1am-3am');
/*!40000 ALTER TABLE `slots` ENABLE KEYS */;


--
-- Definition of table `studentreg`
--

DROP TABLE IF EXISTS `studentreg`;
CREATE TABLE `studentreg` (
  `studentid` varchar(45) NOT NULL,
  `course` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `d_o_b` date NOT NULL,
  `father_name` varchar(45) NOT NULL,
  `father_occupation` varchar(45) default NULL,
  `address` varchar(100) NOT NULL,
  `mobileno` bigint(20) unsigned NOT NULL,
  `email` varchar(45) NOT NULL,
  `phoneno` bigint(20) unsigned default NULL,
  `qualification` varchar(45) NOT NULL,
  `college` varchar(45) default NULL,
  `fee_paid` int(10) unsigned default NULL,
  `reg_date` date NOT NULL,
  `proj_remarks` varchar(45) NOT NULL,
  PRIMARY KEY  (`studentid`),
  KEY `FK_studentreg_1` (`course`),
  CONSTRAINT `FK_studentreg_1` FOREIGN KEY (`course`) REFERENCES `courses` (`course`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentreg`
--

/*!40000 ALTER TABLE `studentreg` DISABLE KEYS */;
INSERT INTO `studentreg` (`studentid`,`course`,`name`,`d_o_b`,`father_name`,`father_occupation`,`address`,`mobileno`,`email`,`phoneno`,`qualification`,`college`,`fee_paid`,`reg_date`,`proj_remarks`) VALUES 
 ('ST1310098176','Core Java','Gauri Singh','1991-11-13','Ramesh Singh','Businessman','Hajratganj, Lko',9876543459,'gauri@mail.com',522225678,'BE','SRMU',2000,'2013-10-13',''),
 ('ST1310231127','Core Java','Parul Singh','1993-10-19','Charan Singh','Businessman','Sitapur,UP',8767869900,'Gulu@yippee.com',534678998,'BE','PSIT',1000,'2013-10-13','completed'),
 ('ST1310685678','Core Java','Raju Verma','1990-07-09','Suresh Verma','Serviceman','Mahanagar,Lko',9876567999,'raju@waomail.com',52222343456,'B-Tech','SRMS',500,'2013-10-13',''),
 ('ST1403187475','Framework','vfhj','2014-03-28',',vm','vhj,k','scaCf',8090536001,'jj@gmail.com',9987,'sav','afasf',3233,'2014-03-28','Not Assigned'),
 ('ST1403213367','android','kunal','2014-03-28','rs gupta','service','chowk',9044323709,'kunal@gmail.com',908,'btech','srmcem',1000,'2014-03-28','Not Assigned'),
 ('ST1403882449','Intership','nlnkj','2014-03-28','dved','ew4few','edsafe',9087654321,'parul@hh.com',907,'acsv','vadv',880,'2014-03-28','Not Assigned'),
 ('ST1404338094','Intership','Pragati','2014-04-20','s srivas','pwd','kapoorthala',8907654321,'prag@gmail.com',89765432,'Mba','iim',9000,'2014-04-20','Not Assigned');
/*!40000 ALTER TABLE `studentreg` ENABLE KEYS */;


--
-- Definition of table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE `trainer` (
  `loginid` varchar(45) NOT NULL,
  `courses` varchar(100) NOT NULL,
  KEY `FK_trainer_1` (`loginid`),
  CONSTRAINT `FK_trainer_1` FOREIGN KEY (`loginid`) REFERENCES `login` (`loginid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trainer`
--

/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` (`loginid`,`courses`) VALUES 
 ('Dheer@123','Core Java,SAP'),
 ('Archit@123','SAP,Networks,Intership'),
 ('Apurv@123','Intership');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
