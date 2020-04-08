DROP TABLE blanks;

CREATE TABLE `blanks` (
  `blank_ID` int(10) NOT NULL AUTO_INCREMENT,
  `blank_Type` int(3) DEFAULT NULL,
  `blank_Advisor_ID` int(10) DEFAULT NULL,
  `blank_Manager_ID` int(10) DEFAULT NULL,
  `blank_Date` int(8) DEFAULT NULL,
  PRIMARY KEY (`blank_ID`),
  KEY `blank_Advisor_ID` (`blank_Advisor_ID`),
  KEY `blank_Manager_ID` (`blank_Manager_ID`),
  CONSTRAINT `blanks_ibfk_1` FOREIGN KEY (`blank_Advisor_ID`) REFERENCES `staff` (`staff_ID`),
  CONSTRAINT `blanks_ibfk_2` FOREIGN KEY (`blank_Manager_ID`) REFERENCES `staff` (`staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO blanks VALUES("1","444","201","201","3032020");
INSERT INTO blanks VALUES("2","101","200","","3032020");
INSERT INTO blanks VALUES("3","101","201","","3032020");
INSERT INTO blanks VALUES("5","101","201","","3032020");
INSERT INTO blanks VALUES("6","101","201","","3032020");
INSERT INTO blanks VALUES("7","444","201","","3032020");
INSERT INTO blanks VALUES("8","444","201","","3032020");
INSERT INTO blanks VALUES("9","444","201","","3032020");
INSERT INTO blanks VALUES("10","444","201","","10032020");
INSERT INTO blanks VALUES("11","201","201","201","3032020");
INSERT INTO blanks VALUES("12","201","201","201","3032020");
INSERT INTO blanks VALUES("13","201","201","201","3032020");
INSERT INTO blanks VALUES("14","201","201","201","3032020");
INSERT INTO blanks VALUES("15","201","201","201","3032020");
INSERT INTO blanks VALUES("16","444","","","7042020");
INSERT INTO blanks VALUES("17","444","","","7042020");
INSERT INTO blanks VALUES("18","444","","","7042020");
INSERT INTO blanks VALUES("19","444","","","7042020");
INSERT INTO blanks VALUES("20","444","","","7042020");
INSERT INTO blanks VALUES("21","444","","","7042020");
INSERT INTO blanks VALUES("22","444","","","7042020");
INSERT INTO blanks VALUES("23","444","","","7042020");
INSERT INTO blanks VALUES("24","444","","","7042020");
INSERT INTO blanks VALUES("25","444","","","7042020");



DROP TABLE coupons;

CREATE TABLE `coupons` (
  `coupon_ID` int(10) NOT NULL AUTO_INCREMENT,
  `blank_ID` int(10) NOT NULL,
  `ticket_ID` int(10) NOT NULL,
  `coupon_Number` int(8) DEFAULT NULL,
  `coupon_Origin` text DEFAULT NULL,
  `coupon_Destination` text DEFAULT NULL,
  `coupon_Time` time DEFAULT NULL,
  `coupon_Date` date DEFAULT NULL,
  PRIMARY KEY (`coupon_ID`),
  KEY `ticket_ID` (`ticket_ID`),
  KEY `blank_ID` (`blank_ID`),
  CONSTRAINT `coupons_ibfk_1` FOREIGN KEY (`blank_ID`) REFERENCES `blanks` (`blank_ID`),
  CONSTRAINT `coupons_ibfk_2` FOREIGN KEY (`ticket_ID`) REFERENCES `tickets` (`ticket_ID`),
  CONSTRAINT `coupons_ibfk_3` FOREIGN KEY (`blank_ID`) REFERENCES `blanks` (`blank_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

INSERT INTO coupons VALUES("20","3","81","0","Jebnai","Mert\'s Ass","00:59:00","2020-04-05");
INSERT INTO coupons VALUES("23","8","82","0","","","00:00:00","0000-00-00");
INSERT INTO coupons VALUES("36","5","83","0","London","Berlin","23:00:00","2020-03-28");
INSERT INTO coupons VALUES("39","6","84","0","London","Berlin","23:00:00","2020-03-19");
INSERT INTO coupons VALUES("40","9","85","0","London","Berlin","21:00:00","2020-03-28");
INSERT INTO coupons VALUES("41","10","86","0","Jebnai","Berlin","00:59:00","2020-03-28");



DROP TABLE currency;

CREATE TABLE `currency` (
  `currency_ID` int(10) NOT NULL AUTO_INCREMENT,
  `currency_Name` varchar(20) NOT NULL,
  `currency_Rate` decimal(10,0) NOT NULL,
  PRIMARY KEY (`currency_ID`),
  UNIQUE KEY `currency_Name` (`currency_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO currency VALUES("1","Dollars","1");
INSERT INTO currency VALUES("2","Argentinean Pesos","67");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_ID` int(10) NOT NULL AUTO_INCREMENT,
  `customer_Type` varchar(8) DEFAULT NULL,
  `customer_Name` tinytext DEFAULT NULL,
  `customer_Surname` tinytext DEFAULT NULL,
  `customer_Email` varchar(50) NOT NULL,
  `customer_LP` date DEFAULT NULL,
  `customer_Debt` int(11) DEFAULT NULL,
  `discount_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`customer_ID`),
  KEY `discount_ID` (`discount_ID`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`discount_ID`) REFERENCES `discounts` (`discount_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO customers VALUES("1","Valued","Jebnai","Beyene","","2020-02-20","500","1");
INSERT INTO customers VALUES("2","Regular ","Ivan","Bosch","bosch.ivan99@gmail.com","2020-01-15","9000","");



DROP TABLE discounts;

CREATE TABLE `discounts` (
  `discount_ID` int(10) NOT NULL AUTO_INCREMENT,
  `discount_Type` varchar(10) DEFAULT NULL,
  `discount_Amount` double DEFAULT NULL,
  PRIMARY KEY (`discount_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO discounts VALUES("1","Flex","1000");



DROP TABLE log_in;

CREATE TABLE `log_in` (
  `login_username` smallint(6) NOT NULL,
  `login_password` longtext NOT NULL,
  `staff_ID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`login_username`),
  UNIQUE KEY `login_username` (`login_username`),
  UNIQUE KEY `staff_ID` (`staff_ID`),
  CONSTRAINT `log_in_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

INSERT INTO log_in VALUES("0","$2y$10$Y7liE8tjxkUi3X8XVwOFUO3rqV9zWXhj04/nWQ/c7YQeHkqgsMBgq","202");
INSERT INTO log_in VALUES("666","$2y$10$kwabMMsrmxCcYxlXV10alOD09soFKmcJwqOJGn7nahjCEsTFQQu7G","201");



DROP TABLE sales;

CREATE TABLE `sales` (
  `sales_ID` int(10) NOT NULL AUTO_INCREMENT,
  `sales_Type` varchar(10) NOT NULL,
  `staff_ID` int(10) NOT NULL,
  `currency_ID` int(10) NOT NULL,
  `currency_Rate` decimal(10,0) NOT NULL,
  `customer_ID` int(10) NOT NULL,
  `ticket_ID` int(10) NOT NULL,
  `sales_Charge` decimal(11,0) NOT NULL,
  `payment_Type` varchar(10) NOT NULL,
  `card_Digits` int(4) DEFAULT NULL,
  PRIMARY KEY (`sales_ID`),
  UNIQUE KEY `sales_ID` (`sales_ID`),
  UNIQUE KEY `ticket_ID` (`ticket_ID`),
  KEY `staff_ID` (`staff_ID`),
  KEY `currency_ID` (`currency_ID`),
  KEY `customer_ID` (`customer_ID`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`staff_ID`) REFERENCES `staff` (`staff_ID`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`currency_ID`) REFERENCES `currency` (`currency_ID`),
  CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`ticket_ID`) REFERENCES `tickets` (`ticket_ID`),
  CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`customer_ID`) REFERENCES `customers` (`customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

INSERT INTO sales VALUES("2","Interline","201","2","67","2","83","3","Card","9999");
INSERT INTO sales VALUES("3","Interline","201","1","1","2","85","1","Cash","0");
INSERT INTO sales VALUES("5","Interline","201","1","1","2","86","1","Cash","0");



DROP TABLE staff;

CREATE TABLE `staff` (
  `staff_ID` int(10) NOT NULL AUTO_INCREMENT,
  `staff_Type` tinytext NOT NULL,
  `staff_Name` tinytext DEFAULT NULL,
  `staff_Surname` tinytext DEFAULT NULL,
  `staff_Email` varchar(100) DEFAULT NULL,
  `staff_Commission` int(2) NOT NULL,
  PRIMARY KEY (`staff_ID`),
  UNIQUE KEY `staff_ID` (`staff_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=latin1;

INSERT INTO staff VALUES("200","Advisor","555","555","123@gmail.com","0");
INSERT INTO staff VALUES("201","Advisor","666","666","bosch.ivan99@gmail.com","0");
INSERT INTO staff VALUES("202","Administrator","Martin","Ivanov","123@Password.bg","0");



DROP TABLE tickets;

CREATE TABLE `tickets` (
  `ticket_ID` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ticket_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=latin1;

INSERT INTO tickets VALUES("81");
INSERT INTO tickets VALUES("82");
INSERT INTO tickets VALUES("83");
INSERT INTO tickets VALUES("84");
INSERT INTO tickets VALUES("85");
INSERT INTO tickets VALUES("86");
INSERT INTO tickets VALUES("87");
INSERT INTO tickets VALUES("88");
INSERT INTO tickets VALUES("89");
INSERT INTO tickets VALUES("90");
INSERT INTO tickets VALUES("151");
INSERT INTO tickets VALUES("152");
INSERT INTO tickets VALUES("153");
INSERT INTO tickets VALUES("154");
INSERT INTO tickets VALUES("155");



