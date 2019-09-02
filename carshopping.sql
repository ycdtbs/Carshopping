/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 80016
Source Host           : localhost:3306
Source Database       : carshopping

Target Server Type    : MYSQL
Target Server Version : 80016
File Encoding         : 65001

Date: 2019-09-02 08:37:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Carnumber` varchar(255) DEFAULT NULL,
  `Carname` varchar(255) DEFAULT NULL,
  `Caridcard` varchar(255) DEFAULT NULL,
  `Carbrand` varchar(255) DEFAULT NULL,
  `Carpage` mediumtext,
  `Carstatue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  `Carsendtime` varchar(255) DEFAULT NULL,
  `Carbacktime` varchar(255) DEFAULT NULL,
  `Carsendmoney` varchar(255) DEFAULT NULL,
  `flag` varchar(2) DEFAULT '1',
  `CarIntroduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', 'car001', '标志403', '吉A0036', '2', 'car001.jpg', '2', null, null, '199', '1', 'color=红色   **zaikerenshu=4人**baigongliyouhao=1元**pailiang=1.5t**baoxian=是');
INSERT INTO `car` VALUES ('2', 'car002', 'mobel3', '吉A1234', '7', 'car002.webp', '2', null, null, '299', '1', 'color=黑色 **zaikerenshu=4人**baigongliyouhao=2元**pailiang=1.5t**baoxian=是');
INSERT INTO `car` VALUES ('3', 'car003', '大黄蜂', '吉A22034', '21', 'car003.png', '1', null, null, '199', '1', 'color=  红色 **zaikerenshu=4**baigongliyouhao=2**pailiang=2.5t**baoxian=否');
INSERT INTO `car` VALUES ('4', 'car007', '马自达3', '吉A1234', '2', 'car007.PNG', '1', null, null, '', '1', 'color=  红色 **zaikerenshu=  4人**baigongliyouhao=  1**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('5', 'car004', '哈佛', '吉A0018', '2', 'car004.PNG', '2', null, null, '299', '2', 'color=  **zaikerenshu=  **baigongliyouhao=  **pailiang=  **baoxian=  ');
INSERT INTO `car` VALUES ('6', 'car005', '中国3', '吉A1234', '2', 'car005.jpg', '2', null, null, '199', '1', 'color=白色 **zaikerenshu=  4人**baigongliyouhao=  1**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('7', 'car008', '奥迪A6', '吉A2089', '1', 'car008.PNG', '1', null, null, '299', '1', 'color=黑色 **zaikerenshu=  4人**baigongliyouhao=  1**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('8', 'car009', 'future1', '吉A8888', '7', 'car009.webp', '1', null, null, '200', '1', 'color=黑色 **zaikerenshu=  4**baigongliyouhao=  1.5t**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('9', 'changcheng', '中国3', '吉A22034', '21', null, '1', null, null, null, '2', 'color=  **zaikerenshu=  **baigongliyouhao=  **pailiang=  **baoxian=  ');
INSERT INTO `car` VALUES ('10', 'car0084', '中国3', '4', '21', null, '4', null, null, null, '2', 'color=  **zaikerenshu=  **baigongliyouhao=  **pailiang=  **baoxian=  ');
INSERT INTO `car` VALUES ('11', 'car0019', '中国3', '吉A22034', '2', 'car0019.png', '1', null, null, '299', '1', 'color=白色 **zaikerenshu=  4人**baigongliyouhao=  1.5t**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('12', 'car1173', '特斯拉未来', '吉A123433', '7', 'car1173.png', '3', null, null, '199', '1', 'color=黄色  **zaikerenshu=  4人**baigongliyouhao=1**pailiang=  1.5t**baoxian=  是');
INSERT INTO `car` VALUES ('13', 'car00234', '中国3', '吉A1234', '21', 'car00234.jpg', '1', null, null, '199', '1', 'color=红色                   **zaikerenshu= 4人**baigongliyouhao= 200元/km**pailiang= 1.5t**baoxian= 否');

-- ----------------------------
-- Table structure for carbrand
-- ----------------------------
DROP TABLE IF EXISTS `carbrand`;
CREATE TABLE `carbrand` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `Brandkey` varchar(255) DEFAULT NULL,
  `Carbrand` varchar(255) DEFAULT NULL,
  `Adress` varchar(255) DEFAULT NULL,
  `flag` int(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of carbrand
-- ----------------------------
INSERT INTO `carbrand` VALUES ('1', 'aodi', '奥迪', '德国', '1');
INSERT INTO `carbrand` VALUES ('2', 'baoma', '宝马', '德国', '1');
INSERT INTO `carbrand` VALUES ('3', 'fengtian', '丰田', '日本', '2');
INSERT INTO `carbrand` VALUES ('4', 'nisang', '尼桑', '日本', '1');
INSERT INTO `carbrand` VALUES ('5', 'bieke', '别克', '美国', '1');
INSERT INTO `carbrand` VALUES ('6', 'jiebao', '捷豹', '英国', '1');
INSERT INTO `carbrand` VALUES ('7', 'tesila', '特斯拉', '美国3456', '2');
INSERT INTO `carbrand` VALUES ('8', 'biyadi', '比亚迪3', '中国2长春2', '2');
INSERT INTO `carbrand` VALUES ('21', 'changcheng', '一汽奔腾', '中国3', '2');
INSERT INTO `carbrand` VALUES ('23', 'benten', '奔腾', '西藏', '1');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Customerrealname` varchar(255) DEFAULT NULL,
  `Customerpassword` varchar(255) DEFAULT NULL,
  `Customeridcardnumber` bigint(255) DEFAULT NULL,
  `Customertel` varchar(255) DEFAULT NULL,
  `Customeremail` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `onedaymoney` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', hhhh', '111111', '65435', '13331762996', 'ycdtbs@163.com', '1', null, null);
INSERT INTO `customer` VALUES ('2', '信息磊', '111111', '111111111111118888', '13331762998', '45@163.com', '1', null, null);
INSERT INTO `customer` VALUES ('3', '信息言', '111111', '111111', '1111111', '111111', '1', null, null);
INSERT INTO `customer` VALUES ('4', '信息蛋', '111111', '111111334', '1111', '1111', '1', null, null);
INSERT INTO `customer` VALUES ('5', '信息吉', '111111', '1111111', '111111', '111111', '1', null, null);
INSERT INTO `customer` VALUES ('7', '信息', '111111', '2', 'mimi@qq.com', '222222', null, null, null);
INSERT INTO `customer` VALUES ('12', '', '1', '1', '', '1', null, null, null);

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(30) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '张三', '女', '19', '北京');
INSERT INTO `employee` VALUES ('2', '李四', '男', '20', '上海');
INSERT INTO `employee` VALUES ('3', '王五', '女', '25', '广州');
INSERT INTO `employee` VALUES ('4', '薛六', '女', '20', '北京');
INSERT INTO `employee` VALUES ('5', '王五', '男', '22', '北京');
INSERT INTO `employee` VALUES ('6', '赵七', '男', '28', '上海');
INSERT INTO `employee` VALUES ('7', '张四', '女', '23', '北京');
INSERT INTO `employee` VALUES ('8', '张三2', '2女', '219', '北2京');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `Code` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Number` int(255) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable` (
  `Id` int(255) NOT NULL AUTO_INCREMENT,
  `Ordernumber` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Ordertime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Orderstatus` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  `Ordercar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Customer` varchar(255) DEFAULT NULL,
  `Orderplantsendtime` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Orderbacktime` varchar(255) DEFAULT NULL,
  `Orderyajin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `onedaymoney` varchar(255) DEFAULT NULL,
  `gemoney` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES ('15', '1567142919298', '2019-08-30', '1', 'car002', '654301uyyyyyy05', '2019-08-26', '2019-08-30', '2242.5', '299', null, '1');
INSERT INTO `ordertable` VALUES ('16', '1567143092864', '2019-08-30', '2', 'car001', '6543915', '2019-08-20', '2019-08-30', '2686.5', '199', '1990', '1');
INSERT INTO `ordertable` VALUES ('17', '1567144948668', '2019-08-30', '1', 'car001', '65430715', '2019-08-28', '2019-08-30', '1345.5', '299', null, '1');
INSERT INTO `ordertable` VALUES ('18', '1567151509195', '2019-08-30', '1', 'car001', '654315', '2019-08-30', null, '298.5', '199', null, '1');
INSERT INTO `ordertable` VALUES ('19', '1567152158661', '2019-08-30', '1', 'car005', '65430119970215', '2019-08-26', null, '895.5', '199', null, '1');
INSERT INTO `ordertable` VALUES ('20', '1567246359927', '2019-08-31', '1', 'car001', '65430119231215', '2019-08-27', null, '597', '199', null, '1');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usernumber` varchar(255) DEFAULT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `UserRoly` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '1',
  `Userphoto` varchar(255) DEFAULT NULL,
  `flag` varchar(255) DEFAULT '1',
  `Usersex` varchar(255) DEFAULT NULL,
  `Usertel` varchar(255) DEFAULT NULL,
  `Useraddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '管理员', '111111', '1', null, '1', '男', '11', '北京');
INSERT INTO `user` VALUES ('2', 'yg0001', '张小明', '111111', '2', null, '1', '女', '12', '天津');
INSERT INTO `user` VALUES ('3', 'yg0002', '李大强', '111111', '2', null, '1', '女', '13', '上海');
INSERT INTO `user` VALUES ('4', 'zg0001', '张主管', '111111', '3', null, '1', '女', '14', '迈阿密');
INSERT INTO `user` VALUES ('16', '1', '2', '1', '2', null, '1', '3', '4', '5');
INSERT INTO `user` VALUES ('17', 'test', '张五', null, '2', null, '1', '1', '14', '阿勒泰');
INSERT INTO `user` VALUES ('18', 'test1', '张主管233', null, '2', null, '1', '女', '14', '阿勒泰');
INSERT INTO `user` VALUES ('19', 'test2', '测试', null, '2', null, '1', '测试', '的是', '测试');
INSERT INTO `user` VALUES ('20', 'test3', '33', null, '3', null, '2', '33', '33', '33');
INSERT INTO `user` VALUES ('21', '1111111111111', '111111111111111', null, '3', null, '1', '111111111', '1111111111', '111111111');
INSERT INTO `user` VALUES ('22', '111', '11123430555', null, '2', null, '1', '11123440yy', '11123450', '11123456677880');
INSERT INTO `user` VALUES ('23', 'zg000155', '张主管5555', null, '3', null, '2', '55', '55', '555');
INSERT INTO `user` VALUES ('24', 'test233', '张主管', null, '3', null, '2', '1', '14', '阿勒泰');
INSERT INTO `user` VALUES ('25', 'test2344', '张主管', null, '3', null, '2', '女', '14', '阿勒泰');
INSERT INTO `user` VALUES ('26', 'meme', '1', null, '3', null, '2', '1', '14', '阿勒泰');
INSERT INTO `user` VALUES ('27', 'zg000133', '张主管', null, '3', null, '1', '1', '14', '迈阿密');
INSERT INTO `user` VALUES ('28', 'zg000133ttt', '张主管', null, '3', null, '1', '1', '14', 'tt');
