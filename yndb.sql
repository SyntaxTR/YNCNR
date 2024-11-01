/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100406
 Source Host           : localhost:3306
 Source Schema         : yndb

 Target Server Type    : MySQL
 Target Server Version : 100406
 File Encoding         : 65001

 Date: 01/11/2024 19:10:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for bannedplayers
-- ----------------------------
DROP TABLE IF EXISTS `bannedplayers`;
CREATE TABLE `bannedplayers`  (
  `Id` int NOT NULL AUTO_INCREMENT,
  `UserId` int NULL DEFAULT NULL,
  `AdminId` int NULL DEFAULT NULL,
  `Reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Time` int NULL DEFAULT NULL,
  `AddTime` int NULL DEFAULT NULL,
  `Type` enum('Permanent','Temporary') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `UnbannedBy` int NULL DEFAULT NULL,
  `UnBannedTime` int NULL DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `Time` datetime NULL DEFAULT current_timestamp,
  `Type` enum('Vergi','Banka','Transfer','Olaylar','AdminKomut','Paraver','Evsil') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for player_ip_addresses
-- ----------------------------
DROP TABLE IF EXISTS `player_ip_addresses`;
CREATE TABLE `player_ip_addresses`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nickname` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UnHashedPw` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'girilmedi',
  `Admin` int NOT NULL DEFAULT 0,
  `kills` int NOT NULL DEFAULT 0,
  `deaths` int NOT NULL DEFAULT 0,
  `IPadres` varchar(17) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `Skor` int NOT NULL DEFAULT 0,
  `Para` int NOT NULL DEFAULT 0,
  `Banka` int NOT NULL DEFAULT 2500,
  `Gun` int NOT NULL DEFAULT 0,
  `Saat` int NOT NULL DEFAULT 0,
  `Dakika` int NOT NULL DEFAULT 0,
  `Level` int NOT NULL DEFAULT 0,
  `Aranma` int NOT NULL DEFAULT 0,
  `Cete` varchar(33) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT 'Yok',
  `CeteRutbe` varchar(33) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Yok',
  `CeteSahip` int NOT NULL DEFAULT 0,
  `CeteYardimci2` int NOT NULL DEFAULT 0,
  `BankaHesap` int NOT NULL DEFAULT 0,
  `KayitTarih` int NOT NULL DEFAULT 0,
  `SonGiris` int NOT NULL DEFAULT 0,
  `CBI` tinyint NOT NULL DEFAULT 0,
  `CIA` int NOT NULL DEFAULT 0,
  `CA` int NOT NULL DEFAULT 0,
  `YNAJAN` int NOT NULL DEFAULT 0,
  `CAPD` int NOT NULL DEFAULT 0,
  `Vip` int NOT NULL DEFAULT 0,
  `Vsure` int NOT NULL DEFAULT 0,
  `VSureEx` int NOT NULL DEFAULT 0,
  `HapisSure` int NOT NULL DEFAULT 0,
  `HapisAtan` varchar(24) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL DEFAULT 'Yok',
  `HapisSebep` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Yok',
  `Kelepceleme` int NOT NULL DEFAULT 0,
  `Kelepcelenme` int NOT NULL DEFAULT 0,
  `Yakalama` int NOT NULL DEFAULT 0,
  `Yakalanma` int NOT NULL DEFAULT 0,
  `Gir` int NOT NULL DEFAULT 0,
  `CM` int NOT NULL DEFAULT 0,
  `CanLevel` int NOT NULL DEFAULT 0,
  `ZirhLevel` int NOT NULL DEFAULT 0,
  `SoygunLevel` int NOT NULL DEFAULT 0,
  `Notes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `forum_id` int NULL DEFAULT -1,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for players_logins_and_exits
-- ----------------------------
DROP TABLE IF EXISTS `players_logins_and_exits`;
CREATE TABLE `players_logins_and_exits`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NULL DEFAULT NULL,
  `Type` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `Time` datetime NULL DEFAULT current_timestamp,
  `IPAdres` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `aID` int NOT NULL AUTO_INCREMENT,
  `aSahip` varchar(24) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'YN:CNR',
  `aModel` int NOT NULL DEFAULT 0,
  `aPos1` float NULL DEFAULT -1639.19,
  `aPos2` float NULL DEFAULT 1211.24,
  `aPos3` float NULL DEFAULT 7.2931,
  `aPos4` float NULL DEFAULT 224.249,
  `aRenk1` int NOT NULL DEFAULT 0,
  `aRenk2` int NOT NULL DEFAULT 0,
  `aDurum` tinyint NOT NULL DEFAULT 1,
  `aModType` int NOT NULL DEFAULT 0,
  `aFiyat` int NOT NULL DEFAULT 0,
  `Vergi` int NOT NULL DEFAULT 1549145454,
  `AracZirh` smallint NULL DEFAULT 0,
  PRIMARY KEY (`aID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
