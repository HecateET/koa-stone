/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : stoneculture

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 25/03/2019 20:49:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for articlecollection
-- ----------------------------
DROP TABLE IF EXISTS `articlecollection`;
CREATE TABLE `articlecollection`  (
  `articleCollectionId` int(20) NOT NULL AUTO_INCREMENT,
  `userId` int(20) NOT NULL COMMENT '用户Id',
  `articleCommentId` int(20) NOT NULL COMMENT '文章Id',
  `collectionTime` date NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`articleCollectionId`) USING BTREE,
  INDEX `fk_articleCollection_userinfo1_idx`(`userId`) USING BTREE,
  INDEX `fk_articleCollection_articleComment1_idx`(`articleCommentId`) USING BTREE,
  CONSTRAINT `fk_articleCollection_articleComment1` FOREIGN KEY (`articleCommentId`) REFERENCES `articlecomment` (`articleCommentId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_articleCollection_userinfo1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for articlecomment
-- ----------------------------
DROP TABLE IF EXISTS `articlecomment`;
CREATE TABLE `articlecomment`  (
  `articleCommentId` int(20) NOT NULL AUTO_INCREMENT,
  `articleCommentTime` date NULL DEFAULT NULL,
  `articleCommentReply` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `articleCommentDetaile` text CHARACTER SET utf8 COLLATE utf8_bin NULL,
  `articleId` int(20) NOT NULL COMMENT '文章Id',
  `articleCommentUser` int(20) NOT NULL COMMENT '评论者Id',
  PRIMARY KEY (`articleCommentId`) USING BTREE,
  INDEX `fk_articleComment_stoneArticle1_idx`(`articleId`) USING BTREE,
  INDEX `fk_articleComment_userinfo1_idx`(`articleCommentUser`) USING BTREE,
  CONSTRAINT `fk_articleComment_stoneArticle1` FOREIGN KEY (`articleId`) REFERENCES `stonearticle` (`stoneArticleId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_articleComment_userinfo1` FOREIGN KEY (`articleCommentUser`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for attention
-- ----------------------------
DROP TABLE IF EXISTS `attention`;
CREATE TABLE `attention`  (
  `attentionId` int(20) NOT NULL AUTO_INCREMENT COMMENT '关注表ID',
  `attentionFan` int(20) NOT NULL COMMENT '用户粉丝id',
  `attentionName` int(20) NOT NULL COMMENT '被关注者Id',
  PRIMARY KEY (`attentionId`) USING BTREE,
  INDEX `fk_attention_userinfo1_idx`(`attentionFan`) USING BTREE,
  INDEX `fk_attention_userinfo2_idx`(`attentionName`) USING BTREE,
  CONSTRAINT `fk_attention_userinfo1` FOREIGN KEY (`attentionFan`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_attention_userinfo2` FOREIGN KEY (`attentionName`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `managerId` int(20) NOT NULL AUTO_INCREMENT COMMENT '管理员ID ',
  `managerName` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '管理员账号',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '管理员密码',
  `managerType` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '管理员级别',
  PRIMARY KEY (`managerId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for port
-- ----------------------------
DROP TABLE IF EXISTS `port`;
CREATE TABLE `port`  (
  `portId` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子ID\n',
  `portTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子标题',
  `portType` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子类型',
  `portViews` int(20) NULL DEFAULT NULL COMMENT '帖子浏览量',
  `portCollections` int(20) NULL DEFAULT NULL COMMENT '帖子收藏量',
  `portStar` int(20) NULL DEFAULT NULL COMMENT '帖子点赞数',
  `portReplies` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '该帖子所有评论Id\n采用字符“1,2,3,4”',
  `portUserId` int(20) NOT NULL,
  PRIMARY KEY (`portId`) USING BTREE,
  INDEX `fk_port_userinfo1_idx`(`portUserId`) USING BTREE,
  CONSTRAINT `fk_port_userinfo1` FOREIGN KEY (`portUserId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portcollection
-- ----------------------------
DROP TABLE IF EXISTS `portcollection`;
CREATE TABLE `portcollection`  (
  `portCollectionId` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子收藏id\n',
  `portId` int(20) NOT NULL COMMENT '帖子Id',
  `userId` int(20) NOT NULL COMMENT '用户Id\n',
  `collectionTime` date NULL DEFAULT NULL COMMENT '帖子收藏时间',
  PRIMARY KEY (`portCollectionId`) USING BTREE,
  INDEX `fk_portCollection_port1_idx`(`portId`) USING BTREE,
  INDEX `fk_portCollection_userinfo1_idx`(`userId`) USING BTREE,
  CONSTRAINT `fk_portCollection_port1` FOREIGN KEY (`portId`) REFERENCES `port` (`portId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_portCollection_userinfo1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for portcomment
-- ----------------------------
DROP TABLE IF EXISTS `portcomment`;
CREATE TABLE `portcomment`  (
  `portCommentId` int(20) NOT NULL AUTO_INCREMENT COMMENT '帖子评论id',
  `portCommentTime` date NULL DEFAULT NULL COMMENT '帖子评论时间',
  `portCommentDetails` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '帖子评论详情',
  `portCommentReply` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '帖子的评论的回复',
  `portId` int(20) NOT NULL COMMENT '帖子id',
  `portCommentUser` int(20) NOT NULL COMMENT '帖子评论者id',
  PRIMARY KEY (`portCommentId`) USING BTREE,
  INDEX `fk_portComment_port1_idx`(`portId`) USING BTREE,
  INDEX `fk_portComment_userinfo1_idx`(`portCommentUser`) USING BTREE,
  CONSTRAINT `fk_portComment_port1` FOREIGN KEY (`portId`) REFERENCES `port` (`portId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_portComment_userinfo1` FOREIGN KEY (`portCommentUser`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `provinceId` int(20) NOT NULL AUTO_INCREMENT COMMENT '省份Id',
  `provinceName` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省份名',
  `provincePY` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省份拼音首字母',
  `provincePinYin` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '省份拼音',
  PRIMARY KEY (`provinceId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES (1, '北京', 'BJ', 'beijing');
INSERT INTO `province` VALUES (2, '天津', 'TJ', 'tianjin');
INSERT INTO `province` VALUES (3, '上海', 'SH', 'shanghai');
INSERT INTO `province` VALUES (4, '重庆', 'CQ', 'chongqing');
INSERT INTO `province` VALUES (5, '河北', 'HB', 'hebei');
INSERT INTO `province` VALUES (6, '河南', 'HN', 'henan');
INSERT INTO `province` VALUES (7, '云南', 'YN', 'yunnan');
INSERT INTO `province` VALUES (8, '辽宁', 'LN', 'liaoning');
INSERT INTO `province` VALUES (9, '黑龙江', 'HLJ', 'heilongjiang');
INSERT INTO `province` VALUES (10, '湖南', 'HN', 'hunan');
INSERT INTO `province` VALUES (11, '安徽', 'AH', 'anhui');
INSERT INTO `province` VALUES (12, '山东', 'SD', 'shandong');
INSERT INTO `province` VALUES (13, '新疆', 'XJ', 'xinjiang');
INSERT INTO `province` VALUES (14, '江苏', 'JS', 'jiangsu');
INSERT INTO `province` VALUES (15, '浙江', 'ZJ', 'zhejiang');
INSERT INTO `province` VALUES (16, '江西', 'JX', 'jiangxi');
INSERT INTO `province` VALUES (17, '湖北', 'HB', 'hubei');
INSERT INTO `province` VALUES (18, '广西', 'GX', 'guangxi');
INSERT INTO `province` VALUES (19, '甘肃', 'GS', 'gansu');
INSERT INTO `province` VALUES (20, '山西', 'SX', 'shanxi');
INSERT INTO `province` VALUES (21, '内蒙古', 'NMG', 'neimenggu');
INSERT INTO `province` VALUES (22, '陕西', 'SX', 'shanxi');
INSERT INTO `province` VALUES (23, '吉林', 'JL', 'jilin');
INSERT INTO `province` VALUES (24, '福建', 'FJ', 'fujian');
INSERT INTO `province` VALUES (25, '贵州', 'GZ', 'guizhou');
INSERT INTO `province` VALUES (26, '广东', 'GD', 'guangdong');
INSERT INTO `province` VALUES (27, '青海', 'QH', 'qinghai');
INSERT INTO `province` VALUES (28, '西藏', 'XZ', 'xizang');
INSERT INTO `province` VALUES (29, '四川', 'SC', 'sichuan');
INSERT INTO `province` VALUES (30, '宁夏', 'NX', 'ningxia');
INSERT INTO `province` VALUES (31, '海南', 'HN', 'hainan');
INSERT INTO `province` VALUES (32, '台湾', 'TW', 'taiwan');
INSERT INTO `province` VALUES (33, '香港特别行政区', 'XG', 'xianggang');
INSERT INTO `province` VALUES (34, '澳门特别行政区', 'AM', 'aomen');

-- ----------------------------
-- Table structure for stone
-- ----------------------------
DROP TABLE IF EXISTS `stone`;
CREATE TABLE `stone`  (
  `stoneId` int(20) NOT NULL AUTO_INCREMENT COMMENT '奇石Id\n',
  `stoneType` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '奇石类型',
  `stoneName` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '奇石名称',
  `stoneDescribe` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '奇石简介',
  `stonePicture` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '奇石图片',
  `publichTime` date NULL DEFAULT NULL COMMENT '发布时间',
  `stoneViews` int(20) NULL DEFAULT NULL,
  `stoneStars` int(20) NULL DEFAULT NULL COMMENT '奇石点赞量',
  `stoneColletion` int(20) NULL DEFAULT NULL COMMENT '奇石收藏量\n',
  `author` int(20) NOT NULL COMMENT '发布者Id',
  PRIMARY KEY (`stoneId`) USING BTREE,
  INDEX `fk_stone_userinfo_idx`(`author`) USING BTREE,
  CONSTRAINT `fk_stone_userinfo` FOREIGN KEY (`author`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stonearticle
-- ----------------------------
DROP TABLE IF EXISTS `stonearticle`;
CREATE TABLE `stonearticle`  (
  `stoneArticleId` int(20) NOT NULL AUTO_INCREMENT COMMENT '文章Id\n',
  `articleTitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章标题',
  `articleType` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '文章类型',
  `titlePicture` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '标题图片',
  `publishTime` date NULL DEFAULT NULL COMMENT '发布文章的时间',
  `articleDetails` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '文章内容',
  `articleViews` int(20) NULL DEFAULT NULL COMMENT '文章浏览量',
  `articleStars` int(20) NULL DEFAULT NULL COMMENT '文章点赞数',
  `articleColletion` int(20) NULL DEFAULT NULL COMMENT '文章收藏量',
  `articleOrigin` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '发布文章来源',
  `articleAuthor` int(20) NOT NULL COMMENT '文章发布者',
  PRIMARY KEY (`stoneArticleId`) USING BTREE,
  INDEX `fk_stoneArticle_userinfo1_idx`(`articleAuthor`) USING BTREE,
  CONSTRAINT `fk_stoneArticle_userinfo1` FOREIGN KEY (`articleAuthor`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stoneclassify
-- ----------------------------
DROP TABLE IF EXISTS `stoneclassify`;
CREATE TABLE `stoneclassify`  (
  `stoneTypeId` int(20) NOT NULL AUTO_INCREMENT COMMENT '石头种类id',
  `stoneTypeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '种类名',
  `stonePY` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '种类名拼音首字母',
  `stonePinYin` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '种类名拼音',
  `stoneOriginId` int(20) NULL DEFAULT NULL COMMENT '品种来源',
  `originProvince` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`stoneTypeId`, `stoneTypeName`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stoneclassify
-- ----------------------------
INSERT INTO `stoneclassify` VALUES (1, '金海石', 'JHS', 'jinhaishi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (2, '轩辕石', 'XYS', 'xuanyuanshi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (3, '房山太湖石', 'FSTHS', 'fangshantaihushi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (4, '燕山石', 'YSS', 'yanshanshi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (5, '硅化木', 'GHM', 'guihuaimu', 1, '北京');
INSERT INTO `stoneclassify` VALUES (6, '京西菊花石', 'JXJHS', 'jingxijuhuashi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (7, '汉白玉石', 'HBYS', 'hanbaiyushi', 1, '北京');
INSERT INTO `stoneclassify` VALUES (8, '黄蜡石', 'HLS', 'huanglashi', 3, '上海');
INSERT INTO `stoneclassify` VALUES (9, '虾米石', 'XMS', 'xiamishi', 2, '天津');
INSERT INTO `stoneclassify` VALUES (10, '钟乳石', 'ZRS', 'zhongrushi', 2, '天津');
INSERT INTO `stoneclassify` VALUES (11, '乌江石', 'XMS', 'xiamishi', 4, '重庆');
INSERT INTO `stoneclassify` VALUES (12, '长江三峡石', 'CJSXS', 'changjiangsanxiashi', 4, '重庆');
INSERT INTO `stoneclassify` VALUES (13, '角石', 'JS', 'jiaoshi', 4, '重庆');
INSERT INTO `stoneclassify` VALUES (14, '响石', 'XS', 'xiangshi', 4, '重庆');
INSERT INTO `stoneclassify` VALUES (15, '石松', 'SS', 'shisong', 4, '重庆');
INSERT INTO `stoneclassify` VALUES (16, '唐尧石', 'TYS', 'tangyaoshi', 5, '河北');
INSERT INTO `stoneclassify` VALUES (17, '模树石', 'MSS', 'moshushi', 5, '河北');
INSERT INTO `stoneclassify` VALUES (18, '菊花石', 'JHS', 'juhuashi', 5, '河北');
INSERT INTO `stoneclassify` VALUES (19, '雪浪石', 'XLS', 'xuelangshi', 5, '河北');
INSERT INTO `stoneclassify` VALUES (20, '冰洲石', 'BZS', 'bingzhoushi', 5, '河北');
INSERT INTO `stoneclassify` VALUES (21, '梅花石', 'MHS', 'meihuashi', 20, '山西');
INSERT INTO `stoneclassify` VALUES (22, '大寨石', 'DZS', 'dazhaishi', 20, '山西');
INSERT INTO `stoneclassify` VALUES (24, '黄河石', 'HHS', 'huangheshi', 20, '山西');
INSERT INTO `stoneclassify` VALUES (25, '绛州石', 'JZS', 'jiangzhoushi', 20, '山西');
INSERT INTO `stoneclassify` VALUES (26, '石州石', 'SZS', 'shizhoushi', 20, '山西');
INSERT INTO `stoneclassify` VALUES (27, '硅化木', 'GHM', 'guihuamu', 20, '山西');

-- ----------------------------
-- Table structure for stonecollection
-- ----------------------------
DROP TABLE IF EXISTS `stonecollection`;
CREATE TABLE `stonecollection`  (
  `stoneColletionId` int(20) NOT NULL AUTO_INCREMENT COMMENT '奇石收藏ID',
  `userId` int(20) NOT NULL,
  `stoneId` int(20) NOT NULL COMMENT '奇石Id',
  `collectionTime` date NULL DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`stoneColletionId`) USING BTREE,
  INDEX `fk_stoneCollection_userinfo1_idx`(`userId`) USING BTREE,
  INDEX `fk_stoneCollection_stone1_idx`(`stoneId`) USING BTREE,
  CONSTRAINT `fk_stoneCollection_stone1` FOREIGN KEY (`stoneId`) REFERENCES `stone` (`stoneId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stoneCollection_userinfo1` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for stonecomment
-- ----------------------------
DROP TABLE IF EXISTS `stonecomment`;
CREATE TABLE `stonecomment`  (
  `stoneCommentId` int(20) NOT NULL AUTO_INCREMENT,
  `stoneCommentTime` date NOT NULL,
  `stoneCommentReply` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `stoneCommentDetails` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '评论内容',
  `stoneId` int(20) NOT NULL COMMENT '被评论的石头id',
  `stoneCommentUser` int(20) NOT NULL COMMENT '评论石头的用户ID',
  PRIMARY KEY (`stoneCommentId`) USING BTREE,
  INDEX `fk_stoneComment_stone1_idx`(`stoneId`) USING BTREE,
  INDEX `fk_stoneComment_userinfo1_idx`(`stoneCommentUser`) USING BTREE,
  CONSTRAINT `fk_stoneComment_stone1` FOREIGN KEY (`stoneId`) REFERENCES `stone` (`stoneId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_stoneComment_userinfo1` FOREIGN KEY (`stoneCommentUser`) REFERENCES `userinfo` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userId` int(20) NOT NULL AUTO_INCREMENT COMMENT '用户Id主键',
  `userNickName` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户名',
  `userHeadPic` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户头像',
  `userPhoneNumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户手机号码',
  `password` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户密码：MD5加密',
  `registerTime` date NULL DEFAULT NULL COMMENT '用户注册时间',
  `userSex` char(3) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '用户性别',
  `userMotto` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE,
  UNIQUE INDEX `userPhoneNumber_UNIQUE`(`userPhoneNumber`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
