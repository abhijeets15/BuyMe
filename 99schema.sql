DROP DATABASE IF EXISTS `BuyMe`;
CREATE DATABASE `BuyMe`;
USE `BuyMe`;

DROP TABLE IF EXISTS `account`;
DROP TABLE IF EXISTS `staff`;
DROP TABLE IF EXISTS `administrator`;
DROP TABLE IF EXISTS `summary_sales_report`;
DROP TABLE IF EXISTS `customer_representative_creates`;
DROP TABLE IF EXISTS `generates`;
DROP TABLE IF EXISTS `service_request`;
DROP TABLE IF EXISTS `performs`;
DROP TABLE IF EXISTS `end_user`;
DROP TABLE IF EXISTS `requests`;
DROP TABLE IF EXISTS `archive`;
DROP TABLE IF EXISTS `views`;
DROP TABLE IF EXISTS `sub_category`;
DROP TABLE IF EXISTS `interacts`;
DROP TABLE IF EXISTS `seller`;
DROP TABLE IF EXISTS `item_auctions`;
DROP TABLE IF EXISTS `within`;
DROP TABLE IF EXISTS `amends`;
DROP TABLE IF EXISTS `retrieves`;
DROP TABLE IF EXISTS `buyer`;
DROP TABLE IF EXISTS `item_alert`;
DROP TABLE IF EXISTS `bid_posts_for`;
DROP TABLE IF EXISTS `removes`;
DROP TABLE IF EXISTS `bid_alert`;
DROP TABLE IF EXISTS `faq`;
DROP TABLE IF EXISTS `adjusts`;
DROP TABLE IF EXISTS `win_alert`;

CREATE TABLE `account` (
	`username` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	`email` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`username`));

CREATE TABLE `staff` (
	`staff_user` varchar(50) NOT NULL,
    FOREIGN KEY (`staff_user`) REFERENCES `account`(`username`) ON UPDATE CASCADE,
	PRIMARY KEY (`staff_user`));

CREATE TABLE `administrator` (
	`admin_user` varchar(50) NOT NULL,
    FOREIGN KEY (`admin_user`) REFERENCES `staff`(`staff_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`admin_user`));

CREATE TABLE `summary_sales_report` (
	`report_ID` int NOT NULL,
    `total_earnings` float,
    `best_selling_end_users` varchar(100),
    `best_selling_items` varchar(100),
    `earnings_per_end_user` float,
    `earnings_per_item` float,
    `earnings_per_item_type` float,
	PRIMARY KEY (`report_ID`));

CREATE TABLE `customer_representative_creates` (
	`customer_rep_user` varchar(50) NOT NULL,
    `admin_user` varchar(50) NOT NULL,
    FOREIGN KEY (`customer_rep_user`) REFERENCES `staff`(`staff_user`) ON UPDATE CASCADE,
    FOREIGN KEY (`admin_user`) REFERENCES `administrator`(`admin_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`customer_rep_user`));

CREATE TABLE `generates` (
	`report_ID` int NOT NULL,
    `admin_user` varchar(50) NOT NULL,
    FOREIGN KEY (`report_ID`) REFERENCES `summary_sales_report`(`report_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`admin_user`) REFERENCES `administrator`(`admin_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`report_ID`, `admin_user`));

CREATE TABLE `service_request` (
	`request_ID` int NOT NULL AUTO_INCREMENT,
    `user_request` varchar(255),
    `rep_feedback` varchar(255),
    `modified_user_data` varchar(255),
	PRIMARY KEY (`request_ID`));

CREATE TABLE `performs` (
	`request_ID` int NOT NULL,
    `customer_rep_user` varchar(50) NOT NULL,
    FOREIGN KEY (`request_ID`) REFERENCES `service_request`(`request_ID`) ON UPDATE CASCADE,
	FOREIGN KEY (`customer_rep_user`) REFERENCES `customer_representative_creates`(`customer_rep_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`request_ID`, `customer_rep_user`));

CREATE TABLE `end_user` (
	`member_user` varchar(50) NOT NULL,
    `name` varchar(100),
    `phone_number` varchar(15),
    `home_address` varchar(100),
    `transaction_history` varchar(255),
    `bid_on` varchar(255),
    `purchased` varchar(255),
    `auctioned` varchar(255),
    FOREIGN KEY (`member_user`) REFERENCES `account`(`username`) ON UPDATE CASCADE,
	PRIMARY KEY (`member_user`));

CREATE TABLE `requests` (
	`request_ID` int NOT NULL,
    `member_user` varchar(50) NOT NULL,
    FOREIGN KEY (`request_ID`) REFERENCES `service_request`(`request_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`member_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`request_ID`));

CREATE TABLE `archive` (
	`archive_ID` int NOT NULL AUTO_INCREMENT,
    `end_user_history` varchar(255),
    `bought` varchar(255),
    `sold` varchar(255),
    `item_history` varchar(255),
    `selling_price` float,
    `list_of_bids` varchar(255),
    `similar_items` varchar(255),
	PRIMARY KEY (`archive_ID`));

CREATE TABLE `views` (
	`archive_ID` int NOT NULL,
    `member_user` varchar(50) NOT NULL,
    FOREIGN KEY (`archive_ID`) REFERENCES `archive`(`archive_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`member_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`archive_ID`, `member_user`));

CREATE TABLE `sub_category` (
	`sub_category_name` varchar(100) NOT NULL,
	PRIMARY KEY (`sub_category_name`));

CREATE TABLE `interacts` (
	`member_user` varchar(50) NOT NULL,
	`sub_category_name` varchar(100) NOT NULL,
    FOREIGN KEY (`member_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
    FOREIGN KEY (`sub_category_name`) REFERENCES `sub_category`(`sub_category_name`) ON UPDATE CASCADE,
	PRIMARY KEY (`member_user`, `sub_category_name`));

CREATE TABLE `seller` (
	`seller_user` varchar(50) NOT NULL,
	`bank_account_number` varchar(18) NOT NULL,
    `bank_routing_number` varchar(9) NOT NULL,
    FOREIGN KEY (`seller_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`seller_user`));

CREATE TABLE `item_auctions` (
	`auction_ID` int NOT NULL AUTO_INCREMENT,
    `seller_user` varchar(50) NOT NULL,
    `post_date` date,
    `expiration_date` date,
    `expiration_time` time,
    `leading_bid` float,
	`initial_bid` float,
    `bid_increment` float,
    `minimum_price` float,
    `material` varchar(30),
    `color` varchar(30),
    `size` varchar(30),
    `type` varchar(30),
    `brand` varchar(30),
    `item_condition` varchar(30),
    `serial` varchar(30),
    FOREIGN KEY (`seller_user`) REFERENCES `seller`(`seller_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`auction_ID`));

CREATE TABLE `within` (
	`auction_ID` int NOT NULL,
    `sub_category_name` varchar(100) NOT NULL,
    FOREIGN KEY (`auction_ID`) REFERENCES `item_auctions`(`auction_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`sub_category_name`) REFERENCES `sub_category`(`sub_category_name`) ON UPDATE CASCADE,
	PRIMARY KEY (`auction_ID`, `sub_category_name`));

CREATE TABLE `amends` (
	`request_ID` int NOT NULL,
    `auction_ID` int NOT NULL,
    FOREIGN KEY (`request_ID`) REFERENCES `service_request`(`request_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`auction_ID`) REFERENCES `item_auctions`(`auction_ID`) ON UPDATE CASCADE,
	PRIMARY KEY (`request_ID`, `auction_ID`));

CREATE TABLE `retrieves` (
	`member_user` varchar(50) NOT NULL,
    `archive_ID` int NOT NULL,
    `auction_ID` int NOT NULL,
    FOREIGN KEY (`member_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
    FOREIGN KEY (`archive_ID`) REFERENCES `archive`(`archive_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`auction_ID`) REFERENCES `item_auctions`(`auction_ID`) ON UPDATE CASCADE,
	PRIMARY KEY (`member_user`, `archive_ID`, `auction_ID`));

CREATE TABLE `buyer` (
	`buyer_user` varchar(50) NOT NULL,
	`shipping_address` varchar(100) NOT NULL,
    FOREIGN KEY (`buyer_user`) REFERENCES `end_user`(`member_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`buyer_user`));

CREATE TABLE `item_alert` (
	`alertID` int NOT NULL,
	`buyer_user` varchar(50) NOT NULL,
    `desired_material` varchar(30),
    `desired_color` varchar(30),
    `desired_size` varchar(30),
    `desired_type` varchar(30),
    `desired_brand` varchar(30),
    `desired_condition` varchar(30),
    `desired_serial` varchar(30),
    FOREIGN KEY (`buyer_user`) REFERENCES `buyer`(`buyer_user`) ON UPDATE CASCADE,
	PRIMARY KEY (`alertID`));

CREATE TABLE `bid_posts_for` (
	`bid_number` int NOT NULL AUTO_INCREMENT,
	`buyer_user` varchar(50) NOT NULL,
    `auction_ID` int NOT NULL,
	`post_date` date,
    `post_time` time,
    `current_bid` float,
    `bid_limit` float,
    FOREIGN KEY (`buyer_user`) REFERENCES `buyer`(`buyer_user`) ON UPDATE CASCADE,
    FOREIGN KEY (`auction_ID`) REFERENCES `item_auctions`(`auction_ID`) ON UPDATE CASCADE,
	PRIMARY KEY (`bid_number`, `auction_ID`));

CREATE TABLE `removes` (
	`request_ID` int NOT NULL,
	`bid_number` int NOT NULL,
    `auction_ID` int NOT NULL,
    FOREIGN KEY (`request_ID`) REFERENCES `service_request`(`request_ID`) ON UPDATE CASCADE,
    FOREIGN KEY (`bid_number`) REFERENCES `bid_posts_for`(`bid_number`) ON UPDATE CASCADE,
	PRIMARY KEY (`request_ID`, `bid_number`, `auction_ID`));

CREATE TABLE `bid_alert` (
	`buyer_user` varchar(50) NOT NULL,
	`bid_number` int NOT NULL,
    `auction_ID` int NOT NULL,
    FOREIGN KEY (`buyer_user`) REFERENCES `buyer`(`buyer_user`) ON UPDATE CASCADE,
    FOREIGN KEY (`bid_number`) REFERENCES `bid_posts_for`(`bid_number`) ON UPDATE CASCADE,
	PRIMARY KEY (`buyer_user`, `bid_number`, `auction_ID`));
    
CREATE TABLE `faq` (
	`faq_ID` int NOT NULL AUTO_INCREMENT,
    `question` varchar(255),
    `answer` varchar(255),
    PRIMARY KEY (`faq_ID`));
    
CREATE TABLE `adjusts` (
	`faq_ID` int NOT NULL,
    `customer_rep_user` varchar(50),
    FOREIGN KEY (`faq_ID`) REFERENCES `faq`(`faq_ID`) ON UPDATE CASCADE,
	FOREIGN KEY (`customer_rep_user`) REFERENCES `customer_representative_creates`(`customer_rep_user`) ON UPDATE CASCADE,
    PRIMARY KEY (`faq_ID`));

CREATE TABLE `win_alert` (
	`auction_ID` int NOT NULL,
    `buyer_user` varchar(50),
    `bid_number` int,
    `acknowledged` bit,
    FOREIGN KEY (`auction_ID`) REFERENCES `item_auctions`(`auction_ID`),
    PRIMARY KEY (`auction_ID`));

LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES ('Admin','adminpass','admin@buyme.com');
INSERT INTO `account` VALUES ('Rep1','rep1pass','rep1@buyme.com');
INSERT INTO `account` VALUES ('Rep2','rep2pass','rep2@buyme.com');
INSERT INTO `account` VALUES ('Shaggy','zoinks','snackmaster@scoobs.com');
INSERT INTO `account` VALUES ('Velma','jinkies','mysterylover@scoobs.com');
INSERT INTO `account` VALUES ('Daphne','creepers','fashionsense@scoobs.com');
INSERT INTO `account` VALUES ('Fred','splitup','nosense@scoobs.com');
INSERT INTO `account` VALUES ('DaRock','jabroni','ironchef@wwe.com');
INSERT INTO `account` VALUES ('JCena','cantseeme','blindghost@wwe.com');
UNLOCK TABLES;

LOCK TABLES `staff` WRITE;
INSERT INTO `staff` VALUES ('Admin');
INSERT INTO `staff` VALUES ('Rep1');
INSERT INTO `staff` VALUES ('Rep2');
UNLOCK TABLES;

LOCK TABLES `administrator` WRITE;
INSERT INTO `administrator` VALUES ('Admin');
UNLOCK TABLES;

/* 6 End Users, 12 Items, 3 Item Types */
LOCK TABLES `summary_sales_report` WRITE;
INSERT INTO `summary_sales_report` VALUES (202201, 26222.64, 'DaRock', 'Pebbles', 4370.44, 2185.22, 8740.88);
INSERT INTO `summary_sales_report` VALUES (202202, 30760.32, 'Velma', 'Round Glasses', 5126.72, 2563.36, 10253.44);
INSERT INTO `summary_sales_report` VALUES (202203, 22920.60, 'JCena', 'Sunglasses', 3820.10, 1910.05, 7640.20);
INSERT INTO `summary_sales_report` VALUES (202204, 29304.00, 'Shaggy', 'Lava Lamp', 4884.00, 2442.00, 9768.00);
UNLOCK TABLES;

LOCK TABLES `customer_representative_creates` WRITE;
INSERT INTO `customer_representative_creates` VALUES ('Rep1', 'Admin');
INSERT INTO `customer_representative_creates` VALUES ('Rep2', 'Admin');
UNLOCK TABLES;

LOCK TABLES `generates` WRITE;
INSERT INTO `generates` VALUES (202201, 'Admin');
INSERT INTO `generates` VALUES (202202, 'Admin');
INSERT INTO `generates` VALUES (202203, 'Admin');
INSERT INTO `generates` VALUES (202204, 'Admin');
UNLOCK TABLES;

LOCK TABLES `service_request` WRITE;
INSERT INTO `service_request` VALUES (40401, 'Insufficent pebbles for auction', 'User request was approved', 'Removed boulders auction');
INSERT INTO `service_request` VALUES (40402, 'Want to increase quantity of items up for auction', 'User request was denied', 'No action performed');
INSERT INTO `service_request` VALUES (40403, 'Please decrease the bid increment by $10.00', 'User request was approved', 'Modified bid increment');
INSERT INTO `service_request` VALUES (40404, 'Please remove my bid of $300 on 2022/03/18', 'User request was approved', 'Removed Bid');
INSERT INTO `service_request` VALUES (40405, 'Please remove my bid of $380 on 2022/04/19', '', '');
UNLOCK TABLES;

LOCK TABLES `performs` WRITE;
INSERT INTO `performs` VALUES (40401, 'Rep1');
INSERT INTO `performs` VALUES (40402, 'Rep1');
INSERT INTO `performs` VALUES (40403, 'Rep2');
INSERT INTO `performs` VALUES (40404, 'Rep2');
UNLOCK TABLES;

LOCK TABLES `end_user` WRITE;
INSERT INTO `end_user` VALUES ('Shaggy', 'Shaggy Rogers', '555-366-7449', '52 Spooner St, Crystal Cove, CA', '', '', '', '');
INSERT INTO `end_user` VALUES ('Velma', 'Velma Dinkley', '555-366-8562', '75 Loose Ln, Crystal Cove, CA', '', '', '', '');
INSERT INTO `end_user` VALUES ('Daphne', 'Daphne Blake', '555-366-3746', '37 Broken Blvd, Crystal Cove, CA', '', '', '', '');
INSERT INTO `end_user` VALUES ('Fred', 'Fred Jones', '555-366-3733', '23 Arrow Ave, Crystal Cove, CA', '', '', '', '');
INSERT INTO `end_user` VALUES ('DaRock', 'Dwayne Johnson', '555-843-7625', '420 Blazing Gdns, Powder Springs, GA', '', '', '', '');
INSERT INTO `end_user` VALUES ('JCena', 'John Cena', '555-733-2362', '202 Gator Byu, Land O Lakes, FL', '', '', '', '');
UNLOCK TABLES;

LOCK TABLES `requests` WRITE;
INSERT INTO `requests` VALUES (40401, 'DaRock');
INSERT INTO `requests` VALUES (40402, 'Velma');
INSERT INTO `requests` VALUES (40403, 'JCena');
INSERT INTO `requests` VALUES (40404, 'Velma');
INSERT INTO `requests` VALUES (40405, 'Fred');
UNLOCK TABLES;

LOCK TABLES `archive` WRITE;
INSERT INTO `archive` VALUES (20001, 'DaRock Selling Pebbles', 'Two', 'Fourteen', 'No Historic Attributes', 180.00, 'Daphne: 20, Velma: 50, JCena: 80, Daphne: 100, Velma: 150, JCena: 170, Daphne: 180', 'Boulders');
INSERT INTO `archive` VALUES (20002, 'Velma Selling Round Glasses', 'Three', 'Twenty-Two', 'No Historic Attributes', 360.00, 'Daphne: 180, DaRock: 220, JCena: 260, Daphne: 310, JCena: 360', 'Sunglasses');
INSERT INTO `archive` VALUES (20003, 'JCena Selling Sunglasses', 'Two', 'Eighteen', 'No Historic Attributes', 320.00, 'Velma: 200, Fred: 220, Shaggy: 250, Fred: 280, Velma: 300, Shaggy: 330, Fred: 360', 'Round Glasses');
INSERT INTO `archive` VALUES (20004, 'Shaggy Selling Lava Lamps', 'None', 'Twelve', 'No Historic Attributes', 450.00, 'Fred: 200, Velma: 230, Fred: 260, DaRock: 290, Velma: 350, Fred: 380, DaRock: 420, Velma: 450', 'Himalayan Salt Lamp');
UNLOCK TABLES;

LOCK TABLES `views` WRITE;
INSERT INTO `views` VALUES (20001, 'Velma');
INSERT INTO `views` VALUES (20001, 'Daphne');
INSERT INTO `views` VALUES (20001, 'DaRock');
INSERT INTO `views` VALUES (20001, 'JCena');
INSERT INTO `views` VALUES (20002, 'Velma');
INSERT INTO `views` VALUES (20002, 'Daphne');
INSERT INTO `views` VALUES (20002, 'DaRock');
INSERT INTO `views` VALUES (20002, 'JCena');
INSERT INTO `views` VALUES (20003, 'Shaggy');
INSERT INTO `views` VALUES (20003, 'Velma');
INSERT INTO `views` VALUES (20003, 'Fred');
INSERT INTO `views` VALUES (20003, 'JCena');
INSERT INTO `views` VALUES (20004, 'Shaggy');
INSERT INTO `views` VALUES (20004, 'Velma');
INSERT INTO `views` VALUES (20004, 'Fred');
INSERT INTO `views` VALUES (20004, 'DaRock');
UNLOCK TABLES;

LOCK TABLES `sub_category` WRITE;
INSERT INTO `sub_category` VALUES ('Rocks');
INSERT INTO `sub_category` VALUES ('Lamps');
INSERT INTO `sub_category` VALUES ('Glasses');
UNLOCK TABLES;

LOCK TABLES `interacts` WRITE;
INSERT INTO `interacts` VALUES ('Shaggy', 'Rocks');
INSERT INTO `interacts` VALUES ('Shaggy', 'Lamps');
INSERT INTO `interacts` VALUES ('Shaggy', 'Glasses');
INSERT INTO `interacts` VALUES ('Velma', 'Rocks');
INSERT INTO `interacts` VALUES ('Velma', 'Lamps');
INSERT INTO `interacts` VALUES ('Velma', 'Glasses');
INSERT INTO `interacts` VALUES ('Daphne', 'Rocks');
INSERT INTO `interacts` VALUES ('Daphne', 'Lamps');
INSERT INTO `interacts` VALUES ('Daphne', 'Glasses');
INSERT INTO `interacts` VALUES ('Fred', 'Rocks');
INSERT INTO `interacts` VALUES ('Fred', 'Lamps');
INSERT INTO `interacts` VALUES ('Fred', 'Glasses');
INSERT INTO `interacts` VALUES ('DaRock', 'Rocks');
INSERT INTO `interacts` VALUES ('DaRock', 'Lamps');
INSERT INTO `interacts` VALUES ('DaRock', 'Glasses');
INSERT INTO `interacts` VALUES ('JCena', 'Rocks');
INSERT INTO `interacts` VALUES ('JCena', 'Lamps');
INSERT INTO `interacts` VALUES ('JCena', 'Glasses');
UNLOCK TABLES;

LOCK TABLES `seller` WRITE;
INSERT INTO `seller` VALUES ('Shaggy', '1001001234', '123123123');
INSERT INTO `seller` VALUES ('Velma', '1001005678', '321321321');
INSERT INTO `seller` VALUES ('DaRock', '1002004321', '123456789');
INSERT INTO `seller` VALUES ('JCena', '1002008765', '987654321');
UNLOCK TABLES;

LOCK TABLES `item_auctions` WRITE;
INSERT INTO `item_auctions` VALUES (9001, 'DaRock','2022-01-10', '2022-01-23', '23:00:00', 180.00, 10.00, 10.00, 100.00, '', '', '', '', '', '', '');
INSERT INTO `item_auctions` VALUES (9002, 'Velma','2022-04-11', '2022-04-21', '20:45:00', 360.00,  150.00, 30.00, 300.00, '', '', '', '', '', '', '');
INSERT INTO `item_auctions` VALUES (9003, 'JCena','2022-04-15', '2022-04-25', '18:30:00', 360.00, 180.00, 20.00, 280.00, '', '', '', '', '', '', '');
INSERT INTO `item_auctions` VALUES (9004, 'Shaggy','2022-01-12', '2022-04-20', '23:59:59', 450.00, 170.00, 30.00, 350.00, '', '', '', '', '', '', '');
UNLOCK TABLES;

LOCK TABLES `within` WRITE;
INSERT INTO `within` VALUES (9001, 'Rocks');
INSERT INTO `within` VALUES (9002, 'Glasses');
INSERT INTO `within` VALUES (9003, 'Glasses');
INSERT INTO `within` VALUES (9004, 'Lamps');
UNLOCK TABLES;

LOCK TABLES `amends` WRITE;
INSERT INTO `amends` VALUES (40401, 9001);
INSERT INTO `amends` VALUES (40402, 9002);
INSERT INTO `amends` VALUES (40403, 9003);
UNLOCK TABLES;

LOCK TABLES `retrieves` WRITE;
INSERT INTO `retrieves` VALUES ('DaRock', 20001, 9001);
INSERT INTO `retrieves` VALUES ('Velma', 20002, 9002);
INSERT INTO `retrieves` VALUES ('JCena', 20003, 9003);
INSERT INTO `retrieves` VALUES ('Shaggy', 20004, 9004);
UNLOCK TABLES;

LOCK TABLES `buyer` WRITE;
INSERT INTO `buyer` VALUES ('Shaggy', '52 Spooner St, Crystal Cove, CA');
INSERT INTO `buyer` VALUES ('Velma', '75 Loose Ln, Crystal Cove, CA');
INSERT INTO `buyer` VALUES ('Daphne', '37 Broken Blvd, Crystal Cove, CA');
INSERT INTO `buyer` VALUES ('Fred', '23 Arrow Ave, Crystal Cove, CA');
INSERT INTO `buyer` VALUES ('DaRock', '420 Blazing Gdns, Powder Springs, GA');
INSERT INTO `buyer` VALUES ('JCena', '202 Gator Byu, Land O Lakes, FL');
UNLOCK TABLES;

LOCK TABLES `item_alert` WRITE;
INSERT INTO `item_alert` VALUES (1,'Shaggy', 'Glasses', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (2,'Velma', 'Rocks', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (3,'Velma', 'Lamps', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (4,'Velma', 'Glasses', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (5,'Daphne', 'Rocks', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (6,'Daphne', 'Glasses', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (7,'Fred', 'Glasses', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (8,'Fred', 'Lamps', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (9,'DaRock', 'Rocks', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (10,'DaRock', 'Glasses', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (11,'DaRock', 'Lamps', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (12,'JCena', 'Rocks', '', '', '', '', '', '');
INSERT INTO `item_alert` VALUES (13,'JCena', 'Glasses', '', '', '', '', '', '');
UNLOCK TABLES;

LOCK TABLES `bid_posts_for` WRITE;
INSERT INTO `bid_posts_for` VALUES (50001, 'Daphne', 9001, '2022-01-07', '12:29:47', 20.00, 200.00);
INSERT INTO `bid_posts_for` VALUES (50002, 'Velma', 9001, '2022-01-08', '09:46:28', 50.00, 160.00);
INSERT INTO `bid_posts_for` VALUES (50003, 'JCena', 9001, '2022-01-10', '17:15:22', 80.00, 180.00);
INSERT INTO `bid_posts_for` VALUES (50004, 'Daphne', 9001, '2022-01-11', '12:29:35', 100.00, 200.00);
INSERT INTO `bid_posts_for` VALUES (50005, 'Velma', 9001, '2022-01-13', '08:07:23', 150.00, 160.00);
INSERT INTO `bid_posts_for` VALUES (50006, 'JCena', 9001, '2022-01-15', '15:23:56', 170.00, 180.00);
INSERT INTO `bid_posts_for` VALUES (50007, 'Daphne', 9001, '2022-01-18', '12:55:18', 180.00, 200.00);
INSERT INTO `bid_posts_for` VALUES (50008, 'Daphne', 9002, '2022-02-15', '11:11:39', 180.00, 320.00);
INSERT INTO `bid_posts_for` VALUES (50009, 'DaRock', 9002, '2022-02-17', '06:05:25', 220.00, 250.00);
INSERT INTO `bid_posts_for` VALUES (50010, 'JCena', 9002, '2022-02-18', '15:17:01', 260.00, 380.00);
INSERT INTO `bid_posts_for` VALUES (50011, 'Daphne', 9002, '2022-02-20', '14:11:16', 310.00, 320.00);
INSERT INTO `bid_posts_for` VALUES (50012, 'JCena', 9002, '2022-02-20', '17:50:59', 360.00, 380.00);
INSERT INTO `bid_posts_for` VALUES (50013, 'Velma', 9003, '2022-03-07', '06:04:58', 200.00, 320.00);
INSERT INTO `bid_posts_for` VALUES (50014, 'Fred', 9003, '2022-03-09', '18:44:57', 220.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50015, 'Shaggy', 9003, '2022-03-10', '14:40:43', 250.00, 350.00);
INSERT INTO `bid_posts_for` VALUES (50016, 'Fred', 9003, '2022-03-13', '22:40:18', 280.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50017, 'Velma', 9003, '2022-03-18', '09:06:24', 300.00, 320.00);
INSERT INTO `bid_posts_for` VALUES (50018, 'Shaggy', 9003, '2022-03-20', '17:27:30', 330.00, 350.00);
INSERT INTO `bid_posts_for` VALUES (50019, 'Fred', 9003, '2022-03-23', '17:11:15', 360.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50020, 'Fred', 9004, '2022-04-16', '22:21:31', 200.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50021, 'Velma', 9004, '2022-04-17', '09:08:49', 230.00, 500.00);
INSERT INTO `bid_posts_for` VALUES (50022, 'Fred', 9004, '2022-04-17', '15:08:05', 260.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50023, 'DaRock', 9004, '2022-04-18', '06:53:23', 290.00, 440.00);
INSERT INTO `bid_posts_for` VALUES (50024, 'Velma', 9004, '2022-04-18', '12:58:51', 350.00, 500.00);
INSERT INTO `bid_posts_for` VALUES (50025, 'Fred', 9004, '2022-04-19', '16:01:24', 380.00, 400.00);
INSERT INTO `bid_posts_for` VALUES (50026, 'DaRock', 9004, '2022-04-20', '20:53:12', 420.00, 440.00);
INSERT INTO `bid_posts_for` VALUES (50027, 'Velma', 9004, '2022-04-20', '21:10:18', 450.00, 500.00);
UNLOCK TABLES;

LOCK TABLES `removes` WRITE;
INSERT INTO `removes` VALUES (40404, 50017, 9003);
INSERT INTO `removes` VALUES (40405, 50025, 9004);
UNLOCK TABLES;

LOCK TABLES `bid_alert` WRITE;
INSERT INTO `bid_alert` VALUES ('Velma', 50006, 9001);
INSERT INTO `bid_alert` VALUES ('JCena', 50007, 9001);
INSERT INTO `bid_alert` VALUES ('DaRock', 50010, 9002);
INSERT INTO `bid_alert` VALUES ('Daphne', 50012, 9002);
INSERT INTO `bid_alert` VALUES ('Velma', 50018, 9003);
INSERT INTO `bid_alert` VALUES ('Shaggy', 50019, 9003);
INSERT INTO `bid_alert` VALUES ('Fred', 50025, 9004);
INSERT INTO `bid_alert` VALUES ('DaRock', 50026, 9004);
UNLOCK TABLES;

LOCK TABLES `faq` WRITE;
INSERT INTO `faq` VALUES (1, 'How do I delete a bid?', 'Please submit a service request with the bid number you want removed. Please know that bids will not be removed if request is made after their auction has closed.');
INSERT INTO `faq` VALUES (2, 'How do I delete an auction?', 'Please submit a service request with the auction id you want removed. Please note that only your auctions will be deleted and only if they have not expired.');
UNLOCK TABLES;

LOCK TABLES `adjusts` WRITE;
INSERT INTO `adjusts` VALUES (1, 'Rep1');
INSERT INTO `adjusts` VALUES (2, 'Rep2');
UNLOCK TABLES;