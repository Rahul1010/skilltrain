/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.7.17-log : Database - ssms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssms` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ssms`;

/*Table structure for table `configurations` */

DROP TABLE IF EXISTS `configurations`;

CREATE TABLE `configurations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `UK_START_DATE_END_DATE` (`start_date`,`end_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `configurations` */

insert  into `configurations`(`id`,`start_date`,`end_date`,`is_active`) values (1,'2017-06-13','2017-06-14',1);

/*Table structure for table `discussions` */

DROP TABLE IF EXISTS `discussions`;

CREATE TABLE `discussions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_skill_ratings_id` bigint(20) NOT NULL,
  `employee_details_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `discussion_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_EMPLOYEE_SKILL_RATINGS_DISCUSSIONS_ID` (`employee_skill_ratings_id`),
  KEY `FK_EMPLOYEE_DETAILS_DISCUSSIONS_ID` (`employee_details_id`),
  CONSTRAINT `FK_EMPLOYEE_DETAILS_DISCUSSIONS_ID` FOREIGN KEY (`employee_details_id`) REFERENCES `employee_details` (`id`),
  CONSTRAINT `FK_EMPLOYEE_SKILL_RATINGS_DISCUSSIONS_ID` FOREIGN KEY (`employee_skill_ratings_id`) REFERENCES `employee_skill_ratings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `discussions` */

/*Table structure for table `employee_details` */

DROP TABLE IF EXISTS `employee_details`;

CREATE TABLE `employee_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `roles_id` smallint(6) NOT NULL,
  `email_id` varchar(60) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `date_of_joining` date NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_EMPLOYEE_DETAILS_CODE` (`code`),
  UNIQUE KEY `UK_EMPLOYEE_DETAILS_EMAIL` (`email_id`),
  UNIQUE KEY `UK_EMPLOYEE_DETAILS_PHONE` (`phone`),
  KEY `FK_ROLES_EMPLOYEE_DETAILS_ID` (`roles_id`),
  CONSTRAINT `FK_ROLES_EMPLOYEE_DETAILS_ID` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `employee_details` */

insert  into `employee_details`(`id`,`code`,`name`,`roles_id`,`email_id`,`phone`,`date_of_joining`,`is_active`) values (1,'REV100','VIGHNESH S',2,'JEEVAVIGNESH@GMAIL.COM','8148285956','2017-06-12',1),(2,'REV101','RAHUL',2,'RAHUL@REVATURE.COM','9456873210','2017-06-11',1),(3,'REV200','AISHVARYA',2,'AISHWARYA@REVATURE.COM','8769542210','2017-06-13',1),(4,'REV3','VENKY',2,'VENKY@REVATURE.COM','7894563210','2017-06-01',1),(5,'REV4','RADHA',1,'RADHA@REVATURE.COM','9863657420','2017-04-07',1),(6,'REV1','MANI',2,'MANI@REVATURE.COM','9875856430','2016-10-07',1),(7,'REV1000','AYNNA',2,'AYNNA@MYNA.COM','9865769440','2017-06-14',1);

/*Table structure for table `employee_skill_ratings` */

DROP TABLE IF EXISTS `employee_skill_ratings`;

CREATE TABLE `employee_skill_ratings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_details_id` int(11) NOT NULL,
  `skill_sets_id` smallint(6) NOT NULL,
  `rated_by` int(11) NOT NULL,
  `rating` smallint(10) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status_id` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKK_EMPLOYEES_DETAILS_EMPLYEE_SKILLS_RATINGS_ID` (`employee_details_id`),
  KEY `FK_SKILL_SETS_EMPLYEE_SKILLS_RATINGS_ID` (`skill_sets_id`),
  KEY `FK_STATUS_EMPLYEE_SKILLS_RATINGS_ID` (`status_id`),
  KEY `FK_EMPLOYEE_DETAILS_EMPLOYEE_SKILL_RATINGS_ID` (`rated_by`),
  CONSTRAINT `FKK_EMPLOYEES_DETAILS_EMPLYEE_SKILLS_RATINGS_ID` FOREIGN KEY (`employee_details_id`) REFERENCES `employee_details` (`id`),
  CONSTRAINT `FK_EMPLOYEE_DETAILS_EMPLOYEE_SKILL_RATINGS_ID` FOREIGN KEY (`rated_by`) REFERENCES `employee_details` (`id`),
  CONSTRAINT `FK_SKILL_SETS_EMPLYEE_SKILLS_RATINGS_ID` FOREIGN KEY (`skill_sets_id`) REFERENCES `skill_sets` (`id`),
  CONSTRAINT `FK_STATUS_EMPLYEE_SKILLS_RATINGS_ID` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `employee_skill_ratings` */

insert  into `employee_skill_ratings`(`id`,`employee_details_id`,`skill_sets_id`,`rated_by`,`rating`,`created_on`,`status_id`) values (1,3,1,3,2,'2017-06-12 20:28:06',4),(2,3,2,3,5,'2017-06-12 20:30:41',2),(3,3,2,4,1,'2017-06-12 20:31:10',2);

/*Table structure for table `employees_details_lead_mappings` */

DROP TABLE IF EXISTS `employees_details_lead_mappings`;

CREATE TABLE `employees_details_lead_mappings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_details_id` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_EMPLOYEE_LEAD` (`employee_details_id`),
  KEY `FK_LEAD_EMLOYEE_DESIGNATION_LEAD_MAPPING_ID` (`lead_id`),
  CONSTRAINT `FK_EMPLOYEES_DETAILS_EMLOYEE_DESIGNATION_LEAD_MAPPING_ID` FOREIGN KEY (`employee_details_id`) REFERENCES `employee_details` (`id`),
  CONSTRAINT `FK_LEAD_EMLOYEE_DESIGNATION_LEAD_MAPPING_ID` FOREIGN KEY (`lead_id`) REFERENCES `employee_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `employees_details_lead_mappings` */

insert  into `employees_details_lead_mappings`(`id`,`employee_details_id`,`lead_id`) values (1,4,6),(2,1,4),(5,3,4),(6,2,4),(7,6,NULL),(8,7,4);

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_skills_ratings_id` bigint(20) NOT NULL,
  `feedback` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_EMPLOYEE_SKILLS_RATINGS_FEEDBACKS_ID` (`employee_skills_ratings_id`),
  CONSTRAINT `FK_EMPLOYEE_SKILLS_RATINGS_FEEDBACKS_ID` FOREIGN KEY (`employee_skills_ratings_id`) REFERENCES `employee_skill_ratings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `feedbacks` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ROLES_NAME` (`name`),
  UNIQUE KEY `UK_ROLES_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `roles` */

insert  into `roles`(`id`,`code`,`name`) values (1,'HR','HUMAN RESOURCES'),(2,'EMP','EMPLOYEE');

/*Table structure for table `skill_sets` */

DROP TABLE IF EXISTS `skill_sets`;

CREATE TABLE `skill_sets` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_SKILL_SETS_NAME` (`name`),
  UNIQUE KEY `UK_SKILL_SETS_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `skill_sets` */

insert  into `skill_sets`(`id`,`code`,`name`,`is_active`) values (1,'SK1','CORE JAVA',1),(2,'SK2','HTML',1),(3,'SK3','SQL',1),(4,'SK4','CSS',1),(5,'SK5','ANGULAR JS',1);

/*Table structure for table `status` */

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(7) NOT NULL,
  `name` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_STATUS_NAME` (`name`),
  UNIQUE KEY `UK_STATUS_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `status` */

insert  into `status`(`id`,`code`,`name`) values (1,'S1','SUBMITED'),(2,'S2','IN NEGOTIATION'),(3,'S3','ACCEPTED'),(4,'S4','INITIATED'),(5,'S5','APPROVED'),(6,'S6','SAVE');

/*Table structure for table `user_login_details` */

DROP TABLE IF EXISTS `user_login_details`;

CREATE TABLE `user_login_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `employee_details_id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `password` varchar(32) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_EMPLOYEE_DETAILS_ID` (`employee_details_id`),
  UNIQUE KEY `UK_USERNAME` (`username`),
  CONSTRAINT `FK_EMPLOYEE_DETAILS_USER_LOGIN_DETAILS_EMPLOYEE_DETAILS_ID` FOREIGN KEY (`employee_details_id`) REFERENCES `employee_details` (`id`),
  CONSTRAINT `FK_EMPLOYEE_DETAILS_USER_LOGIN_DETAILS_USERNAME` FOREIGN KEY (`username`) REFERENCES `employee_details` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `user_login_details` */

insert  into `user_login_details`(`id`,`employee_details_id`,`username`,`password`,`last_login`) values (1,1,'JEEVAVIGNESH@GMAIL.COM','8edea367d5aac4f227193f07b9220746','2017-06-12 19:15:53'),(2,2,'RAHUL@REVATURE.COM','bac363ad53ee1c18f64a192698c4c114','2017-06-12 19:16:15'),(3,3,'AISHWARYA@REVATURE.COM','bac363ad53ee1c18f64a192698c4c114','2017-06-12 19:16:36'),(4,4,'VENKY@REVATURE.COM','bac363ad53ee1c18f64a192698c4c114','2017-06-12 19:17:02'),(5,5,'RADHA@REVATURE.COM','bac363ad53ee1c18f64a192698c4c114','2017-06-12 19:17:15'),(6,6,'MANI@REVATURE.COM','bac363ad53ee1c18f64a192698c4c114','2017-06-12 19:17:30'),(7,7,'AYNNA@MYNA.COM','b09390c75bd889904df0735cdf4d1f53','2017-06-14 06:44:19');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
