/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rockxinhu_fabu

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2017-10-26 10:07:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `xinhu_admin`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_admin`;
CREATE TABLE `xinhu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `user` varchar(50) NOT NULL DEFAULT '' COMMENT '用戶名',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `pass` varchar(100) DEFAULT NULL COMMENT '密碼',
  `loginci` smallint(6) DEFAULT '0' COMMENT '登錄次數',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否啟用',
  `type` tinyint(1) DEFAULT '0' COMMENT '0普通1管理員',
  `sex` varchar(10) DEFAULT NULL COMMENT '性別',
  `tel` varchar(50) DEFAULT NULL COMMENT '電話',
  `face` varchar(50) DEFAULT NULL COMMENT '頭像地址',
  `deptid` int(11) DEFAULT '0' COMMENT '主部門ID',
  `deptname` varchar(50) DEFAULT NULL COMMENT '部門',
  `deptids` varchar(30) DEFAULT NULL COMMENT '其他部門ID',
  `deptnames` varchar(100) DEFAULT NULL COMMENT '多部門',
  `rankings` varchar(100) DEFAULT NULL COMMENT '多職位',
  `deptallname` varchar(100) DEFAULT NULL COMMENT '部門全部路徑',
  `superid` varchar(50) DEFAULT NULL,
  `superman` varchar(20) DEFAULT NULL COMMENT '上級主管',
  `ranking` varchar(255) DEFAULT NULL COMMENT '崗位',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `deptpath` varchar(100) DEFAULT NULL COMMENT '部門路徑',
  `superpath` varchar(100) DEFAULT NULL COMMENT '上級主管路徑',
  `groupname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `apptx` tinyint(1) DEFAULT '1' COMMENT '是否app提醒',
  `workdate` date DEFAULT NULL COMMENT '入職時間',
  `email` varchar(50) DEFAULT NULL COMMENT '郵箱',
  `lastpush` datetime DEFAULT NULL COMMENT '最後app推送時間',
  `adddt` datetime DEFAULT NULL COMMENT '新增時間',
  `weixinid` varchar(50) DEFAULT NULL COMMENT '微信號',
  `quitdt` date DEFAULT NULL COMMENT '離職日期',
  `style` tinyint(2) DEFAULT '0' COMMENT '默認樣式',
  `pingyin` varchar(50) DEFAULT NULL COMMENT '名字拼音',
  `emailpass` varchar(100) DEFAULT NULL COMMENT '郵箱密碼',
  `companyid` int(11) DEFAULT '0' COMMENT '所在公司單位Id',
  `online` tinyint(1) DEFAULT '0' COMMENT '在線狀態',
  `lastonline` datetime DEFAULT NULL COMMENT '最後在線時間',
  PRIMARY KEY (`id`,`user`),
  KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='用戶表';

-- ----------------------------
-- Records of xinhu_admin
-- ----------------------------
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理員', 'e10adc3949ba59abbe56e057f20f883e', '1925', '1', '1', '男', '0592-1234567', 'upload/face/1.jpg', '2', '開發部', '3', '財務部', '財務總監', '信呼開發團隊/開發部', '5', '磐石', '項目主管', '0', '[1],[2],[3]', '[5]', null, '15800000123', '1', '2016-06-01', null, '2017-03-08 09:52:30', null, null, null, '0', 'guanliyuan', null, '1', '0', null);
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蟬', 'e10adc3949ba59abbe56e057f20f883e', '68', '1', '0', '女', '0592-123456', 'upload/face/2.jpg', '3', '財務部', null, null, null, '信呼開發團隊/財務部', '5', '磐石', '財務總監', '0', '[1],[3]', '[5]', null, '15800000007', '1', '2016-08-09', null, null, null, null, null, '0', 'diaochan', null, '0', '0', null);
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小喬', 'e10adc3949ba59abbe56e057f20f883e', '119', '1', '0', '女', null, 'upload/face/3.jpg', '3', '財務部', null, null, null, '信呼開發團隊/財務部', '2', '貂蟬', '出納', '0', '[1],[3]', '[5],[2]', null, '15800000001', '1', '2017-05-02', null, '2016-08-30 20:34:23', null, null, null, '0', 'xiaoqiao', null, '0', '0', null);
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大喬', 'e10adc3949ba59abbe56e057f20f883e', '187', '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', null, null, null, '信呼開發團隊/行政人事部', '5', '磐石', '人事主管', '0', '[1],[4]', '[5]', null, '15800000002', '1', '2017-07-01', null, '2016-10-20 22:27:51', null, null, null, '0', 'daqiao', null, '0', '0', null);
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '189', '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理層', null, null, null, '信呼開發團隊/管理層', null, null, '董事長', '0', '[1],[5]', null, null, '15800000009', '1', '2015-11-01', null, null, null, null, null, '0', 'panshi', null, '1', '0', null);
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '張飛', 'e10adc3949ba59abbe56e057f20f883e', '61', '1', '0', '男', null, 'upload/face/6.jpg', '2', '開發部', null, null, null, '信呼開發團隊/開發部', '1', '管理員', '程序員', '100', '[1],[2]', '[5],[1]', '1,2', '15800000004', '1', '2017-07-01', null, '2016-11-01 20:15:52', null, null, null, '0', 'zhangfei', null, '1', '0', null);
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '趙子龍', 'e10adc3949ba59abbe56e057f20f883e', '31', '1', '0', '男', null, 'upload/face/7.jpg', '2', '開發部', null, null, null, '信呼開發團隊/開發部', '1', '管理員', '高級程序員', '100', '[1],[2]', '[5],[1]', '1', '15800000005', '1', '2016-07-01', null, '2017-06-28 15:34:26', null, null, null, '0', 'zhaozilong', null, '1', '0', null);
INSERT INTO `xinhu_admin` VALUES ('8', null, 'xinhu', '信呼客服', '6846860684f05029abccc09a53cd66f1', '294', '1', '1', '男', null, 'upload/face/8.jpg', '2', '開發部', null, null, null, '信呼開發團隊/開發部', '1', '管理員', '客服', '200', '[1],[2]', '[5],[1]', null, '15800000006', '1', '2016-07-01', null, null, null, 'rainrock829', null, '2', 'xinhukefu', null, '1', '0', null);

-- ----------------------------
-- Table structure for `xinhu_assetm`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_assetm`;
CREATE TABLE `xinhu_assetm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '類別',
  `title` varchar(50) DEFAULT NULL COMMENT '名稱',
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `brand` varchar(20) DEFAULT NULL COMMENT '品牌',
  `model` varchar(100) DEFAULT NULL COMMENT '規格型號',
  `laiyuan` varchar(50) DEFAULT NULL COMMENT '來源',
  `shuname` varchar(50) DEFAULT NULL COMMENT '所屬部門',
  `dt` date DEFAULT NULL COMMENT '日期',
  `ckid` smallint(50) DEFAULT '0' COMMENT '存放地點',
  `state` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `adddt` datetime DEFAULT NULL COMMENT '添加時間',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `buydt` date DEFAULT NULL COMMENT '購進日期',
  `price` decimal(10,2) DEFAULT NULL COMMENT '價格',
  `optid` smallint(6) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `useid` varchar(50) DEFAULT '0',
  `usename` varchar(50) DEFAULT NULL COMMENT '使用人',
  `fengmian` varchar(50) DEFAULT NULL COMMENT '封面圖片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='固定資產表';

-- ----------------------------
-- Records of xinhu_assetm
-- ----------------------------
INSERT INTO `xinhu_assetm` VALUES ('1', '204', '這是一個電腦', 'DN-0001', '聯想', '12', '購入', null, null, '214', '0', '報廢啦？1', '管理員', '2015-04-13 16:34:49', '2016-10-26 22:01:14', '2015-10-30', '6000.00', '1', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('2', '0', '2112', 'BJB-0001', '聯想', 'M300', '購入', null, null, '0', '0', '2121', '管理員', '2015-04-13 16:52:33', '2016-04-27 22:11:40', '2016-04-27', null, '1', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('3', '0', '筆記本', 'BJB-0002', '戴爾', null, '自建', null, null, '0', '0', '哈哈', '管理員', '2015-04-13 17:03:52', '2015-06-30 17:32:49', null, null, '1', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('4', '0', '這是不筆記本', 'BJB-0003', 'dell', 'I5 60G內存', '購入', null, null, '0', '0', '呵呵', '管理員', '2015-04-14 11:08:51', '2015-07-13 20:09:24', null, null, '1', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('5', '0', '這是一個筆記本', 'BJB-004', '聯想', '006', '購入', null, null, '0', '0', null, '管理員', null, '2016-04-27 22:42:51', '2016-04-01', '500.00', '1', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('6', '204', '公共打印機', 'ZC-001', '惠普', null, '購入', null, null, '214', '1', null, '管理員', '2016-10-26 22:17:41', '2016-12-09 17:18:14', '2016-10-01', '0.00', '1', '1', 'd1', '信呼開發團隊', 'upload/2016-12/09_17181118.png');
INSERT INTO `xinhu_assetm` VALUES ('7', '355', '這是一個電腦啊', 'ZiCAN-001', '聯想', null, '購買', null, null, '0', '0', '簡單說明一下', null, null, null, '2017-01-17', null, '0', '1', '0', null, null);
INSERT INTO `xinhu_assetm` VALUES ('8', '207', '這是一個電腦啊', 'ZiCAN-002', '聯想', null, '購買', null, null, '0', '0', '簡單說明一下', null, '2017-08-19 22:50:00', '2017-08-19 22:50:00', '2017-01-17', null, '0', '1', '0', null, null);

-- ----------------------------
-- Table structure for `xinhu_book`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_book`;
CREATE TABLE `xinhu_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '書名',
  `typeid` smallint(6) DEFAULT '0' COMMENT '對應分類',
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `author` varchar(20) DEFAULT NULL COMMENT '作者',
  `chuban` varchar(50) DEFAULT NULL COMMENT '出版社',
  `cbdt` date DEFAULT NULL COMMENT '出版日期',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '價格',
  `weizhi` varchar(50) DEFAULT NULL COMMENT '存放位置',
  `shul` smallint(6) DEFAULT '0' COMMENT '數量',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optid` smallint(6) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `isbn` varchar(30) DEFAULT NULL,
  `jieshu` smallint(6) DEFAULT '0' COMMENT '被借閱數',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='圖書表';

-- ----------------------------
-- Records of xinhu_book
-- ----------------------------
INSERT INTO `xinhu_book` VALUES ('1', 'C語言程序設計', '232', 'TS-001', '巨同升', '中國日報', '2012-10-01', '20.00', '忘了', '1', '2016-10-28 23:18:36', '2016-10-28 23:21:53', '管理員', '1', '本書在內容編排上，採用“應用驅動知識”的方式，即根據每一章應用目標的需求，合理地安排每一個知識主題的引入點，從而將C語言中枯燥難懂的語法知識分解到全書各章並融入到豐富的實例中。本書在編程方法的講解上，採用“逐步構造法”，即通過問題分析、算法設計、程序原型等環節一步一步地構造出完整的程序，從而加深讀者對編程方法的理解和掌握。', null, '0');
INSERT INTO `xinhu_book` VALUES ('2', 'PHP從入門到精通', '232', 'TS-002', '潘凱華', '化學工業出版社', '2008-10-01', '68.00', '忘了', '1', '2016-10-28 23:25:22', '2016-10-28 23:27:07', '管理員', '1', null, '9787302179597', '0');
INSERT INTO `xinhu_book` VALUES ('4', 'PHP從入門到放棄', '357', 'TS-003', '磐石', '信呼開發團隊', '2017-01-17', '49.90', '不知道', '5', '2017-08-20 12:32:43', '2017-08-20 12:32:43', '管理員', '1', null, 'PANSHI-001', '0');

-- ----------------------------
-- Table structure for `xinhu_bookborrow`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_bookborrow`;
CREATE TABLE `xinhu_bookborrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `bookid` smallint(6) DEFAULT '0',
  `bookname` varchar(50) DEFAULT NULL COMMENT '書名',
  `jydt` date DEFAULT NULL COMMENT '借閱日期',
  `yjdt` date DEFAULT NULL COMMENT '預計歸還',
  `ghtime` datetime DEFAULT NULL COMMENT '歸還時間',
  `isgh` tinyint(1) DEFAULT '0' COMMENT '是否歸返',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='圖書借閱';

-- ----------------------------
-- Records of xinhu_bookborrow
-- ----------------------------
INSERT INTO `xinhu_bookborrow` VALUES ('1', '1', '2016-10-29 13:08:44', '1', '管理員', '2016-10-29', null, '1', '1', '2', 'PHP從入門到精通', '2016-10-29', '2016-10-31', '2016-10-29 19:42:43', '1');
INSERT INTO `xinhu_bookborrow` VALUES ('2', '8', '2016-10-29 13:14:35', '8', '信呼客服', '2016-10-29', '拿來看看把！', '0', '1', '1', 'C語言程序設計', '2016-10-29', '2016-10-30', null, '0');
INSERT INTO `xinhu_bookborrow` VALUES ('3', '1', '2016-10-30 11:58:59', '1', '管理員', '2016-10-30', null, '1', '1', '2', 'PHP從入門到精通', '2016-10-30', '2016-11-30', '2017-03-31 09:36:00', '1');

-- ----------------------------
-- Table structure for `xinhu_carm`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_carm`;
CREATE TABLE `xinhu_carm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carnum` varchar(10) DEFAULT NULL COMMENT '車牌號',
  `carbrand` varchar(20) DEFAULT NULL COMMENT '車輛品牌',
  `carmode` varchar(30) DEFAULT NULL COMMENT '型號',
  `cartype` varchar(10) DEFAULT NULL COMMENT '車輛類型',
  `buydt` date DEFAULT NULL COMMENT '購買日期',
  `buyprice` mediumint(9) DEFAULT NULL COMMENT '購買價格',
  `enginenb` varchar(50) DEFAULT NULL COMMENT '發動機號',
  `ispublic` tinyint(1) DEFAULT '1' COMMENT '是否公開使用',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `state` tinyint(1) DEFAULT '0' COMMENT '狀態@0|辦理中,1|可用,2|維修中,3|報廢',
  `framenum` varchar(50) DEFAULT NULL COMMENT '車架號',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='車輛表';

-- ----------------------------
-- Records of xinhu_carm
-- ----------------------------
INSERT INTO `xinhu_carm` VALUES ('1', '閩D123QB', '奧迪', 'N7', '小型車', '2015-09-01', '20000', '不知道', '1', '2016-10-27 13:31:00', '1', '管理員', '2015-09-16 10:51:56', '管理員', null, '1', null, '1');
INSERT INTO `xinhu_carm` VALUES ('2', '閩D123455', '奔馳', 'A4L', '轎車', '2015-01-01', '20000', null, '1', '2016-10-28 13:28:01', '1', '管理員', '2015-09-17 09:54:49', '管理員', null, '1', 'aodiche', '1');

-- ----------------------------
-- Table structure for `xinhu_carmang`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_carmang`;
CREATE TABLE `xinhu_carmang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `carid` smallint(6) DEFAULT '0' COMMENT '維修車輛',
  `reason` varchar(500) DEFAULT NULL COMMENT '維修原因',
  `address` varchar(50) DEFAULT NULL COMMENT '維修地點',
  `jianame` varchar(50) DEFAULT NULL COMMENT '駕駛員',
  `jiaid` varchar(50) DEFAULT NULL,
  `bujian` varchar(200) DEFAULT NULL COMMENT '更換部件',
  `startdt` datetime DEFAULT NULL COMMENT '維修時間',
  `enddt` datetime DEFAULT NULL COMMENT '維修截止時間',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '維修金額',
  `type` tinyint(1) DEFAULT '0' COMMENT '類型@0|車輛維修,1|保養',
  `nextdt` date DEFAULT NULL COMMENT '下次保養日期',
  `kmshu` varchar(20) DEFAULT NULL COMMENT '當前保養公裡數',
  `kmnshu` varchar(20) DEFAULT NULL COMMENT '下次保養公裡數',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='車輛維修保養記錄表';

-- ----------------------------
-- Records of xinhu_carmang
-- ----------------------------
INSERT INTO `xinhu_carmang` VALUES ('1', '1', '2017-06-26 21:28:14', '1', '管理員', '2017-06-26', null, '1', '1', '1', '維修原因', '維修地點	', '管理員', '1', '更換部件', '2017-06-26 21:28:00', '2017-06-27 21:28:00', '600.00', '0', null, null, null);
INSERT INTO `xinhu_carmang` VALUES ('2', '1', '2017-06-27 13:22:46', '1', '管理員', '2017-06-27', null, '1', '1', '1', '去保養吧', '鑫達維修廠', '張飛', '6', '三清,三濾,換機油', '2017-06-27 13:20:00', '2017-06-28 13:25:00', '3.00', '1', '2017-06-30', '5000', '8999');

-- ----------------------------
-- Table structure for `xinhu_carmrese`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_carmrese`;
CREATE TABLE `xinhu_carmrese` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `useid` varchar(200) DEFAULT NULL,
  `usename` varchar(200) DEFAULT NULL COMMENT '使用者',
  `useren` smallint(6) DEFAULT '0' COMMENT '使用人數',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `enddt` datetime DEFAULT NULL COMMENT '截止時間',
  `address` varchar(50) DEFAULT NULL COMMENT '目的地',
  `carid` smallint(6) DEFAULT NULL,
  `carnum` varchar(10) DEFAULT NULL COMMENT '使用車輛',
  `xianlines` varchar(200) DEFAULT NULL COMMENT '線路',
  `jiaid` varchar(200) DEFAULT NULL,
  `jianame` varchar(200) DEFAULT NULL COMMENT '駕駛員',
  `kmstart` varchar(20) DEFAULT NULL COMMENT '起始公裡數',
  `kmend` varchar(20) DEFAULT NULL COMMENT '結束公裡數',
  `returndt` datetime DEFAULT NULL COMMENT '歸還時間',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='車輛預定';

-- ----------------------------
-- Records of xinhu_carmrese
-- ----------------------------
INSERT INTO `xinhu_carmrese` VALUES ('1', '1', '2015-09-23 16:54:19', '1', '管理員', '2015-09-23', '呵呵呵呵', '1', '1', 'u4,u3', '大喬,貂蟬', '0', '2015-09-23 15:00:00', '2015-09-23 16:00:00', '漳州', '2', '閩D123455', 'G15-S30', '1', '管理員', null, null, null);
INSERT INTO `xinhu_carmrese` VALUES ('2', '1', '2015-09-23 16:54:08', '1', '管理員', '2015-09-23', null, '1', '1', 'u4,u3', '大喬,貂蟬', '2', '2015-09-25 15:30:00', '2015-09-25 16:13:00', '安溪', '2', '閩D123455', '同安S206', '4,3', '大喬,貂蟬', null, null, null);
INSERT INTO `xinhu_carmrese` VALUES ('3', '1', '2016-03-07 21:02:32', '1', '管理員', '2016-03-07', null, '0', '1', 'u7', '劉備', '1', '2016-03-07 20:56:00', '2016-03-08 20:56:00', '不知道', '2', '閩D123455', '嗯嗯', '1', '管理員', null, null, null);
INSERT INTO `xinhu_carmrese` VALUES ('5', '1', '2016-10-28 11:43:40', '1', '管理員', '2016-10-28', null, '1', '1', 'd2', '開發部', '5', '2016-10-28 05:43:03', '2016-10-28 11:43:08', '廈門北站', '1', '閩D123QB', '不知道', '1', '管理員', '6566', '6567', '2017-03-01 15:02:00');
INSERT INTO `xinhu_carmrese` VALUES ('6', '1', '2016-10-28 15:10:44', '1', '管理員', '2016-10-28', null, '1', '1', 'u1', '管理員', '0', '2016-10-30 05:10:15', '2016-10-31 15:10:20', '旅遊', '1', '閩D123QB', '呵呵呵', '1', '管理員', null, null, null);
INSERT INTO `xinhu_carmrese` VALUES ('7', '8', '2017-03-01 09:41:31', '8', '信呼客服', '2017-03-01', '領導要下鄉考察啊', '1', '1', 'd5', '管理層', '5', '2017-03-01 08:00:00', '2017-03-02 09:40:00', '平民區', '2', '閩D123455', '廈門→郊區', '1', '管理員', '2330', '2332', '2017-03-01 10:21:03');

-- ----------------------------
-- Table structure for `xinhu_carms`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_carms`;
CREATE TABLE `xinhu_carms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carid` int(11) DEFAULT '0' COMMENT '車輛Id',
  `otype` varchar(20) DEFAULT NULL COMMENT '類型,加油',
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL COMMENT '截止時間',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '花費金額',
  `optid` int(11) DEFAULT '0' COMMENT '添加人id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `unitname` varchar(50) DEFAULT NULL COMMENT '對應名稱',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `address` varchar(100) DEFAULT NULL COMMENT '地點',
  `jiaid` varchar(30) DEFAULT NULL,
  `jianame` varchar(30) DEFAULT NULL COMMENT '駕駛員',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='車輛信息登記表';

-- ----------------------------
-- Records of xinhu_carms
-- ----------------------------
INSERT INTO `xinhu_carms` VALUES ('1', '1', '加油', '2017-06-22', null, '200.00', '1', '2017-06-22 12:47:42', '管理員', '1', '去加油了', null, '2017-06-22', '中石化', '5', '磐石');
INSERT INTO `xinhu_carms` VALUES ('2', '1', '強險', '2016-06-24', '2017-08-29', '900.00', '1', '2017-08-23 14:52:00', '管理員', '1', null, null, '2017-06-22', null, null, null);
INSERT INTO `xinhu_carms` VALUES ('3', '1', '商業險', '2016-06-22', '2017-08-28', '3000.00', '1', '2017-08-23 14:52:11', '管理員', '1', null, null, '2017-06-22', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_chargems`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_chargems`;
CREATE TABLE `xinhu_chargems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) DEFAULT '0',
  `mid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `updatedt` datetime DEFAULT NULL,
  `key` varchar(200) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0' COMMENT '對應安裝模塊Id',
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系統升級';

-- ----------------------------
-- Records of xinhu_chargems
-- ----------------------------
INSERT INTO `xinhu_chargems` VALUES ('1', '0', '1', '2016-12-28 15:24:19', '2017-10-26 10:07:25', null, '1');
INSERT INTO `xinhu_chargems` VALUES ('2', '1', '1', '2016-12-28 15:21:14', '2017-10-26 10:07:25', null, '0');

-- ----------------------------
-- Table structure for `xinhu_city`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_city`;
CREATE TABLE `xinhu_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上級ＩＤ',
  `name` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '類型0國家,1省,2市,3縣',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `pinyin` varchar(50) DEFAULT NULL,
  `pinyins` varchar(50) DEFAULT NULL COMMENT '拼音簡稱',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`pid`),
  KEY `region_type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_city
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_company`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_company`;
CREATE TABLE `xinhu_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL COMMENT '公司名稱',
  `nameen` varchar(200) DEFAULT NULL COMMENT '英文名',
  `tel` varchar(30) DEFAULT NULL COMMENT '電話',
  `fax` varchar(30) DEFAULT NULL COMMENT '傳真',
  `pid` int(11) DEFAULT '0' COMMENT '對應上級',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `fuzeid` varchar(30) DEFAULT NULL COMMENT '對應負責人Id',
  `fuzename` varchar(30) DEFAULT NULL COMMENT '對應負責人',
  `address` varchar(50) DEFAULT NULL COMMENT '地址',
  `city` varchar(30) DEFAULT NULL COMMENT '所在城市',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公司單位表';

-- ----------------------------
-- Records of xinhu_company
-- ----------------------------
INSERT INTO `xinhu_company` VALUES ('1', '信呼開發團隊', null, '0592-123456', '0592-123456', '0', '0', '5', '磐石', '軟件園', '廈門');
INSERT INTO `xinhu_company` VALUES ('2', '信呼開發團隊(泉州分公司)', null, null, null, '1', '0', null, null, null, null);
INSERT INTO `xinhu_company` VALUES ('3', '信呼開發團隊(北京分公司)', null, null, null, '1', '0', null, null, null, null);
INSERT INTO `xinhu_company` VALUES ('4', '房租家軟件公司', null, null, null, '0', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `xinhu_custfina`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_custfina`;
CREATE TABLE `xinhu_custfina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htid` int(11) DEFAULT '0' COMMENT '合同ID',
  `htnum` varchar(20) DEFAULT NULL,
  `dt` date DEFAULT NULL COMMENT '所屬日期',
  `uid` smallint(6) DEFAULT '0',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '客戶名稱',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款單,1付款單',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否收款,付款',
  `paydt` datetime DEFAULT NULL COMMENT '收付款時間',
  `explain` varchar(200) DEFAULT NULL COMMENT '說明',
  `createdt` datetime DEFAULT NULL COMMENT '創建時間',
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `ismove` tinyint(1) DEFAULT '0' COMMENT '是否轉移的',
  PRIMARY KEY (`id`),
  KEY `htid` (`htid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='客戶收付款';

-- ----------------------------
-- Records of xinhu_custfina
-- ----------------------------
INSERT INTO `xinhu_custfina` VALUES ('1', '1', 'HT-001', '2016-10-15', '1', '1', '信呼辦公軟件', '2016-10-15 16:24:59', '管理員', '520.00', '0', '1', '2016-10-19 18:36:29', null, '2016-10-15 16:24:59', '管理員', '1', '1');
INSERT INTO `xinhu_custfina` VALUES ('2', '0', null, '2016-10-15', '1', '1', '信呼辦公軟件', '2016-10-15 18:40:20', '管理員', '2100.00', '1', '1', '2016-10-19 18:42:22', '服務器費用', '2016-10-15 18:40:20', '管理員', '1', '1');
INSERT INTO `xinhu_custfina` VALUES ('3', '2', 'HT-002', '2016-10-15', '7', '3', '微軟公司', '2016-10-15 19:10:04', '趙子龍', '20000.00', '0', '1', '2016-10-05 19:10:20', null, '2016-10-15 19:10:04', '管理員', '1', '1');
INSERT INTO `xinhu_custfina` VALUES ('4', '3', 'HT-003', '2016-10-15', '1', '1', '信呼辦公軟件', '2016-10-19 16:05:06', '管理員', '25.00', '1', '1', '2017-06-26 15:54:00', null, '2016-10-15 19:36:08', '管理員', '1', '1');
INSERT INTO `xinhu_custfina` VALUES ('5', '2', 'HT-002', '2016-10-16', '7', '3', '微軟公司', '2016-10-16 13:32:11', '趙子龍', '30000.00', '0', '0', null, null, '2016-10-16 13:32:11', '管理員', '1', '0');
INSERT INTO `xinhu_custfina` VALUES ('6', '4', 'HT-004', '2016-10-16', '6', '5', '騰訊科技', '2016-10-16 16:01:11', '張飛', '2300.00', '0', '0', null, null, '2016-10-16 16:01:11', '張飛', '6', '0');

-- ----------------------------
-- Table structure for `xinhu_customer`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_customer`;
CREATE TABLE `xinhu_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名稱',
  `type` varchar(20) DEFAULT NULL COMMENT '客戶類型',
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `linkname` varchar(20) DEFAULT NULL COMMENT '聯系人',
  `unitname` varchar(100) DEFAULT NULL COMMENT '單位名稱',
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '來源',
  `tel` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `routeline` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL COMMENT '主頁地址',
  `status` tinyint(4) DEFAULT '1',
  `adddt` datetime DEFAULT NULL,
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `shate` varchar(50) DEFAULT NULL COMMENT '共享給',
  `shateid` varchar(50) DEFAULT NULL,
  `isgys` tinyint(1) DEFAULT '0' COMMENT '是否供應商',
  `isstat` tinyint(1) DEFAULT '0' COMMENT '是否標*客戶',
  `fzid` smallint(6) DEFAULT '0',
  `fzname` varchar(20) DEFAULT NULL COMMENT '客戶負責人',
  `htshu` smallint(6) DEFAULT '0' COMMENT '合同數',
  `moneyz` decimal(10,2) DEFAULT '0.00' COMMENT '銷售總額',
  `moneyd` decimal(10,2) DEFAULT '0.00' COMMENT '待收金額',
  `sheng` varchar(50) DEFAULT NULL COMMENT '所在省',
  `shi` varchar(50) DEFAULT NULL COMMENT '所在市',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='客戶';

-- ----------------------------
-- Records of xinhu_customer
-- ----------------------------
INSERT INTO `xinhu_customer` VALUES ('1', '信呼辦公軟件', '互聯網', '7', '2017-05-12 09:35:48', null, null, '廈門信呼科技有限公司', '網上開拓', '0592-123456', '15888888888', 'admin@rockoa.com', null, '福建廈門', null, null, '1', null, '管理員', '1', null, null, '0', '1', '0', null, '2', '520.00', '0.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('2', 'Rock', '軟件', '1', '2016-12-16 10:45:25', '管理員', null, 'RockOA開發團隊', '電話開拓', '0592-123456', '15888888', 'xinhu@rockoa.com', null, '廈門', null, null, '0', null, '管理員', '1', null, null, '1', '0', '0', null, '0', '0.00', '0.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('3', '微軟公司', '軟件', '0', '2016-10-17 09:24:22', null, null, null, '網上開拓', null, null, null, null, '美國倫敦', null, null, '1', null, '管理員', '1', '管理員,張飛', '1,6', '1', '0', '0', null, '1', '50000.00', '30000.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('4', '谷歌公司', null, '0', '2016-07-18 14:11:55', null, null, null, '網上開拓', null, null, null, null, '美國chrome', null, null, '1', null, '信呼客服', '6', '管理員', '1', '1', '0', '0', null, '1', '0.00', '0.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('5', '騰訊科技', null, '0', '2016-10-16 16:00:31', null, null, null, '網上開拓', null, null, null, null, '深圳', null, null, '1', '2016-10-16 16:00:31', '張飛', '6', null, null, '0', '0', '0', null, '1', '2300.00', '2300.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('15', '信呼', '軟件', '1', '2017-08-20 13:43:23', '管理員', '磐石', '廈門信呼科技有限公司', '網上開拓', '0592-123456', '15800000000', 'admin@rockoa.com', null, '福建廈門思明區軟件園', null, null, '1', '2017-08-20 13:43:23', '管理員', '1', null, null, '0', '0', '0', null, '0', '0.00', '0.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('16', '百度', '搜索計算', '1', '2017-08-20 13:43:23', '管理員', '李彥宏', '百度在線網絡技術(北京)有限公司', '電話聯系', '010-123456', '15800000001', 'admin@baidu.com', null, '北京軟件園百度大廈', null, null, '1', '2017-08-20 13:43:23', '管理員', '1', null, null, '0', '0', '0', null, '0', '0.00', '0.00', null, null);
INSERT INTO `xinhu_customer` VALUES ('17', '陳先生', '個人', '1', '2017-08-20 13:43:23', '管理員', null, null, '電話聯系', '010-123456', '15800000002', '1111@qq.com', null, '福建廈門火車站', null, null, '1', '2017-08-20 13:43:23', '管理員', '1', null, null, '0', '0', '0', null, '0', '0.00', '0.00', null, null);

-- ----------------------------
-- Table structure for `xinhu_custract`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_custract`;
CREATE TABLE `xinhu_custract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `num` varchar(30) DEFAULT NULL COMMENT '合同編號',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `custid` int(11) DEFAULT '0',
  `custname` varchar(255) DEFAULT NULL COMMENT '客戶名稱',
  `linkman` varchar(20) DEFAULT NULL COMMENT '客戶聯系人',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '合同金額',
  `moneys` decimal(10,2) DEFAULT '0.00' COMMENT '待收金額',
  `startdt` date DEFAULT NULL COMMENT '生效日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `content` text COMMENT '合同內容',
  `saleid` smallint(6) DEFAULT '0' COMMENT '銷售機會Id',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `signdt` date DEFAULT NULL COMMENT '簽約日期',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款合同，1付款合同',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '0待,1已完成,2部分',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已全部創建收付款單',
  `createname` varchar(20) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='客戶合同';

-- ----------------------------
-- Records of xinhu_custract
-- ----------------------------
INSERT INTO `xinhu_custract` VALUES ('1', '1', 'HT-001', '2016-10-15 10:59:40', '管理員', '2016-10-12', null, '1', '1', '信呼辦公軟件', null, '520.00', '0.00', '2016-10-01', '2016-10-31', '1、技術支持一個月。\n2、部署安裝2次。', null, '1', '2016-10-12', '0', '1', '1', '管理員', '1');
INSERT INTO `xinhu_custract` VALUES ('2', '7', 'HT-002', '2016-10-13 20:18:04', '趙子龍', '2016-10-13', null, '1', '3', '微軟公司', null, '50000.00', '30000.00', '2016-10-01', '2017-10-31', null, '2', '1', '2016-10-13', '0', '2', '1', '管理員', '1');
INSERT INTO `xinhu_custract` VALUES ('3', '1', 'HT-003', '2016-10-19 16:02:53', '管理員', '2016-10-15', null, '1', '1', '信呼辦公軟件', null, '25.00', '0.00', '2016-10-01', '2016-10-31', '採購了啥！', null, '1', '2016-10-15', '1', '1', '1', '管理員', '1');
INSERT INTO `xinhu_custract` VALUES ('4', '6', 'HT-004', '2016-10-16 16:01:06', '張飛', '2016-10-16', null, '1', '5', '騰訊科技', null, '2300.00', '2300.00', '2015-10-01', '2017-10-31', null, null, '1', '2016-10-16', '0', '0', '1', '張飛', '6');
INSERT INTO `xinhu_custract` VALUES ('5', '1', 'HT-005', '2017-06-26 17:50:09', '管理員', '2017-06-26', null, '1', '4', '谷歌公司', null, '2351.00', '2351.00', '2017-06-01', '2017-07-01', null, null, '1', '2017-06-26', '0', '0', '0', '管理員', '1');

-- ----------------------------
-- Table structure for `xinhu_custsale`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_custsale`;
CREATE TABLE `xinhu_custsale` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custid` int(11) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL,
  `uid` smallint(6) DEFAULT '0',
  `optname` varchar(10) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `state` tinyint(4) DEFAULT '0' COMMENT '狀態',
  `explain` varchar(500) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `applydt` date DEFAULT NULL,
  `dealdt` datetime DEFAULT NULL COMMENT '成交時間',
  `adddt` datetime DEFAULT NULL,
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '銷售來源',
  `createid` smallint(6) DEFAULT '0',
  `createname` varchar(20) DEFAULT NULL,
  `htid` smallint(6) DEFAULT '0' COMMENT '合同ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='銷售機會';

-- ----------------------------
-- Records of xinhu_custsale
-- ----------------------------
INSERT INTO `xinhu_custsale` VALUES ('1', '1', '信呼辦公軟件', '3', '小喬', '2016-07-17 22:12:06', '0', '說要買模塊定制哦！', '50.00', '2016-07-17', null, '2016-07-17 22:12:06', null, '3', '小喬', '0');
INSERT INTO `xinhu_custsale` VALUES ('2', '3', '微軟公司', '7', '趙子龍', '2016-07-18 10:38:21', '1', '說要收購軟件信呼，呵呵！', '50000.00', '2016-07-18', '2016-07-18 14:02:15', '2016-07-18 10:38:21', '主動來訪', '1', '管理員', '2');
INSERT INTO `xinhu_custsale` VALUES ('3', '4', '谷歌公司', '8', '信呼客服', '2016-07-18 14:13:17', '1', '可能買安卓手機一部', '500.00', '2016-07-18', '2016-07-18 14:13:39', '2016-07-18 14:13:17', '主動來訪', '8', '信呼客服', '0');
INSERT INTO `xinhu_custsale` VALUES ('4', '1', '信呼辦公軟件', '1', '管理員', '2016-07-18 16:33:17', '0', '呵呵', '58.00', '2016-07-18', '2016-07-29 13:14:41', '2016-07-18 16:33:17', '電話銷售', '1', '管理員', '0');
INSERT INTO `xinhu_custsale` VALUES ('5', '3', '微軟公司', '4', '大喬', '2016-07-18 20:53:18', '0', '夢夢搭', '511.00', '2016-07-18', null, '2016-07-18 20:53:18', '網上聯系', '4', '大喬', '0');

-- ----------------------------
-- Table structure for `xinhu_daily`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_daily`;
CREATE TABLE `xinhu_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `content` varchar(4000) DEFAULT NULL COMMENT '內容',
  `adddt` datetime DEFAULT NULL COMMENT '新增時間',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `uid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `type` tinyint(1) DEFAULT '0' COMMENT '類型@0|日報,1|週報,2|月報,3|年報',
  `plan` varchar(2000) DEFAULT NULL COMMENT '明日計劃',
  `status` tinyint(1) DEFAULT '0',
  `enddt` date DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `mark` smallint(6) DEFAULT '0' COMMENT '得分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='日報';

-- ----------------------------
-- Records of xinhu_daily
-- ----------------------------
INSERT INTO `xinhu_daily` VALUES ('1', '2016-04-07', 'REIM系統開發，添加推送密碼，官網維護等。', '2016-04-08 23:00:40', '2016-04-08 23:00:40', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('2', '2016-04-08', '1、核心模塊流程添加轉辦給其他人功能。\n2、REIM開發添加手機端提醒。', '2016-04-08 23:01:24', '2016-04-08 23:01:24', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('3', '2016-04-05', '1、官網添加會員用戶中心，添加密碼修改，REIM密鑰創建。', '2016-04-08 23:02:49', '2016-04-08 23:02:49', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('4', '2016-06-16', '1、後台數據權限添加\n2、權限查看編輯應用到各個模塊中。\n', null, '2016-06-16 22:45:17', '2', '貂蟬', '0', null, '1', null, '2', '0');
INSERT INTO `xinhu_daily` VALUES ('5', '2016-06-16', '今天查看了其他人員的日報哦，做的還不錯，加油！', null, '2016-06-16 23:08:37', '5', '磐石', '0', null, '1', null, '5', '0');
INSERT INTO `xinhu_daily` VALUES ('6', '2016-06-17', '1、救了世子和劉備夫人，不慎他跳井了。\n2、被曹操追上，死裡逃生啊。', null, '2016-06-17 10:55:07', '7', '趙子龍', '0', null, '1', null, '7', '0');
INSERT INTO `xinhu_daily` VALUES ('7', '2016-06-17', '1、優化了很多內容APP，測試\n2、添加上傳文件功能。', null, '2016-06-17 19:28:30', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('8', '2016-06-13', '1、開發設計維護。\n2、端午來幹嘛的？', null, '2016-06-17 20:21:14', '1', '管理員', '1', '1、繼續開發。\n2、繼續涉及啦，哈哈。', '1', '2016-06-17', '1', '0');
INSERT INTO `xinhu_daily` VALUES ('9', '2016-06-06', '端午放假端午放假', '2016-06-17 20:26:27', '2016-10-19 21:27:03', '1', '管理員', '1', null, '1', '2016-06-12', '1', '0');
INSERT INTO `xinhu_daily` VALUES ('10', '2016-06-01', '1、本月主用做信呼系統開發。\n2、信呼APP開發，包括安卓，蘋果，接口等。', '2016-06-17 20:27:43', '2016-06-17 20:29:07', '1', '管理員', '2', '1、下月計劃信呼官網設計並開發\n2、信呼上線。', '1', '2016-06-30', '1', '0');
INSERT INTO `xinhu_daily` VALUES ('11', '2016-06-24', '1、客戶端添加搜索。\n2、添加可上傳頭像功能。', '2016-06-24 20:34:57', '2016-06-24 20:35:12', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('12', '2016-06-24', '1、修改了自己資料，入職查看相關公司規定。', '2016-06-24 20:39:33', '2016-06-24 20:40:30', '3', '小喬', '0', null, '1', null, '3', '0');
INSERT INTO `xinhu_daily` VALUES ('13', '2016-06-30', '完成了很多任務，呵呵', '2016-06-30 20:15:21', '2016-06-30 20:15:39', '6', '張飛', '0', null, '1', null, '6', '12');
INSERT INTO `xinhu_daily` VALUES ('14', '2016-09-14', '日報修改時間切換等。', '2016-09-14 15:40:38', '2016-09-14 15:40:38', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('15', '2016-10-25', '猜猜我做了啥，哈哈1', '2016-10-25 20:45:08', '2016-12-14 16:33:31', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('16', '2017-01-05', '昨天的日報還沒寫呢，現在寫一些！', '2017-01-06 09:17:15', '2017-01-06 09:17:15', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('17', '2017-02-10', '1、添加元素類型，日報添加提醒報告。\n2、完善系統安全。', '2017-02-10 16:20:46', '2017-02-10 16:26:33', '6', '張飛', '0', null, '1', null, '6', '0');
INSERT INTO `xinhu_daily` VALUES ('18', '2017-05-07', '日報統計開發', '2017-05-09 14:20:31', '2017-05-09 17:15:01', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('19', '2017-05-08', '升級系統，開發系統，bug修復。', '2017-05-15 20:09:02', '2017-05-15 20:09:02', '1', '管理員', '1', null, '1', '2017-05-12', '1', '0');
INSERT INTO `xinhu_daily` VALUES ('20', '2017-07-24', '補寫日報嘍，首頁開發調整。', '2017-07-24 09:04:03', '2017-07-24 09:12:04', '1', '管理員', '0', null, '1', null, '1', '0');
INSERT INTO `xinhu_daily` VALUES ('21', '2017-09-24', '孔明讓我去保護主公。', '2017-09-24 10:54:01', '2017-09-24 11:01:50', '7', '趙子龍', '0', null, '1', null, '7', '0');

-- ----------------------------
-- Table structure for `xinhu_dailyfx`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_dailyfx`;
CREATE TABLE `xinhu_dailyfx` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `month` varchar(10) DEFAULT NULL COMMENT '月份',
  `optdt` datetime DEFAULT NULL COMMENT '分析時間',
  `day1` tinyint(1) DEFAULT '0' COMMENT '0未寫,1已寫,2請假,3休息日',
  `day2` tinyint(1) DEFAULT '0',
  `day3` tinyint(1) DEFAULT '0',
  `day4` tinyint(1) DEFAULT '0',
  `day5` tinyint(1) DEFAULT '0',
  `day6` tinyint(1) DEFAULT '0',
  `day7` tinyint(1) DEFAULT '0',
  `day8` tinyint(1) DEFAULT '0',
  `day9` tinyint(1) DEFAULT '0',
  `day10` tinyint(1) DEFAULT '0',
  `day11` tinyint(1) DEFAULT '0',
  `day12` tinyint(1) DEFAULT '0',
  `day13` tinyint(1) DEFAULT '0',
  `day14` tinyint(1) DEFAULT '0',
  `day15` tinyint(1) DEFAULT '0',
  `day16` tinyint(1) DEFAULT '0',
  `day17` tinyint(1) DEFAULT '0',
  `day18` tinyint(1) DEFAULT '0',
  `day19` tinyint(1) DEFAULT '0',
  `day20` tinyint(1) DEFAULT '0',
  `day21` tinyint(1) DEFAULT '0',
  `day22` tinyint(1) DEFAULT '0',
  `day23` tinyint(1) DEFAULT '0',
  `day24` tinyint(1) DEFAULT '0',
  `day25` tinyint(1) DEFAULT '0',
  `day26` tinyint(1) DEFAULT '0',
  `day27` tinyint(1) DEFAULT '0',
  `day28` tinyint(1) DEFAULT '0',
  `day29` tinyint(1) DEFAULT '0',
  `day30` tinyint(1) DEFAULT '0',
  `day31` tinyint(1) DEFAULT '0',
  `totaly` smallint(6) DEFAULT '0' COMMENT '應寫次數',
  `totalx` smallint(6) DEFAULT '0' COMMENT '已寫次數',
  `totalw` smallint(6) DEFAULT '0' COMMENT '未寫次數',
  `explain` varchar(200) DEFAULT NULL COMMENT '說明',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`month`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='日報分析統計表';

-- ----------------------------
-- Records of xinhu_dailyfx
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_demo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_demo`;
CREATE TABLE `xinhu_demo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sheng` varchar(50) DEFAULT NULL COMMENT '省',
  `shi` varchar(50) DEFAULT NULL COMMENT '市',
  `xian` varchar(50) DEFAULT NULL COMMENT '縣(區)',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `tanxuan` varchar(50) DEFAULT NULL COMMENT '彈出下來單選',
  `tanxuancheck` varchar(50) DEFAULT NULL COMMENT '彈框下拉多選',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_demo
-- ----------------------------
INSERT INTO `xinhu_demo` VALUES ('1', '北京', '東城區', null, '2017-10-20', '1', '2017-10-20 10:20:57', '1', '管理員', null, '0', '1', '第二個數據', '數據1,數據2,數據6');

-- ----------------------------
-- Table structure for `xinhu_dept`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_dept`;
CREATE TABLE `xinhu_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '編號',
  `name` varchar(100) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `headman` varchar(50) DEFAULT NULL COMMENT '負責人',
  `headid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='組織結構部門';

-- ----------------------------
-- Records of xinhu_dept
-- ----------------------------
INSERT INTO `xinhu_dept` VALUES ('1', null, '信呼開發團隊', '0', '0', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('2', 'dev', '開發部', '1', '1', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('3', null, '財務部', '1', '2', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('4', null, '行政人事部', '1', '3', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('5', null, '管理層', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_editrecord`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_editrecord`;
CREATE TABLE `xinhu_editrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldsname` varchar(50) DEFAULT NULL COMMENT '字段名稱',
  `oldval` varchar(1000) DEFAULT NULL COMMENT '原來值',
  `newval` varchar(1000) DEFAULT NULL COMMENT '新值',
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT NULL COMMENT '操作人Id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `editci` smallint(6) DEFAULT '0' COMMENT '第幾次修改記錄',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='修改記錄表';

-- ----------------------------
-- Records of xinhu_editrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_emailm`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_emailm`;
CREATE TABLE `xinhu_emailm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0' COMMENT '用戶iD',
  `title` varchar(220) DEFAULT NULL COMMENT '主題',
  `content` longtext COMMENT '郵件內容',
  `sendid` smallint(6) DEFAULT NULL,
  `sendname` varchar(100) DEFAULT NULL COMMENT '發送人',
  `senddt` datetime DEFAULT NULL COMMENT '發送時間',
  `receid` varchar(2000) DEFAULT NULL,
  `recename` varchar(4000) DEFAULT NULL COMMENT '接收人',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|草稿,1|已發送',
  `hid` smallint(6) DEFAULT '0' COMMENT '@回復id',
  `isfile` tinyint(1) DEFAULT '0' COMMENT '@是否有附件',
  `applydt` date DEFAULT NULL,
  `message_id` varchar(100) DEFAULT NULL COMMENT '郵件Id',
  `fromemail` varchar(500) DEFAULT NULL COMMENT '發送人郵件',
  `toemail` varchar(500) DEFAULT NULL COMMENT '發給郵件人',
  `reply_toemail` varchar(500) DEFAULT NULL COMMENT '回復郵件',
  `ccemail` varchar(500) DEFAULT NULL COMMENT '抄送給',
  `size` int(11) DEFAULT '0' COMMENT '郵件大小',
  `ccname` varchar(100) DEFAULT NULL COMMENT '抄送給',
  `ccid` varchar(100) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0內部郵件,1用郵件外發',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `numoi` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `message_id` (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='郵件主表';

-- ----------------------------
-- Records of xinhu_emailm
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_emails`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_emails`;
CREATE TABLE `xinhu_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0',
  `uid` smallint(6) DEFAULT '0',
  `zt` tinyint(1) DEFAULT '0' COMMENT '@0|未讀,1|已讀',
  `type` tinyint(1) DEFAULT '0' COMMENT '0接收,1抄送,2發送者',
  `ishui` tinyint(1) DEFAULT '0' COMMENT '是否回復',
  `isdel` tinyint(1) DEFAULT '0' COMMENT '@0|未刪,1|已刪',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `email` varchar(50) DEFAULT NULL,
  `personal` varchar(20) DEFAULT NULL COMMENT '人員',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`,`email`,`type`),
  KEY `mid_2` (`mid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='郵件子表';

-- ----------------------------
-- Records of xinhu_emails
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_email_cont`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_email_cont`;
CREATE TABLE `xinhu_email_cont` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `body` longtext COMMENT '內容',
  `receid` varchar(500) DEFAULT '0',
  `recename` varchar(500) DEFAULT NULL COMMENT '接收人',
  `receemail` varchar(500) DEFAULT NULL COMMENT '接收郵件',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '添加人',
  `status` tinyint(1) DEFAULT '0' COMMENT '0待發送,1成功,2失敗',
  `senddt` datetime DEFAULT NULL COMMENT '發送時間',
  `ccname` varchar(500) DEFAULT NULL COMMENT '抄送給',
  `ccemail` varchar(500) DEFAULT NULL COMMENT '抄送郵件',
  `attachpath` varchar(500) DEFAULT NULL COMMENT '附件路徑',
  `attachname` varchar(500) DEFAULT NULL COMMENT '福建名稱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系統發送郵件內容';

-- ----------------------------
-- Records of xinhu_email_cont
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_file`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_file`;
CREATE TABLE `xinhu_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valid` tinyint(4) DEFAULT '1',
  `filename` varchar(200) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `fileext` varchar(20) DEFAULT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesizecn` varchar(30) DEFAULT NULL,
  `filepath` varchar(100) DEFAULT NULL,
  `thumbpath` varchar(100) DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(50) DEFAULT NULL COMMENT '上傳者',
  `adddt` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(300) DEFAULT NULL,
  `mtype` varchar(50) DEFAULT NULL COMMENT '對應類型',
  `mid` int(11) DEFAULT '0' COMMENT '管理id',
  `downci` int(11) DEFAULT '0' COMMENT '下載次數',
  `keyoi` varchar(20) DEFAULT NULL COMMENT '對應序號郵件附件中用到',
  `pdfpath` varchar(100) DEFAULT NULL COMMENT '轉pdf後路徑',
  `oid` int(11) DEFAULT '0' COMMENT '舊ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='上傳文件記錄表';

-- ----------------------------
-- Records of xinhu_file
-- ----------------------------
INSERT INTO `xinhu_file` VALUES ('1', '1', '系統logo.png', null, 'png', '2000', '2.36 KB', 'images/logo.png', '', '1', '管理員', '2016-11-23 22:26:21', '127.0.0.1', 'Chrome', 'im_mess', '11', '5', '0', null, '0');
INSERT INTO `xinhu_file` VALUES ('2', '1', 'daiban.png', null, 'png', '2000', '2.21 KB', 'images/daiban.png', '', '1', '管理員', '2016-11-23 22:26:26', '127.0.0.1', 'Chrome', null, '0', '3', '0', null, '0');

-- ----------------------------
-- Table structure for `xinhu_fininfom`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_fininfom`;
CREATE TABLE `xinhu_fininfom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT '0' COMMENT '類型@0|報銷單,1|出差報銷,2|借款單,3|還款單,4|付款申請,5|開票申請',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金額',
  `moneycn` varchar(100) DEFAULT NULL COMMENT '大寫金額',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `bills` smallint(6) DEFAULT NULL COMMENT '附單據(張)',
  `paytype` varchar(20) DEFAULT NULL COMMENT '付款方式',
  `fullname` varchar(100) DEFAULT NULL COMMENT '收款人全稱',
  `cardid` varchar(50) DEFAULT NULL COMMENT '收款帳號',
  `openbank` varchar(50) DEFAULT NULL COMMENT '開戶行',
  `purpose` varchar(100) DEFAULT NULL COMMENT '用途',
  `purresult` varchar(100) DEFAULT NULL,
  `paydt` date DEFAULT NULL COMMENT '付款日期',
  `num` varchar(30) DEFAULT NULL COMMENT '合同號/訂單號',
  `name` varchar(50) DEFAULT NULL COMMENT '開票名稱',
  `shibieid` varchar(50) DEFAULT NULL COMMENT '納稅識別號',
  `address` varchar(100) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(50) DEFAULT NULL COMMENT '電話',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='費用報銷';

-- ----------------------------
-- Records of xinhu_fininfom
-- ----------------------------
INSERT INTO `xinhu_fininfom` VALUES ('1', '0', '1', '12.00', '壹拾貳元整', '2016-05-05 20:19:42', '1', '管理員', '2016-05-05', null, '1', '1', '0', '支付寶', 'RockOA開發團隊', 'admin@rockoa.com', '阿裡巴巴', null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('3', '1', '1', '500.00', '伍佰元整', '2016-09-03 11:43:36', '1', '管理員', '2016-05-05', null, '1', '1', '0', '支付寶', 'RockOA開發團隊', 'admin@rockoa.com', '阿裡巴巴', '北京會見馬雲', '聊的不錯', null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('4', '2', '1', '500.00', '伍佰元整', '2016-09-03 15:43:28', '1', '管理員', '2016-05-08', '啟動資金', '1', '1', '1', '支付寶', 'RockOA開發團隊', 'admin@rockoa.com', '阿裡巴巴公司', '買房', null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('5', '0', '1', '101.00', '壹佰零壹元整', '2016-09-02 22:54:13', '1', '管理員', '2016-09-02', null, '0', '1', '0', '支付寶', '信呼', 'admin@rockoa.com', '支付寶', null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('6', '2', '1', '35000.00', '參萬伍仟元整', '2016-09-03 16:52:52', '1', '管理員', '2016-09-03', null, '1', '1', null, '支付寶', 'RockOA開發團隊', 'admin@rockoa.com', '阿裡巴巴', '買車', null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('7', '3', '1', '35000.00', '參萬伍仟元整', '2016-09-03 17:17:44', '1', '管理員', '2016-09-03', null, '1', '1', null, '支付寶', 'RockOA開發團隊', 'admin@rockoa.com', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('8', '0', '1', '63.00', '陸拾參元整', '2017-05-14 18:50:58', '1', '管理員', '2016-09-28', null, '1', '1', '0', '支付寶', '信呼開發團隊', 'admin@rockoa.com', '阿裡巴巴', null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('9', '0', '4', '530.00', '伍佰參拾元整', '2017-05-08 19:35:20', '4', '大喬', '2017-05-08', null, '0', '1', '0', '現金', '大喬公司', '62265333333', '無', null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('10', '4', '1', '50.00', null, '2017-08-07 20:42:59', '1', '管理員', '2017-08-07', '付錢申請', '0', '1', null, '銀行轉賬', '信呼開發團隊', '62251234699', '招商銀行', null, null, '2017-08-07', 'abx123', null, null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('11', '5', '1', '5600.00', null, '2017-08-07 21:11:16', '1', '管理員', '2017-08-07', null, '1', '1', null, '增值稅普通發票', '信呼開發團隊', '6225885927362442', '招商銀行', null, null, '2017-08-07', null, '合同開票', '3500000000', '廈門軟件園', '0592-1234667');

-- ----------------------------
-- Table structure for `xinhu_fininfos`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_fininfos`;
CREATE TABLE `xinhu_fininfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '對應主表fininfom.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `sdt` date DEFAULT NULL COMMENT '發生日期',
  `name` varchar(20) DEFAULT NULL COMMENT '所屬項目',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金額',
  `sm` varchar(100) DEFAULT NULL COMMENT '說明',
  `didian` varchar(50) DEFAULT NULL COMMENT '發生地點',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='費用報銷子表';

-- ----------------------------
-- Records of xinhu_fininfos
-- ----------------------------
INSERT INTO `xinhu_fininfos` VALUES ('1', '5', '0', '2016-09-02', '市內交通費', '12.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('2', '5', '1', '2016-09-02', '停車費', '89.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('3', '4', '0', '2016-05-05', '電話費', '500.00', '國外電話費貴啊', null);
INSERT INTO `xinhu_fininfos` VALUES ('4', '3', '0', '2016-09-01', '電話費', '45.00', null, '北京');
INSERT INTO `xinhu_fininfos` VALUES ('5', '3', '1', '2016-09-01', '快遞費', '455.00', null, '北京');
INSERT INTO `xinhu_fininfos` VALUES ('6', '8', '0', '2016-09-01', '電話費', '30.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('7', '8', '1', '2017-01-05', '電話費', '33.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('8', '9', '0', '2017-05-01', '市內交通費', '30.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('9', '9', '1', '2017-05-08', '停車費', '500.00', null, null);

-- ----------------------------
-- Table structure for `xinhu_flow_bill`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_bill`;
CREATE TABLE `xinhu_flow_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sericnum` varchar(50) DEFAULT NULL COMMENT '單號',
  `table` varchar(50) DEFAULT NULL COMMENT '對應表',
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `modeid` smallint(6) DEFAULT '0' COMMENT '模塊id',
  `modename` varchar(20) DEFAULT NULL COMMENT '模塊名稱',
  `uname` varchar(20) DEFAULT NULL COMMENT '申請人姓名',
  `uid` smallint(6) DEFAULT NULL COMMENT '用戶id',
  `udeptname` varchar(30) DEFAULT NULL COMMENT '申請人部門',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0' COMMENT '操作人Id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `allcheckid` varchar(500) DEFAULT NULL COMMENT '@所有審核人',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '是否刪除',
  `nstatus` tinyint(1) DEFAULT '0' COMMENT '當前狀態值',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `nstatustext` varchar(100) DEFAULT NULL COMMENT '當前狀態',
  `status` tinyint(1) DEFAULT '0',
  `nowcourseid` smallint(6) DEFAULT '0' COMMENT '當前步驟Id',
  `nowcheckid` varchar(500) DEFAULT NULL COMMENT '當前審核人id',
  `nowcheckname` varchar(500) DEFAULT NULL COMMENT '當前審核人',
  `checksm` varchar(200) DEFAULT NULL COMMENT '最後審核說明',
  `updt` datetime DEFAULT NULL COMMENT '最後更新時間',
  `createdt` datetime DEFAULT NULL COMMENT '創建時間',
  `tuiid` int(11) DEFAULT '0' COMMENT '退回flow_log.Id',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否已提交了',
  PRIMARY KEY (`id`),
  KEY `sericnum` (`sericnum`),
  KEY `table` (`table`,`mid`) USING BTREE,
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='流程單據';

-- ----------------------------
-- Records of xinhu_flow_bill
-- ----------------------------
INSERT INTO `xinhu_flow_bill` VALUES ('1', 'KA-20160729-0001', 'kqinfo', '1', '5', '請假條', '管理員', '1', '開發部', '2016-08-17 22:50:22', '1', '管理員', '4,5', '0', '1', '2016-07-29', '大喬通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('2', 'KB-20160729-0001', 'kqinfo', '2', '6', '加班單', '管理員', '1', '開發部', '2016-07-29 10:56:58', '1', '管理員', '5', '0', '1', '2016-07-29', '磐石通過', '1', '0', null, null, '好的', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('3', 'KA-20160807-0001', 'kqinfo', '3', '5', '請假條', '張飛', '6', '開發部', '2016-08-07 18:37:02', '6', '張飛', '4,1', '0', '1', '2016-08-07', '大喬通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('4', 'KA-20160815-0001', 'kqinfo', '4', '5', '請假條', '管理員', '1', '開發部', '2016-09-13 16:05:38', '1', '管理員', '5,4', '0', '2', '2016-09-13', '待磐石處理', '0', '1', '5', '磐石', 'as', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('5', 'KA-20160825-0001', 'kqinfo', '5', '5', '請假條', '管理員', '1', '開發部', '2016-08-25 16:01:52', '1', '管理員', '4,5', '0', '1', '2016-08-25', '大喬通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('6', 'KA-20160826-0001', 'kqinfo', '6', '5', '請假條', '信呼客服', '8', '開發部', '2016-08-26 22:45:35', '8', '信呼客服', '4,1', '0', '1', '2016-08-26', '大喬通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('8', 'KB-20160827-0001', 'kqinfo', '7', '6', '加班單', '管理員', '1', '開發部', '2016-08-27 14:06:56', '1', '管理員', '5', '0', '1', '2016-08-27', '磐石通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('9', 'KD-20160827-0001', 'kqout', '1', '23', '外出出差', '管理員', '1', '開發部', '2016-08-27 15:22:51', '1', '管理員', '5', '0', '1', '2016-08-27', '磐石通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('10', 'KA-20160830-0001', 'kqinfo', '8', '5', '請假條', '張飛', '6', '開發部', '2016-08-30 20:12:33', '6', '張飛', '4,6,1', '0', '1', '2016-08-30', '大喬處理通過', '1', '0', null, null, '好的', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('11', 'CD-20160901-0001', 'goodm', '1', '24', '物品領用', '管理員', '1', '開發部', '2016-09-01 23:08:03', '1', '管理員', '4', '0', '1', '2016-09-01', '大喬處理發放', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('12', 'CD-20160901-0002', 'goodm', '2', '24', '物品領用', '管理員', '1', '開發部', '2016-09-02 10:43:32', '1', '管理員', '4', '0', '1', '2016-09-02', '大喬處理發放', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('14', 'CD-20160901-0004', 'goodm', '4', '24', '物品領用', '管理員', '1', '開發部', '2016-09-02 21:29:42', '1', '管理員', '2,1,3,4', '0', '1', '2016-09-02', '貂蟬處理發放', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('15', 'CD-20160901-0005', 'goodm', '5', '28', '物品採購', '管理員', '1', '開發部', '2016-09-03 22:54:31', '1', '管理員', '5,4', '0', '1', '2016-09-03', '待大喬處理', '0', '20', '4', '大喬', '哈哈哈', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('16', 'CD-20160901-0006', 'goodm', '6', '24', '物品領用', '管理員', '1', '開發部', '2017-02-09 16:16:12', '1', '管理員', '4', '0', '0', '2017-02-09', '待大喬處理', '0', '47', '4', '大喬', null, '2017-02-09 16:16:12', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('17', 'CD-20160901-0007', 'goodm', '7', '28', '物品採購', '管理員', '1', '開發部', '2017-05-02 13:35:17', '1', '管理員', '5,4', '0', '1', '2017-05-02', '待大喬處理', '0', '20', '4', '大喬', '很好，同意購買。', '2017-06-12 15:33:36', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('18', 'FA-20160902-0001', 'fininfom', '5', '11', '費用報銷', '管理員', '1', '開發部', '2016-09-12 14:52:28', '1', '管理員', '4,5,2', '0', '2', '2016-09-02', '待大喬處理', '0', '8', '4', '大喬', '12', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('19', 'FA-20160508-0001', 'fininfom', '4', '26', '借款單', '管理員', '1', '開發部', '2016-09-03 15:43:28', '1', '管理員', '2,4,5', '0', '1', '2016-05-08', '貂蟬處理通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('20', 'FB-20160505-0001', 'fininfom', '3', '25', '出差報銷', '管理員', '1', '開發部', '2016-09-03 11:43:36', '1', '管理員', '2,8,5,4', '0', '1', '2016-05-05', '貂蟬處理通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('21', 'FC-20160903-0001', 'fininfom', '6', '26', '借款單', '管理員', '1', '開發部', '2016-09-03 16:52:52', '1', '管理員', '2,4,5', '0', '1', '2016-09-03', '貂蟬處理通過', '1', '0', null, null, '哈哈哈哈', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('22', 'FD-20160903-0001', 'fininfom', '7', '27', '還款單', '管理員', '1', '開發部', '2016-09-03 17:17:44', '1', '管理員', '2,1', '0', '1', '2016-09-03', '貂蟬處理通過', '1', '0', null, null, '哈哈哈哈', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('23', 'GA-20160905-0001', 'official', '1', '19', '發文單', '管理員', '1', '開發部', '2016-09-05 20:13:56', '1', '管理員', '3,8,5', '0', '1', '2016-09-05', '小喬處理通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('24', 'KA-20160908-0001', 'kqinfo', '9', '5', '請假條', '管理員', '1', '開發部', '2016-09-12 14:50:07', '1', '管理員', '4,5', '0', '5', '2016-09-08', '作廢', '5', '2', null, null, '作廢：太久沒處理了，作廢吧', '2017-08-02 15:38:14', null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('25', 'KA-20160925-0001', 'kqinfo', '11', '5', '請假條', '張飛', '6', '開發部', '2016-09-25 16:04:13', '6', '張飛', '1,4,5', '0', '1', '2016-09-25', '待大喬處理', '0', '2', '4', '大喬', null, '2017-03-17 14:11:04', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('26', 'FA-20160928-0001', 'fininfom', '8', '11', '費用報銷', '管理員', '1', '開發部', '2017-05-14 18:50:58', '1', '管理員', '2,4,5', '0', '1', '2016-09-28', '貂蟬處理通過', '1', '0', null, null, null, '2017-06-22 09:41:59', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('27', 'CD-20160901-0008', 'goodm', '0', '24', '物品領用', '管理員', '1', '開發部', '2016-10-06 12:09:58', '0', null, null, '1', '1', '2016-09-01', null, '0', '0', null, null, null, null, null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('28', 'HA-20161006-0001', 'hrpositive', '1', '32', '轉正申請', '管理員', '1', '開發部', '2016-10-06 20:58:38', '1', '管理員', '4,5', '0', '1', '2016-10-06', '大喬處理通過', '1', '0', null, null, '好哦奧', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('29', 'HB-20161007-0001', 'hrredund', '1', '33', '離職申請', '管理員', '1', '開發部', '2016-10-07 11:55:33', '1', '管理員', '5,4', '0', '2', '2016-10-07', '待磐石處理', '0', '29', '5', '磐石', '沒事提啥離職啊，我去', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('37', 'HC-20161010-0001', 'hrsalary', '1', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 20:13:37', '1', '管理員', '4', '0', '0', '2016-10-10', '待大喬處理', '0', '31', '4', '大喬', null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('38', 'HC-20161010-0002', 'hrsalary', '2', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 20:14:07', '1', '管理員', '4', '0', '1', '2016-10-10', '大喬處理通過', '1', '0', null, null, null, '2017-04-22 19:18:13', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('39', 'HC-20161010-0003', 'hrsalary', '3', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 20:14:49', '1', '管理員', '4', '0', '0', '2016-10-10', '待大喬處理', '0', '31', '4', '大喬', null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('40', 'HC-20161010-0004', 'hrsalary', '4', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 20:15:34', '1', '管理員', '4', '0', '1', '2016-10-10', '大喬處理通過', '1', '0', null, null, null, '2017-04-22 20:36:59', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('41', 'HC-20161010-0005', 'hrsalary', '5', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 20:16:13', '1', '管理員', '4', '0', '1', '2016-10-10', '大喬處理通過', '1', '0', null, null, null, '2017-04-22 20:36:57', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('42', 'HC-20161010-0006', 'hrsalary', '15', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 21:06:23', '1', '管理員', '4', '0', '1', '2016-10-10', '大喬處理通過', '1', '0', null, null, null, '2017-04-22 19:17:58', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('43', 'HC-20161010-0007', 'hrsalary', '14', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 21:06:42', '1', '管理員', null, '0', '0', '2016-10-10', null, '0', '0', null, null, null, null, null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('44', 'HC-20161010-0008', 'hrsalary', '16', '34', '薪資', '管理員', '1', '開發部', '2016-10-19 21:24:55', '1', '管理員', '4', '0', '1', '2016-10-10', '大喬處理通過', '1', '0', null, null, null, '2017-04-22 19:08:18', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('45', 'HC-20161010-0009', 'hrsalary', '13', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 21:06:00', '1', '管理員', null, '0', '0', '2016-10-10', null, '0', '0', null, null, null, null, null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('46', 'HC-20161010-0010', 'hrsalary', '11', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 21:06:00', '1', '管理員', null, '0', '0', '2016-10-10', null, '0', '0', null, null, null, null, null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('47', 'HE-20161019-0001', 'hrtransfer', '1', '38', '人事調動', '管理員', '1', '開發部', '2016-10-19 22:03:12', '1', '管理員', '4', '0', '1', '2016-10-19', '大喬處理通過', '1', '0', null, null, null, '2017-02-07 10:21:30', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('48', 'HD-20161101-0001', 'hrtrsalary', '1', '37', '調薪申請', '管理員', '1', '開發部', '2016-10-20 22:20:41', '1', '管理員', '5,4', '0', '0', '2016-11-01', '待磐石處理', '0', '33', '5', '磐石', null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('49', 'HF-20161020-0001', 'reward', '1', '39', '獎懲處罰', '管理員', '1', '開發部', '2016-10-20 21:01:10', '1', '管理員', '4,1', '0', '1', '2016-10-20', '大喬處理通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('50', 'HF-20161020-0002', 'reward', '2', '39', '獎懲處罰', '管理員', '1', '開發部', '2016-10-20 21:16:24', '1', '管理員', '8,4', '0', '1', '2016-10-20', '待大喬處理', '0', '36', '4', '大喬', null, '2017-03-09 14:33:18', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('51', 'CJ-20161028-0001', 'carmrese', '5', '44', '車輛預定', '管理員', '1', '開發部', '2016-10-28 11:43:40', '1', '管理員', '1,3,5', '0', '1', '2016-10-28', '管理員處理已歸還', '1', '0', null, null, null, '2017-03-01 15:02:50', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('93', 'CJ-20150923-0002', 'carmrese', '1', '44', '車輛預定', '管理員', '1', '開發部', '2015-09-23 16:54:19', '1', '管理員', null, '0', '1', '2015-09-23', null, '1', '0', null, null, null, '2017-06-28 10:49:36', '2015-09-23 16:54:19', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('53', 'CJ-20150923-0001', 'carmrese', '2', '44', '車輛預定', '管理員', '1', '開發部', '2015-09-23 16:54:08', '1', '管理員', null, '0', '1', '2015-09-23', null, '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('54', 'CJ-20161028-0002', 'carmrese', '6', '44', '車輛預定', '管理員', '1', '開發部', '2016-10-28 15:10:44', '1', '管理員', '3,5', '0', '1', '2016-10-28', '小喬處理通過', '1', '0', null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('55', 'CJ-20160307-0001', 'carmrese', '3', '44', '車輛預定', '管理員', '1', '開發部', '2016-03-07 21:02:32', '0', null, '5,3,1', '0', '1', '2016-03-07', '待小喬處理', '0', '38', '3', '小喬', null, '2017-08-25 20:02:07', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('56', 'CL-20161029-0001', 'bookborrow', '1', '46', '圖書借閱', '管理員', '1', '開發部', '2016-10-29 13:08:44', '1', '管理員', '6,3,1', '0', '1', '2016-10-29', '張飛處理確認歸還', '1', '0', null, null, '呵呵', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('57', 'CL-20161029-0002', 'bookborrow', '2', '46', '圖書借閱', '信呼客服', '8', '開發部', '2016-10-29 13:14:35', '8', '信呼客服', '3,2', '0', '1', '2016-10-29', '待貂蟬處理', '0', '40', '2', '貂蟬', '轉給：貂蟬', null, null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('58', 'CL-20161030-0001', 'bookborrow', '3', '46', '圖書借閱', '管理員', '1', '開發部', '2016-10-30 11:58:59', '1', '管理員', '1,3', '0', '1', '2016-10-30', '管理員處理確認歸還', '1', '0', null, null, null, '2017-03-31 09:36:21', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('59', 'KD-20161108-0001', 'kqout', '2', '23', '外出出差', '信呼客服', '8', '開發部', '2016-11-08 20:52:41', '8', '信呼客服', '1', '0', '1', '2016-11-08', '管理員處理通過', '1', '0', null, null, '好的', '2017-02-28 13:13:38', null, '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('61', 'CH-20161208-0001', 'sealapl', '1', '49', '印章申請', '管理員', '1', '開發部', '2016-12-08 21:48:02', '1', '管理員', '1,6,5', '0', '5', '2016-12-08', '作廢', '5', '0', null, null, '作廢：不需要申請了。', '2016-12-19 11:44:21', null, '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('63', 'KA-20161209-0001', 'kqinfo', '14', '5', '請假條', '管理員', '1', '開發部', '2017-07-25 22:09:21', '1', '管理員', '5', '0', '1', '2017-07-25', '磐石處理同意', '1', '0', null, null, '很好啊', '2017-08-04 09:59:14', '2016-12-09 12:23:06', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('64', 'KE-20161216-0001', 'kqerr', '1', '51', '打卡異常', '管理員', '1', '開發部', '2016-12-16 20:54:27', '1', '管理員', '4,5', '0', '1', '2016-12-16', '大喬處理通過', '1', '0', null, null, null, '2016-12-16 21:08:07', '2016-12-16 20:54:27', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('67', 'ZF-20161219-0003', 'tovoid', '3', '52', '單據作廢申請', '管理員', '1', '開發部', '2016-12-19 13:49:22', '1', '管理員', '5', '0', '5', '2016-12-19', '作廢', '5', '0', null, null, '作廢：在刪除測試測試', '2016-12-19 14:33:32', '2016-12-19 13:49:22', '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('69', 'ZF-20161219-0005', 'tovoid', '5', '52', '單據作廢申請', '管理員', '1', '開發部', '2016-12-19 14:39:20', '1', '管理員', '5', '0', '1', '2016-12-19', '磐石處理通過', '1', '0', null, null, null, '2016-12-19 14:39:52', '2016-12-19 14:39:20', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('70', 'GA-20170209-0001', 'official', '2', '19', '發文單', '管理員', '1', '開發部', '2017-08-30 23:26:23', '1', '管理員', '2,3,5', '0', '1', '2017-02-09', '貂蟬處理同意', '1', '0', null, null, null, '2017-09-06 22:38:16', '2017-02-09 17:35:29', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('71', 'CJ-20170301-0001', 'carmrese', '7', '44', '車輛預定', '信呼客服', '8', '開發部', '2017-03-01 09:41:31', '8', '信呼客服', '1,3', '0', '1', '2017-03-01', '管理員處理通過', '1', '0', null, null, 'weew', '2017-03-01 10:21:04', '2017-03-01 09:41:31', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('72', 'CH-20170320-0001', 'sealapl', '2', '49', '印章申請', '管理員', '1', '開發部', '2017-03-20 09:39:47', '1', '管理員', '1,6,5', '0', '1', '2017-03-20', '管理員處理已蓋章', '1', '0', null, null, null, '2017-03-24 16:42:59', '2017-03-20 09:39:47', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('81', 'XW-20170406-0001', 'work', '2', '4', '任務', '管理員', '1', '開發部', '2017-04-06 14:07:50', '1', '管理員', '1', '0', '1', '2017-04-06', '管理員處理通過', '1', '0', null, null, '好的', '2017-07-20 17:13:04', '2017-04-06 14:07:50', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('80', 'XW-20170329-0001', 'work', '1', '4', '任務', '管理員', '1', '開發部', '2017-07-24 10:02:38', '1', '管理員', '1,6', '0', '5', '2017-03-29', '作廢', '5', '53', null, null, '作廢：不需要了', '2017-08-02 15:09:26', '2017-03-29 10:57:58', '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('82', 'XW-20170410-0001', 'work', '3', '4', '任務', '管理員', '1', '開發部', '2017-04-18 11:43:47', '1', '管理員', '1', '0', '1', '2017-04-10', '管理員處理通過', '1', '0', null, null, null, '2017-07-04 13:58:15', '2017-04-10 17:14:40', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('84', 'KD-20170419-0001', 'kqout', '3', '23', '外出出差', '管理員', '1', '開發部', '2017-04-19 12:57:28', '1', '管理員', '5', '0', '1', '2017-04-19', '磐石處理通過', '1', '0', null, null, null, '2017-04-19 12:57:48', '2017-04-19 12:57:28', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('85', 'HC-20161010-0011', 'hrsalary', '12', '34', '薪資', '管理員', '1', '開發部', '2016-10-10 21:06:00', '1', '管理員', null, '0', '0', '2016-10-10', null, '0', '0', null, null, null, '2017-04-22 18:57:55', '2016-10-10 21:06:00', '0', '0');
INSERT INTO `xinhu_flow_bill` VALUES ('86', 'FA-20160505-0001', 'fininfom', '1', '11', '費用報銷', '管理員', '1', '開發部', '2016-05-05 20:19:42', '1', '管理員', null, '0', '1', '2016-05-05', null, '1', '0', null, null, null, '2017-05-02 11:00:16', '2016-05-05 20:19:42', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('87', 'CD-20170502-0001', 'goodm', '8', '24', '物品領用', '管理員', '1', '開發部', '2017-05-02 14:03:10', '1', '管理員', '4', '0', '1', '2017-05-02', '大喬處理發放', '1', '0', null, null, null, '2017-06-22 16:11:33', '2017-05-02 13:57:34', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('88', 'FA-20170508-0001', 'fininfom', '9', '11', '費用報銷', '大喬', '4', '行政人事部', '2017-05-08 19:35:20', '4', '大喬', '4,5,2', '0', '1', '2017-05-08', '待貂蟬處理', '0', '9', '2', '貂蟬', null, '2017-06-09 21:35:52', '2017-05-08 19:35:20', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('89', 'KB-20170518-0001', 'kqinfo', '15', '6', '加班單', '管理員', '1', '開發部', '2017-05-18 12:17:51', '1', '管理員', '5', '0', '1', '2017-05-18', '磐石處理通過', '1', '0', null, null, null, '2017-05-18 12:58:56', '2017-05-18 12:11:37', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('105', 'GB-20170830-0001', 'official', '3', '20', '收文單', '管理員', '1', '開發部', '2017-08-30 22:59:35', '1', '管理員', '5', '0', '0', '2017-08-30', '待磐石處理', '0', '24', '5', '磐石', null, '2017-08-30 22:59:35', '2017-08-30 22:59:35', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('91', 'CX-20170626-0001', 'carmang', '1', '59', '車輛維修', '管理員', '1', '開發部', '2017-06-26 21:28:14', '1', '管理員', '4', '0', '1', '2017-06-26', '大喬處理通過', '1', '0', null, null, null, '2017-07-20 17:15:49', '2017-06-26 21:28:14', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('92', 'CY-20170627-0001', 'carmang', '2', '60', '車輛保養', '管理員', '1', '開發部', '2017-06-27 13:22:46', '1', '管理員', '6,4', '0', '1', '2017-06-27', '張飛處理通過', '1', '0', null, null, null, '2017-06-27 13:26:57', '2017-06-27 13:20:42', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('94', 'KB-20170629-0001', 'kqinfo', '16', '6', '加班單', '管理員', '1', '開發部', '2017-06-29 10:14:05', '1', '管理員', '4,5', '0', '1', '2017-06-29', '大喬處理通過', '1', '0', null, null, null, '2017-06-29 10:16:07', '2017-06-29 10:14:05', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('95', 'KB-20170629-0002', 'kqinfo', '17', '6', '加班單', '磐石', '5', '管理層', '2017-06-29 10:18:35', '5', '磐石', null, '0', '0', '2017-06-29', '待處理', '0', '3', null, null, null, '2017-06-29 10:18:35', '2017-06-29 10:18:35', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('96', 'CE-20170705-0001', 'goodm', '9', '28', '物品採購', '管理員', '1', '開發部', '2017-10-14 22:49:59', '1', '管理員', '5,4', '0', '0', '2017-07-05', '待磐石處理', '0', '19', '5', '磐石', null, '2017-10-14 22:49:59', '2017-07-05 20:24:46', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('97', 'WX-20170707-0001', 'repair', '1', '62', '維修報修', '管理員', '1', '開發部', '2017-07-07 13:12:53', '1', '管理員', '4', '0', '1', '2017-07-07', '大喬處理確認', '1', '0', null, null, null, '2017-07-07 13:16:36', '2017-07-07 13:12:53', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('98', 'WX-20170707-0002', 'repair', '2', '62', '維修報修', '小喬', '3', '財務部', '2017-07-07 13:37:28', '3', '小喬', '4', '0', '1', '2017-07-07', '大喬處理通過', '1', '0', null, null, null, '2017-07-07 13:39:18', '2017-07-07 13:37:28', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('99', 'FE-20170807-0001', 'fininfom', '10', '64', '付款申請', '管理員', '1', '開發部', '2017-08-07 20:42:59', '1', '管理員', '5,3', '0', '0', '2017-08-07', '待磐石處理', '0', '62', '5', '磐石', null, '2017-08-07 20:42:59', '2017-08-07 20:42:59', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('100', 'FF-20170807-0001', 'fininfom', '11', '65', '開票申請', '管理員', '1', '開發部', '2017-08-07 21:11:16', '1', '管理員', '3,2,5', '0', '1', '2017-08-07', '小喬處理已開票', '1', '0', null, null, null, '2017-08-07 21:15:10', '2017-08-07 21:11:16', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('101', 'CD-20170810-0001', 'goodm', '10', '24', '物品領用', '大喬', '4', '行政人事部', '2017-08-10 10:29:36', '4', '大喬', '4', '0', '0', '2017-08-10', '待大喬處理', '0', '47', '4', '大喬', null, '2017-08-10 10:29:36', '2017-08-10 10:29:36', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('102', 'XW-20170812-0001', 'work', '5', '4', '任務', '管理員', '1', '開發部', '2017-08-15 17:43:16', '1', '管理員', '7,5,1', '0', '2', '2017-08-12', '待趙子龍處理', '3', '52', '7', '趙子龍', '哈哈', '2017-08-15 17:43:16', '2017-08-12 17:31:36', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('103', 'KD-20170828-0001', 'kqout', '4', '23', '外出出差', '管理員', '1', '開發部', '2017-08-28 11:54:41', '1', '管理員', '5', '0', '0', '2017-08-28', '待磐石處理', '0', '5', '5', '磐石', null, '2017-08-28 11:54:41', '2017-08-28 11:54:41', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('104', 'KE-20170828-0001', 'kqerr', '2', '51', '打卡異常', '貂蟬', '2', '財務部', '2017-08-28 12:19:12', '2', '貂蟬', '5,4', '0', '0', '2017-08-28', '待磐石處理', '0', '44', '5', '磐石', null, '2017-08-28 12:19:12', '2017-08-28 12:19:12', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('106', 'HC-20170906-0001', 'hrsalary', '18', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:43:38', '1', '管理員', null, '1', '1', '2017-09-06', null, '1', '0', null, null, null, '2017-09-06 20:43:51', '2017-09-06 20:43:38', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('107', 'HC-20170906-0002', 'hrsalary', '20', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:47:16', '1', '管理員', null, '1', '0', '2017-09-06', null, '0', '0', null, null, null, '2017-09-06 20:47:21', '2017-09-06 20:47:16', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('108', 'HC-20170906-0003', 'hrsalary', '19', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:47:16', '1', '管理員', null, '1', '1', '2017-09-06', null, '1', '0', null, null, null, '2017-09-06 20:48:19', '2017-09-06 20:47:16', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('109', 'HC-20170906-0004', 'hrsalary', '22', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:57:46', '1', '管理員', '4', '0', '0', '2017-09-06', '待大喬處理', '0', '31', '4', '大喬', null, '2017-09-06 20:57:46', '2017-09-06 20:57:46', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('110', 'HC-20170906-0005', 'hrsalary', '23', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:57:46', '1', '管理員', '4', '0', '0', '2017-09-06', '待大喬處理', '0', '31', '4', '大喬', null, '2017-09-06 20:57:46', '2017-09-06 20:57:46', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('111', 'HC-20170906-0006', 'hrsalary', '21', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 20:57:46', '1', '管理員', null, '0', '1', '2017-09-06', null, '1', '0', null, null, null, '2017-09-06 20:58:04', '2017-09-06 20:57:46', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('112', 'HC-20170906-0007', 'hrsalary', '24', '34', '薪資', '管理員', '1', '開發部', '2017-09-06 21:00:14', '1', '管理員', null, '0', '1', '2017-09-06', null, '1', '0', null, null, null, '2017-09-06 21:00:21', '2017-09-06 21:00:14', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('113', 'HG-20171013-0001', 'hrcheck', '1', '71', '考核評分', '管理員', '1', '開發部', '2017-10-13 23:16:59', '1', '管理員', '4,5', '0', '1', '2017-10-13', '大喬處理同意', '1', '0', null, null, null, '2017-10-13 23:36:21', '2017-10-13 22:52:22', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('114', 'HG-20171014-0001', 'hrcheck', '2', '71', '考核評分', '張飛', '6', '開發部', '2017-10-14 11:32:28', '6', '張飛', '1,4', '0', '0', '2017-10-14', '待管理員處理', '0', '69', '1', '管理員', null, '2017-10-14 11:32:28', '2017-10-14 11:07:37', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('115', 'YS-20171020-0001', 'demo', '1', '72', '演示測試', '管理員', '1', '開發部', '2017-10-20 10:20:57', '1', '管理員', '5', '0', '0', '2017-10-20', '待磐石處理', '0', '71', '5', '磐石', null, '2017-10-20 10:20:57', '2017-10-20 10:15:00', '0', '1');
INSERT INTO `xinhu_flow_bill` VALUES ('116', 'GA-20171023-0001', 'official', '4', '19', '發文單', '管理員', '1', '開發部', '2017-10-23 14:50:08', '1', '管理員', '3,4', '0', '1', '2017-10-23', '待小喬處理', '0', '21', '3', '小喬', '轉給：小喬', '2017-10-24 18:04:24', '2017-10-23 14:16:30', '0', '1');

-- ----------------------------
-- Table structure for `xinhu_flow_checks`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_checks`;
CREATE TABLE `xinhu_flow_checks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT '0',
  `mid` int(11) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0',
  `courseid` smallint(6) DEFAULT '0',
  `checkid` varchar(100) DEFAULT NULL,
  `checkname` varchar(100) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `addlx` tinyint(1) DEFAULT '0' COMMENT '類型1自定義,2撤回添加,3退回添加,4轉移添加',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='單據的審核人';

-- ----------------------------
-- Records of xinhu_flow_checks
-- ----------------------------
INSERT INTO `xinhu_flow_checks` VALUES ('9', 'bookborrow', '2', '46', '40', '2', '貂蟬', '8', '信呼客服', '2016-10-29 22:33:30', '0', '0');
INSERT INTO `xinhu_flow_checks` VALUES ('11', 'goodm', '6', '24', '6', '2', '貂蟬', '1', '管理員', '2017-02-09 16:16:12', '0', '0');
INSERT INTO `xinhu_flow_checks` VALUES ('40', 'work', '1', '4', '52', '3', '小喬', '1', '管理員', '2017-03-29 11:37:52', '0', '4');
INSERT INTO `xinhu_flow_checks` VALUES ('51', 'official', '4', '19', '21', '3', '小喬', '5', '磐石', '2017-10-24 18:04:24', '0', '4');
INSERT INTO `xinhu_flow_checks` VALUES ('52', 'official', '4', '19', '22', '4', '大喬', '5', '磐石', '2017-10-24 18:04:24', '0', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_cname`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_cname`;
CREATE TABLE `xinhu_flow_cname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '編號',
  `name` varchar(50) DEFAULT NULL COMMENT '審核組名',
  `checkid` varchar(50) DEFAULT NULL,
  `checkname` varchar(50) DEFAULT NULL COMMENT '審核人',
  `pid` int(11) DEFAULT '0' COMMENT '上級ID',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '適用對象',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  PRIMARY KEY (`id`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='自定義審核人組';

-- ----------------------------
-- Records of xinhu_flow_cname
-- ----------------------------
INSERT INTO `xinhu_flow_cname` VALUES ('1', 'group1', '審核人員分組1', '1', '管理員', '0', 'd5', '管理層', '0');
INSERT INTO `xinhu_flow_cname` VALUES ('2', 'group', '審核人員分組', '5', '磐石', '1', 'd1', '信呼開發團隊', '0');
INSERT INTO `xinhu_flow_cname` VALUES ('4', 'wewwe', null, '4', '大喬', '1', 'd3', '財務部', '22');

-- ----------------------------
-- Table structure for `xinhu_flow_course`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_course`;
CREATE TABLE `xinhu_flow_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT '上級ID',
  `nid` int(11) DEFAULT '0' COMMENT '下級步驟ID',
  `setid` smallint(6) DEFAULT '0' COMMENT '模塊ID',
  `name` varchar(20) DEFAULT NULL COMMENT '步驟名稱',
  `num` varchar(20) DEFAULT NULL,
  `checktype` varchar(20) DEFAULT NULL COMMENT '審核人類型',
  `checktypeid` varchar(200) DEFAULT NULL,
  `checktypename` varchar(200) DEFAULT NULL COMMENT '審核人',
  `sort` smallint(6) DEFAULT '0',
  `whereid` smallint(6) DEFAULT '0' COMMENT '流程模塊條件下的Id',
  `where` varchar(500) DEFAULT NULL COMMENT '審核條件',
  `explain` varchar(100) DEFAULT NULL COMMENT '說明',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `courseact` varchar(50) DEFAULT NULL COMMENT '審核動作',
  `checkshu` tinyint(2) DEFAULT '1' COMMENT '至少幾人審核 ,0全部',
  `checkfields` varchar(500) DEFAULT NULL COMMENT '審核處理表單',
  `pid` smallint(6) DEFAULT '0' COMMENT '上級Id(棄用)',
  `optid` smallint(6) DEFAULT '0' COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人姓名',
  `receid` varchar(200) DEFAULT NULL COMMENT '適用對象id',
  `recename` varchar(200) DEFAULT NULL COMMENT '適用對象',
  `iszf` tinyint(1) DEFAULT '0' COMMENT '是否可以轉給他人辦理',
  `isqm` tinyint(1) DEFAULT '0' COMMENT '手寫簽名0不用,1都需要,2只需要通過,3只需要不通過',
  `coursetype` tinyint(1) DEFAULT '0' COMMENT '審批方式0順序,1前置審批,2後置審批',
  PRIMARY KEY (`id`),
  KEY `setid` (`setid`)
) ENGINE=MyISAM AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COMMENT='流程步驟表';

-- ----------------------------
-- Records of xinhu_flow_course
-- ----------------------------
INSERT INTO `xinhu_flow_course` VALUES ('1', '0', '0', '5', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-07-02 21:05:00', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('2', '1', '0', '5', '人事審核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-07-07 22:14:24', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('3', '0', '0', '6', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-07-02 22:25:29', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('4', '2', '0', '5', '總經理審核', null, 'user', '5', '磐石', '0', '2', null, '超過3天24小時', '2016-09-25 14:53:34', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('5', '0', '0', '23', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-08-27 08:46:27', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('6', '0', '0', '24', '行政發放', null, 'user', '4', '大喬', '0', '0', null, null, '2017-08-10 11:42:24', '1', '發放,駁回|red', '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('7', '0', '0', '11', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-09-02 17:36:36', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('8', '7', '0', '11', '人事審核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-02 17:38:15', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('9', '8', '0', '11', '財務審核', null, 'rank', null, '財務總監', '0', '0', null, null, '2016-09-02 17:39:07', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('10', '0', '0', '25', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-09-03 09:26:32', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('11', '10', '0', '25', '人事審核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-03 09:27:00', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('12', '11', '0', '25', '財務審核', null, 'rank', null, '財務總監', '0', '0', null, null, '2016-09-03 09:27:26', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('13', '0', '0', '26', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-09-03 09:27:55', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('14', '0', '0', '26', '人事審核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-03 09:28:18', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('15', '0', '0', '26', '財務審核', null, 'rank', null, '財務總監', '0', '0', null, null, '2016-09-03 09:28:35', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('16', '0', '0', '27', '財務確認', null, 'rank', null, '財務總監', '0', '0', null, null, '2016-09-03 15:29:45', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('17', '16', '0', '27', '付款確認', null, 'apply', null, null, '0', '0', null, null, '2016-09-03 15:32:25', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('18', '17', '0', '27', '確認收款', null, 'rank', null, '財務總監', '0', '0', null, null, '2016-09-03 15:33:23', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('19', '0', '0', '28', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-02-08 14:39:04', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('20', '19', '0', '28', '行政審批', null, 'cname', 'group1', '審核人員分組1', '0', '0', null, null, '2017-06-20 16:43:37', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('21', '0', '0', '19', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-10-24 18:03:05', '1', null, '1', null, '0', '0', null, null, null, '1', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('22', '21', '0', '19', '辦公室批辦', null, 'change', 'd2,d4', '開發部,行政人事部', '0', '0', null, null, '2017-10-23 16:28:27', '1', null, '1', 'recename', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('23', '22', '0', '19', '領導審批', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:47:03', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('24', '0', '0', '20', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-10-24 10:07:45', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('25', '24', '0', '20', '辦公室批辦', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:49:41', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('26', '25', '0', '20', '領導審批', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:49:49', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('27', '0', '0', '32', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-10-06 20:43:27', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('28', '0', '0', '32', '人事審批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 10:24:03', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('29', '0', '0', '33', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-10-07 11:41:01', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('30', '29', '0', '33', '人事審批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 11:41:17', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('31', '0', '0', '34', '人事審核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 19:24:54', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('32', '0', '0', '38', '人事審批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-19 21:48:34', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('33', '0', '0', '37', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-10-19 22:28:02', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('34', '33', '0', '37', '人事審批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-19 22:28:17', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('35', '0', '0', '39', '當事人確認', 'objectque', 'auto', null, null, '0', '0', null, null, '2016-10-20 20:52:15', '1', '無異議,不認可', '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('36', '35', '0', '39', '人事審批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-20 20:53:10', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('37', '0', '0', '44', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-10-28 11:29:50', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('38', '37', '0', '44', '行政確認', null, 'user', '3', '小喬', '0', '0', null, null, '2017-08-25 20:03:02', '1', null, '1', 'kmstart,carid,carnum', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('39', '0', '0', '46', '行政確認', null, 'user', '3', '小喬', '0', '0', null, null, '2017-09-16 13:22:52', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('40', '39', '0', '46', '借閱人歸返', null, 'apply', null, null, '0', '0', null, null, '2016-10-29 22:26:13', '1', '確認歸還', '1', 'ghtime', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('41', '0', '0', '49', '上級審批', null, 'super', null, null, '0', '0', null, null, '2016-12-08 21:32:07', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('42', '41', '0', '49', '保管人確認', 'bgque', 'auto', null, null, '0', '0', null, null, '2016-12-08 21:33:08', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('43', '42', '0', '49', '申請人確認', null, 'apply', null, null, '0', '0', null, null, '2016-12-08 21:56:33', '1', '已蓋章,放棄蓋章', '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('44', '0', '0', '51', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-12-16 18:02:01', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('45', '44', '0', '51', '人事確認', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-12-16 18:02:21', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('46', '0', '0', '52', '上級審核', null, 'super', null, null, '0', '0', null, null, '2016-12-19 09:58:39', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('47', '0', '0', '24', '行政確認', null, 'rank', null, '人事主管', '1', '0', null, null, '2017-09-26 10:20:04', '1', null, '1', null, '0', '0', null, 'd3,d4', '財務部,行政人事部', '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('48', '47', '0', '24', '行政發放', null, 'user', '3', '小喬', '1', '0', null, null, '2017-08-09 16:58:39', '1', '發放,駁回|red', '1', null, '0', '0', null, 'u3', '小喬', '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('50', '38', '0', '44', '駕駛員歸還', 'jias', 'auto', null, null, '0', '0', null, null, '2017-03-01 14:58:11', '1', '已歸還', '1', 'kmend,returndt', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('51', '0', '52', '4', '任務分配', null, 'super', null, null, '0', '4', null, '未分配時', '2017-08-15 11:19:33', '1', '同意分配|green|3,不通過|red', '1', 'dist', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('52', '0', '0', '4', '執行人執行', 'run', 'auto', null, null, '0', '0', null, '已分配', '2017-08-12 16:16:16', '1', '已完成||6,無法完成|red,執行中||4', '1', null, '0', '0', null, null, null, '1', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('53', '52', '0', '4', '提交人驗證', null, 'opt', null, null, '0', '0', null, null, '2017-08-15 17:46:47', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('55', '0', '0', '59', '行政確認', null, 'rank', null, '人事主管', '0', '0', null, null, '2017-06-26 21:26:30', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('56', '0', '0', '60', '行政確認', null, 'rank', null, '人事主管', '0', '0', null, null, '2017-06-27 13:03:25', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('57', '0', '0', '60', '駕駛員處理', 'jia', 'auto', null, null, '0', '0', null, null, '2017-06-27 13:04:24', '1', null, '1', 'address,bujian,kmshu', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('58', '0', '0', '60', '駕駛員取車', 'jia', 'auto', null, null, '0', '0', null, null, '2017-06-27 13:05:41', '1', null, '1', 'nextdt,kmnshu,enddt,money', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('59', '3', '0', '6', '核算加班費', null, 'rank', null, '人事主管', '0', '129', null, null, '2017-06-29 10:05:49', '1', null, '1', 'jiafee', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('60', '0', '0', '62', '行政人員檢查', null, 'user', '4', '大喬', '0', '0', null, null, '2017-07-07 13:16:02', '1', '確認', '1', 'iswx,reasons,money,wxname', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('61', '60', '0', '62', '外修確認', null, 'user', '4', '大喬', '0', '140', null, null, '2017-07-07 13:36:48', '1', null, '1', 'money,wxname', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('62', '0', '0', '64', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-08-07 20:21:47', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('63', '62', '0', '64', '出納付款', null, 'rank', null, '出納', '0', '0', null, null, '2017-10-09 15:32:23', '1', '已付款', '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('64', '0', '0', '65', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-08-07 21:11:40', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('65', '64', '0', '65', '財務審批', null, 'rank', null, '財務總監', '0', '0', null, null, '2017-08-07 21:11:58', '1', null, '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('66', '65', '0', '65', '會計開票', null, 'rank', null, '出納', '0', '0', null, null, '2017-08-07 21:12:24', '1', '已開票', '1', null, '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('69', '0', '0', '71', '上級評分', null, 'super', null, null, '0', '0', null, null, '2017-10-13 23:13:03', '1', null, '1', 'fensj', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('70', '69', '0', '71', '人事評分', null, 'rank', null, '人事主管', '0', '0', null, null, '2017-10-13 23:13:30', '1', null, '1', 'fenrs', '0', '0', null, null, null, '0', '0', '0');
INSERT INTO `xinhu_flow_course` VALUES ('71', '0', '0', '72', '上級審批', null, 'super', null, null, '0', '0', null, null, '2017-10-20 09:12:05', '1', null, '1', null, '0', '0', null, null, null, '0', '2', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_element`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_element`;
CREATE TABLE `xinhu_flow_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `fields` varchar(50) DEFAULT NULL COMMENT '對應字段',
  `fieldstype` varchar(30) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `dev` varchar(20) DEFAULT NULL COMMENT '默認值',
  `isbt` tinyint(1) DEFAULT '0' COMMENT '是否必填',
  `data` varchar(500) DEFAULT NULL COMMENT '數據源',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否錄入元素',
  `iszs` tinyint(1) DEFAULT '1' COMMENT '是否列表展示',
  `attr` varchar(500) DEFAULT NULL COMMENT '屬性',
  `iszb` tinyint(1) DEFAULT '0',
  `isss` tinyint(1) DEFAULT '0',
  `lattr` varchar(100) DEFAULT NULL COMMENT '列屬性',
  `width` varchar(10) DEFAULT NULL COMMENT '列寬',
  `lens` smallint(6) DEFAULT '0' COMMENT '字段長度',
  `savewhere` varchar(100) DEFAULT NULL COMMENT '保存條件',
  `islb` tinyint(1) DEFAULT '1' COMMENT '是否列表列',
  `ispx` tinyint(1) DEFAULT '0' COMMENT '是否可排序',
  `isalign` tinyint(1) DEFAULT '0' COMMENT '0居中,1居左,2居右',
  `issou` tinyint(1) DEFAULT '0' COMMENT '是否可搜索',
  `istj` tinyint(1) DEFAULT '0' COMMENT '是否可統計',
  `gongsi` varchar(500) DEFAULT NULL COMMENT '計算公式',
  `placeholder` varchar(50) DEFAULT NULL COMMENT '提示內容',
  `isonly` tinyint(1) DEFAULT '0' COMMENT '是否唯一',
  `isdr` tinyint(1) DEFAULT '0' COMMENT '是否導入字段',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=698 DEFAULT CHARSET=utf8 COMMENT='模塊元素';

-- ----------------------------
-- Records of xinhu_flow_element
-- ----------------------------
INSERT INTO `xinhu_flow_element` VALUES ('1', '1', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('2', '1', '類型名稱', 'typename', 'rockcombo', '2', null, '1', 'gongtype', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('3', '1', '內容', 'content', 'htmlediter', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('4', '1', '發送給', 'recename', 'changedeptusercheck', '4', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '不選默認為發個全部人員', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('5', '1', '相應地址', 'url', 'text', '5', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('6', '2', '會議室', 'hyname', 'rockcombo', '0', null, '1', 'hyname', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('7', '2', '主題', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('8', '2', '開始時間', 'startdt', 'datetime', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('9', '2', '結束時間', 'enddt', 'datetime', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('10', '2', '參會人', 'joinname', 'changedeptusercheck', '4', null, '1', 'joinid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('11', '2', '說明', 'explain', 'textarea', '5', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('12', '3', '日期', 'dt', 'date', '3', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('13', '3', '日報類型', 'type', 'select', '2', '0', '1', '0|日報,1|週報,2|月報,3|年報', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('14', '3', '截止日期', 'enddt', 'date', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('15', '3', '內容', 'content', 'textarea', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('16', '3', '明日計劃', 'plan', 'textarea', '6', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('17', '3', '新增時間', 'adddt', 'hidden', '7', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('18', '3', '人員', 'optname', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('19', '2', '發起人', 'optname', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('20', '4', '類型', 'type', 'rockcombo', '1', null, '1', 'worktype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('21', '4', '等級', 'grade', 'rockcombo', '2', null, '1', 'workgrade', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('22', '4', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('23', '4', '分配給', 'dist', 'changeuser', '3', null, '0', 'distid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('24', '4', '說明', 'explain', 'textarea', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('26', '4', '創建人', 'optname', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('27', '4', '創建時間', 'optdt', 'datetime', '12', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('28', '4', '開始時間', 'startdt', 'datetime', '6', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('29', '4', '截止時間', 'enddt', 'datetime', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('30', '5', '請假', 'kind', 'fixed', '0', '請假', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('31', '5', '請假類型', 'qjkind', 'rockcombo', '0', null, '1', 'kqqjkind', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('32', '5', '開始時間', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('33', '5', '截止時間', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('34', '5', '時間(小時)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('35', '5', '說明', 'explain', 'textarea', '12', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('36', '6', '類型', 'kind', 'fixed', '0', '加班', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('37', '6', '開始時間', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('38', '6', '截止時間', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('39', '6', '時間(小時)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('40', '6', '說明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('41', '7', '客戶名稱', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('42', '7', '所屬人', 'suoname', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('43', '7', '客戶類型', 'type', 'rockcombo', '2', null, '1', 'crmtype', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('44', '7', '來源', 'laiyuan', 'rockcombo', '3', null, '1', 'crmlaiyuan', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '1', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('45', '7', '客戶單位', 'unitname', 'text', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('47', '7', '聯系電話', 'tel', 'text', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('48', '7', '聯系手機', 'mobile', 'text', '6', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('49', '7', '郵箱', 'email', 'text', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('50', '7', '說明', 'explain', 'textarea', '14', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('51', '7', '地址', 'address', 'text', '8', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('52', '7', '交通路線', 'routeline', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('53', '8', '客戶', 'custid', 'hidden', '0', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('54', '8', '客戶', 'custname', 'selectdatafalse', '1', null, '1', 'selectcust,custid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('55', '8', '狀態', 'state', 'rockcombo', '8', '0', '1', 'crmstate,value', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('56', '8', '說明', 'explain', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('57', '8', '申請日期', 'applydt', 'date', '2', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('58', '8', '來源', 'laiyuan', 'rockcombo', '3', null, '1', 'custsalelai', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('59', '8', '金額', 'money', 'number', '4', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('60', '8', '添加時間', 'adddt', 'datetime', '5', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('61', '8', '創建人', 'createname', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('62', '8', '銷售人員', 'optname', 'text', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('63', '9', '名稱', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('64', '9', '對應分類', 'typeid', 'rockcombo', '0', null, '1', 'goodstype,id,tree', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('65', '9', '規格', 'guige', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('66', '9', '型號', 'xinghao', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('67', '9', '單價', 'price', 'number', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('68', '9', '單位', 'unit', 'rockcombo', '0', null, '1', 'rockunit', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('69', '9', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('70', '10', '用戶Id', 'id', 'number', '22', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('71', '10', '姓名', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('72', '10', '部門Id', 'deptid', 'number', '8', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('73', '10', '部門', 'deptname', 'changedept', '9', null, '1', 'deptid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '1', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('74', '10', '職位', 'ranking', 'text', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('75', '10', '上級主管', 'superman', 'changeusercheck', '13', null, '0', 'superid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '1', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('76', '10', '上級主管id', 'superid', 'text', '14', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('77', '10', '用戶名', 'user', 'text', '2', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '不能包含中文', '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('78', '10', '編號', 'num', 'text', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, '唯一編號/工號', '1', '0');
INSERT INTO `xinhu_flow_element` VALUES ('79', '7', '狀態', 'status', 'select', '10', '1', '1', '1|啟用,0|停用', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('80', '12', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('81', '12', '提醒時間', 'startdt', 'datetime', '1', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('82', '12', '重復', 'rate', 'select', '2', null, '0', 'd|每天,w|每週,m|每月', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('83', '12', '重復值', 'rateval', 'checkboxall', '3', null, '0', '0|無,1|啊', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('84', '12', '說明', 'explain', 'textarea', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('85', '12', '記事人', 'optname', 'text', '5', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('86', '12', '截止時間', 'enddt', 'datetime', '6', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('87', '12', '提醒', 'txsj', 'select', '7', '0', '1', '0|不提醒,1|提醒', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('88', '21', '打卡時間', 'dkdt', 'datetime', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('89', '21', '打卡類型', 'type', 'text', '2', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('90', '21', '添加時間', 'optdt', 'datetime', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('91', '21', '定位地址', 'address', 'text', '4', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('92', '21', '姓名', 'base_name', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('93', '22', '項目類型', 'type', 'rockcombo', '2', null, '1', 'projecttype', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('94', '22', '編號', 'num', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('95', '22', '名稱', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('96', '22', '開始時間', 'startdt', 'datetime', '3', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('97', '22', '預計結束時間', 'enddt', 'datetime', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('98', '22', '負責人', 'fuze', 'changeuser', '5', null, '1', 'fuzeid', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('99', '22', '執行人', 'runuser', 'changedeptusercheck', '6', null, '1', 'runuserid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('100', '22', '進度(%)', 'progress', 'select', '7', '0', '1', 'progressdata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('101', '22', '內容', 'content', 'htmlediter', '8', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('102', '22', '狀態', 'status', 'select', '20', '0', '1', '0|待執行,1|已完成,3|執行中', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('103', '23', '類型', 'atype', 'select', '0', '外出', '1', '外出,出差', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('104', '23', '外出地址', 'address', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('105', '23', '外出時間', 'outtime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('106', '23', '預計回崗', 'intime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('107', '23', '外出理由', 'reason', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('108', '23', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('109', '24', '申請日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('110', '24', '類型', 'type', 'fixed', '0', '0', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('111', '24', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('112', '24', '物品', 'temp_aid', 'selectdatafalse', '0', null, '1', 'getgoodsdata,aid', '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('113', '24', '領用數量', 'count', 'number', '2', '0', '1', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('114', '11', '申請日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('115', '11', '單據數(張)', 'bills', 'number', '0', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('116', '11', '收款人全稱', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('117', '11', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('118', '11', '收款帳號', 'cardid', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('119', '11', '開戶行', 'openbank', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('120', '11', '報銷金額', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('121', '11', '大寫金額', 'moneycn', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('122', '11', '發生日期', 'sdt', 'date', '0', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('123', '11', '報銷項目', 'name', 'rockcombo', '0', null, '1', 'finaitems', '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('124', '11', '金額', 'money', 'number', '0', '0', '1', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('125', '11', '說明', 'sm', 'text', '0', null, '0', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('126', '24', '單位', 'unit', 'text', '3', null, '0', null, '0', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('127', '25', '申請日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('128', '25', '附單據(張)', 'bills', 'number', '1', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('129', '25', '出差目的', 'purpose', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('130', '25', '出差成果', 'purresult', 'text', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('131', '25', '收款人全稱', 'fullname', 'text', '4', '', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('132', '25', '付款方式', 'paytype', 'rockcombo', '5', '', '1', 'paytype', '1', '1', '', '0', '0', '', '', '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('133', '25', '收款帳號', 'cardid', 'text', '6', '', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('134', '25', '開戶行', 'openbank', 'text', '7', '', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('135', '25', '報銷金額', 'money', 'text', '8', '0', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '1', '0', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('136', '25', '大寫金額', 'moneycn', 'text', '9', '', '1', '', '1', '1', '', '0', '0', '', '', '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('137', '25', '發生日期', 'sdt', 'date', '0', '', '1', '', '1', '1', '', '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('138', '25', '報銷項目', 'name', 'rockcombo', '1', '', '1', 'finaitems', '1', '1', '', '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('139', '25', '金額', 'money', 'number', '2', '0', '1', '', '1', '1', '', '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('140', '25', '說明', 'sm', 'text', '4', '', '0', '', '1', '1', '', '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('141', '25', '發生地點', 'didian', 'text', '3', null, '0', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('142', '25', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('143', '25', '單據類型', 'type', 'fixed', '11', '1', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('144', '26', '單據類型', 'type', 'fixed', '0', '2', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('145', '26', '申請日期', 'applydt', 'text', '1', '{date}', '1', null, '1', '1', 'readonly', '0', '1', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('146', '26', '借款用途', 'purpose', 'text', '2', null, '1', null, '1', '1', null, '0', '1', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('147', '26', '收款人全稱', 'fullname', 'text', '3', null, '1', null, '1', '1', null, '0', '1', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('148', '26', '付款方式', 'paytype', 'rockcombo', '4', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('149', '26', '收款帳號', 'cardid', 'text', '5', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('150', '26', '開戶行', 'openbank', 'text', '6', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('151', '26', '借款金額', 'money', 'text', '7', '0', '1', null, '1', '1', null, '0', '1', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('152', '26', '借款金額大寫', 'moneycn', 'text', '8', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('153', '26', '說明', 'explain', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('154', '11', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('155', '27', '類型', 'type', 'fixed', '0', '3', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('156', '27', '申請日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('157', '27', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('158', '27', '收款人全稱', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('159', '27', '收款帳號', 'cardid', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('160', '27', '還款金額', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('161', '27', '還款金額大寫', 'moneycn', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('162', '27', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('163', '27', '需還款金額', 'temp_money', 'auto', '0', null, '0', 'jiekuantongs', '0', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('164', '28', '申請日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('165', '28', '說明', 'explain', 'textarea', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('166', '28', '類型', 'type', 'fixed', '2', '1', '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('168', '28', '供應商名稱', 'custname', 'text', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('169', '28', '採購金額', 'money', 'number', '5', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', '[{zb0.count}*{zb0.price}] - [{discount}]', null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('170', '28', '物品', 'temp_aid', 'selectdatafalse', '0', null, '1', 'getgoodsdata,aid', '1', '1', null, '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('171', '28', '採購數量', 'count', 'number', '2', '0', '1', '', '1', '1', '', '1', '0', '', '', '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('172', '28', '單位', 'unit', 'text', '3', null, '0', null, '1', '1', 'readonly', '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('173', '28', '單價', 'price', 'number', '4', '0', '0', null, '1', '1', null, '1', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('174', '7', '供應商', 'isgys', 'checkbox', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('175', '19', '標題', 'title', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('176', '19', '副標題', 'titles', 'text', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('177', '19', '公文等級', 'grade', 'rockcombo', '5', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('178', '19', '公文類型', 'class', 'rockcombo', '6', null, '1', 'officialclass', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('179', '19', '公文編號', 'num', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('180', '19', '公文內容', 'content', 'htmlediter', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('181', '19', '說明', 'explain', 'textarea', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('182', '19', '需查閱對象', 'recename', 'changedeptusercheck', '11', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('183', '20', '標題', 'title', 'text', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('184', '20', '副標題', 'titles', 'text', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('185', '20', '公文等級', 'grade', 'rockcombo', '6', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('186', '20', '公文密級', 'miji', 'rockcombo', '8', null, '1', 'officialmiji', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('187', '20', '公文編號', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('188', '20', '公文內容', 'content', 'htmlediter', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('189', '20', '說明', 'explain', 'textarea', '11', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('190', '20', '需查閱對象', 'recename', 'changedeptusercheck', '12', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('191', '20', '類型', 'type', 'fixed', '2', '1', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('192', '4', '所屬項目', 'projectid', 'select', '4', null, '0', 'projectdata', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('193', '30', '類型', 'kind', 'rockcombo', '1', '請假', '1', 'kqkind', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('199', '30', '對應人員', 'uname', 'changeuser', '0', null, '1', 'uid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('195', '30', '開始時間', 'stime', 'datetime', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('196', '30', '截止時間', 'etime', 'datetime', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('197', '30', '時間(小時)', 'totals', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('198', '30', '說明', 'explain', 'textarea', '2', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('200', '2', '狀態', 'state', 'text', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('201', '1', '來源', 'zuozhe', 'text', '6', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('202', '1', '日期', 'indate', 'date', '7', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('203', '29', '電話', 'tel', 'text', '6', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('204', '29', '手機號', 'mobile', 'text', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('205', '29', '郵箱', 'email', 'text', '11', null, '0', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('206', '29', '生日類型', 'birtype', 'select', '12', '0', '1', '0|陽歷', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('207', '29', '生日', 'birthday', 'date', '13', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, '選擇身份證上日期', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('208', '29', '學歷', 'xueli', 'text', '14', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('209', '29', '民族', 'minzu', 'text', '15', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('210', '29', '籍貫', 'jiguan', 'selectdatafalse', '16', null, '1', 'city:citydata', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('211', '29', '婚姻', 'hunyin', 'select', '9', null, '1', '未婚,已婚', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('212', '29', '現住址', 'nowdizhi', 'text', '8', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('213', '29', '家庭住址', 'housedizhi', 'text', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('214', '29', '姓名', 'name', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('215', '29', '部門', 'deptname', 'text', '1', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('216', '29', '職位', 'ranking', 'text', '2', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('217', '29', '人員狀態', 'state', 'rockcombo', '3', null, '0', 'userstate,value', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('218', '31', '合同名稱', 'name', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('219', '31', '開始日期', 'startdt', 'date', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('220', '31', '截止日期', 'enddt', 'date', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('221', '31', '合同類型', 'httype', 'rockcombo', '5', null, '1', 'userhttype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('222', '31', '狀態', 'state', 'text', '8', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('223', '31', '簽署單位', 'company', 'hidden', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('224', '31', '簽署人', 'uname', 'changeuser', '0', null, '1', 'uid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('225', '31', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('226', '31', '提前終止日期', 'tqenddt', 'date', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('227', '32', '職位', 'ranking', 'text', '3', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('228', '32', '入職日期', 'entrydt', 'text', '4', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('229', '32', '試用到期日', 'syenddt', 'date', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('230', '32', '轉正日期', 'positivedt', 'date', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('231', '32', '申請說明', 'explain', 'textarea', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('232', '33', '職位', 'ranking', 'text', '2', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('233', '33', '入職日期', 'entrydt', 'text', '4', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('234', '33', '離職類型', 'redundtype', 'rockcombo', '5', null, '1', 'redundtype', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('235', '33', '離職日期', 'quitdt', 'date', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('236', '33', '離職原因', 'redundreson', 'textarea', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('237', '33', '說明', 'explain', 'textarea', '8', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('238', '34', '月份', 'month', 'month', '1', '{month}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('239', '34', '對應人', 'uname', 'changeuser', '0', null, '1', 'xuid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('240', '34', '基本工資', 'base', 'number', '1', '1500', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('241', '34', '職位津貼', 'postjt', 'number', '1', '3500', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('242', '34', '技能津貼', 'skilljt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('243', '34', '交通補貼', 'travelbt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('244', '34', '通信補貼', 'telbt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('245', '34', '實發工資', 'money', 'text', '100', '0', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('246', '34', '對應人員部門', 'udeptname', 'text', '0', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('247', '34', '職位', 'ranking', 'text', '0', '{ranking}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('248', '34', '獎勵', 'reward', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('249', '34', '處罰', 'punish', 'number', '40', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('250', '34', '說明', 'explain', 'textarea', '101', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('251', '34', '個人社保', 'socials', 'number', '41', '181', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('252', '34', '個人所得稅', 'taxes', 'number', '42', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('253', '29', '開戶行', 'bankname', 'text', '18', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('254', '29', '工資卡帳號', 'banknum', 'text', '17', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('255', '34', '其它增加', 'otherzj', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('256', '34', '其它減少', 'otherjs', 'number', '43', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('257', '34', '遲到(次)', 'cidao', 'text', '50', '0', '0', null, '1', '0', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('258', '34', '遲到處罰', 'cidaos', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('259', '34', '早退(次)', 'zaotui', 'text', '50', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('260', '34', '早退處罰', 'zaotuis', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('261', '34', '請假(小時)', 'leave', 'text', '51', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('262', '34', '請假減少', 'leaves', 'number', '51', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('263', '34', '加班(小時)', 'jiaban', 'text', '20', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('264', '34', '加班補貼', 'jiabans', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('265', '34', '未打卡(次)', 'weidk', 'text', '50', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('266', '34', '未打卡處罰', 'weidks', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('267', '35', '客戶名稱', 'custid', 'hidden', '1', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('268', '35', '客戶名稱', 'custname', 'selectdatafalse', '2', null, '1', 'selectcust,custid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('269', '35', '銷售機會', 'saleid', 'select', '4', null, '0', 'selectsale', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('270', '35', '簽約日期', 'signdt', 'date', '5', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('271', '35', '合同金額', 'money', 'number', '6', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('272', '35', '生效日期', 'startdt', 'date', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('273', '35', '截止日期', 'enddt', 'date', '8', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('274', '35', '合同內容', 'content', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('275', '35', '說明', 'explain', 'textarea', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('276', '35', '合同編號', 'num', 'num', '0', null, '1', 'HT-', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('277', '35', '合同類型', 'type', 'select', '10', '0', '1', '0|收款合同,1|付款合同', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('278', '36', '合同', 'htid', 'select', '1', null, '0', 'hetongdata', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('279', '36', '合同編號', 'htnum', 'hidden', '2', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('280', '36', '客戶名稱', 'custname', 'selectdatafalse', '4', null, '1', 'selectcust,custid', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('281', '36', '類型', 'type', 'select', '6', null, '1', '0|收款單,1|付款單', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('282', '36', '金額', 'money', 'number', '7', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('283', '36', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('284', '35', '待收/付金額', 'moneys', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('285', '36', '客戶名稱', 'custid', 'hidden', '5', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('286', '36', '是否付款', 'ispay', 'select', '8', '0', '1', '0|否,1|是', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('287', '36', '收付款時間', 'paydt', 'datetime', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('288', '7', '聯系人', 'linkname', 'text', '13', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('289', '36', '所屬日期', 'dt', 'date', '3', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('290', '38', '要調動人', 'tranname', 'changeuser', '0', null, '1', 'tranuid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('291', '38', '調動類型', 'trantype', 'rockcombo', '0', null, '1', 'transfertype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('292', '38', '原來部門', 'olddeptname', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('293', '38', '原來職位', 'oldranking', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('294', '38', '調動後部門', 'newdeptname', 'changedept', '0', null, '1', 'newdeptid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('295', '38', '調動後職位', 'newranking', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('296', '38', '生效日期', 'effectivedt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('297', '38', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('298', '37', '調薪幅度', 'floats', 'number', '4', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('299', '37', '生效日期', 'effectivedt', 'date', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('300', '37', '申請日期', 'applydt', 'date', '3', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('301', '37', '說明', 'explain', 'textarea', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('302', '37', '職位', 'ranking', 'text', '2', '{ranking}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('303', '39', '獎懲對象', 'object', 'changeuser', '3', null, '1', 'objectid', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('304', '39', '獎懲類型', 'type', 'select', '6', '0', '1', '0|獎勵,1|處罰', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('305', '39', '獎懲結果', 'result', 'rockcombo', '7', null, '1', 'rewardresult', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('306', '39', '獎懲金額', 'money', 'number', '8', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('307', '39', '說明', 'explain', 'textarea', '9', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('308', '39', '申請日期', 'applydt', 'text', '2', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('309', '39', '發生時間', 'happendt', 'datetime', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('310', '39', '發生地點', 'hapaddress', 'text', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('311', '40', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '50', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('312', '40', '對應分類', 'typeid', 'rockcombo', '0', null, '1', 'knowledgetype,id,tree', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('313', '40', '排序', 'sort', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('314', '40', '內容', 'content', 'htmlediter', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('315', '41', '資產分類', 'typeid', 'rockcombo', '0', null, '1', 'assetstype,id,tree', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('316', '41', '編號', 'num', 'num', '1', null, '0', 'ZC-', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('317', '41', '名稱', 'title', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('318', '41', '品牌', 'brand', 'rockcombo', '3', null, '0', 'rockbrand', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('319', '41', '存放倉庫', 'ckid', 'rockcombo', '4', null, '1', 'warehouse,id', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('320', '41', '規格型號', 'model', 'text', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('321', '41', '資產來源', 'laiyuan', 'rockcombo', '6', null, '1', 'wplaiyuan', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('322', '41', '狀態', 'state', 'select', '7', '0', '1', '0|閒置,1|在用,2|維修,3|報廢,4|丟失', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('323', '41', '購進日期', 'buydt', 'date', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('324', '41', '價格', 'price', 'number', '11', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('325', '41', '說明', 'explain', 'textarea', '30', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('326', '41', '使用人', 'usename', 'changedeptusercheck', '15', null, '0', 'useid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('327', '42', '車牌號', 'carnum', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('328', '42', '車輛類型', 'cartype', 'rockcombo', '1', null, '1', 'cartype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('329', '42', '車輛品牌', 'carbrand', 'rockcombo', '2', null, '1', 'carbrand', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('330', '42', '型號', 'carmode', 'text', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('331', '42', '購買日期', 'buydt', 'date', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('332', '42', '購買價格', 'buyprice', 'number', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('333', '42', '車架號', 'framenum', 'text', '7', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('334', '42', '發動機號', 'enginenb', 'text', '8', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('335', '42', '是否公開使用', 'ispublic', 'checkbox', '9', '1', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('336', '42', '說明', 'explain', 'textarea', '50', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('337', '42', '狀態', 'state', 'select', '11', '1', '1', '0|辦理中,1|可用,2|維修中,3|報廢', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('516', '58', '狀態', 'ztname', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('515', '42', '登記數', 'djshu', 'text', '51', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('346', '43', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '50', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('347', '43', '對應分類', 'typeid', 'rockcombo', '0', null, '1', 'knowtikutype,id,tree', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('348', '43', '類型', 'type', 'select', '0', '0', '1', '0|單選,1|多選', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('349', '43', 'A', 'ana', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('350', '43', 'B', 'anb', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('351', '43', 'C', 'anc', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('352', '43', 'D', 'and', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('353', '43', '答案', 'answer', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('354', '43', '狀態', 'status', 'select', '1', '1', '1', '0|停用,1|啟用', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('355', '43', '說明', 'explain', 'textarea', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('356', '43', '題內容', 'content', 'htmlediter', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('357', '44', '使用者', 'usename', 'changedeptusercheck', '0', null, '1', 'useid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('358', '44', '使用人數', 'useren', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('359', '44', '開始時間', 'startdt', 'datetime', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('360', '44', '截止時間', 'enddt', 'datetime', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('361', '44', '目的地', 'address', 'text', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('362', '44', '線路', 'xianlines', 'text', '5', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('363', '44', '預定車輛', 'carid', 'hidden', '6', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('364', '44', '車牌號', 'carnum', 'selectdatafalse', '7', null, '1', 'getcardata,carid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('365', '44', '駕駛員', 'jianame', 'changeusercheck', '8', null, '1', 'jiaid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('366', '44', '說明', 'explain', 'textarea', '12', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('367', '45', '書名', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('368', '45', '對應分類', 'typeid', 'rockcombo', '0', '0', '1', 'booktype,id,tree', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('369', '45', '編號', 'num', 'num', '0', null, '1', 'TS-', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('370', '45', '作者', 'author', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('371', '45', '出版社', 'chuban', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('372', '45', '出版日期', 'cbdt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('373', '45', '價格', 'price', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('374', '45', '數量', 'shul', 'number', '0', '1', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('375', '45', '說明', 'explain', 'textarea', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('376', '45', '存放位置', 'weizhi', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('377', '45', 'ISBN', 'isbn', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('378', '46', '借閱書名', 'bookid', 'hidden', '0', null, '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('379', '46', '借閱書名', 'bookname', 'selectdatafalse', '0', null, '1', 'getbookdata,bookid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('380', '46', '借閱日期', 'jydt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('381', '46', '預計歸還', 'yjdt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', 'gt|{jydt}|{0}必須大于借閱日期', '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('382', '46', '歸還時間', 'ghtime', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', 'gt|{jydt}|{0}必須大于借閱日期,lt|{now}|{0}必須小于當前時間', '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('383', '46', '是否歸返', 'isgh', 'select', '0', '0', '0', '0|否,1|是', '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('384', '46', '說明', 'explain', 'textarea', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('385', '4', '督導人', 'ddname', 'changeusercheck', '8', null, '0', 'ddid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('386', '4', '任務分值', 'score', 'number', '9', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('387', '3', '評分分數', 'mark', 'text', '8', '0', '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('388', '47', '主題', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('389', '47', '發送給', 'recename', 'changedeptusercheck', '2', null, '1', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('390', '47', '郵件內容', 'content', 'htmlediter', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('391', '47', '抄送給', 'ccname', 'changeusercheck', '3', null, '0', 'ccid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('392', '47', '立即發送', 'isturn', 'checkbox', '11', '0', '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('393', '47', '發送人', 'sendname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('395', '48', '印章名稱', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('396', '48', '印章類型', 'type', 'rockcombo', '0', null, '1', 'sealtype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('397', '48', '保管人', 'bgname', 'changeusercheck', '0', null, '1', 'bgid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('398', '49', '申請印章', 'sealid', 'select', '0', null, '1', 'getsealdata', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('399', '49', '印章名稱', 'sealname', 'hidden', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('400', '49', '是否外帶', 'isout', 'select', '0', '0', '1', '0|否,1|是', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('401', '49', '說明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('402', '5', '剩餘考勤統計', 'temp_kqtotal', 'auto', '9', null, '0', 'getshentime', '1', '0', 'readonly', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('403', '41', '封面圖片', 'fengmian', 'uploadimg', '16', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('404', '47', '是否外發', 'type', 'select', '1', '0', '1', '0|否,1|是', '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('405', '51', '異常類型', 'errtype', 'rockcombo', '0', null, '1', 'kqerrtype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('406', '51', '異常日期', 'dt', 'date', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', 'elt|{date}|異常日期應小于當前日期', '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('407', '51', '應打卡時間', 'ytime', 'time', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('408', '51', '說明', 'explain', 'textarea', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('409', '52', '流程模塊', 'modeid', 'select', '0', '0', '1', 'modebill', '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('410', '52', '流程模塊', 'modename', 'hidden', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('411', '52', '作廢單號', 'tonum', 'select', '3', null, '1', 'gettonum', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('412', '52', '作廢類型', 'type', 'select', '4', '0', '1', '0|作廢單據,1|刪除單據', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('413', '52', '說明', 'explain', 'textarea', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('414', '53', '姓名', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('415', '53', '手機號', 'mobile', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('416', '53', '電話', 'tel', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('417', '53', '郵箱', 'email', 'email', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('418', '53', '所在組', 'gname', 'select', '0', null, '0', 'getgname', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('419', '53', '地址', 'address', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('420', '53', '單位名稱', 'unitname', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('421', '29', '照片', 'zhaopian', 'uploadimg', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('422', '29', '身份證號', 'idnum', 'text', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('423', '29', '備用聯系人', 'spareman', 'text', '19', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('424', '29', '備用聯系人電話', 'sparetel', 'text', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('425', '29', '開始日期', 'startdt', 'date', '0', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('426', '29', '截止日期', 'enddt', 'date', '1', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('427', '29', '職位', 'rank', 'text', '2', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('428', '29', '單位名稱', 'unitname', 'text', '3', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('429', '29', '開始日期', 'startdt', 'date', '0', null, '1', null, '1', '1', null, '2', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('430', '29', '截止日期', 'enddt', 'date', '1', null, '1', null, '1', '1', null, '2', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('431', '29', '專業', 'rank', 'text', '2', null, '1', null, '1', '1', null, '2', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('432', '29', '學校名稱', 'unitname', 'text', '3', null, '1', null, '1', '1', null, '2', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('433', '1', '封面圖片', 'fengmian', 'uploadimg', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '1', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('434', '19', '正文文件', 'filecontid', 'uploadfile', '9', null, '1', 'doc,docx,pdf,jpg,png', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('435', '20', '公文文件', 'filecontid', 'uploadfile', '9', null, '0', 'doc,docx,pdf', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('436', '12', '提醒給', 'recename', 'changedeptusercheck', '8', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('437', '2', '會議紀要人', 'jyname', 'changeusercheck', '8', null, '0', 'jyid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('438', '2', '會議紀要內容', 'content', 'htmlediter', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('439', '54', '對應會議', 'mid', 'select', '0', null, '1', 'meetdata', '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('440', '54', '會議紀要內容', 'content', 'htmlediter', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('441', '54', '類型@0|普通,1|固定@not', 'type', 'fixed', '3', '2', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('442', '54', '會議主題', 'title', 'hidden', '1', null, '0', null, '0', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('443', '44', '起始公裡數', 'kmstart', 'number', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('444', '44', '結束公裡數', 'kmend', 'number', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', 'gt|{kmstart}|結束公裡數必須大于起始公路數', '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('445', '44', '歸還時間', 'returndt', 'datetime', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', 'gt|{startdt}|歸還時間必須大于開始時間', '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('446', '10', '入職日期', 'workdate', 'date', '5', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('447', '10', '性別', 'sex', 'select', '6', '男', '1', '男,女', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('448', '10', '名字拼音', 'pingyin', 'text', '15', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '拼音全拼(方便人員搜索)', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('449', '10', '手機號', 'mobile', 'text', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('451', '1', '操作人', 'optname', 'text', '8', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('452', '3', '操作時間', 'optdt', 'datetime', '9', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('453', '3', '部門', 'deptname', 'text', '0', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('454', '22', '任務數', 'workshu', 'number', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('456', '7', '合同數', 'htshu', 'number', '15', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('455', '7', '是否標★', 'isstat', 'select', '11', '0', '1', '0|否,1|是', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('457', '7', '銷售總額', 'moneyz', 'number', '16', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('458', '7', '待收金額', 'moneyd', 'number', '17', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('459', '29', '入職日期', 'workdate', 'date', '21', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('460', '29', '轉正日期', 'positivedt', 'date', '23', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('461', '28', '物品Id', 'aid', 'hidden', '1', '0', '1', null, '1', '0', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('462', '24', '物品Id', 'aid', 'hidden', '1', '0', '1', null, '1', '0', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('463', '32', '申請日期', 'applydt', 'date', '2', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('467', '33', '申請日期', 'applydt', 'date', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('474', '56', '標題', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('475', '56', '考試時間(分鐘)', 'kstime', 'select', '1', '10', '1', 'kstimelist', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('484', '56', '狀態', 'state', 'select', '12', '0', '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('476', '56', '開始時間', 'startdt', 'datetime', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('477', '56', '截止時間', 'enddt', 'datetime', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('478', '56', '多選題數', 'dxshu', 'number', '5', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('479', '56', '單選題數', 'dsshu', 'number', '4', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('480', '56', '考試對象', 'recename', 'changedeptusercheck', '6', null, '1', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('481', '56', '培訓人數', 'reshu', 'number', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('482', '56', '已答數', 'ydshu', 'number', '8', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('483', '56', '說明', 'explain', 'textarea', '11', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('485', '56', '總分', 'zfenshu', 'number', '9', '100', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('486', '56', '合格分數', 'hgfen', 'number', '10', '60', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('487', '6', '加班兌換', 'jiatype', 'select', '0', '0', '1', '0|調休,1|加班費', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('488', '6', '加班費', 'jiafee', 'number', '0', '0', '0', null, '1', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('489', '48', '電子印章圖片', 'sealimg', 'uploadimg', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('490', '48', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('491', '56', '培訓題庫', 'tikuname', 'selectdatatrue', '6', null, '0', 'tikunamedata,tikuid', '1', '1', 'placeholder=\"不選/為空為全部題庫\"', '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('492', '56', '題庫id', 'tikuid', 'hidden', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('504', '58', '車輛', 'carid', 'select', '0', null, '1', 'getcardata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('505', '58', '登記類型', 'otype', 'rockcombo', '1', null, '1', 'carotype', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('506', '58', '開始日期', 'startdt', 'date', '2', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('507', '58', '截止日期', 'enddt', 'date', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('508', '58', '駕駛員', 'jianame', 'changeusercheck', '4', null, '0', 'jiaid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('509', '58', '對應名稱', 'unitname', 'text', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('510', '58', '金額', 'money', 'number', '6', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('511', '58', '地點', 'address', 'text', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('512', '58', '說明', 'explain', 'textarea', '8', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('513', '58', '登記人', 'optname', 'text', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('514', '58', '登記時間', 'optdt', 'text', '10', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('517', '35', '狀態', 'statetext', 'text', '13', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('518', '35', '創建人', 'createname', 'text', '14', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('519', '35', '擁有者', 'optname', 'text', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('520', '36', '創建人', 'createname', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('521', '36', '所屬人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('522', '59', '維修車輛', 'carid', 'select', '0', '0', '1', 'getcardata', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('523', '59', '維修原因', 'reason', 'textarea', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('524', '59', '維修地點', 'address', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('525', '59', '駕駛員', 'jianame', 'changeusercheck', '3', null, '1', 'jiaid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('526', '59', '更換部件', 'bujian', 'text', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '200', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('527', '59', '維修時間', 'startdt', 'datetime', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('528', '59', '維修截止時間', 'enddt', 'datetime', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', 'gt|{startdt}|截止時間必須大于開始時間', '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('529', '59', '維修金額', 'money', 'number', '7', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('530', '59', '說明', 'explain', 'textarea', '8', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('531', '60', '保養車輛', 'carid', 'select', '0', '0', '1', 'getcardata', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('532', '60', '保養原因', 'reason', 'textarea', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('533', '60', '保養地點', 'address', 'text', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('534', '60', '駕駛員', 'jianame', 'changeusercheck', '2', null, '1', 'jiaid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('535', '60', '保養內容', 'bujian', 'text', '5', null, '0', null, '0', '1', null, '0', '0', null, null, '200', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('536', '60', '保養時間', 'startdt', 'datetime', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('537', '60', '取車時間', 'enddt', 'datetime', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', 'gt|{startdt}|截止時間必須大于開始時間', '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('538', '60', '保養金額', 'money', 'number', '8', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('539', '60', '說明', 'explain', 'textarea', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('540', '60', '當前保養公裡數', 'kmshu', 'text', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('541', '60', '下次保養日期', 'nextdt', 'date', '10', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('542', '60', '下次保養公裡數', 'kmnshu', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', 'gt|{kmshu}|下次保養公裡數必須大于當前公裡數', '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('543', '60', '單據類型', 'type', 'fixed', '1', '1', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('544', '12', '狀態', 'status', 'select', '9', '1', '1', '1|啟用,0|停用', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('556', '61', '主Id', 'mid', 'text', '1', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('546', '61', '開始時間', 'startdt', 'datetime', '3', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('547', '61', '重復', 'rate', 'hidden', '5', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('548', '61', '重復值', 'rateval', 'hidden', '7', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('549', '61', '提醒內容', 'explain', 'textarea', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('555', '61', '模塊編號', 'modenum', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('551', '61', '截止時間', 'enddt', 'datetime', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('553', '61', '提醒給', 'recename', 'changedeptusercheck', '6', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('554', '61', '狀態', 'status', 'select', '10', '1', '1', '1|啟用,0|停用', '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('557', '61', '頻率設置', 'temp_rateval', 'auto', '9', null, '0', 'ratevalset', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('558', '61', '提醒頻率', 'ratecont', 'text', '8', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0', null, '1', '0', '1', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('559', '61', '操作時間', 'optdt', 'datetime', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('560', '61', '操作人', 'optname', 'text', '12', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('561', '4', '得分', 'mark', 'text', '10', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('562', '28', '優惠價格', 'discount', 'number', '4', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('563', '62', '報修資產', 'assetm', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '100', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('564', '62', '保修原因', 'reason', 'textarea', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('565', '62', '實際原因', 'reasons', 'textarea', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('566', '62', '需要外修', 'iswx', 'select', '2', '0', '0', '0|否,1|是', '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('567', '62', '維修金額', 'money', 'number', '5', '0', '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('569', '62', '維修人員', 'wxname', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('570', '62', '說明', 'explain', 'textarea', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('571', '63', '名稱', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('572', '63', '所屬單位', 'pid', 'select', '2', '0', '1', 'companydata', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('573', '63', '對應負責人', 'fuzename', 'changeusercheck', '3', null, '0', 'fuzeid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('574', '63', '所在城市', 'city', 'text', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('575', '63', '地址', 'address', 'text', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '1', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('576', '63', '電話', 'tel', 'text', '6', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('577', '63', '傳真', 'fax', 'text', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('578', '63', '排序號', 'sort', 'number', '8', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('579', '63', '對應英文名', 'nameen', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('580', '63', 'ID', 'id', 'text', '9', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('581', '31', '簽署單位', 'companyid', 'select', '4', null, '1', 'companydata', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('582', '31', '部門', 'deptname', 'text', '1', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('585', '10', '微信號', 'weixinid', 'text', '18', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '手機號不能作為微信號', '1', '0');
INSERT INTO `xinhu_flow_element` VALUES ('583', '10', '電話', 'tel', 'text', '16', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('584', '10', '郵箱', 'email', 'email', '17', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '1', '1');
INSERT INTO `xinhu_flow_element` VALUES ('586', '10', '所屬單位', 'companyid', 'select', '19', null, '1', 'companydata', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('588', '10', '啟用', 'status', 'select', '20', '1', '0', '1|啟用,0|停用', '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('589', '10', '管理員', 'type', 'select', '21', '0', '0', '0|普通,1|管理員', '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('590', '10', '排序號', 'sort', 'number', '23', '0', '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('591', '10', '頭像', 'face', 'uploadimg', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('592', '10', '所在組', 'groupname', 'checkboxall', '24', null, '0', 'groupdata', '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('593', '29', '所屬單位', 'companyid', 'select', '25', null, '0', 'companydata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('594', '29', '試用期到', 'syenddt', 'date', '22', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('595', '29', '離職日期', 'quitdt', 'date', '24', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('596', '10', '密碼', 'pass', 'text', '3', null, '0', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '新增默認123456,不填不修改密碼', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('597', '9', '初始庫存', 'stockcs', 'number', '0', '0', '0', null, '1', '1', 'min=\"0\"', '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('598', '5', '請假天數', 'totday', 'text', '10', '0', '0', null, '1', '0', 'readonly', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('599', '30', '天數', 'totday', 'text', '1', '0', '0', null, '1', '0', 'readonly', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('600', '34', '是否發放', 'ispay', 'text', '102', '0', '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('601', '64', '付款編號', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '可為合同號/訂單號', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('602', '64', '付款金額', 'money', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('603', '64', '付款日期', 'paydt', 'date', '2', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('604', '64', '收款單位', 'fullname', 'text', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '填寫全稱', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('605', '64', '收款銀行', 'openbank', 'text', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('606', '64', '收款帳號', 'cardid', 'text', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('607', '64', '付款方式', 'paytype', 'rockcombo', '6', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('608', '64', '說明', 'explain', 'textarea', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('609', '64', '類型', 'type', 'fixed', '8', '4', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('611', '65', '開票名稱', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '50', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('610', '65', '類型', 'type', 'fixed', '0', '5', '1', null, '1', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('612', '65', '開票金額', 'money', 'number', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('613', '65', '開票日期', 'paydt', 'date', '3', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('614', '65', '公司單位名稱', 'fullname', 'text', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '填寫需要開票公司/單位全稱', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('615', '65', '納稅識別號', 'shibieid', 'text', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('616', '65', '開戶行', 'openbank', 'text', '8', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('617', '65', '開戶帳號', 'cardid', 'text', '9', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('618', '65', '開票類型', 'paytype', 'rockcombo', '10', null, '1', 'openpiaotype', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('619', '65', '說明', 'explain', 'textarea', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('620', '65', '公司地址', 'address', 'text', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('621', '65', '聯系電話', 'tel', 'text', '6', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('622', '65', '相關單號', 'num', 'text', '11', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '可填寫合同號/訂單號', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('623', '53', '性別', 'sex', 'select', '0', null, '1', '男,女', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('624', '66', '對應模塊', 'setid', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('625', '66', '通知內容摘要', 'summary', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('626', '1', '開始時間', 'startdt', 'datetime', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '投票時需開始時間', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('627', '1', '截止時間', 'enddt', 'datetime', '13', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '投票時需截止時間', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('628', '1', '至少投票', 'mintou', 'number', '10', null, '0', null, '1', '1', 'min=\"0\"', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '為0不填說明就不用投票', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('629', '1', '最多投票', 'maxtou', 'number', '10', '0', '0', null, '1', '1', 'min=\"0\"', '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, '0不限制', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('630', '1', '投票選項', 'touitems', 'text', '0', null, '1', null, '1', '1', null, '1', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('631', '19', '發文字號', 'zinum', 'rockcombo', '0', null, '1', 'officiazinum', '1', '1', null, '0', '0', null, null, '30', null, '0', '1', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('632', '19', '接收單位', 'unitname', 'text', '7', null, '1', null, '1', '1', null, '0', '0', null, null, '50', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('633', '20', '來文日期', 'laidt', 'date', '1', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('634', '20', '來文單位', 'unitsame', 'text', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '50', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('635', '19', '發文單位', 'unitsame', 'text', '4', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('636', '19', '公文密級', 'miji', 'rockcombo', '8', null, '1', 'officialmiji', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('637', '20', '接收單位', 'unitname', 'text', '7', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('638', '67', '訂閱標題', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('639', '67', '訂閱提醒內容', 'cont', 'textarea', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('640', '67', '訂閱說明', 'explain', 'textarea', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('641', '67', '訂閱人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('642', '67', '訂閱時間', 'optdt', 'datetime', '4', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('643', '67', '狀態', 'status', 'checkbox', '5', '1', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('644', '67', '同時訂閱給', 'recename', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('645', '67', '訂閱提醒時間', 'ratecont', 'text', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('646', '67', '訂閱地址', 'suburl', 'textarea', '8', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('647', '67', '訂閱地址post參數', 'suburlpost', 'textarea', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('648', '67', '最後運行時間', 'lastdt', 'datetime', '10', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('649', '67', 'ID', 'id', 'text', '12', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('650', '68', '訂閱標題', 'title', 'text', '0', null, '1', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('651', '68', '訂閱內容', 'cont', 'text', '0', null, '1', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('652', '68', '添加時候', 'optdt', 'datetime', '0', null, '1', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('653', '68', '訂閱提醒對象', 'recename', 'text', '0', null, '1', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('654', '68', '文件', 'filepath', 'text', '0', null, '1', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('655', '67', '共享給', 'shatename', 'changedeptusercheck', '11', null, '0', 'shateid', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '共享給他人讓他也可以訂閱設置這個訂閱', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('656', '34', '是否核算', 'isturn', 'text', '103', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '0', '1', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('657', '34', '是否審核', 'status', 'text', '104', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '1');
INSERT INTO `xinhu_flow_element` VALUES ('658', '69', '標題', 'title', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('659', '69', '發文單位', 'unitsame', 'text', '2', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('660', '69', '公文編號', 'num', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('661', '69', '公文密級', 'miji', 'text', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('662', '69', '操作時間', 'optdt', 'datetime', '4', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('663', '10', '多部門', 'deptnames', 'changedeptcheck', '11', null, '0', 'deptids', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('664', '10', '多職位', 'rankings', 'text', '12', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '1', '0', null, '多個用,分開', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('665', '70', '設備號', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '1', '0');
INSERT INTO `xinhu_flow_element` VALUES ('666', '70', '設備名稱', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('667', '70', '公司名', 'company', 'text', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('668', '70', '狀態', 'status', 'text', '3', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('669', '70', '最後請求時間', 'lastdt', 'datetime', '5', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('670', '70', '排序號', 'sort', 'number', '4', null, '0', null, '0', '0', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('671', '70', 'ID', 'id', 'number', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('672', '70', 'sd卡剩餘空間', 'space', 'number', '7', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('673', '70', '剩餘內存', 'memory', 'number', '8', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('674', '70', '人員數', 'usershu', 'number', '9', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('675', '70', '指紋數', 'fingerprintshu', 'number', '10', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('676', '70', '頭像數量', 'headpicshu', 'number', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('677', '70', '打卡數', 'clockinshu', 'number', '12', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('678', '70', '現場照片數', 'picshu', 'number', '13', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('679', '70', '系統版本', 'romver', 'text', '14', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('680', '70', '應用版本', 'appver', 'text', '15', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('681', '70', '設備型號', 'model', 'text', '16', null, '0', null, '0', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('682', '71', '月份', 'month', 'month', '0', '{month}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('683', '71', '考核內容', 'content', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '1', '0', null, '多條用回車換行', '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('684', '71', '自評分數', 'fenzp', 'number', '0', '0', '1', null, '1', '1', 'min=\"0\" max=\"100\"', '0', '0', null, null, '0', 'gt|0|分數必須大于0,elt|100|分數不能大于100', '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('685', '71', '上級評分', 'fensj', 'number', '0', '0', '0', null, '0', '1', 'min=\"0\" max=\"100\"', '0', '0', null, null, '0', 'gt|0|分數必須大于0,elt|100|分數不能大于100', '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('686', '71', '人事評分', 'fenrs', 'number', '0', '0', '0', null, '0', '1', 'min=\"0\" max=\"100\"', '0', '0', null, null, '0', 'gt|0|分數必須大于0,elt|100|分數不能大于100', '1', '1', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('687', '71', '最後得分', 'fen', 'number', '0', '0', '0', null, '0', '1', null, '0', '0', null, null, '0', null, '1', '1', '0', '0', '1', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('688', '71', '說明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('689', '7', '所在省', 'sheng', 'selectdatafalse', '7', null, '0', 'city:citydata', '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('690', '7', '所在市', 'shi', 'text', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '0', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('691', '72', '省', 'sheng', 'select', '1', null, '1', 'city:shengdata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('692', '72', '市', 'shi', 'select', '2', null, '1', 'citydata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('693', '72', '縣(區)', 'xian', 'select', '3', null, '0', 'xiandata', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('694', '72', '申請日期', 'applydt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('695', '72', '說明', 'explain', 'textarea', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('696', '72', '彈出下拉單選', 'tanxuan', 'selectdatafalse', '5', null, '0', 'tanxuan', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');
INSERT INTO `xinhu_flow_element` VALUES ('697', '72', '彈框下拉多選', 'tanxuancheck', 'selectdatatrue', '6', null, '0', 'tanxuancheck', '1', '1', null, '0', '0', null, null, '0', null, '1', '0', '0', '0', '0', null, null, '0', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_extent`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_extent`;
CREATE TABLE `xinhu_flow_extent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(200) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0' COMMENT '模塊',
  `type` tinyint(1) DEFAULT '0' COMMENT '0查看,1添加,2編輯,3刪除',
  `wherestr` varchar(500) DEFAULT NULL COMMENT '條件',
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `whereid` smallint(6) DEFAULT '0' COMMENT '條件Id',
  PRIMARY KEY (`id`),
  KEY `modeid` (`modeid`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='模塊權限';

-- ----------------------------
-- Records of xinhu_flow_extent
-- ----------------------------
INSERT INTO `xinhu_flow_extent` VALUES ('1', '全體人員', 'all', '1', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('2', '全體人員', 'all', '1', '0', 'e3JlY2VpZH0:', '發布給包含我', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('3', '全體人員', 'all', '3', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('4', '全體人員', 'all', '2', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('5', '全體人員', 'all', '2', '0', 'YWxs', '全部數據', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('6', '全體人員', 'all', '3', '0', 'e2FsbHN1cGVyfQ::', '所有下屬人員', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('10', '全體人員', 'all', '1', '2', 'b3B0aWQ9e3VpZH0:', '自己發布的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('11', '全體人員', 'all', '2', '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPTA:', '我創建的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('12', '全體人員', 'all', '4', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('13', '全體人員', 'all', '4', '0', 'YWxs', '任何人都可以看到任務', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('14', '全體人員', 'all', '5', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('15', '全體人員', 'all', '6', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('16', '管理員', 'u1', '1', '3', 'b3B0aWQ!MA::', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('117', '管理員', 'u1', '5', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('18', '全體人員', 'all', '2', '3', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlIGluKDAsMyk:', '可刪除我創建的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('19', '全體人員', 'all', '8', '3', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', '刪除自己未成交的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('20', '全體人員', 'all', '7', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('21', '全體人員', 'all', '8', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('22', '全體人員', 'all', '9', '2', 'b3B0aWQ9e3VpZH0:', '本人添加可編輯', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('24', '全體人員', 'all', '3', '0', 'dWlkPXt1aWR9', '可查看我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('25', '全體人員', 'all', '8', '0', 'dWlkPXt1aWR9', '可查看我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('26', '全體人員', 'all', '7', '0', 'dWlkPXt1aWR9', '可查看我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('27', '全體人員', 'all', '12', '2', 'dWlkPXt1aWR9', '編輯我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('28', '全體人員', 'all', '12', '3', 'dWlkPXt1aWR9', '刪除自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('29', '全體人員', 'all', '12', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('30', '全體人員', 'all', '12', '0', 'dWlkPXt1aWR9', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('31', '全體人員', 'all', '10', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('32', '全體人員', 'all', '13', '0', 'YWxs', '全體人員都可以查看組織結構', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('33', '管理員', 'u1', '13', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('34', '管理員', 'u1', '10', '3', 'YHR5cGVgPTA:', '只能刪除非管理員帳號', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('35', '管理員', 'u1', '14', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('36', '管理員', 'u1', '14', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('37', '管理員', 'u1', '15', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('38', '管理員', 'u1', '15', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('39', '管理員', 'u1', '16', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('40', '管理員', 'u1', '16', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('41', '管理員', 'u1', '17', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('42', '管理員', 'u1', '17', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('43', '管理員', 'u1', '18', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('44', '管理員', 'u1', '18', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('45', '管理員', 'u1', '9', '3', 'YWxs', '管理可刪除全部', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('46', '全體人員', 'all', '24', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('47', '全體人員', 'all', '25', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('48', '全體人員', 'all', '26', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('49', '全體人員', 'all', '7', '2', 'dWlkPXt1aWR9', '可編輯我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('50', '全體人員', 'all', '22', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('51', '全體人員', 'all', '22', '2', 'b3B0aWQ9e3VpZH0:', '創建人可修改', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('52', '全體人員', 'all', '23', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('53', '全體人員', 'all', '11', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('54', '全體人員', 'all', '27', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('55', '全體人員', 'all', '8', '2', 'dWlkPXt1aWR9IGFuZCBodGlkPTA:', '可編輯自己未創建合同的單子', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('56', '全體人員', 'all', '3', '2', 'dWlkPXt1aWR9IGFuZCBkdD57ZGF0ZS0zfQ::', '自己可編輯3天前日報', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('57', '全體人員', 'all', '29', '2', 'aWQ9e3VpZH0:', '可編輯自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('58', '管理員', 'u1', '29', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('59', '全體人員', 'all', '29', '0', 'aWQ9e3VpZH0:', '可查看自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('60', '管理員', 'u1', '31', '0', 'YWxs', '可查看所有人', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('61', '管理員', 'u1', '31', '2', 'YWxs', '管理員可編輯所有人', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('62', '管理員,行政人事部', 'u1,d4', '29', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('63', '全體人員', 'all', '33', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('64', '全體人員', 'all', '32', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('65', '全體人員', 'all', '34', '0', 'YHh1aWRgPXt1aWR9', '可查看自己薪資', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('66', '全體人員', 'all', '34', '0', 'YG9wdGlkYD17dWlkfQ::', '可查看我提交的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('67', '管理員,信呼客服', 'u1,u8', '34', '0', null, null, '1', '3');
INSERT INTO `xinhu_flow_extent` VALUES ('68', '全體人員', 'all', '35', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('69', '全體人員', 'all', '35', '2', 'dWlkPXt1aWR9IGFuZCBtb25leT1tb25leXM:', '編輯我的合同', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('70', '全體人員', 'all', '36', '2', 'dWlkPXt1aWR9IGFuZCBpc3BheT0w', '未付款前可以編輯', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('71', '管理員', 'u1', '36', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('72', '全體人員', 'all', '37', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('73', '全體人員', 'all', '40', '0', 'YWxs', '任何人都可以查看知識', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('74', '管理員,大喬', 'u1,u4', '40', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('75', '管理員,行政人事部', 'u1,d4', '41', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('76', '行政人事部', 'd4', '41', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('77', '全體人員', 'all', '41', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('78', '管理員,行政人事部', 'u1,d4', '41', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('79', '管理員,行政人事部', 'u1,d4', '42', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('80', '管理員,行政人事部', 'u1,d4', '42', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('81', '管理員,行政人事部', 'u1,d4', '42', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('82', '管理員,行政人事部', 'u1,d4', '42', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('83', '管理員,行政人事部', 'u1,d4', '43', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('84', '信呼開發團隊', 'd1', '43', '2', 'b3B0aWQ9e3VpZH0:', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('85', '管理員,行政人事部', 'u1,d4', '43', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('86', '管理員,行政人事部', 'u1,d4', '43', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('87', '全體人員', 'all', '43', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('88', '全體人員', 'all', '44', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('89', '全體人員', 'all', '44', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('90', '全體人員', 'all', '45', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('91', '全體人員', 'all', '45', '2', 'b3B0aWQ9e3VpZH0:', '可編輯自己添加', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('92', '管理員,行政人事部', 'u1,d4', '45', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('93', '管理員,行政人事部', 'u1,d4', '45', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('94', '全體人員', 'all', '46', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('95', '全體人員', 'all', '46', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('96', '全體人員', 'all', '22', '3', 'b3B0aWQ9e3VpZH0:', '創建人可刪除自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('97', '全體人員', 'all', '47', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('98', '全體人員', 'all', '47', '2', 'c2VuZGlkPXt1aWR9IGFuZCBpc3R1cm49MA::', '可編輯草稿', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('99', '全體人員', 'all', '47', '3', 'c2VuZGlkPXt1aWR9IGFuZCBpc3R1cm49MA::', '可刪除草稿', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('100', '管理員', 'u1', '21', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('101', '全體人員', 'all', '48', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('102', '全體人員', 'all', '48', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('103', '全體人員', 'all', '48', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('104', '全體人員', 'all', '49', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('105', '全體人員', 'all', '51', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('106', '全體人員', 'all', '52', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('107', '全體人員', 'all', '53', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('108', '全體人員', 'all', '53', '2', 'dWlkPXt1aWR9', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('109', '全體人員', 'all', '53', '3', 'dWlkPXt1aWR9', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('110', '全體人員', 'all', '36', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('111', '全體人員', 'all', '36', '3', 'dWlkPXt1aWR9IGFuZCBpc3BheT0w', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('112', '行政人事部', 'd4', '28', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('113', '全體人員', 'all', '54', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('114', '全體人員', 'all', '54', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('115', '全體人員', 'all', '54', '2', 'b3B0aWQ9e3VpZH0:', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('116', '全體人員', 'all', '38', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('120', '全體人員', 'all', '10', '0', 'e2RlcHR9', '可以查看本部門人員', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('123', '管理員,行政人事部', 'u1,d4', '56', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('124', '全體人員', 'all', '56', '3', 'YG9wdGlkYD17dWlkfSBhbmQgYHN0YXJ0ZHRgPm5vdygp', '時間還未開始就可以刪除', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('125', '全體人員', 'all', '56', '2', 'YG9wdGlkYD17dWlkfSBhbmQgYHN0YXJ0ZHRgPm5vdygp', '時間還未開始就可以編輯', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('126', '全體人員', 'all', '56', '0', 'YG9wdGlkYD17dWlkfQ::', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('127', '管理員,行政人事部', 'u1,d4', '56', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('130', '全體人員', 'all', '58', '2', 'b3B0aWQ9e3VpZH0:', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('131', '全體人員', 'all', '58', '3', 'b3B0aWQ9e3VpZH0:', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('132', '全體人員', 'all', '61', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('133', '全體人員', 'all', '61', '2', 'dWlkPXt1aWR9', '可編輯我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('134', '全體人員', 'all', '61', '3', 'dWlkPXt1aWR9', '可刪除我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('135', '管理員', 'u1', '61', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('136', '管理員', 'u1', '61', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('137', '全體人員', 'all', '62', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('138', '行政人事部', 'd4', '62', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('139', '全體人員', 'all', '63', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('140', '管理員', 'u1', '63', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('141', '管理員', 'u1', '63', '3', 'YGlkYD4x', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('142', '管理員', 'u1', '63', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('143', '管理員', 'u1', '10', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('144', '全體人員', 'all', '7', '3', 'dWlkPXt1aWR9', '可刪除我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('145', '全體人員', 'all', '64', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('146', '全體人員', 'all', '65', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('147', '管理員', 'u1', '10', '4', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('148', '全體人員', 'all', '7', '4', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('149', '管理員', 'u1', '67', '3', 'YWxs', '管理員可刪除全部人的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('150', '全體人員', 'all', '67', '3', 'YG9wdGlkYD17dWlkfQ::', '可刪除我的訂閱', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('151', '全體人員', 'all', '67', '2', 'YG9wdGlkYD17dWlkfQ::', '編輯自己訂閱', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('153', '全體人員', 'all', '68', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('154', '全體人員', 'all', '68', '0', 'e3JlY2VpZCx1aWRpbn0:', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('155', '管理員', 'u1', '68', '3', 'YWxs', '管理員可刪除所有', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('156', '管理員', 'u1', '70', '2', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('157', '管理員', 'u1', '70', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('158', '管理員,行政人事部', 'u1,d4', '29', '2', 'YWxs', '編輯所有人', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('159', '全體人員', 'all', '71', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('160', '全體人員', 'all', '72', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('161', '全體人員', 'all', '72', '0', 'YWxs', null, '1', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_log`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_log`;
CREATE TABLE `xinhu_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1通過',
  `statusname` varchar(20) DEFAULT NULL COMMENT '狀態名稱',
  `name` varchar(50) DEFAULT NULL COMMENT '進程名稱',
  `courseid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL COMMENT '瀏覽器',
  `checkname` varchar(20) DEFAULT NULL,
  `checkid` smallint(6) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT NULL COMMENT '@模塊Id',
  `color` varchar(10) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `step` smallint(6) DEFAULT '0' COMMENT '步驟號',
  `qmimg` text COMMENT '簽名的圖片base64',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=1134 DEFAULT CHARSET=utf8 COMMENT='單據操作記錄';

-- ----------------------------
-- Records of xinhu_flow_log
-- ----------------------------
INSERT INTO `xinhu_flow_log` VALUES ('2', 'kqinfo', '1', '2', '不同意', '上級審核', '1', '2016-07-29 10:53:48', '哈哈哈，不給你過，看怎麼兜風', '192.168.1.143', 'Chrome', '磐石', '5', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('3', 'kqinfo', '1', '1', '同意', '上級審核', '1', '2016-07-29 10:54:12', null, '192.168.1.143', 'Chrome', '磐石', '5', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('5', 'kqinfo', '2', '2', '不同意', '上級審核', '3', '2016-07-29 10:56:03', '哈哈啊', '192.168.1.143', 'Chrome', '磐石', '5', '6', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('7', 'kqinfo', '2', '1', '同意', '上級審核', '3', '2016-07-29 10:58:51', '好的', '127.0.0.1', 'Firefox', '磐石', '5', '6', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('60', 'kqinfo', '5', '1', '同意', '上級審核', '1', '2016-08-25 16:02:15', null, '127.0.0.1', 'Chrome', '磐石', '5', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('61', 'kqinfo', '5', '1', '同意', '人事審核', '2', '2016-08-25 16:03:22', null, '127.0.0.1', 'Chrome', '大喬', '4', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('63', 'kqinfo', '6', '1', '同意', '上級審核', '1', '2016-08-26 23:35:26', null, '127.0.0.1', 'Chrome', '管理員', '1', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('64', 'kqinfo', '3', '1', '同意', '上級審核', '1', '2016-08-26 23:36:28', null, '127.0.0.1', 'Chrome', '管理員', '1', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('65', 'kqinfo', '6', '1', '同意', '人事審核', '2', '2016-08-26 23:36:46', null, '127.0.0.1', 'Chrome', '大喬', '4', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('66', 'kqinfo', '3', '1', '同意', '人事審核', '2', '2016-08-26 23:36:50', null, '127.0.0.1', 'Chrome', '大喬', '4', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('67', 'kqinfo', '1', '1', '同意', '人事審核', '2', '2016-08-26 23:36:55', null, '127.0.0.1', 'Chrome', '大喬', '4', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('71', 'kqinfo', '7', '1', '同意', '上級審核', '3', '2016-08-27 15:14:50', null, '127.0.0.1', 'Chrome', '磐石', '5', '6', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('73', 'kqout', '1', '1', '同意', '上級審核', '5', '2016-08-27 15:23:05', null, '127.0.0.1', 'Chrome', '磐石', '5', '23', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('111', 'goodm', '1', '2', '駁回', '行政發放', '6', '2016-09-01 23:12:12', '哈哈', '127.0.0.1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('112', 'goodm', '1', '1', '發放', '行政發放', '6', '2016-09-01 23:16:44', null, '127.0.0.1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('114', 'goodm', '2', '2', '駁回', '行政發放', '6', '2016-09-02 10:13:00', '哈哈', '127.0.0.1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('115', 'goodm', '2', '2', '駁回', '行政發放', '6', '2016-09-02 10:43:13', '12', '127.0.0.1', 'Chrome', '大喬', '4', '24', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('117', 'goodm', '2', '1', '發放', '行政發放', '6', '2016-09-02 10:43:45', null, '127.0.0.1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('129', 'fininfom', '5', '1', '同意', '上級審批', '7', '2016-09-02 23:03:45', null, '127.0.0.1', 'Chrome', '磐石', '5', '11', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('130', 'kqinfo', '4', '2', '不同意', '上級審核', '1', '2016-09-02 23:06:03', 'as', '127.0.0.1', 'Chrome', '磐石', '5', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('136', 'fininfom', '3', '1', '同意', '上級審批', '10', '2016-09-03 15:39:01', null, '127.0.0.1', 'Chrome', '磐石', '5', '25', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('138', 'fininfom', '4', '1', '同意', '上級審核', '13', '2016-09-03 15:44:02', null, '127.0.0.1', 'Chrome', '磐石', '5', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('139', 'fininfom', '6', '2', '不同意', '上級審核', '13', '2016-09-03 15:46:03', '哈哈', '127.0.0.1', 'Chrome', '磐石', '5', '26', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('140', 'fininfom', '4', '1', '同意', '人事審核', '14', '2016-09-03 15:50:17', null, '127.0.0.1', 'Chrome', '大喬', '4', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('141', 'fininfom', '4', '1', '同意', '財務審核', '15', '2016-09-03 16:51:39', null, '127.0.0.1', 'Chrome', '貂蟬', '2', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('143', 'fininfom', '6', '1', '同意', '上級審核', '13', '2016-09-03 16:53:05', null, '127.0.0.1', 'Chrome', '磐石', '5', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('145', 'fininfom', '6', '1', '同意', '人事審核', '14', '2016-09-03 17:16:16', 'hahah', '127.0.0.1', 'Chrome', '大喬', '4', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('146', 'fininfom', '6', '1', '同意', '財務審核', '15', '2016-09-03 17:16:59', '哈哈哈哈', '127.0.0.1', 'Chrome', '貂蟬', '2', '26', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('148', 'fininfom', '7', '1', '同意', '財務確認', '16', '2016-09-03 17:18:06', null, '127.0.0.1', 'Chrome', '貂蟬', '2', '27', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('149', 'fininfom', '7', '1', '同意', '付款確認', '17', '2016-09-03 17:18:37', '哈哈哈', '127.0.0.1', 'Chrome', '管理員', '1', '27', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('150', 'fininfom', '7', '1', '同意', '確認收款', '18', '2016-09-03 17:19:43', '哈哈哈哈', '127.0.0.1', 'Chrome', '貂蟬', '2', '27', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('156', 'kqinfo', '8', '1', '同意', '上級審核', '1', '2016-09-04 22:06:25', '給你吧，哈哈哈', '127.0.0.1', 'Chrome', '張飛', '6', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('157', 'kqinfo', '8', '1', '同意', '人事審核', '2', '2016-09-05 14:22:32', '好的', '127.0.0.1', 'Chrome', '大喬', '4', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('159', 'fininfom', '3', '1', '同意', '人事審核', '11', '2016-09-05 14:34:49', 'hahah', '127.0.0.1', 'Chrome', '信呼客服', '8', '25', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('160', 'fininfom', '3', '1', '同意', '財務審核', '12', '2016-09-05 14:35:07', null, '127.0.0.1', 'Chrome', '貂蟬', '2', '25', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('161', 'goodm', '4', '1', '發放', '行政發放', '6', '2016-09-05 14:41:11', '哈哈哈', '127.0.0.1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('162', 'goodm', '4', '1', '發放', '行政發放', '6', '2016-09-05 15:29:17', '哈哈哈', '127.0.0.1', 'Chrome', '小喬', '3', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('163', 'goodm', '4', '2', '駁回', '行政發放', '6', '2016-09-05 15:29:33', '問', '127.0.0.1', 'Chrome', '貂蟬', '2', '24', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('165', 'goodm', '4', '1', '發放', '行政發放', '6', '2016-09-05 15:30:27', null, '127.0.0.1', 'Chrome', '管理員', '1', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('166', 'goodm', '4', '1', '發放', '行政發放', '6', '2016-09-05 15:48:41', null, '127.0.0.1', 'Chrome', '貂蟬', '2', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('168', 'official', '1', '1', '同意', '上級審批', '21', '2016-09-05 20:41:33', null, '127.0.0.1', 'Chrome', '磐石', '5', '19', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('169', 'official', '1', '1', '同意', '辦公室批辦', '22', '2016-09-05 20:53:17', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '19', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('171', 'official', '1', '1', '同意', '領導審批', '23', '2016-09-05 21:04:50', null, '127.0.0.1', 'Chrome', '小喬', '3', '19', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('174', 'goodm', '5', '2', '不同意', '上級審批', '19', '2016-09-06 16:38:30', '不能通過', '127.0.0.1', 'Chrome', '磐石', '5', '28', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('175', 'goodm', '5', '1', '同意', '上級審批', '19', '2016-09-06 16:38:56', '哈哈哈', '127.0.0.1', 'Chrome', '磐石', '5', '28', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('188', 'kqinfo', '9', '2', '不同意', '上級審核', '1', '2016-09-08 20:38:05', 'hahaha', '192.168.1.104', 'Chrome', '磐石', '5', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('190', 'kqinfo', '9', '1', '同意', '上級審核', '1', '2016-09-08 21:39:10', null, '192.168.1.100', 'wxbro', '磐石', '5', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('199', 'kqinfo', '9', '2', '不同意', '人事審核', '2', '2016-09-12 14:49:37', '哈哈哈', '127.0.0.1', 'Firefox', '大喬', '4', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('201', 'fininfom', '5', '2', '不同意', '人事審核', '8', '2016-09-12 14:51:29', '12', '127.0.0.1', 'Firefox', '大喬', '4', '11', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('235', 'hrpositive', '1', '1', '同意', '上級審批', '27', '2016-10-07 10:24:33', '表現不錯轉正吧', '127.0.0.1', 'Chrome', '磐石', '5', '32', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('236', 'hrpositive', '1', '1', '同意', '人事審批', '28', '2016-10-07 10:25:56', '好哦奧', '127.0.0.1', 'Chrome', '大喬', '4', '32', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('238', 'hrredund', '1', '2', '不同意', '上級審批', '29', '2016-10-07 11:55:03', '沒事提啥離職啊，我去', '127.0.0.1', 'Chrome', '磐石', '5', '33', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('333', 'assetm', '6', '1', '維修', '維修', '0', '2016-10-26 22:27:47', '加碳粉', '127.0.0.1', 'Chrome', '管理員', '1', '41', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('332', 'assetm', '6', '1', '領用', '領用登記', '0', '2016-10-26 22:26:44', '領用了', '127.0.0.1', 'Chrome', '管理員', '1', '41', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('493', 'hrtransfer', '1', '1', '同意', '人事審批', '32', '2017-02-07 10:21:30', null, '127.0.0.1', 'Chrome', '大喬', '4', '38', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('309', 'reward', '1', '1', '無異議', '當事人確認', '35', '2016-10-20 21:08:27', '謝謝獎勵', '127.0.0.1', 'Chrome', '管理員', '1', '39', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('311', 'reward', '1', '1', '同意', '人事審批', '36', '2016-10-20 21:17:12', null, '127.0.0.1', 'Chrome', '大喬', '4', '39', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('345', 'carmrese', '6', '1', '同意', '上級審批', '37', '2016-10-28 22:43:52', null, '127.0.0.1', 'Chrome', '磐石', '5', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('346', 'carmrese', '6', '1', '同意', '行政確認', '38', '2016-10-28 22:44:17', null, '127.0.0.1', 'Chrome', '小喬', '3', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('354', 'bookborrow', '1', '1', '同意', '行政確認', '39', '2016-10-29 15:19:40', '借吧', '127.0.0.1', 'Chrome', '小喬', '3', '46', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('355', 'bookborrow', '1', '1', '確認歸還', '借閱人歸返', '0', '2016-10-29 16:43:29', '已被張飛拿走了,轉給：張飛', '127.0.0.1', 'Chrome', '管理員', '1', '46', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('356', 'bookborrow', '1', '1', '確認歸還', '借閱人歸返', '40', '2016-10-29 19:43:01', '呵呵', '127.0.0.1', 'Chrome', '張飛', '6', '46', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('357', 'bookborrow', '2', '1', '同意', '行政確認', '39', '2016-10-29 20:21:19', null, '127.0.0.1', 'Chrome', '小喬', '3', '46', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('358', 'bookborrow', '2', '1', '確認歸還', '借閱人歸返', '0', '2016-10-29 22:33:30', '轉給：貂蟬', '127.0.0.1', 'Safari', '信呼客服', '8', '46', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('361', 'bookborrow', '3', '1', '同意', '行政確認', '39', '2016-10-30 11:59:32', null, '127.0.0.1', 'Chrome', '小喬', '3', '46', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('364', 'daily', '9', '1', null, '點評', '0', '2016-10-31 20:20:26', '不錯不錯', '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('367', 'work', '2', '2', '執行中', '進度報告', '0', '2016-11-02 20:23:41', '快好了', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('368', 'work', '2', '2', '執行中', '進度報告', '0', '2016-11-02 20:26:45', '問問', '127.0.0.1', 'Chrome', '管理員', '1', '4', '#ff6600', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('369', 'work', '2', '1', '已完成', '進度報告', '0', '2016-11-02 20:27:17', '好了', '127.0.0.1', 'Chrome', '管理員', '1', '4', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('372', 'work', '7', '1', '評分', '任務評分', '0', '2016-11-02 22:25:08', '呵呵', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('375', 'project', '2', '0', null, '更新進度', '0', '2016-11-10 19:51:38', null, '127.0.0.1', 'Chrome', '管理員', '1', '22', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('383', 'work', '8', '2', '執行中', '進度報告', '0', '2016-11-14 19:05:38', '很好啊', '127.0.0.1', 'Firefox', '管理員', '1', '4', 'orange', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('387', 'daily', '13', '1', '評分', '日報評分', '0', '2016-11-28 17:03:05', '呵呵', '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('388', 'daily', '15', '1', null, '點評', '0', '2016-11-28 17:08:54', '不錯啊', '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('921', 'kqinfo', '9', '1', null, '作廢', '0', '2017-08-02 15:38:14', '太久沒處理了，作廢吧', '127.0.0.1', 'Chrome', '管理員', '1', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('404', 'seal', '1', '1', null, '提交', '0', '2016-12-08 21:09:03', null, '127.0.0.1', 'Chrome', '管理員', '1', '48', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('405', 'sealapl', '1', '1', null, '提交', '0', '2016-12-08 21:48:02', null, '127.0.0.1', 'Chrome', '管理員', '1', '49', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('406', 'sealapl', '1', '1', '同意', '上級審批', '41', '2016-12-08 21:55:36', null, '127.0.0.1', 'Chrome', '磐石', '5', '49', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('407', 'sealapl', '1', '1', '同意', '保管人確認', '42', '2016-12-08 21:56:05', '可以的，來蓋章吧', '127.0.0.1', 'Chrome', '張飛', '6', '49', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('408', 'sealapl', '1', '1', '已蓋章', '申請人確認', '43', '2016-12-09 09:14:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '49', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('412', 'kqinfo', '14', '1', null, '提交', '0', '2016-12-09 12:23:06', null, '127.0.0.1', 'Chrome', '管理員', '1', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('919', 'kqinfo', '14', '1', '同意', '上級審核', '1', '2017-07-31 16:21:16', null, '::1', 'Chrome', '磐石', '5', '5', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('415', 'customer', '2', '1', '啟用', '狀態切換', '0', '2016-12-14 10:07:10', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('416', 'customer', '2', '1', '啟用', '狀態切換', '0', '2016-12-14 10:07:51', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('417', 'customer', '2', '0', '停用', '狀態切換', '0', '2016-12-14 10:08:09', '哈哈', '127.0.0.1', 'Chrome', '管理員', '1', '7', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('418', 'customer', '2', '1', '標星', '標星', '0', '2016-12-14 10:17:30', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'chocolate', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('419', 'customer', '2', '0', '取消標星', '取消標星', '0', '2016-12-14 10:18:49', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('420', 'customer', '1', '1', '標星', '標星', '0', '2016-12-14 10:18:53', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'chocolate', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('421', 'customer', '2', '1', '標星', '狀態切換', '0', '2016-12-14 10:19:55', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'chocolate', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('422', 'customer', '1', '1', '拜訪記錄', '狀態切換', '0', '2016-12-14 10:21:44', '哈哈哈哈啊', '127.0.0.1', 'Chrome', '管理員', '1', '7', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('423', 'customer', '1', '1', '拜訪記錄', '拜訪記錄', '0', '2016-12-14 10:22:10', '12', '127.0.0.1', 'Chrome', '管理員', '1', '7', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('424', 'customer', '1', '1', '拜訪', '拜訪記錄', '0', '2016-12-14 10:22:47', '112', '127.0.0.1', 'Chrome', '管理員', '1', '7', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('431', 'kqerr', '1', '1', null, '提交', '0', '2016-12-16 20:54:27', null, '127.0.0.1', 'Chrome', '管理員', '1', '51', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('432', 'kqerr', '1', '1', '同意', '上級審核', '44', '2016-12-16 21:01:34', null, '127.0.0.1', 'Chrome', '磐石', '5', '51', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('434', 'kqerr', '1', '1', '同意', '人事確認', '45', '2016-12-16 21:08:07', null, '127.0.0.1', 'Chrome', '大喬', '4', '51', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('451', 'tovoid', '5', '1', '同意', '上級審核', '46', '2016-12-19 14:39:52', null, '127.0.0.1', 'Chrome', '磐石', '5', '52', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('450', 'tovoid', '5', '1', null, '提交', '0', '2016-12-19 14:39:20', null, '127.0.0.1', 'Chrome', '管理員', '1', '52', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('447', 'tovoid', '3', '1', '同意', '上級審核', '46', '2016-12-19 14:32:51', null, '127.0.0.1', 'Chrome', '磐石', '5', '52', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('445', 'tovoid', '3', '1', null, '提交', '0', '2016-12-19 13:49:22', null, '127.0.0.1', 'Chrome', '管理員', '1', '52', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('452', 'vcard', '2', '1', null, '提交', '0', '2016-12-20 10:36:39', null, '127.0.0.1', 'Safari', '管理員', '1', '53', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('453', 'vcard', '3', '1', null, '提交', '0', '2016-12-20 10:37:37', null, '127.0.0.1', 'Safari', '管理員', '1', '53', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('456', 'vcard', '4', '1', null, '提交', '0', '2016-12-20 11:31:21', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '53', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('461', 'vcard', '5', '1', null, '提交', '0', '2016-12-21 14:36:17', null, '127.0.0.1', 'Chrome', '管理員', '1', '53', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('490', 'daily', '16', '1', null, '提交', '0', '2017-01-06 09:17:15', null, '127.0.0.1', 'Firefox', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('491', 'meet', '4', '1', null, '提交', '0', '2017-02-06 15:51:13', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('494', 'goodm', '6', '1', null, '提交', '0', '2017-02-09 16:07:36', null, '127.0.0.1', 'Chrome', '管理員', '1', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('532', 'meet', '5', '6', '簽到', '簽到', '0', '2017-02-28 10:36:02', '我來了', '127.0.0.1', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1028', 'official', '2', '1', '同意', '上級審批', '21', '2017-08-30 20:37:27', null, '::1', 'Chrome', '磐石', '5', '19', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('533', 'meet', '5', '6', '簽到', '簽到', '0', '2017-02-28 10:38:27', null, '192.168.1.152', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('534', 'meet', '6', '1', null, '提交', '0', '2017-02-28 11:38:44', null, '127.0.0.1', 'Chrome', '管理員', '1', '54', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('500', 'daily', '17', '1', null, '提交', '0', '2017-02-10 16:20:46', null, '127.0.0.1', 'Chrome', '張飛', '6', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('535', 'meet', '7', '1', null, '提交', '0', '2017-02-28 12:36:58', null, '127.0.0.1', 'Chrome', '管理員', '1', '54', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('536', 'meet', '8', '1', null, '提交', '0', '2017-02-28 12:53:47', null, '127.0.0.1', 'Chrome', '管理員', '1', '54', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('503', 'work', '9', '1', null, '提交', '0', '2017-02-13 10:53:58', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('504', 'work', '9', '2', '執行中', '進度報告', '0', '2017-02-13 11:06:09', '攻城中', '127.0.0.1', 'Chrome', '張飛', '6', '4', 'orange', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('506', 'customer', '1', '1', null, '共享給', '0', '2017-02-15 14:56:50', '共享給:管理員', '127.0.0.1', 'Chrome', '管理員', '1', '7', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('507', 'customer', '1', '1', null, '共享給', '0', '2017-02-15 14:57:01', '共享給:管理員', '127.0.0.1', 'Chrome', '管理員', '1', '7', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('508', 'customer', '1', '1', null, '取消共享', '0', '2017-02-15 15:04:12', '223', '127.0.0.1', 'Chrome', '管理員', '1', '7', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('537', 'kqout', '2', '1', '同意', '上級審核', '5', '2017-02-28 13:13:38', '好的', '127.0.0.1', 'Chrome', '管理員', '1', '23', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('538', 'carmrese', '7', '1', null, '提交', '0', '2017-03-01 09:41:31', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '44', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('539', 'carmrese', '7', '1', '同意', '上級審批', '37', '2017-03-01 09:42:19', null, '192.168.1.63', 'Chrome', '管理員', '1', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('540', 'carmrese', '7', '1', '同意', '行政確認', '38', '2017-03-01 10:09:43', null, '192.168.1.63', 'Chrome', '小喬', '3', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('541', 'carmrese', '7', '1', '同意', '駕駛員歸還', '50', '2017-03-01 10:21:04', 'weew', '192.168.1.63', 'Chrome', '管理員', '1', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('542', 'carmrese', '5', '1', '同意', '上級審批', '37', '2017-03-01 14:59:52', null, '192.168.1.63', 'Chrome', '磐石', '5', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('524', 'meet', '5', '1', null, '提交', '0', '2017-02-28 09:30:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('543', 'carmrese', '5', '1', '同意', '行政確認', '38', '2017-03-01 15:00:08', null, '192.168.1.63', 'Chrome', '小喬', '3', '44', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('544', 'carmrese', '5', '1', '已歸還', '駕駛員歸還', '50', '2017-03-01 15:02:50', null, '192.168.1.63', 'Chrome', '管理員', '1', '44', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('529', 'meet', '5', '0', null, '簽到', '0', '2017-02-28 10:31:28', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('530', 'meet', '5', '0', null, '簽到', '0', '2017-02-28 10:32:43', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('531', 'meet', '5', '0', '簽到', '簽到', '0', '2017-02-28 10:33:07', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('648', 'work', '1', '1', null, '提交', '0', '2017-03-29 10:57:58', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('649', 'work', '1', '1', '已完成', '執行人執行', '0', '2017-03-29 11:02:44', '轉給：小喬', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('561', 'fininfom', '8', '1', '同意', '上級審批', '0', '2017-03-08 09:51:28', null, '192.168.1.63', 'Chrome', '磐石', '5', '11', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('562', 'fininfom', '8', '1', null, '撤回', '0', '2017-03-08 09:51:44', null, '192.168.1.63', 'Chrome', '磐石', '5', '11', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('563', 'fininfom', '8', '2', '不同意', '上級審批', '7', '2017-03-08 09:52:30', 'lalal', '192.168.1.63', 'Chrome', '磐石', '5', '11', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('564', 'fininfom', '8', '2', '不同意', '上級審批', '7', '2017-03-08 09:58:24', 'haha', '192.168.1.63', 'Chrome', '磐石', '5', '11', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('566', 'reward', '2', '1', '無異議', '當事人確認', '35', '2017-03-09 14:33:18', null, '192.168.1.152', 'xinhu', '信呼客服', '8', '39', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('650', 'work', '1', '1', '已完成', '執行人執行', '0', '2017-03-29 11:37:52', '轉給：小喬', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('651', 'work', '1', '1', '已完成', '執行人執行', '0', '2017-03-29 11:38:23', '轉給：張飛', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('652', 'work', '1', '3', '執行中', '執行人執行', '52', '2017-03-29 11:45:46', '執行了', '192.168.1.63', 'Chrome', '張飛', '6', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('653', 'work', '1', '1', '已完成', '執行人執行', '0', '2017-03-29 11:50:15', 'ha ,轉給：管理員', '192.168.1.63', 'Chrome', '張飛', '6', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('656', 'work', '1', '3', '執行中', '執行人執行', '52', '2017-03-30 17:25:38', 'h', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('657', 'work', '1', '1', '已完成', '執行人執行', '52', '2017-03-30 18:11:23', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('658', 'bookborrow', '3', '1', '確認歸還', '借閱人歸返', '40', '2017-03-31 09:36:21', null, '127.0.0.1', 'Chrome', '管理員', '1', '46', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('659', 'work', '1', '2', '不同意', '提交人驗證', '53', '2017-04-06 09:10:38', '我', '127.0.0.1', 'Chrome', '管理員', '1', '4', 'red', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('660', 'work', '2', '1', null, '提交', '0', '2017-04-06 14:07:50', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('590', 'kqinfo', '11', '2', '不同意', '上級審核', '1', '2017-03-17 13:48:59', '哈哈哈', '127.0.0.1', 'Chrome', '管理員', '1', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('591', 'kqinfo', '11', '2', '不同意', '上級審核', '1', '2017-03-17 13:49:17', '哈哈哈', '127.0.0.1', 'Chrome', '管理員', '1', '5', 'red', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('592', 'kqinfo', '11', '1', '同意', '上級審核', '1', '2017-03-17 14:11:04', null, '127.0.0.1', 'Chrome', '管理員', '1', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('593', 'sealapl', '2', '1', null, '提交', '0', '2017-03-20 09:39:47', null, '127.0.0.1', 'Chrome', '管理員', '1', '49', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('594', 'sealapl', '2', '1', '同意', '上級審批', '41', '2017-03-20 09:40:11', null, '127.0.0.1', 'Chrome', '磐石', '5', '49', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('631', 'work', '10', '1', '同意分配', '任務分配', '51', '2017-03-24 16:20:22', null, '192.168.1.63', 'Chrome', '磐石', '5', '4', 'green', '0', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('632', 'work', '10', '3', '執行中', '執行人執行', '52', '2017-03-24 16:23:16', '開發中。。', '192.168.1.63', 'Chrome', '李四', '9', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('633', 'work', '10', '1', '已完成', '執行人執行', '52', '2017-03-24 16:23:22', null, '192.168.1.63', 'Chrome', '李四', '9', '4', null, '0', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('634', 'work', '10', '2', '不同意', '提交人驗證', '53', '2017-03-24 16:23:49', '哈哈,退回到[任務分配(磐石)]', '127.0.0.1', 'Chrome', '管理員', '1', '4', 'red', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('635', 'work', '10', '2', '無法完成', '執行人執行', '52', '2017-03-24 16:24:49', '分配給其他人吧,退回到[任務分配(磐石)]', '192.168.1.63', 'Chrome', '李四', '9', '4', 'red', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('636', 'work', '10', '2', '無法完成', '執行人執行', '52', '2017-03-24 16:26:17', '給其他人吧,退回到[任務分配(磐石)]', '192.168.1.63', 'Chrome', '李四', '9', '4', 'red', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('637', 'work', '10', '1', '同意分配', '任務分配', '0', '2017-03-24 16:27:01', '啊啊啊啊', '192.168.1.63', 'Chrome', '磐石', '5', '4', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('638', 'work', '10', '1', null, '撤回', '0', '2017-03-24 16:27:09', null, '192.168.1.63', 'Chrome', '磐石', '5', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('639', 'work', '10', '1', '已完成', '執行人執行', '52', '2017-03-24 16:35:53', null, '192.168.1.63', 'Chrome', '張飛', '6', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('640', 'work', '10', '1', '同意', '提交人驗證', '53', '2017-03-24 16:36:01', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('641', 'sealapl', '2', '1', '同意', '保管人確認', '42', '2017-03-24 16:42:22', null, '192.168.1.63', 'Chrome', '張飛', '6', '49', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('642', 'sealapl', '2', '1', '已蓋章', '申請人確認', '43', '2017-03-24 16:42:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '49', null, '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('661', 'work', '3', '1', null, '提交', '0', '2017-04-10 17:14:40', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('662', 'meet', '9', '1', null, '提交', '0', '2017-04-11 09:07:15', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('663', 'meet', '10', '1', null, '提交', '0', '2017-04-11 09:18:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('664', 'meet', '11', '1', null, '提交', '0', '2017-04-11 12:15:45', null, '127.0.0.1', 'Chrome', '管理員', '1', '54', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('922', 'kqinfo', '14', '1', null, '短信催辦', '0', '2017-08-02 16:06:32', 'weew', '127.0.0.1', 'Chrome', '管理員', '1', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('671', 'project', '4', '1', null, '提交', '0', '2017-04-14 16:13:30', null, '127.0.0.1', 'Chrome', '管理員', '1', '22', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('667', 'project', '3', '1', null, '提交', '0', '2017-04-13 11:59:43', null, '127.0.0.1', 'Chrome', '管理員', '1', '22', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('668', 'project', '2', '3', '執行中', '進度報告', '0', '2017-04-13 13:45:50', 'ww', '127.0.0.1', 'Chrome', '信呼客服', '8', '22', 'orange', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('669', 'project', '2', '3', '執行中', '進度報告', '0', '2017-04-13 13:46:44', '執行中', '127.0.0.1', 'Chrome', '信呼客服', '8', '22', 'orange', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('670', 'project', '2', '5', '終止', '進度報告', '0', '2017-04-13 14:35:28', '23', '127.0.0.1', 'Chrome', '信呼客服', '8', '22', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('673', 'schedule', '4', '1', null, '提交', '0', '2017-04-17 08:43:03', null, '127.0.0.1', 'Chrome', '小喬', '3', '12', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('676', 'kqout', '3', '1', null, '提交', '0', '2017-04-19 12:57:28', null, '127.0.0.1', 'Chrome', '管理員', '1', '23', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('677', 'kqout', '3', '1', '同意', '上級審核', '5', '2017-04-19 12:57:48', null, '::1', 'Chrome', '磐石', '5', '23', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('678', 'customer', '2', '0', '取消標星', '狀態切換', '0', '2017-04-20 13:03:23', null, '127.0.0.1', 'Chrome', '管理員', '1', '7', 'gray', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('679', 'hrsalary', '16', '1', '同意', '人事審核', '31', '2017-04-22 19:08:18', null, '::1', 'Chrome', '大喬', '4', '34', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('680', 'hrsalary', '15', '1', '同意', '人事審核', '31', '2017-04-22 19:17:58', null, '::1', 'Chrome', '大喬', '4', '34', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('681', 'hrsalary', '2', '1', '同意', '人事審核', '31', '2017-04-22 19:18:13', null, '::1', 'Chrome', '大喬', '4', '34', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('682', 'hrsalary', '5', '1', '同意', '人事審核', '31', '2017-04-22 20:36:57', null, '::1', 'Chrome', '大喬', '4', '34', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('683', 'hrsalary', '4', '1', '同意', '人事審核', '31', '2017-04-22 20:36:59', null, '::1', 'Chrome', '大喬', '4', '34', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('685', 'goods', '3', '1', null, '提交', '0', '2017-05-02 13:35:05', null, '127.0.0.1', 'Chrome', '管理員', '1', '9', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('687', 'goodm', '8', '1', null, '提交', '0', '2017-05-02 13:57:34', null, '127.0.0.1', 'Chrome', '管理員', '1', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('697', 'fininfom', '9', '1', null, '提交', '0', '2017-05-08 19:35:20', null, '127.0.0.1', 'Chrome', '大喬', '4', '11', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('698', 'daily', '18', '1', null, '提交', '0', '2017-05-09 14:20:31', null, '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('700', 'knowtiku', '4', '1', null, '提交', '0', '2017-05-09 20:08:51', null, '127.0.0.1', 'Chrome', '管理員', '1', '43', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('707', 'daily', '19', '1', null, '提交', '0', '2017-05-16 20:09:02', null, '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('708', 'knowtraim', '1', '1', null, '提交', '0', '2017-05-16 20:35:12', null, '127.0.0.1', 'Chrome', '管理員', '1', '56', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('723', 'kqinfo', '15', '1', null, '提交', '0', '2017-05-18 12:11:37', null, '127.0.0.1', 'Safari', '管理員', '1', '6', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('725', 'kqinfo', '15', '1', '同意', '上級審核', '3', '2017-05-18 12:58:56', null, '::1', 'Chrome', '磐石', '5', '6', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('730', 'knowtraim', '2', '1', null, '提交', '0', '2017-05-19 16:08:09', null, '127.0.0.1', 'Chrome', '管理員', '1', '56', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('728', 'seal', '2', '1', null, '提交', '0', '2017-05-18 21:04:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '48', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('732', 'knowtraim', '3', '1', null, '提交', '0', '2017-05-20 14:31:55', null, '127.0.0.1', 'Chrome', '管理員', '1', '56', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1030', 'official', '2', '2', '不同意', '辦公室批辦', '22', '2017-08-30 23:20:00', 'e', '::1', 'Chrome', '小喬', '3', '19', 'red', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('1029', 'official', '3', '1', null, '提交', '0', '2017-08-30 22:59:35', null, '127.0.0.1', 'Chrome', '管理員', '1', '20', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('739', 'fininfom', '8', '1', '同意', '上級審批', '7', '2017-06-09 20:33:16', null, '127.0.0.1', 'Chrome', '磐石', '5', '11', 'green', '1', '1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAB4CAYAAAApDe1iAAAOz0lEQVR4Xu1dWc5GNw11GVoohSJAQoIHJB5YAWJXsAXULcCuUDfACxIPICEQQyllHuTqs2rSDE5i5yb3nu/lH74MzrFzruM4uW8QPkAACACBIATeCGoXzQIBIAAECAQDIwACQCAMARBMGLRoGAgAARAMbAAIAIEwBEAwYdCiYSAABEAwsAEgAATCEADBhEGLhoEAEBglmH8R0WeIPt6F+u/rp0az9j/+juviAwSAwM0RsBKMJhQNyX+I6LM3xwjDAwJAYBCBEsGAUAYBRTUgAAQ+QUAIBoQCqwACQMAdASYYXuYI0WDJ4w4xGgQCz0WgFKR9LiIYORAAAm4IgGDcoERDQAAIpAiAYGATQAAIhCEAggmDFg0DASAAgoENAAEgEIaA7CIhszYMYjQMBJ6LABPMv5GN+1wDwMiBQCQCTDD/JKLPR3aCtoEAEHgmAkwwHxHR288cPkYNBIBAJALWw46RMqBtIAAEbooAdpFuqlgMCwjsgIAQzB3PIOkzVow130MjH+ya7WB9kOH2COhDjk+adLkLsW6vbAwQCKxGQAiGJxwHe78UKAB7FPwRr+lqQmN5rpYhEG40DQSuR0ATDN8J47FdzXk13K6O76TXZPLfVy/L4MVcb3+Q4OYIaILxmPAS52jtTkl8pFVOw+/tcYBgbm7cGN71CGiCmbmMW7wWbsNyRy97S1yuh2C8vR5kMF9vf5Dg5gh4EIzVa0mh7PUgmBDkTQYeagHBeKCINoBABQG9iyRxkx7AeNli9VpyBNO7LPNcJvUSXA8uKGtD4EMielM9OMQec55tS1/yoEPg3ob9klIzBNNSeGsAI3GY2T61TJ5ttcZ6+vd/SYhAdgNnvNIa/vydEAZ7mv8goncqII7Y0uk6OUJ+IZje5YeHJzEah+mJ29SUAIKpm+jfX6RSwkkIQGJjTAKRaQ4laUeX6EdM0NOFlMnKJ6o/Zwy6ek7M3rZ6y9f040GSp+s/J788bPi7mcB/NDa9GwvR8qD9DAJCMOwC84nqlnfgPSl7d4a8CAYu9aeN4aTX18BrOYTONKFYyMNrggs8vRPdq39uxyux8BBVV8UUPfAy562NB/QrIvrW5p7VxvCtF00TjATWalF4763d3jiMB8H0LAfXawQ9lhCQpRv/5OU8PgcgoAnGMvEsXk7vsK2k0evt1IKCO8cWevF7QnksiQ7VchpzqS0denearJBY4jBCfr15MzkZIkjSOlaU60Pgr0T0BSyJ+kDbqXRKMDUvwUIEI2OzeCY6ANkKRNdksHpLI+NAHV8EROf8cOFkPHwORKAnYzJqclriMDrxajRTM0r+A9W+vchYEm2vIpuAJYJJYxRRyyORsrVsEYIZOc7AfYBcbPZwdSnexeIrQxAju1oTTv3nCCYX7I1aHskwuP2/EdEXC+OSy6pGvBeQi5OxBDcjS6KaHQSLgOa9ESjFM9Jgb8vDGJFLt8n9eW8/8tOQtzNHSGlkPKgzjgCWROPYbV2zRDA68GrZvu4dZBrY9faQopd0veNF+TwCEn/z2B0ExhsiUNuREQ/DssvTO7R02WJJ8rP2ESGvtW+UsyMgevo1EX3bXg0lT0KgRjASF/HOQ8gRgBcpwNU+w/qgpzP0NC1li2DkaIDnuZ1c0FUvaUbjPd7LrGlw0cCnEJBgPevKcrUqIDwcgRbBiGcxEyjlbEy5tawF1+j2JMvJJIiErBbC13zvlSh5jfTodRiBFsGIt9GTPcsTPXd3bq0tSQnv6UcGPerxDIOGimYE9N0yHxDRu+aaKHgLBFpB3tIdqXzbmVxQlZ7I1tdw8lax5La04iwz+Sogmb3MURPL7ldA7IXczaSpEYw2EimX805kB4i/q90l0iKBVrJdDfoZcrqZSi8djqQ0sBDeeU2XDgydjyFQI5g0R6HlgdQksCyBZpLtLAQjAcZUzpn40hjq96vF2bfycEFOy/30OzyiGsEIKejGR2IkXN96oHHUOFsXYZXIsVVvGNiHVPw5EX3vNdbRAP1DoHrmMFuEIRNzdOILqpbM2plku5oHM/rdMy3CPmrJZQGx2DF7XMkWwXglRFmWV5YyJQWVSKS1dIIH02/yoicQSz92j6thIZhZ74VBtXgnFi+npKAcUbSCyiJXC4PHGUVhwDqX5adE9CMAAwRaCLQml5cHU8qy1cRgidNYPRjxXNIkv9wZKAR561aidxM/uujlai07xvebItAimJllix5yaYdIE4xlp6lFMEJSaTkhONxGbzdEjSWurbTjhpIKgZUEk14kJNvG2oOwLGu0Ajnhj29A43Fo74Tb0Ul+ULodAblVjmsgl8WOG0pmEGgRDFfpnfQ5oNM2Sp5RKygrRp8uazzOTD3dQOTtnqLznQ4jyjLNYh+iR8vuIQLVwVZvIZhZEdILqyyKL5EU/1+8FW5Xkru8YkWzYz2x/k+I6IcvwXeacDr2E0V6PYR1om4vl3kFwWhvpeUN5RRuOYnbavdyoDcVQG85/4GIvqquGNWkLb9HB8RXkEoaG1wxBzZVf7xYK8CVLWruq9WfBGOlrBBOq148UvYetDsfPSHtUv1/SU3aaRulgLgl1aBHHrkzWXQruvZIi7DKAQ/GitRguRUTt2f50lN2cMgh1XIxghXY9gymdo2G9S4dr11FTXCsc2v/PeO1lAXBWFCaKLNiEliXL17GOwFHV9XSlvgur93QHkK6w/ZHIvp612g/KTw7KXfS8+xYBiF8TrVogrF6JEJCuytcX0fAVqLlvXpL9xdE9J3Ka1q8rj2dJQjrA2fFLNzd3lZgENpHJMH0xF4k4W5HhediBdpLWRkzSI2hdD+PToyLkG9UT6P1oibBbvJEjfOydqMIRnskFgMXRe+icE6J57cpaHxk0jIZyv9XB3E525m35lO9iff0JyL6ysuaLLiPGt6IF7OT5yLj3sXeRvWwfb0IgtFbnwyAZRLu4MH89hWX0Jikywrrks9T8enWLbfNGP+SiL6rOhLZ+KcF81kZewgj4uV9s/KnS1yP9tBGgkAUwUg3vYZ+xRMl3bLNPfkly3XF5OXJyFm0+vhDaadFvyzeSuZek6DHi+kp6yWfpZ0r7M0i123KRBDMDDjRCteTVz/BassJmRxeQdIUH32eSn9Xk0l7NStIr6RTIT4+D1b7eOfQzNiYrhttb15yHtvOnQkmJZPUsHiSWiYG1/PE6TdE9I3MMoYJ5XdE9M2CNf2MiL6vZImMsVgN2rr0sRKRtV+vciAYLyQL7XhOHA9RZxSuA7O6Hf7dQiZafpk4Xt5BLo7CbevzVCX80q1x9ng4AL3Lx+Kd9MRrVo5rxt5WynlsX6cTTM5LmX2yy5LI43IlvY3cS3RptmtvPGulUdYIZNf4i14ir8TqUX2dSDA5b8ArPuK5S9SaWK3b9sQQvbyoSMOueQL8HY/17UgBBtuGBzMInLXaCQSTy0lhw+BkNw+j1Tsx3K7HPSg5oqqdBUq9rg+J6MsvJe4av7AES2fuWbba8Ew5XPo+g56h7q4EE7H0SeGI2IlJX1bHfTJ58Eew5r/ltj3LMsgS4zCoOrRIyRPg/88uWSMFhwcTia7z7sisqJFLH5GNPQP2evRk9/BYhEj0lRSaPDSR67cgcr3W8q611JrF3aN+LgbDnie/l3y3h5jF8/LABG1spHw9GSPW6+nJZ06ce8fRAtIlUY4UUo/pfSL6gUEG61awoamwIrll3MmeVxhQT2t4h6eLdqO9XVZNXBGuem5JlE42Dxl23eaV+ZIjk91lZtm97e1p/NEc79UEkz7pPRSub8VnAKJeuZHzUmSiiYck45mVwQOXpjFMFEix+OAVpL7avlpD2h3Xlvzbf3+lAeRetDaj8IigbUmBuV0i7anI09Erd2UGlxVGmC7jZl6it0Je7XldOQdWjvWSvq4EN+dC906k2aBt6da3VBlaLvld56foGE9E3kovLlcYk9bnCYFpxgjb1MGWciXB5IZmnUijQdvfE9G7hXNAlt0kHWuQ2JF4KRExnpOetIwHEzbfV3MKwVjtLXga3rf50whmJGBauvWNz/TwNqr1o5cBlvwVa7uWcidMhDRYH+HJWbDqKXMCrj3j2a7s7gTz59fL1vXdKK2AaevWt1EliPeSu+VutE1rvRMmQs67s3iFVgy8y0kyp1eczFu+W7S3I8Hk8j5ay4/SrW98heTXHDSlPRZJ49dPbIcuqk2cECvQyyLGRh93GMHnx0T03khFQ51ckN5QDUV6EdiFYHKvAKnd0p+7mkHyT97sBcFQvhSQXrUMOMGD0eeOvHJgSnrWHq1WXwmnNEjfe32HwURQJIfAlQSTeh1iBCWZVpxP6rGSlQf5TiAYjmkxufPP3MXkPdii7E0QuIpgxJ3micNJafrksJZpxfmkUVVKQt8KDE8gGMaR9Spe3QpcRnWHeosQuMIIcpOFJysHBHXATeebeF3N4A2r11KgJdcpBKMD4VfYVgtHfL8YgdVGIIFRfeo4HTJPWvZcImIp3vCumvir+pnFR4Knq2JTs/KifjACKwkmTaXPEckpE0nUsmJ3h3HizwnbqUIwrV2/YLNG87sgsJJgLGNeMWEtcljLRBKijj/tpqcSPkIwu11MbtUnyjkjsJvhRk5YZ+g+bi6V14MgZTeG25fU+wjZI9o8yduKGD/aTBAAwcyZREooswSJJcacPlB7MwR2JJiT1u8eBCNLISGXE2Itm5kxxNkVgR0JhrHaTS6r/qweTJrfcxKpWrFAOSCw3UQ+/YxILQahPRUmUJAKJuDtEdjNUzidYMRgdKayPjcDUrn9lMIANQIgGNgDEAACYQjsRjCn3IQWphA0DATuhMBuBHOXJdKdbARjAQLDCOxGMBwIZZmwVTusUlQEAvsgsBvBMDKrTijvowVIAgRuisCOBHNTqDEsIPA8BEAwz9M5RgwEliEAglkGNToCAs9DAATzPJ1jxEBgGQIgmGVQoyMg8DwEQDDP0zlGDASWIQCCWQY1OgICz0MABPM8nWPEQGAZAiCYZVCjIyDwPARAMM/TOUYMBJYhAIJZBjU6AgLPQwAE8zydY8RAYBkCIJhlUKMjIPA8BP4HOv1KpvOddYwAAAAASUVORK5CYII=');
INSERT INTO `xinhu_flow_log` VALUES ('740', 'fininfom', '9', '1', '同意', '上級審批', '7', '2017-06-09 21:35:04', null, '127.0.0.1', 'Chrome', '磐石', '5', '11', 'green', '1', '1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAB4CAYAAAApDe1iAAALGElEQVR4Xu2dy+4lNxGHK0CAkAAJCCYI2CLB47DLW5AtCxZZZAtvwY7HASnbJBID4iLuEG4q5VTi/5nT3W7bZbvc35FGmpnTLpe/Kv+O25ful4QPBCAAAScCLznZxSwEIAABQWBIAghAwI0AAuOGFsMQgAACQw5AAAJuBBAYN7QYhgAEEBhyAAIQcCOAwLihxTAEIIDAkAMQgIAbAQTGDS2GIQABBIYcgAAE3AggMG5oMQwBCCAw5AAEIOBGAIFxQ4thCEAAgSEHIAABNwIIjBtaDEMAAggMOQABCLgRQGDc0GIYAhBAYMgBCEDAjQACI/IPEXlZ5PTDt5Tdf0Xks27RwTAEghO4isB8ICLPEjFo1e5WdoKn0a77/75xh9XKUd5o24pB/5OIvHYwIvmfiPxHRJ6LyHcK4q7lGb3kg4NXPqulrlxFYPRX8jN3oqJJrX8+EpEvNowav8jnYcLsPLMlSkQWmL+JyCt3UdBRyeccI6OjFmUWmZsjnl3TjGJGkR9Yb9SOokKiIxZN2r+IyFc6MNS69BOFmYqhff7VeBRXgltjph8mxUvoBS0TpbOkeHuPInSC+Ns3MVNRi/IxQbz3d9TcEQITJXMa+hlNYHqPImykpHMIupQd+fPPu+V4ZdlTMBGYyNlT6Hskgel9D997pFQYwqJiestkgqlc/ygiXyuylF8IgclntcyVUQSmd3L2HimNSqjfi8gbSeW64vZ5J2d6x9CpGZg9QwCBeUpLO5iuQo2apzgTu9bX2ohN7Xq0H4FpHbEA9qIITA+U1sE+LNx818PHHnXYvJPV1SpHEJge0ZusjlbJM1mzTrtzlVuis2BaikJLW2fbwfWDCFxdYHQPzasBl6B7pUtLUWhpq1f7qaeSwJUFxrav6/Jty6MElSGZqnhLUWhpaypIOLNN4KoCs/IS9Kz5jsDMGhlHv64oMMy3OCbUjmkEZgz3obVeTWDshHXPHaxDAzxR5QjMRMHo5cpVBMYmcz32d/SKVfR6EJjoESzw/woCY5O5f709iKoAE0UaEEBgGkCMZmJ1gWEyd56MRGDmiUU3T1YWGCZzu6VRVkWIfRamtS5aVWCYzJ0vT+0Iwqo5Nx/xCTxaLdi9DiumT4vbCyOrVZ/S0Q2NelJ7tZyboBvP68JKwbZbIu/J3K0nxW1FeSXGtZms7H4mIm/XGqJ8DAIrJL+tEvV4QlvJPIL6NTNnffHco2fAeIy+lMUKTweM0bsn8HLmxM/BY6MJfULbFzYK6L3/o3aqWJx5A4E9Ba6E2WwiY6K8x9hDsHs/lTAnh7jGkUBJZ3F0J9t0+laBR7+0+koTPcCY076ca9SxWpGoLZ8N5+BCE2V7Z9QjYdbv9kS71Bcm30vJBS2X27lmap51EN2d++U7x+4flvR3EfnSjvO5KxstxKFmBNSKf84IQm+ZVHQ8cqPkFrNV27EzgIBHEnk1Y2vUcj9aOXsc4KjTtfw1j/AL7ikCvOHRq3dMajeCwPxSRL5/4/crEfnB7e/38whHo5WtEOwlvYcg2K2J18O1a1OtxWhty4ff3d5eECHvajlqeR1l6626vSTwci+dmz3Q9muajkpsP4UG8OxoZStpHo1ivH7JZ94y7ykuxl7r0LcZfL1FDx5s4+ci8sPb2yptLnCrT83e11xQztroPycHE83H5yLyzRuFVsJiUO/FxHMeYlaB6SEuNlnu/Q7xFp1FRx86F6XCYTmY019s1Ksj6tdaOBLZRg6w3u17NGqx//NYOtX23U/AeoqAp+3SWPUSFxMYrzieaX96+5LbD0w8NB91JH15ATkCngv2yE6L723UoLbMr/RdPd6+avL84TZH4CkCnrbPxmHEypbXredW23OExFYm1TeNzy9E5K2zMLn+RQLenTaXuSWdDZ3T5ebfiMizXEMV16XzMJ4i4Gn7TPN7d3TzLXdrwJm26LW5QqJx5vblLN3C62cQGPv1UF9SYfHY6LWHKV0x8hQBT9s5aZC+l3pE/O1AamndCElOlCe5pjTIrdzXTq3LxOmW/VETgOkvq6cIeNo+iouNWjzfQX3kw09F5EcZG/neEZEf302y3ttmQvWI9uDvRwmMznW8nrRdE0VXjr46kIe9CN5GUuqKx76FEQIzetTySBjS91H9VkTe2BEThGRgx6ipeoTA2C2R+j3byVrbBGfCsoLAzDBqSXNUd16/snO2S2OgIvxyTWJTdg4CvQXGTjZ7PAqgBVH7pTQRjCww6U7n3nG2WOgoRW9/t+Kt4qd+bp2EbxFTbAwkMCrxBjZ5t2q7fbGLUoGxp9jViuPR2adaNqmw9Jxr0bqU16OcMuFWwdHDpx5HMGq5Ud6BAALzFOqewKS3dqXcvA/7pfs5akZf79+28qsN28n6aDfrnpjonNY3NnIWgXHozDOaLO0oM7alhU97AmP2rXPov3XyVA+z5X48d8ymfj3yxyPWNhp7V0R+kgvhNoJpfdzjRPVc2ouAR9L18t2jnhyB0XrT0UwqPHs+KWtP3o98Sv1Jv7e/p1vfte162vm7HmDvbNr2BCZyO8AeWYVnwo9sV2nduQKT2td5Be0oRyyPvi/1OWI5FRhdTXo1ovP4nE+ApH/KqkRg8mlzZTraI/cukA8EGYHpneb6WhldSSL3epMfUB9Bfgo9fVSEflOzEjMgnCGqrD2LFKKROPkxAQTmxRGMLsvanhcEpn1P8TpN3d5TLFYTQGCeItSTujrxiMBUp9amgVGPifBrEZY3CSAwL6KxvR3cIvl0HATGh+uUVhEYBKZ3YrKLtzfxgfUhMI8FxjoBczDtkxOBac90WosIzOPQ6DBeOwIC0z51vQ97tvcYi8UEEJjH6EY8FKo4iMEKckwgWMBq3EVgauhRtoQAxwRKqAUtg8AEDVxgt3NOlNs2gdJmavn0Oc+ldihXSQCBqQRI8VMEco8JHJ0Mz62U/M4l5XQdAXACi9mHBHoeE7Adw63EykZVjIxOJDcCcwIWl1YTGHFMoJXAmJ3aR6ZWQ4xkAIGJFK34vrKLN34MT7UAgTmFi4srCSAwlQCjFUdgokUstr/s4o0dv9PeIzCnkVGggoAKzHMRebPCBkUDEUBgAgUruKver2wJjmdN9xGYNeM6Y6uYf5kxKs4+ITDOgDH/CQG9PdJlavaRXCgpEJgLBXtgU38tIs94ROvACAyqGoEZBP5i1XJ7dLGAW3MRmIsGvnOzWZ7uDHyW6hCYWSKxth8sT68d383WITAXDXzHZrM83RH2bFUhMLNFZD1/mH9ZL6bZLUJgslFxYSEBlqcLwa1QDIFZIYrztoHl6Xlj08UzBKYL5stWwu3RZUP/ccMRmIsngHPzWZ52Bjy7eQRm9gjF9o/l6djxq/YegalGiIENAixPkxrcIpEDbgSYf3FDG8cwI5g4sYrmKcvT0SLm4C8C4wAVk8LyNEnAKhI54EaA2yM3tLEMM4KJFa8o3rI8HSVSzn4iMM6AL2qe5emLBv6+2QgMidCaAMvTrYkGtofABA7epK4z/zJpYEa4hcCMoL52nSxPrx3fU61DYE7h4uIDAixPkyJPCCAwJERLAtwetaS5gC0EZoEgdmzCeyLyvZ36WJ7uGIwIVSEwEaI0j49H8yv6vd4mfWsel/FkJAEEZiT9mHVvjVJYno4ZT1evERhXvMsaV5HRT5o/zL8sG+7yhiEw5eyuXvJeUI5un67O65LtR2AuGfZmjTaR0XmXN3kEazOuyxhCYJYJ5bCG2NzL/S3TMIeoeB4CCMw8sYjsydHydeS24XsFAQSmAh5FIQCBfQIIDBkCAQi4Efg/VyjGiBTW4kMAAAAASUVORK5CYII=');
INSERT INTO `xinhu_flow_log` VALUES ('741', 'fininfom', '9', '1', '同意', '人事審核', '8', '2017-06-09 21:35:52', null, '127.0.0.1', 'Chrome', '大喬', '4', '11', 'green', '1', '2', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAB4CAYAAAApDe1iAAAJ2klEQVR4Xu2dyc4dNRCFK8wzCyTYIIHEjvd/FlawgwVIERJjmFEpv0PTf9/bHqraZftrKYqUdJft75TP9dDDE+GAAAQg4ETgiVNcwkIAAhAQDIYkgAAE3AhgMG5oCQwBCGAw5AAEIOBGAINxQ0tgCEAAgyEHIAABNwIYjBtaAkMAAhgMOQABCLgRwGDc0BIYAhDAYMgBCEDAjQAG44aWwBCAAAZDDkAAAm4EMBg3tASGAAQwGHIAAhBwI4DBuKG9LPBfDyW9fFmJFASBTAIYTCaowKdhMIHFWb1qGMz4GYDBjK/htC3AYMaXFoMZX8NpW4DBjC8tBjO+htO2AIMZX1oMZnwNp20BBjO+tBjM+BpO2wIMZnxpMZjbGj4TkddE5KXxZR6zBRjMmLpta43BHGv4t8iLl9qT553yHPCdwBsWi8E8hvnPwz+R34aJVhMKAWqoxboGg/lPjz9E5BURUYNhWhQgTzGYACI0VgGDeQ4wjVp+F5HXG5lyuREBDMYIZMcwqxtMWmth1NIxCW8VjcEEFKWwSqsazA8i8i5rLYXZcvHpGMzFwB2KW9Fg/hQRfXpc/37VgSkhjQhgMEYgO4ZZzWDSlIjc7Zh0uUUjUi6puOetZDCYS9w8PKwZBjOYYAfVXcVguLdlwFzFYAYUbVflFQxGzYVdogFzFYMZULSFDCYt5qqJ6g10HIMRwGAGE8xxiqR3werOTIQ7YJOxaHN/FJH3xpdpzRZgMOPrfjZF+lpEPngYAaje6Y+2/Ej/njmxNRZd0OVF5oPnZ89kGhxd9+p/KSKfbkYcNVrquoYaVO97SayNRdulIzJ9VQNHRwI1SdmxussW/bOIvLEbfWxhpB2W9Lf++munfSoiHwentq2zxYiFrexAgmMwgcR4qIo+rKcLmre00Q6p5pF+ndMoZLRFUB056XqP5VRI2elojLwOktcI0UeI70XknYcOtl0T2Y9K1Dx+E5G37lRTz/lORD7q05TiUtOI5dYaUHHAzQVMjVroOVyLwThAFZEcA9mbif6SfyMinxRUSc1HRzKj6Hi2IF3Q9EenMjVqoed07SiJ6dT8qrC6HpLe85r4nXFMN4ppJ/hFRN6vKvnxRWmacVa+UXHNYZSDR12ZGjVL4xPAQ2yfmvpG1Y6/P0rYeBnIWav51X5OSPlbruWccef/MwmUdKLMkEOetl0XSA3Y7sxo8uqv5NvBWkfHer7grbtP5HKw5NTqIEpAUQqqpAaz+isiMdmChLn6VAzmauJ25X0rIh8u/iPB6MUun1wiYTAuWC8JSueKvfaimwFvBnm265KEPCoEg+mGvrng1Rd4Ixps2tXbirt0H1u68c1dvG+A1d+REmHtJT2Bvu1HUZ7v6pudD6VjMCFkqKrEqI8IVDV2d1GP0ctPD8+D6eMN+37DFvkNVTEYi3TvE2O0RwQsKXnunt0zku0tDL8GvG3BkrFJLAzGBOPlQUZ7RMASUOvU8AsR+Wz3cq17D5ZqeWom+uwYRyEBDKYQWJDTR3tEwArbWbt19KGfjd1OY3JyPJkWRmKlFGswxiSvDRd5B+nosQsrOmoWpV8X2D7GoSM/RiJWamTEyXH3jDCccjGBCDsot5p89NiFB57ti6p0ZPOViHzuURAx6wlgMPXsel7pucjZs123yo48YovIK0ydMJgwUmRXZLVHBHpsSWeLwYn3CWAw42XIah1u5e348bJzV2MMZjwJV5ouRF5rGi9zOtQYg+kAvbHIVTrdSkbamBJxL8dg4mpzVDN93aY+oTu7bkc3EpZsf6etaX1WSHlxdCIwe6J2wupWbM6v+lFH1H8b6bMmR18HsNz+Tgak61l6Yx6HEwEMxgmsU9h02/rZZ0xuFT/CR+RzTLQUr96hm76XpDl/L+/TLQD6oTuORgIYTCPACy8/u03+rCrbd5VE/axqr68D6JQsfexu3ycwnLPMuvP/GEwDvIsvtVrc3RpNNP2Ppka1mHUkpM8k3Tq2U8mj89R0jr4SieEUKBItwQqqvtSpHou7HlORFlGs63P2zNJ+TeesL9wznG2775laC58hrz2DOmSjJqy0dedLiNKURDtPzzUHj6mRTgPvfeN7myY1089bhkOf2pAFxhhulLO429KS1nestJSt11pOjbZ10bi5Oe7NuJXRkNfnwh+ycZNUuubXtabpZ1OKmpg513iNzpJx6Va0rqWcHb1N9qx+Q/4/BhNftisTP3X23E7ZSs9jarQfwSi/nHURj3WuVj7DX4/BxJfQavcot6XpLlo93zs/vF87oaM/PfTTsjnH1axz6jT0Od4JNDScIJXXpO9xg1wazeSOAEpxXTEyKzUYz+laKZ8pzsdg4suoHfFZx2dq0tqM3g177w7iEpJXdeRSg1HO+ugA/aJEzTvnAtIIpGOYkp0Qr2qkLV+L7/9c2YlLDUb5eU/bvDQKGReDCSnLi0rpqEHvT4miU6+dplqVag3Ga1pY245hr4uSuMMCdK54xLfXXTW9sUBbYzAjtc+CkWsMDMYVb3Pwq+6BKa1o1Hrt21FjMKO0rVSzLudjMF2wZxca+de0pvNmN9zoxJo6Rhw1GuG4PgwGcz3zkhKv2Motqc9o59bwi7buNRrz/9UXg4ktn3aQq+6qjU2irna1N85F2Lmra3GwqzCYYILsqkOit+lTu+Xc+96jtlYHuhqDCSTGriolrxuI24q+Nas16F53T/el5VA6BuMA1Shk5AVeoya6hjn6MkFugbVTq9z4y5yHwcSVmiRv06Zlu7lmcbittpNejcHEFJat0nZdWkaANdvb7TWeMAIGE1NURi/turSYRMu17TWfKAIGE09MRi82mrSYRMu1NrWfJAoGE09IkttGkxaOLdfa1H6SKBhMPCFrt1bjtaRvjVpMouXavq0OVjoGE0wQqmNGoMUkWq41a8AMgTCYGVSkDdYEMBgjohiMEUjCTEUAgzGSE4MxAkmYqQhgMEZyYjBGIAkzFQEMxkhODMYIJGGmIoDBGMmJwRiBJMxUBDAYIzkxGCOQhJmKAAZjJCcGYwSSMFMRwGCM5MRgjEASZioCGIyRnBiMEUjCTEUAgzGSE4MxAkmYqQhgMEZyYjBGIAkzFQEMxkhODMYIJGGmIoDBGMmJwRiBJMxUBDAYIzkxGCOQhJmKAAZjJCcGYwSSMFMRwGCM5MRgjEASZioCGIyRnBiMEUjCTEUAgzGSE4MxAkmYqQhgMEZyYjBGIAkzFQEMxkhODMYIJGGmIoDBGMmJwRiBJMxUBDAYIzkxGCOQhJmKAAZjJCcGYwSSMFMRwGCM5MRgjEASZioCGIyRnBiMEUjCTEUAgzGSE4MxAkmYqQhgMEZyYjBGIAkzFQEMxkhODMYIJGEgAIHHBP4FYyt/iEppCIAAAAAASUVORK5CYII=');
INSERT INTO `xinhu_flow_log` VALUES ('743', 'goodm', '7', '1', '同意', '上級審批', '19', '2017-06-12 15:33:36', '很好，同意購買。', '192.168.1.63', 'Chrome', '磐石', '5', '28', 'green', '1', '1', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARgAAAB4CAYAAAApDe1iAAANCklEQVR4Xu1dOQ8mNQz1crNcggKoKCmQkBA0QAMtf4Zfw6+hQAIhqKBAiIqKDopFsMt96sEYwjCHk7GTTOZ9EtoVm3GSZ+eN4zieG8IfESACRCAIgRtBcimWCBABIiAkGBoBESACYQiQYMKgpWAiQARIMLQBIkAEwhAgwYRBS8FEgAiQYGgDRIAIhCHQmmC+F5EHRRhsDtMwBROBhgi0JJjfJ2LBn3c3xIBdEwEiEIRAC4L5TUTumubTov8gKCmWCBCBOQK1F/gf0wB+EJGbVAcRIAJjI1CLYNRr4XZobHvi7IjAfxCoQTDqtdToi+olAkSgIwQiFz29lo4UzaEQgRYIRBDMr8mpUIT8FjixTyJABAoQ8CSAlFgYaylQBh8hAqMh4EEwJJbRrILzIQJOCBwhGBKLkxIohgiMioCVYPQkaI4Dt0KjWgbnRQQcELASDO8MOYBNEUTgaghYCQa4wIuhx3I1C+F8icABBHIIRvNacp45MDQ+SgSIwNkRyCULeDG4R3T/dBM69/klvOgVnd2KOH4isIJALkGkN6EhEuTw08GLiziNwu+eSlpCf5g3S0RUApzdXBeBXILRGi65z20hDNLCL2fBl5KEjh/9ec7huhbEmROBDQRyF1lEHKaEYLBV+0VE7luZ2x0ReWCqO5POUbdjeD537jQkIkAEMhHIXWQ/i8i9zoszl2C2xpB6KAoFyERjRw9P/5MnYpmGwuZEoASBXIK5JSKPOxMMYjj4IXBs+c23ad+KCIhD5wLC2ovnlG6xLONjGyJABCYEcgkGj+Ht/7WIPOGEYq4Ho9sjlN1M4za3ReRR45jUq9HSncbH2KxzBODd4uUCu+bpZAfKKiWYrfhH7rQsBINM4qWjcRBFCUngOYunkzsXtvdFAN6tEkaOrZJcfPVQLC1HaWlMw6JA69Znj2CW7kEdrekLmTkeTzHAfHAXgXdF5FVDDSGNm/04bYmXBEeccu5OgA3WESglGIvn4EUw6ej3To8sukbM5hHnOJKl36u3WTvZm+Oi3uUHIvJaBmh6u7/EpjO6YdMcBEqUsedxaP/WdlYi8jrBoiHmWEh5W2yjESNbsjGNgUEX1uD+1kjg1egWunzEfNIdgVKCQdxj71krcViJyOvkh260uxn9JRD6WbILkAleDshLivoxrykK2YNy90hiSbzVk7ASh7WdV+5K7asJB1XU5eM4RcSJ3VKAHQSObSjSGWr8lMA8PKEa471UHyUEA4AsbwxvD8Yj/oKxWwntUoawM1lsQZA1PbcXJf29vKMoLL1eOlHju7zcPYJZIwnLYrcuZGs7C6lZFOq11bL0dZY28EiQrKhbnDW70AAssrlb/5jL1FoDhv4tBLN232dPvB4v7/WxJ2fp30tlaoD3ajkwVgJRrHXxYruDHKTHSpQU9Ixu0S2pEkFDoFgrAqUL1eJ1WLdIlnaelyznJScUq1IsrFjXareUNzTvu2cCWcPpQxF5efpHkkstazrYT+mi8l7wmMZWuQZuaw4q+uSP68mfJf/q5FMda/ilBGM9SbKgZfGG9Db0TYtAthkGAdbvObkqSwkG0/YKuu4RjKe3dHJ1XWb46Te3jl4LuQxoPU70KMF4XHrcIxgeRfZoOTFj+i4pv3q1QHwMoo2lHiWYtWBbTsxki2D4PabGBlKxew1OM85SEfToro4QzF5GrJVktk6RrDKicaL8OAQYwI3DtrnkIwSzt7XB5CwEsSXHK87THGgO4H8IpOkCn4rI88RoPASiCcaC2BrBpORkyZWx9MU27RFIA7geMbz2M+IIVhHomWDSQZNgzm/EmtqAmTBR7vz6NM2gB4KxkIeljWnCbFQdgfRkiMRSHf62HfZAMJZYzl6cxoKiXtDktX4LWsfboCLdK5MYngwdx/OUEs5CMB4ejIXITqnEDgfNk6EOldJiSEcIxnJCZJmTRY4HOVj6sYyXbdYRYGo/reM/CBwhGAjyWLSWTF0PguGRd5zxp8SCW8/4SgB/RGC3ru4WRB7kAvmWha8Eg/Zbt67Xxss6vDHGnuayIOv6oZhuKPWsCBz1YI4uXGuFf8Rglko2WnG3kJhV1lXafZNUucuZM0+KctAavO1Rgjm6TbJ4QUpCpYZr6WNwNZunt1SMS0/fUCYztZe1y4jE2wz3+A09CEZJBluXnBuwVu9HYzQl2yNrH+NrenmGS98u0rq7qM87/2qA5aifmF/Vmhbm7UUwEK1vP4unsXdRUoeqb0Ntn5PDQkP/v8Kx1Zx7ImgFrDRXJbWJkiLfxJ0E8w8CngSjQvcMTLc8SB3fI4yS0yPt30J0I5vC1pcVgY3iM7eBHC90Cb8jBcLS06hI3Vg8scj+LyM7gmC2tkz6BoWCLadB1gQ7LKb02zwgsR4+rVHDkJCKj68mQpdL+tQC34rJvA0W9dsi8obTYFUXVttqobuSF5cTPNcSYzWCElTWqvdbPBftb41g0hu52vZq6ehLb/v5lmYNJxwp4ztIET/Ld6JhA3ghqP3V1p31xRWBz6VkRhKMB5BbMQOLB+Qxhp5kvCMirycLc2k7Myd2LF4QTen3rXLn/5GIvLjx7fIeyjXQg8nVamH73gmmcFrDPZaWOsDk0kLY70+Zs/PgLDyJVl9hAKl9LCIvzTSxF5+rpTgSTCWkSTCVgC7sJvVG0m0E4i4PzrwE/PsnIvJCYV+ej2Es8D4RG9JfL+SC8ZBgPLW9IYsEUwnozG7S+Iqe9szjFhDZ60mZbss00N5b8h0JJtMgS5uTYP7O//D+lcQ90sJMGA9OV/BLg6H69k1PzLzH7iFvfoHVcqHVo1+rDAZ5rUgdbHdlgslJDMyBOY2XWE7M0qCnEtOcVM5Wu1aPxjUTuLe7YPRgciz6QFsPgjniAaTPqlHq2w6L6gsRee7A/NYe1X495r/Wh8WIlVyWxnM2UklxSAnGeqE1QM2rIi26qTmeYfuKWmCficgzU7Ib3mKaBDbvL6r/HhRmyRadk/OZSSXFPL0K0lv8RbeZ+POKqQ5V18bIC3wOZA2vJUd5R2+J5/RVu23qISjR1srDscyVHowFJYc2VyCYqFiLA/zDitAFjD+XLle2njiDvJU0MDrB9Oa1VFJr826UYDS429tWhB5MJRMZlWDotVQyoJVu0hKnPcY6SDCV7GM0gvlSRJ6csBttbpVMwqUbEowLjOcXMtIiZB2Yfuyxd4Lp8WSrH+05jmQEgtGC4IBlhPk4qreZqN4JprfEv2aKiu747AtSvZajVdiicb6afCWYklKn0VjRe4lGOJF/VoJJ0+vPOoeKaq7eVa8eTE83uqsrpUWHZ1ycevRsuefTAlP2+W85BMWi9TH1yEmNXdvbmQhGj55rl1fsWoGdDq4nD4ZeS0MjOQvBqNfylYg81RAvdm1DoBeCIbnY9BXWqneC0Yrz9FrCTCBE8Jxg3ppO+N4M6W1ZKIO5FcFe66pngtG3Dz+q3oGhZA5BF7c+9vlEMM9myiltTnIpRc75uV4JhneInBVdWVya9Iiuv5n6f6LCOLgtqgCytYveCKb2HaI7U2FqrVmzhFuvdW+tOm7RLv16J/q/NXkwTwcPhp5LMMC54nsimEivxVJ1T6uw4ZMg6UfJ+EbMtSqRb0XkkakoOZ5+T0Req5BpzZdBvq5Cn+iBYLTYdUQg18sjSiu0hSpkIOFa+hRTap0HMxCs55pKa4JR7+DIt6TX3GL9KqQWnj6iGV7vz0cPBAPc8N/9+Y/ziREQaEkwnluipbKMnlXLSDD51p4WcacHk4/fEE+0IJi0kr6HdwFF6KdCdD7ewT5PshrCcAyTSHNhSDAGwEZsUptgdEt0W0QedQY0stA0PZgyZUHf8GRIMGX4nf6pWgSjpwoALKpP9WKQ/etdaJoEU2bqDI6X4TbMU1GLPQWoZs0WDSxiXp5vTRLMMCbPidREIJpgPAO5FlyiTi4Yg7GgzzZEYIZAFMH8OB1NRuS2bCkR2yR819l7308PhkuHCBQgEEEwuiVqVRAqIrBIgikwLj5CBCIIpnVB5YjAIrdIXCtEoACBCIIpGIbrIyAY5Nd45dhgcPRgXFVEYVdBYESCmSfdeeiSBOOBImVcDoERCQZKXLo9ranr2O7cNGo6/XpBq5iScahsRgT6Q2BkgkHC3X0igop4uGxXumViCYD+7JYjOgkCIxOMniZ5J92dRLUcJhFoj8CoBJNetNuqVtdeAxwBERgYgVEJBirTfBz8feR5DmyenNrZERh94SnJoAymNbB7dp1y/ESgGwRGJxg9UWKgthuT40CuhMAVCAbxGBxR444Sf0SACFRE4AoEUxFOdkUEiECKAAmG9kAEiEAYAiSYMGgpmAgQARIMbYAIEIEwBEgwYdBSMBEgAiQY2gARIAJhCJBgwqClYCJABEgwtAEiQATCECDBhEFLwUSACJBgaANEgAiEIUCCCYOWgokAESDB0AaIABEIQ4AEEwYtBRMBIvAn6Jhkl2ggQW8AAAAASUVORK5CYII=');
INSERT INTO `xinhu_flow_log` VALUES ('778', 'fininfom', '8', '1', '同意', '人事審核', '8', '2017-06-22 09:40:30', null, '::1', 'Chrome', '大喬', '4', '11', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('779', 'fininfom', '8', '1', '同意', '財務審核', '9', '2017-06-22 09:41:59', null, '::1', 'Chrome', '貂蟬', '2', '11', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('780', 'carms', '1', '1', null, '提交', '0', '2017-06-22 12:47:42', null, '127.0.0.1', 'Chrome', '管理員', '1', '58', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('781', 'carms', '2', '1', null, '提交', '0', '2017-06-22 13:46:07', null, '127.0.0.1', 'Chrome', '管理員', '1', '58', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('782', 'carms', '3', '1', null, '提交', '0', '2017-06-22 13:46:32', null, '127.0.0.1', 'Chrome', '管理員', '1', '58', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('785', 'goodm', '8', '1', '發放', '行政發放', '6', '2017-06-22 16:11:33', null, '::1', 'Chrome', '大喬', '4', '24', null, '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('786', 'custfina', '4', '0', '已付款', '標已付款', '0', '2017-06-26 15:54:48', null, '127.0.0.1', 'Chrome', '管理員', '1', '36', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('787', 'custfina', '4', '0', '已付款', '標已付款', '0', '2017-06-26 15:54:55', null, '127.0.0.1', 'Chrome', '管理員', '1', '36', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('788', 'custract', '5', '1', null, '提交', '0', '2017-06-26 17:50:09', null, '127.0.0.1', 'Chrome', '管理員', '1', '35', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('789', 'carmang', '1', '1', null, '提交', '0', '2017-06-26 21:28:14', null, '127.0.0.1', 'Chrome', '管理員', '1', '59', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('790', 'carmang', '2', '1', null, '提交', '0', '2017-06-27 13:20:42', null, '127.0.0.1', 'Chrome', '管理員', '1', '60', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('792', 'carmang', '2', '1', '同意', '行政確認', '56', '2017-06-27 13:24:28', null, '::1', 'Chrome', '大喬', '4', '60', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('793', 'carmang', '2', '1', '同意', '駕駛員處理', '57', '2017-06-27 13:25:25', null, '::1', 'Chrome', '張飛', '6', '60', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('794', 'carmang', '2', '1', '同意', '駕駛員取車', '58', '2017-06-27 13:26:57', null, '::1', 'Chrome', '張飛', '6', '60', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('801', 'kqinfo', '16', '1', '同意', '核算加班費', '59', '2017-06-29 10:16:07', null, '::1', 'Chrome', '大喬', '4', '6', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('800', 'kqinfo', '16', '1', '同意', '上級審核', '3', '2017-06-29 10:15:34', null, '::1', 'Chrome', '磐石', '5', '6', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('799', 'kqinfo', '16', '1', null, '提交', '0', '2017-06-29 10:14:05', null, '127.0.0.1', 'Chrome', '管理員', '1', '6', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('802', 'kqinfo', '17', '1', null, '提交', '0', '2017-06-29 10:18:35', null, '127.0.0.1', 'Chrome', '磐石', '5', '6', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('804', 'flow_remind', '1', '1', null, '提交', '0', '2017-07-01 13:48:58', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('805', 'flow_remind', '1', '1', null, '提交', '0', '2017-07-01 13:55:32', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('806', 'flow_remind', '1', '1', null, '提交', '0', '2017-07-01 13:56:36', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('809', 'kqinfo', '16', '1', null, '評論', '0', '2017-07-01 15:05:52', '不錯', '127.0.0.1', 'Chrome', '管理員', '1', '6', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('828', 'work', '3', '1', '已完成', '執行人執行', '52', '2017-07-04 13:57:53', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('829', 'work', '3', '1', '同意', '提交人驗證', '53', '2017-07-04 13:58:15', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('830', 'work', '3', '1', '評分', '任務評分', '0', '2017-07-04 13:59:11', '不錯，繼續努力', '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('831', 'work', '2', '3', '執行中', '執行人執行', '52', '2017-07-04 14:10:02', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('832', 'goodm', '9', '1', null, '提交', '0', '2017-07-05 20:24:46', null, '127.0.0.1', 'Chrome', '管理員', '1', '28', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('854', 'repair', '1', '1', null, '提交', '0', '2017-07-07 13:12:53', null, '127.0.0.1', 'Chrome', '管理員', '1', '62', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('855', 'repair', '1', '1', '確認', '行政人員檢查', '60', '2017-07-07 13:16:36', null, '::1', 'Chrome', '大喬', '4', '62', null, '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('856', 'repair', '2', '1', null, '提交', '0', '2017-07-07 13:37:28', null, '::1', 'Chrome', '小喬', '3', '62', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('857', 'repair', '2', '1', '確認', '行政人員檢查', '60', '2017-07-07 13:38:35', null, '::1', 'Chrome', '大喬', '4', '62', null, '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('858', 'repair', '2', '1', '同意', '外修確認', '61', '2017-07-07 13:39:18', null, '::1', 'Chrome', '大喬', '4', '62', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('859', 'work', '2', '1', '已完成', '執行人執行', '52', '2017-07-07 17:13:40', null, '127.0.0.1', 'Safari', '管理員', '1', '4', null, '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('863', 'company', '1', '1', null, '提交', '0', '2017-07-08 14:42:42', null, '127.0.0.1', 'Chrome', '管理員', '1', '63', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('864', 'company', '2', '1', null, '提交', '0', '2017-07-08 14:43:58', null, '127.0.0.1', 'Chrome', '管理員', '1', '63', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('865', 'company', '3', '1', null, '提交', '0', '2017-07-08 14:44:23', null, '127.0.0.1', 'Chrome', '管理員', '1', '63', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('866', 'company', '4', '1', null, '提交', '0', '2017-07-08 14:46:21', null, '127.0.0.1', 'Chrome', '管理員', '1', '63', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('898', 'admin', '2', '0', null, '設置為管理員', '0', '2017-07-08 22:20:34', null, '127.0.0.1', 'Chrome', '管理員', '1', '10', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('900', 'admin', '2', '0', null, '取消管理員', '0', '2017-07-08 22:28:50', null, '127.0.0.1', 'Chrome', '管理員', '1', '10', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('902', 'meet', '12', '1', null, '提交', '0', '2017-07-18 10:58:50', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('903', 'work', '2', '1', '同意', '提交人驗證', '53', '2017-07-20 17:13:04', '好的', '127.0.0.1', 'Chrome', '管理員', '1', '4', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('904', 'carmang', '1', '1', '同意', '行政確認', '55', '2017-07-20 17:15:49', null, '::1', 'Safari', '大喬', '4', '59', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('906', 'daily', '20', '1', null, '提交', '0', '2017-07-24 09:04:03', null, '127.0.0.1', 'Chrome', '管理員', '1', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('923', 'kqinfo', '14', '1', null, '短信催辦', '0', '2017-08-02 16:31:16', 'hahaha', '127.0.0.1', 'Chrome', '管理員', '1', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('924', 'kqinfo', '14', '1', null, '追加說明', '0', '2017-08-02 16:51:30', '不錯啊', '127.0.0.1', 'Chrome', '管理員', '1', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('925', 'kqinfo', '14', '1', null, '追加說明', '0', '2017-08-02 16:52:26', '哈哈哈', '::1', 'Chrome', '大喬', '4', '5', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('927', 'meet', '13', '1', null, '提交', '0', '2017-08-03 13:17:05', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('928', 'meet', '13', '6', '簽到', '簽到', '0', '2017-08-03 14:14:31', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('929', 'meet', '13', '6', '簽到', '簽到', '0', '2017-08-03 14:15:20', '簽到', '127.0.0.1', 'Chrome', '管理員', '1', '2', 'blue', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('931', 'kqinfo', '14', '1', '同意', null, null, '2017-08-04 09:42:57', '錯誤', '127.0.0.1', 'Chrome', '管理員', '1', '5', 'green', '1', null, null);
INSERT INTO `xinhu_flow_log` VALUES ('932', 'kqinfo', '14', '1', '同意', '異常處理', '0', '2017-08-04 09:59:14', '很好啊', '127.0.0.1', 'Chrome', '管理員', '1', '5', 'green', '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('940', 'hrsalary', '2', '1', null, '發放', '0', '2017-08-07 09:57:52', null, '127.0.0.1', 'Chrome', '管理員', '1', '34', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('948', 'fininfom', '10', '1', null, '提交', '0', '2017-08-07 20:42:59', null, '127.0.0.1', 'Chrome', '管理員', '1', '64', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('949', 'fininfom', '11', '1', null, '提交', '0', '2017-08-07 21:11:16', null, '127.0.0.1', 'Chrome', '管理員', '1', '65', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('950', 'fininfom', '11', '1', '同意', '上級審批', '64', '2017-08-07 21:14:41', null, '::1', 'Chrome', '磐石', '5', '65', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('951', 'fininfom', '11', '1', '同意', '財務審批', '65', '2017-08-07 21:14:58', null, '::1', 'Chrome', '貂蟬', '2', '65', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('952', 'fininfom', '11', '1', '已開票', '會計開票', '66', '2017-08-07 21:15:10', null, '::1', 'Chrome', '小喬', '3', '65', null, '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('953', 'goodm', '10', '1', null, '提交', '0', '2017-08-10 10:29:36', null, '::1', 'Chrome', '大喬', '4', '24', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('957', 'work', '5', '1', null, '提交', '0', '2017-08-12 17:31:36', null, '127.0.0.1', 'Chrome', '管理員', '1', '4', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('960', 'meet', '14', '1', null, '提交', '0', '2017-08-13 19:01:21', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('968', 'work', '5', '1', '同意分配', '任務分配', '51', '2017-08-15 17:42:03', null, '::1', 'Chrome', '磐石', '5', '4', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('969', 'work', '5', '2', '無法完成', '執行人執行', '52', '2017-08-15 17:42:53', '哈哈', '::1', 'Chrome', '趙子龍', '7', '4', 'red', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('974', 'meet', '15', '1', null, '提交', '0', '2017-08-18 11:42:54', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('981', 'flow_remind', '4', '1', null, '提交', '0', '2017-08-23 14:25:55', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1002', 'infor', '9', '1', null, '提交', '0', '2017-08-26 12:41:10', null, '127.0.0.1', 'Chrome', '管理員', '1', '1', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('999', 'carmrese', '3', '1', '同意', '上級審批', '37', '2017-08-25 20:02:07', null, '::1', 'Chrome', '磐石', '5', '44', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('1008', 'infor', '9', '1', null, '投票', '0', '2017-08-26 22:22:17', null, '::1', 'Chrome', '張飛', '6', '1', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1009', 'infor', '9', '1', null, '投票', '0', '2017-08-26 22:41:04', null, '192.168.1.101', 'wxbro', '趙子龍', '7', '1', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1131', 'infor', '9', '1', null, '投票', '0', '2017-10-23 17:14:28', '投票項ID(3)', '127.0.0.1', 'Chrome', '管理員', '1', '1', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1013', 'kqout', '4', '1', null, '提交', '0', '2017-08-28 11:54:41', null, '127.0.0.1', 'Chrome', '管理員', '1', '23', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1014', 'kqerr', '2', '1', null, '提交', '0', '2017-08-28 12:19:12', null, '::1', 'Chrome', '貂蟬', '2', '51', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1036', 'flow_remind', '5', '1', null, '提交', '0', '2017-09-02 13:53:03', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1037', 'flow_remind', '6', '1', null, '提交', '0', '2017-09-02 21:06:29', null, '::1', 'Chrome', '信呼客服', '8', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1038', 'flow_remind', '7', '1', null, '提交', '0', '2017-09-02 21:08:52', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1050', 'official', '2', '1', '同意', '辦公室批辦', '22', '2017-09-06 22:37:28', null, '::1', 'Chrome', '小喬', '3', '19', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('1049', 'hrsalary', '23', '1', null, '提交', '0', '2017-09-06 20:57:46', null, '127.0.0.1', 'Chrome', '管理員', '1', '34', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1048', 'hrsalary', '22', '1', null, '提交', '0', '2017-09-06 20:57:46', null, '127.0.0.1', 'Chrome', '管理員', '1', '34', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1046', 'infor', '9', '1', null, '投票', '0', '2017-09-04 20:32:25', null, '::1', 'Chrome', '大喬', '4', '1', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1045', 'flow_remind', '8', '1', null, '提交', '0', '2017-09-03 20:12:00', null, '127.0.0.1', 'Chrome', '管理員', '1', '61', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1051', 'official', '2', '1', '同意', '領導審批', '23', '2017-09-06 22:38:16', null, '::1', 'Chrome', '貂蟬', '2', '19', 'green', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('1073', 'daily', '21', '1', null, '提交', '0', '2017-09-24 10:54:01', null, '::1', 'Chrome', '趙子龍', '7', '3', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1076', 'meet', '1', '1', null, '提交', '0', '2017-09-24 14:48:44', null, '127.0.0.1', 'Chrome', '管理員', '1', '2', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1112', 'hrcheck', '1', '1', null, '提交', '0', '2017-10-13 22:52:22', null, '127.0.0.1', 'Chrome', '管理員', '1', '71', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1114', 'hrcheck', '1', '1', '同意', '上級評分', '69', '2017-10-13 23:25:21', null, '::1', 'Chrome', '磐石', '5', '71', 'green', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('1115', 'hrcheck', '1', '1', '同意', '人事評分', '70', '2017-10-13 23:36:21', null, '::1', 'Chrome', '大喬', '4', '71', 'green', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('1116', 'hrcheck', '2', '1', null, '提交', '0', '2017-10-14 11:07:37', null, '::1', 'Chrome', '張飛', '6', '71', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1125', 'demo', '1', '1', null, '提交', '0', '2017-10-20 10:15:00', null, '127.0.0.1', 'Chrome', '管理員', '1', '72', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1127', 'official', '4', '1', null, '提交', '0', '2017-10-23 14:16:30', null, '127.0.0.1', 'Chrome', '管理員', '1', '19', null, '1', '0', null);
INSERT INTO `xinhu_flow_log` VALUES ('1132', 'official', '4', '1', '同意', '上級審批', '0', '2017-10-24 18:04:24', '轉給：小喬', '::1', 'Chrome', '磐石', '5', '19', 'green', '1', '1', null);

-- ----------------------------
-- Table structure for `xinhu_flow_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_menu`;
CREATE TABLE `xinhu_flow_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '顯示名稱',
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `sort` tinyint(4) DEFAULT '0',
  `statusname` varchar(20) DEFAULT NULL,
  `statuscolor` varchar(20) DEFAULT NULL,
  `statusvalue` tinyint(1) DEFAULT '1' COMMENT '狀態值',
  `actname` varchar(20) DEFAULT NULL COMMENT '動作名稱',
  `setid` smallint(6) DEFAULT '0' COMMENT '對應模塊',
  `wherestr` varchar(300) DEFAULT NULL COMMENT '顯示條件',
  `explain` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `islog` tinyint(1) DEFAULT '1',
  `issm` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '0' COMMENT '類型',
  `changeaction` varchar(20) DEFAULT NULL COMMENT '觸發的方法',
  `fields` varchar(50) DEFAULT NULL,
  `upgcont` varchar(500) DEFAULT NULL COMMENT '更新內容',
  `iszs` tinyint(1) DEFAULT '0' COMMENT '是否在詳情頁面顯示',
  PRIMARY KEY (`id`),
  KEY `setid` (`setid`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='單據操作菜單';

-- ----------------------------
-- Records of xinhu_flow_menu
-- ----------------------------
INSERT INTO `xinhu_flow_menu` VALUES ('1', '標為已讀', 'yd', '0', '已讀', 'green', '1', '標識', '1', null, null, '1', '0', '0', '0', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('2', '全部標識已讀', 'allyd', '0', null, null, '1', null, '1', null, null, '1', '0', '0', '0', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('3', '標為已讀', 'yd', '0', '已讀', 'green', '1', '標識', '3', null, null, '1', '0', '0', '0', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('4', '全部標識已讀', 'allyd', '0', null, null, '1', null, '3', null, null, '1', '0', '0', '0', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('5', '點評', null, '0', null, null, '0', null, '3', null, null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('6', '取消會議', null, '0', '取消', 'gray', '3', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ!e25vd30gIGFuZCBzdGF0ZT0w', '我發起，未開始會議可取消', '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('7', '結束會議', null, '0', '結束', 'orange', '2', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ8e25vd30gYW5kIGVuZGR0Pntub3d9ICBhbmQgc3RhdGU9MQ::', '我發起，開會中可提前結束', '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('12', '＋添加跟進記錄', null, '0', '跟進', null, '1', '跟進記錄', '7', 'KHVpZD17dWlkfSBvciB7c2hhdGVpZCx1aWRpbn0p', null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('13', '啟用', 'ztqh', '0', '啟用', 'green', '1', '狀態切換', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MA::', null, '1', '1', '0', '1', null, null, 'c3RhdHVzPTE:', '0');
INSERT INTO `xinhu_flow_menu` VALUES ('14', '停用', 'ztqh', '0', '停用', 'gray', '0', '狀態切換', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '1', '1', null, null, 'c3RhdHVzPTA:', '0');
INSERT INTO `xinhu_flow_menu` VALUES ('15', '共享給...', 'shate', '5', null, null, '1', null, '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '0', '3', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('16', '＋添加跟進', null, '0', null, null, '1', '跟進', '8', 'dWlkPXt1aWR9', null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('17', '標為跟進中', 'ztqh', '0', '跟進中', 'blue', '0', '狀態切換', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MCBhbmQgaHRpZD0w', null, '1', '1', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('18', '標為已成交', 'ztqh', '0', '已成交', 'green', '1', '狀態切換', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('19', '標為已丟失', 'ztqh', '0', '已丟失', 'gray', '2', '狀態切換', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MiBhbmQgaHRpZD0w', null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('20', '轉移給...', 'zhuan', '0', null, null, '1', null, '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZT0w', null, '1', '1', '1', '2', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('21', '標為執行中', 'state2', '1', '執行中', 'orange', '3', '進度報告', '22', 'YHN0YXR1c2Agbm90IGluKDEsNSk:', null, '1', '1', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('22', '更新進度', 'upprogress', '0', null, null, '0', null, '22', 'cHJvZ3Jlc3M8PjEwMCBhbmQgYHN0YXR1c2A8PjU:', null, '1', '1', '0', '4', null, 'progress', null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('23', '標為已完成', 'state1', '1', '已完成', 'green', '1', '進度報告', '22', 'c3RhdHVzIG5vdCBpbigxLDUp', null, '1', '1', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('24', '終止項目', 'state3', '1', '終止', 'gray', '5', '進度報告', '22', 'YHN0YXR1c2Agbm90IGluKDEsNSk:', null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('25', '提前終止', null, '0', '終止', 'gray', '2', '提前終止', '31', 'c3RhdGU9MQ::', null, '1', '1', '1', '4', null, 'tqenddt', null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('26', '創建收款單', 'cjdaishou', '0', null, 'chocolate', '1', null, '35', 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0w', null, '1', '0', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('27', '標已收款', 'pay', '0', '已收款', 'green', '0', null, '36', 'dWlkPXt1aWR9IGFuZCB0eXBlPTAgYW5kIGlzcGF5PTA:', null, '1', '1', '1', '4', null, 'paydt', null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('28', '標已付款', 'pay', '0', '已付款', 'green', '0', null, '36', 'dWlkPXt1aWR9IGFuZCB0eXBlPTEgYW5kIGlzcGF5PTA:', null, '1', '1', '1', '4', null, 'paydt', null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('29', '創建付款單', 'cjdaishou', '0', null, 'chocolate', '1', null, '35', 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0x', null, '1', '0', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('30', '領用登記', null, '0', '領用', null, '1', null, '41', null, null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('31', '維修登記', null, '0', '維修', 'gray', '1', null, '41', null, null, '1', '1', '1', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('32', '標☆', null, '0', '標星', 'chocolate', '1', '狀態切換', '7', 'dWlkPXt1aWR9IGFuZCBpc3N0YXQ9MA::', null, '1', '1', '0', '1', null, null, 'aXNzdGF0PTE:', '0');
INSERT INTO `xinhu_flow_menu` VALUES ('33', '取消標☆', null, '0', '取消標星', 'gray', '0', '狀態切換', '7', 'dWlkPXt1aWR9IGFuZCBpc3N0YXQ9MQ::', null, '1', '1', '0', '1', null, null, 'aXNzdGF0PTA:', '0');
INSERT INTO `xinhu_flow_menu` VALUES ('34', '取消共享', 'unshate', '6', null, 'gray', '1', null, '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MSBhbmQgc2hhdGUgaXMgbm90IG51bGw:', null, '1', '1', '0', '1', null, null, null, '0');
INSERT INTO `xinhu_flow_menu` VALUES ('35', '會議簽到', null, '0', '簽到', 'blue', '6', '簽到', '2', 'c3RhdGU9MQ::', null, '1', '1', '0', '1', null, null, null, '1');
INSERT INTO `xinhu_flow_menu` VALUES ('36', '設置為管理員', null, '0', null, null, '0', null, '10', 'YGlkYD4xICBhbmQge3VpZH09MSBhbmQgYHR5cGVgPTA:', null, '1', '1', '1', '0', null, null, 'YHR5cGVgPTE:', '0');
INSERT INTO `xinhu_flow_menu` VALUES ('37', '取消管理員', null, '0', null, null, '0', null, '10', 'YGlkYD4xICBhbmQge3VpZH09MSBhbmQgYHR5cGVgPTE:', null, '1', '1', '1', '0', null, null, 'YHR5cGVgPTA:', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_remind`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_remind`;
CREATE TABLE `xinhu_flow_remind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `enddt` datetime DEFAULT NULL COMMENT '截止時間',
  `uid` smallint(6) DEFAULT NULL COMMENT '用戶Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `modenum` varchar(30) DEFAULT NULL COMMENT '對應模塊編號',
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '頻率',
  `explain` varchar(500) DEFAULT NULL COMMENT '提醒內容',
  `rate` varchar(50) DEFAULT NULL COMMENT '提醒頻率o僅一次,d天,w週,m月',
  `rateval` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `receid` varchar(100) DEFAULT NULL,
  `recename` varchar(100) DEFAULT NULL COMMENT '提醒給',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table` (`uid`,`table`,`mid`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`modenum`,`mid`),
  KEY `table_2` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='單據提醒設置表';

-- ----------------------------
-- Records of xinhu_flow_remind
-- ----------------------------
INSERT INTO `xinhu_flow_remind` VALUES ('1', '2017-07-01 13:56:29', null, '1', '2017-07-01 20:11:15', '管理員', 'jiaban', 'kqinfo', '16', '每天 20:17:00,每週四 15:46:58', '加班單：2017-06-28 18:00:00→2017-06-28 18:00:00共加班6.0小時,加班加班', 'd,w4', '20:17:00,15:46:58', '0', null, null);
INSERT INTO `xinhu_flow_remind` VALUES ('4', '2017-08-23 14:25:17', null, '1', '2017-08-23 20:48:29', '管理員', 'flowtodo', 'flow_todo', '1', '每小時 52:24 每天從14:25:17至23:27:06提醒', '車輛[{carid}]的{otype}將在{enddt}到期。', 'h', '52:24|23:27:06', '0', null, null);
INSERT INTO `xinhu_flow_remind` VALUES ('8', '2017-09-03 20:11:29', null, '1', '2017-09-30 09:42:28', '管理員', 'subscribe', 'subscribe', '1', '每月 02 02:05:00', '訂閱管理：每月份人員考勤統計簡表', 'm', '02 02:05:00', '1', 'd4', '行政人事部');

-- ----------------------------
-- Table structure for `xinhu_flow_set`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_set`;
CREATE TABLE `xinhu_flow_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '模塊名稱',
  `num` varchar(30) NOT NULL DEFAULT '' COMMENT '模塊編號',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `table` varchar(50) DEFAULT NULL COMMENT '對應的表',
  `where` varchar(500) DEFAULT NULL COMMENT '相關條件',
  `summary` varchar(500) DEFAULT NULL COMMENT '摘要',
  `summarx` varchar(500) DEFAULT NULL COMMENT '應用摘要',
  `type` varchar(20) DEFAULT NULL COMMENT '分類',
  `pctx` tinyint(1) DEFAULT '0' COMMENT 'pc端提醒',
  `mctx` tinyint(1) DEFAULT '0' COMMENT 'app提醒',
  `wxtx` tinyint(1) DEFAULT '0' COMMENT '微信提醒',
  `emtx` tinyint(1) DEFAULT '0' COMMENT '是否郵件提醒',
  `sericnum` varchar(50) DEFAULT NULL COMMENT '編號規則',
  `isflow` tinyint(1) DEFAULT '1' COMMENT '是否有流程',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '針對對象',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `status` tinyint(1) DEFAULT '1',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否可錄入',
  `tables` varchar(100) DEFAULT NULL COMMENT '多行子表',
  `names` varchar(100) DEFAULT NULL COMMENT '多行子表名稱',
  `statusstr` varchar(100) DEFAULT NULL COMMENT '狀態值設置',
  `isgbjl` tinyint(1) DEFAULT '0' COMMENT '是否關閉操作記錄',
  `isgbcy` tinyint(1) DEFAULT '0' COMMENT '是否不顯示查閱記錄',
  `isscl` tinyint(1) DEFAULT '0' COMMENT '是否生成列表頁',
  `isup` tinyint(1) DEFAULT '1' COMMENT '更新時是否同步',
  `ddtx` tinyint(1) DEFAULT '0' COMMENT '是否釘釘提醒',
  `isbxs` tinyint(1) DEFAULT '0' COMMENT '錄入頁面是否不顯示流程圖',
  `lbztxs` tinyint(1) DEFAULT '0' COMMENT '列表頁狀態搜索顯示0默認,1必須顯示,2顯示',
  PRIMARY KEY (`id`,`num`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='流程模塊';

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '1', 'infor', null, '[{typename}]{title}', 'title:[{typename}]{title}\noptdt:{optdt}', '行政', '1', '0', '0', '0', 'XA-Ymd-', '0', 'all', '全體人員', '2017-09-26 09:58:30', '1', '1', 'infors', '投票選項', null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('2', '會議', 'meet', '2', 'meet', '`type`=0', '[{hyname}]{title},{startdt}→{enddt}', 'title:{title}\ncont:會議室：{hyname}[br]發起人：{optname}[br]參會人：{joinname}\noptdt:{startdt}→{enddt}', '行政', '1', '0', '0', '0', 'XB-Ymd-', '0', 'all', '全體人員', '2017-10-23 14:03:26', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日報', 'daily', '21', 'daily', null, '[{optname}]{content}', 'title:[{optname}]{dt}的{type}\noptdt:{optdt}\ncont:{content}', '基礎', '1', '0', '0', '0', 'XC-Ymd-', '0', 'all', '全體人員', '2016-09-24 21:58:37', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('4', '任務', 'work', '23', 'work', null, '[{type}]{title},分配給:{dist}', 'title:{title}\noptdt:{optdt}\ncont:類型：{type}[br]等級：{grade}[br]分配給：{dist}[br]創建者：{optname}[br]截止時間：{enddt}', '基礎', '1', '0', '0', '0', 'XW-Ymd-', '1', 'all', '全體人員', '2017-03-24 13:12:46', '1', '1', null, null, '待?分配,已完成,未通過,待?執行,?執行中,已作廢,待?驗證', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('5', '請假條', 'leave', '30', 'kqinfo', 'kind=[F]請假[F]', '[{qjkind}]{stime}→{etime}共{totals}小時,{explain}', 'title:[{qjkind}]共{totals}小時\ncont:時間：{stime}→{etime}[br]說明：{explain}\noptdt:{optdt}', '考勤', '1', '0', '0', '0', 'KA-Ymd-', '1', 'all', '全體人員', '2017-06-29 10:26:42', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('6', '加班單', 'jiaban', '31', 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小時,{explain}', 'title:加班共{totals}小時\ncont:時間：{stime}→{etime}[br]說明：{explain}\noptdt:{optdt}', '考勤', '1', '0', '0', '0', 'KB-Ymd-', '1', 'all', '全體人員', '2017-06-29 10:26:09', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('7', '客戶管理', 'customer', '50', 'customer', null, '{name}', 'title:{name}\noptdt:{optdt}\ncont:來源：{laiyuan}[br]操作人：{optname}[br]共享給：{shate}', '客戶', '1', '0', '0', '0', 'CA-Ymd-', '0', 'all', '全體人員', '2016-09-25 08:42:17', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('8', '銷售機會', 'custsale', '51', 'custsale', null, null, 'title:{custname}\noptdt:{optdt}\ncont:來源：{laiyuan}[br]銷售人：{optname}[br]申請日期：{applydt}[br]預計金額：{money}', '客戶', '1', '0', '0', '0', 'CB-Ymd-', '0', 'all', '全體人員', '2017-04-24 20:31:39', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('9', '物品', 'goods', '4', 'goods', null, null, null, '行政', '0', '0', '0', '0', 'CC-Ymd-', '0', 'all', '全體人員', '2016-09-01 20:51:47', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('11', '費用報銷', 'finfybx', '90', 'fininfom', 'type=0', '報銷：{money},收款人：{fullname}', null, '財務', '1', '0', '0', '0', 'FA-Ymd-', '1', 'all', '全體人員', '2017-05-06 18:36:22', '1', '1', 'fininfos', '報銷明細', null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('10', '用戶', 'user', '201', 'admin', null, null, 'title:{name}\ncont:部門：{deptallname}[br]職位：{ranking}[br]電話：{tel}[br]手機：{mobile}[br]郵箱：{email}', '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2017-07-08 19:38:55', '1', '0', null, null, null, '0', '0', '1', '1', '0', '0', '2');
INSERT INTO `xinhu_flow_set` VALUES ('12', '日程', 'schedule', '24', 'schedule', null, '{title}', 'title:{title}\noptdt:{optdt}\ncont:時間：{startdt}[br]截止：{enddt}[br]說明：{explain}[br]重復：{rate}{rateval}[br]提醒：{txsj}', '基礎', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2016-09-25 11:51:09', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('13', '部門', 'dept', '202', 'dept', null, '{name}', null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 16:44:30', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('14', '系統組', 'group', '203', 'group', null, null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 17:47:58', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('15', '計劃任務', 'task', '204', 'task', null, null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 17:23:01', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('16', '會話管理', 'huihua', '205', 'im_group', 'type<>2', null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 17:26:59', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('17', '應用管理', 'yingyong', '206', 'im_group', 'type=2', null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 17:26:25', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('18', '應用菜單', 'yymenu', '207', 'im_menu', null, null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2016-08-13 17:27:41', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('19', '發文單', 'officia', '40', 'official', 'type=0', '{num}[{class}]{title}', null, '公文', '1', '0', '0', '0', 'GA-Ymd-', '1', 'all', '全體人員', '2017-08-30 22:52:31', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('20', '收文單', 'officib', '41', 'official', 'type=1', null, null, '公文', '1', '0', '0', '0', 'GB-Ymd-', '1', 'all', '全體人員', '2017-08-30 22:52:35', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('21', '打卡記錄', 'kqdkjl', '32', 'kqdkjl', null, null, 'title:{dkdt}(星期{week})\ncont:姓名：{name}[br]打卡類型：{type}[br]打卡IP：{ip}[br]說明：{explain}', '考勤', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-03-30 10:49:05', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('22', '項目', 'project', '22', 'project', null, null, null, '基礎', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2017-04-13 13:40:07', '1', '1', null, null, '待執行|blue,已完成|green,結束|#888888,執行中|#ff6600', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('23', '外出出差', 'waichu', '33', 'kqout', null, '[{atype}]{address}{outtime}', 'title:{optname}[{atype}]{reason}\noptdt:{optdt}\ncont:外出時間：{outtime}[br]預計回崗：{intime}[br]地點：{address}[br]', '考勤', '1', '0', '0', '0', 'KD-Ymd-', '1', 'all', '全體人員', '2017-08-28 11:48:39', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('24', '物品領用', 'goodly', '5', 'goodm', 'type=0', '{explain}', null, '行政', '1', '0', '0', '0', 'CD-Ymd-', '1', 'all', '全體人員', '2017-08-10 10:46:26', '1', '1', 'goodss', '領用物品', '待?發放,已發放,駁回', '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('25', '出差報銷', 'finccbx', '91', 'fininfom', 'type=1', '報銷金額:{money},目的:{purpose},成果:{purresult}', null, '財務', '1', '0', '0', '0', 'FB-Ymd-', '1', 'all', '全體人員', '2017-05-06 21:29:35', '1', '1', 'fininfos', '報銷明細', null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('26', '借款單', 'finjkd', '92', 'fininfom', 'type=2', '借款金額:{money},用途:{purpose}', null, '財務', '1', '0', '0', '0', 'FC-Ymd-', '1', 'all', '全體人員', '2017-05-06 21:45:31', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('27', '還款單', 'finhkd', '93', 'fininfom', 'type=3', '還款金額：{money}，還款方式:{paytype}，還款到：{fullname}', null, '財務', '1', '0', '0', '0', 'FD-Ymd-', '1', 'all', '全體人員', '2017-05-06 21:45:35', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('28', '物品採購', 'caigou', '6', 'goodm', 'type=1', '從[{custname}]採購金額:{money}元', null, '行政', '1', '0', '0', '0', 'CE-Ymd-', '1', 'all', '全體人員', '2016-09-03 22:58:07', '1', '1', 'goodss', '採購物品', null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('29', '人員檔案', 'userinfo', '60', 'userinfo', null, null, null, '人事', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-07-08 19:38:44', '1', '0', 'userinfos,userinfos', '工作經歷,教育經歷', null, '0', '0', '0', '1', '0', '0', '1');
INSERT INTO `xinhu_flow_set` VALUES ('30', '考勤信息', 'leavehr', '34', 'kqinfo', null, null, null, '考勤', '1', '0', '0', '0', null, '0', 'd4', '行政人事部', '2016-09-13 13:46:55', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('31', '員工合同', 'userract', '61', 'userract', null, null, null, '人事', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2017-07-08 16:05:55', '1', '0', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('32', '轉正申請', 'hrpositive', '62', 'hrpositive', null, '申請[{positivedt}]轉正', null, '人事', '1', '0', '0', '0', 'HA-Ymd-', '1', 'all', '全體人員', '2017-05-03 21:09:12', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('33', '離職申請', 'hrredund', '63', 'hrredund', null, '[{redundtype}],在{quitdt}離職', null, '人事', '1', '0', '0', '0', 'HB-Ymd-', '1', 'all', '全體人員', '2017-05-03 21:40:44', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('34', '薪資', 'hrsalary', '65', 'hrsalary', null, '{uname}[{month}]月份的薪資', 'title:{month}薪資', '人事', '1', '0', '0', '0', 'HC-Ymd-', '1', 'all', '全體人員', '2017-08-07 10:03:57', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('35', '客戶合同', 'custract', '52', 'custract', null, '編號[{num}],客戶:{custname},{enddt}到期', 'title:{custname}\ncont:合同編號：{num}[br]日期：{startdt}→{enddt}[br]狀態：{moneys}', '客戶', '0', '0', '0', '0', 'CC-Ymd-', '0', 'all', '全體人員', '2017-07-04 11:34:02', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('36', '收付款單', 'custfina', '53', 'custfina', null, null, 'title:{custname}\noptdt:{optdt}\ncont:金額：{money}[br]對應合同：{htnum}', '客戶', '0', '0', '0', '0', 'CD-Ymd-', '0', 'all', '全體人員', '2017-07-04 11:55:10', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('37', '調薪申請', 'hrtrsalary', '66', 'hrtrsalary', null, '{optname}申請調薪', null, '人事', '1', '0', '0', '0', 'HD-Ymd-', '1', 'all', '全體人員', '2017-05-03 22:12:37', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('38', '人事調動', 'hrtransfer', '67', 'hrtransfer', null, '[{tranname}]【{trantype}】:{olddeptname}→{newdeptname},{oldranking}→{newranking}', null, '人事', '1', '0', '0', '0', 'HE-Ymd-', '1', 'all', '全體人員', '2017-05-03 20:37:38', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('39', '獎懲處罰', 'reward', '68', 'reward', null, '對【{object}】的{atype},獎懲結果:{result},金額:{money}', null, '人事', '1', '0', '0', '0', 'HF-Ymd-', '1', 'all', '全體人員', '2017-05-03 22:22:43', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('40', '知識', 'knowledge', '71', 'knowledge', null, '{title}', 'title:{title}\noptdt:{optdt}', '資源', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2016-12-06 16:15:13', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('41', '固定資產', 'assetm', '7', 'assetm', null, null, null, '行政', '0', '0', '0', '0', 'CF-Ymd-', '0', 'all', '全體人員', '2016-10-26 20:42:04', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('42', '車輛管理', 'carm', '101', 'carm', null, null, null, '車輛', '0', '0', '0', '0', 'CH-Ymd-', '0', 'all', '全體人員', '2017-06-22 13:36:39', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('43', '題庫', 'knowtiku', '72', 'knowtiku', null, null, 'title:[{typename}]{title}\ncont:A：{ana}[br]B：{anb}[br]C：{anc}[br]D：{and}', '資源', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-05-19 17:01:55', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('44', '車輛預定', 'carmrese', '103', 'carmrese', null, '{usename}預定車輛【{carnum}】在{startdt}前往{address}', null, '車輛', '1', '0', '0', '0', 'CJ-Ymd-', '1', 'all', '全體人員', '2017-05-08 10:15:15', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('45', '圖書管理', 'book', '8', 'book', null, '{title}', 'title:{title}', '行政', '0', '0', '0', '0', 'CK-Ymd-', '0', 'all', '全體人員', '2017-04-12 09:03:49', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('46', '圖書借閱', 'bookborrow', '9', 'bookborrow', null, '{optname}借閱[{bookname}]', null, '行政', '1', '0', '0', '0', 'CL-Ymd-', '1', 'all', '全體人員', '2017-05-08 11:15:03', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('47', '郵件', 'emailm', '25', 'emailm', null, '{title},發件人:{sendname}', 'title:{title}\noptdt:{senddt}\ncont:發件人：{sendname}[br]收件人：{recename}', '基礎', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2016-12-08 16:11:33', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('48', '印章', 'seal', '10', 'seal', null, null, null, '行政', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2016-12-08 21:02:54', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('49', '印章申請', 'sealapl', '11', 'sealapl', null, '{optname}申請使用[{sealname}]', null, '行政', '1', '0', '0', '0', 'CM-Ymd-', '1', 'all', '全體人員', '2017-06-21 21:16:58', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('50', '待辦處理', 'daiban', '208', 'flow_bill', null, null, null, '系統', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2016-12-15 17:48:55', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('51', '打卡異常', 'kqerr', '35', 'kqerr', null, '{optname}[{errtype}]申請', null, '考勤', '1', '0', '0', '0', 'KE-Ymd-', '1', 'all', '全體人員', '2017-08-28 12:12:51', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('52', '單據作廢申請', 'tovoid', '27', 'tovoid', null, '{optname}申請單號:{tonum}作廢,模塊:{modename}', null, '基礎', '1', '0', '0', '0', 'ZF-Ymd-', '1', 'all', '全體人員', '2016-12-19 13:43:28', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('53', '個人通訊錄', 'vcard', '26', 'vcard', null, null, 'title:{name}\ncont:電話：{tel}[br]手機：{mobile}[br]郵箱：{email}[br]所在組：{gname}', '基礎', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2016-12-20 16:30:42', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('54', '會議紀要', 'meetjy', '3', 'meet', 'type=2', null, null, '行政', '1', '0', '0', '0', 'XC-Ymd-', '0', 'all', '全體人員', '2017-02-28 10:40:58', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('55', '定位記錄', 'kqdw', '36', 'location', null, null, 'title:{name}\noptdt:{optdt}\ncont:星期：{week}[br]地址：{label}[br]說明：{explain}', '考勤', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-03-30 11:22:03', '1', '0', null, null, null, '1', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('56', '考試培訓', 'knowtraim', '73', 'knowtraim', null, '{title},時間{startdt}→{enddt}', 'title:{title}\noptdt:{start}', '資源', '1', '0', '0', '0', 'ZA-Ymd-', '0', 'all', '全體人員', '2017-05-09 21:27:00', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('58', '車輛信息登記', 'carms', '102', 'carms', null, null, null, '車輛', '1', '0', '0', '0', 'CN-Ymd', '0', 'all', '全體人員', '2017-06-21 21:18:07', '1', '1', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('59', '車輛維修', 'carmwx', '104', 'carmang', 'type=0', null, null, '車輛', '1', '0', '0', '0', 'CX-Ymd-', '1', 'all', '全體人員', '2017-06-26 21:22:59', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('60', '車輛保養', 'carmby', '105', 'carmang', 'type=1', '車輛保養', null, '車輛', '1', '0', '0', '0', 'CY-Ymd-', '1', 'all', '全體人員', '2017-06-27 13:24:15', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('61', '單據提醒設置', 'remind', '28', 'flow_remind', null, null, null, '基礎', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-06-30 13:05:47', '1', '0', null, null, null, '1', '1', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('62', '維修報修', 'repair', '12', 'repair', null, '{assetm}:{reason}', null, '行政', '1', '0', '0', '0', 'WX-Ymd-', '1', 'all', '全體人員', '2017-07-07 13:40:16', '1', '1', null, null, '待處理,已完成', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('63', '公司單位', 'company', '200', 'company', null, null, null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2017-07-08 14:21:37', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('64', '付款申請', 'finpay', '94', 'fininfom', 'type=4', '申請付款{money}元', null, '財務', '1', '0', '0', '0', 'FE-Ymd-', '1', 'all', '全體人員', '2017-08-07 20:46:42', '1', '1', null, null, '待?處理,已付款', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('65', '開票申請', 'finkai', '95', 'fininfom', 'type=5', '[{fullname}]要開票{money}元', null, '財務', '1', '0', '0', '0', 'FF-Ymd-', '1', 'all', '全體人員', '2017-08-07 21:13:21', '1', '1', null, null, '待?處理,已開票', '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('66', '單據通知設置', 'flowtodo', '209', 'flow_todo', null, '{summary}', null, '系統', '0', '0', '0', '0', null, '0', 'u1', '管理員', '2017-08-23 13:51:23', '1', '0', null, null, null, '0', '0', '0', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('67', '訂閱管理', 'subscribe', '210', 'subscribe', null, '{cont}', null, '系統', '0', '0', '0', '0', null, '0', 'all', '全體人員', '2017-09-02 13:51:07', '1', '0', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('68', '訂閱報表', 'subscribeinfo', '211', 'subscribeinfo', null, '{title}', 'title:{title}\noptdt:{optdt}\ncont:{cont}', '系統', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2017-09-02 22:26:18', '1', '0', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('69', '公文查閱', 'officic', '42', 'official', 'status=1', '{title}', null, '公文', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2017-09-06 22:00:18', '1', '0', null, null, null, '1', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('70', '考勤機設備', 'kqjsn', '37', 'kqjsn', null, null, null, '考勤', '1', '0', '0', '0', null, '0', 'all', '全體人員', '2017-09-20 13:43:14', '1', '1', null, null, null, '0', '0', '1', '0', '0', '0', '2');
INSERT INTO `xinhu_flow_set` VALUES ('71', '考核評分', 'hrcheck', '69', 'hrcheck', null, '月份{month}的考核內容', null, '人事', '1', '0', '0', '0', 'HG-Ymd-', '1', 'all', '全體人員', '2017-10-13 23:29:40', '1', '1', null, null, null, '0', '0', '1', '1', '0', '0', '0');
INSERT INTO `xinhu_flow_set` VALUES ('72', '演示測試', 'demo', '300', 'demo', null, null, null, '系統', '0', '0', '0', '0', 'YS-Ymd-', '1', 'all', '全體人員', '2017-10-20 09:02:14', '1', '0', null, null, null, '0', '0', '1', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_todo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_todo`;
CREATE TABLE `xinhu_flow_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL COMMENT '名稱標題',
  `num` varchar(30) DEFAULT NULL COMMENT '編號',
  `setid` smallint(6) DEFAULT '0' COMMENT '對應模塊',
  `explain` varchar(100) DEFAULT NULL COMMENT '說明',
  `whereid` smallint(6) DEFAULT '0' COMMENT '對應條件id',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `receid` varchar(500) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL COMMENT '通知給',
  `changefields` varchar(200) DEFAULT NULL COMMENT '改變字段',
  `changecourse` varchar(30) DEFAULT NULL COMMENT '對應步做id',
  `boturn` tinyint(1) DEFAULT '0' COMMENT '提交時',
  `boedit` tinyint(1) DEFAULT '0' COMMENT '編輯時',
  `bochang` tinyint(1) DEFAULT '0' COMMENT '字段改變時',
  `bodel` tinyint(1) DEFAULT '0' COMMENT '刪除時',
  `bozuofei` tinyint(1) DEFAULT '0' COMMENT '作廢時',
  `botong` tinyint(1) DEFAULT '0' COMMENT '步驟處理通過時',
  `bobutong` tinyint(1) DEFAULT '0' COMMENT '步驟處理不通過時',
  `bofinish` tinyint(1) DEFAULT '0' COMMENT '處理完成時',
  `bozhui` tinyint(1) DEFAULT '0' COMMENT '追加說明時',
  `bozhuan` tinyint(1) DEFAULT '0' COMMENT '流程轉辦時',
  `toturn` tinyint(1) DEFAULT '0' COMMENT '是否通知給提交人',
  `tocourse` tinyint(1) DEFAULT '0' COMMENT '是否通知給流程所有參與人',
  `todofields` varchar(100) DEFAULT NULL COMMENT '通知給主表上字段',
  `summary` varchar(100) DEFAULT NULL COMMENT '通知內容摘要',
  `botask` tinyint(1) DEFAULT '0' COMMENT '計劃任務',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='單據通知設置表';

-- ----------------------------
-- Records of xinhu_flow_todo
-- ----------------------------
INSERT INTO `xinhu_flow_todo` VALUES ('1', '車輛信息到期提醒', null, '58', '這只是個事例', '96', '0', 'u1', '管理員', null, null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', null, '車輛[{carid}]的{otype}將在{enddt}到期。', '1');
INSERT INTO `xinhu_flow_todo` VALUES ('2', '公文通知查閱', null, '19', null, '0', '1', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', 'receid', '你有一條公文需要查閱', '0');
INSERT INTO `xinhu_flow_todo` VALUES ('3', '公文通知查閱', null, '20', null, '0', '1', null, null, null, null, '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', 'receid', '你有一條公文需要查閱', '0');

-- ----------------------------
-- Table structure for `xinhu_flow_todos`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_todos`;
CREATE TABLE `xinhu_flow_todos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modenum` varchar(30) DEFAULT '0' COMMENT '對應模塊編號',
  `modename` varchar(30) DEFAULT NULL COMMENT '模塊名稱',
  `table` varchar(30) DEFAULT NULL COMMENT '對應主表',
  `mid` int(11) DEFAULT '0' COMMENT '主表Id',
  `uid` int(11) DEFAULT '0' COMMENT '對應人員',
  `adddt` datetime DEFAULT NULL COMMENT '添加時間',
  `readdt` datetime DEFAULT NULL COMMENT '已讀時間',
  `isread` tinyint(1) DEFAULT '0' COMMENT '是否已讀',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`),
  KEY `modenum` (`modenum`,`mid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='單據通知給對應人員';

-- ----------------------------
-- Records of xinhu_flow_todos
-- ----------------------------
INSERT INTO `xinhu_flow_todos` VALUES ('27', 'officia', '發文單', 'official', '2', '2', '2017-09-06 22:37:28', '2017-09-06 22:37:53', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('2', 'waichu', '外出出差', 'kqout', '4', '5', '2017-08-28 11:54:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('26', 'hrsalary', '薪資', 'hrsalary', '22', '4', '2017-09-06 20:57:46', '2017-09-29 17:20:26', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('4', 'kqerr', '打卡異常', 'kqerr', '2', '5', '2017-08-28 12:19:12', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('5', 'gong', '通知公告', 'infor', '9', '2', '2017-08-29 09:27:21', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('6', 'gong', '通知公告', 'infor', '9', '3', '2017-08-29 09:27:21', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('7', 'gong', '通知公告', 'infor', '9', '4', '2017-08-29 09:27:21', '2017-09-04 20:31:48', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('8', 'gong', '通知公告', 'infor', '9', '5', '2017-08-29 09:27:21', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('9', 'gong', '通知公告', 'infor', '9', '6', '2017-08-29 09:27:21', '2017-09-25 11:50:14', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('10', 'gong', '通知公告', 'infor', '9', '7', '2017-08-29 09:27:21', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('11', 'gong', '通知公告', 'infor', '9', '8', '2017-08-29 09:27:21', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('25', 'gong', '通知公告', 'infor', '6', '1', '2017-09-05 22:08:39', '2017-09-08 12:46:56', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('13', 'officia', '發文單', 'official', '2', '5', '2017-08-30 20:34:40', '2017-08-30 20:37:16', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('14', 'officia', '發文單', 'official', '2', '3', '2017-08-30 20:37:27', '2017-08-30 20:37:37', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('15', 'officib', '收文單', 'official', '3', '5', '2017-08-30 22:59:35', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('24', 'schedule', '日程', 'schedule', '3', '1', '2017-09-02 11:54:57', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('17', 'schedule', '日程', 'schedule', '1', '2', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('18', 'schedule', '日程', 'schedule', '1', '3', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('19', 'schedule', '日程', 'schedule', '1', '4', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('20', 'schedule', '日程', 'schedule', '1', '5', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('21', 'schedule', '日程', 'schedule', '1', '6', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('22', 'schedule', '日程', 'schedule', '1', '7', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('23', 'schedule', '日程', 'schedule', '1', '8', '2017-09-01 07:55:00', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('28', 'officia', '發文單', 'official', '2', '1', '2017-09-06 22:38:16', '2017-09-06 22:38:22', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('29', 'officia', '發文單', 'official', '2', '4', '2017-09-06 22:38:16', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('30', 'officia', '發文單', 'official', '2', '6', '2017-09-06 22:38:16', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('31', 'officia', '發文單', 'official', '2', '7', '2017-09-06 22:38:16', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('32', 'officia', '發文單', 'official', '2', '8', '2017-09-06 22:38:16', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('33', 'daily', '工作日報', 'daily', '21', '1', '2017-09-24 10:54:01', '2017-09-30 14:13:19', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('34', 'meet', '會議', 'meet', '1', '1', '2017-09-24 14:48:44', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('35', 'meet', '會議', 'meet', '1', '6', '2017-09-24 14:48:44', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('36', 'meet', '會議', 'meet', '1', '7', '2017-09-24 14:48:44', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('37', 'meet', '會議', 'meet', '1', '8', '2017-09-24 14:48:44', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('38', 'emailm', '郵件', 'emailm', '1', '1', '2017-09-30 14:15:41', '2017-09-30 14:15:47', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('39', 'emailm', '郵件', 'emailm', '1', '2', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('40', 'emailm', '郵件', 'emailm', '1', '3', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('41', 'emailm', '郵件', 'emailm', '1', '4', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('42', 'emailm', '郵件', 'emailm', '1', '5', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('43', 'emailm', '郵件', 'emailm', '1', '6', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('44', 'emailm', '郵件', 'emailm', '1', '7', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('45', 'emailm', '郵件', 'emailm', '1', '8', '2017-09-30 14:15:41', null, '0');
INSERT INTO `xinhu_flow_todos` VALUES ('46', 'hrcheck', '考核評分', 'hrcheck', '1', '5', '2017-10-13 23:16:59', '2017-10-13 23:25:05', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('47', 'hrcheck', '考核評分', 'hrcheck', '1', '4', '2017-10-13 23:25:21', '2017-10-13 23:25:52', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('48', 'hrcheck', '考核評分', 'hrcheck', '1', '1', '2017-10-13 23:36:21', '2017-10-13 23:36:30', '1');
INSERT INTO `xinhu_flow_todos` VALUES ('49', 'caigou', '物品採購', 'goodm', '9', '5', '2017-10-14 22:49:59', null, '0');

-- ----------------------------
-- Table structure for `xinhu_flow_where`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_where`;
CREATE TABLE `xinhu_flow_where` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT '0' COMMENT '對應模塊',
  `num` varchar(30) DEFAULT NULL COMMENT '編號',
  `pnum` varchar(30) DEFAULT NULL COMMENT '編號分組',
  `name` varchar(50) DEFAULT NULL COMMENT '條件名稱',
  `wheresstr` varchar(500) DEFAULT NULL COMMENT '對應表條件',
  `whereustr` varchar(500) DEFAULT NULL COMMENT '用戶條件',
  `wheredstr` varchar(500) DEFAULT NULL COMMENT '對應部門條件',
  `sort` smallint(6) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL COMMENT '包含用戶',
  `nreceid` varchar(200) DEFAULT NULL,
  `nrecename` varchar(200) DEFAULT NULL COMMENT '不包含用戶',
  `islb` tinyint(1) DEFAULT '0' COMMENT '是否在生成列表頁面上顯示',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `syrid` varchar(200) DEFAULT NULL,
  `syrname` varchar(200) DEFAULT NULL COMMENT '此條件可適用對象',
  PRIMARY KEY (`id`),
  KEY `setid` (`setid`)
) ENGINE=MyISAM AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='單據條件';

-- ----------------------------
-- Records of xinhu_flow_where
-- ----------------------------
INSERT INTO `xinhu_flow_where` VALUES ('1', '1', 'my', null, '與我相關', 'e3JlY2VpZH0:', null, null, '0', 'receid包含用戶', null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('2', '5', null, null, '大于3天', 'YHRvdGFsc2AgPiAyNA::', null, null, '0', '時間(小時) 大于 24', null, null, null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('3', '34', null, null, '管理員對應開發部', null, null, null, '0', null, 'd2', '開發部', null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('4', '4', null, null, '未分配的記錄', 'YGRpc3RgIGlzIG51bGw:', null, null, '20', '分配給 為空 ', null, null, null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('5', '1', 'wfb', null, '我發布', 'YG9wdGlkYD17dWlkfQ::', null, null, '1', 'optid字段等于當前用戶', null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('7', '3', 'my', null, '我的日報', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('8', '3', 'undall', null, '下屬全部日報', 'YHVpZGAgaW4oe2FsbHN1cGVyfSk:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('9', '3', 'undwd', null, '全部下屬未讀', 'e3VpZCxkb3duYWxsfSBhbmQge3VucmVhZH0:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('10', '1', 'wexx', null, '我未讀', 'e3JlY2VpZH0gYW5kIHt1bnJlYWR9', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('11', '2', 'today', null, '今日會議', 'YHN0YXR1c2A9MSBhbmQgYHN0YXJ0ZHRgIGxpa2UgJ1tkYXRlXSUn', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('12', '2', 'bzhy', null, '本週會議', 'YHN0YXR1c2A9MSBhbmQgYHN0YXJ0ZHRgID49ICd7d2Vla2ZpcnN0fSc:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('13', '2', 'all', null, '全部會議', 'YHN0YXR1c2A9MQ::', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('14', '2', 'myfq', null, '我發起會議', 'YHN0YXR1c2A9MSBhbmQgYG9wdGlkYD17dWlkfQ::', null, null, '4', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('15', '13', null, null, '大喬查看權限', null, null, null, '0', null, 'd3,d4', '財務部,行政人事部', null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('16', '4', 'my', null, '我的任務', 'e2Rpc3RpZCx1aWRpbn0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('17', '4', 'down', null, '我下屬任務', 'e2Rpc3RpZCxkb3dufQ::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('18', '4', 'wcj', null, '我創建任務', 'YG9wdGlkYD17dWlkfQ::', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('19', '4', 'dd', null, '我督導任務', 'e2RkaWQsdWlkaW59', null, null, '4', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('20', '4', 'wwc', null, '我未完成任務', 'YHN0YXR1c2AgaW4oMyw0KSBhbmQge2Rpc3RpZCx1aWRpbn0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('21', '4', 'all', 'all', '所有任務', 'MT0x', null, null, '5', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('22', '22', 'my', null, '我執行項目', 'e3J1bnVzZXJpZCxyZWNlbm90fQ::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('23', '22', 'wwc', null, '我未完成項目', 'e3J1bnVzZXJpZCxyZWNlbm90fSBhbmQgYHN0YXR1c2AgaW4oMCwzKQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('24', '22', 'myfz', null, '我負責項目', 'e2Z1emVpZCx1aWRpbn0:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('25', '22', 'mycj', null, '我創建項目', 'YG9wdGlkYD17dWlkfQ::', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('26', '22', 'all', 'all', '所有項目', 'MT0x', null, null, '5', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('27', '12', 'my', null, '我的日程', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('28', '12', 'rece', null, '提醒給我的', 'e3JlY2VpZCxyZWNlbm90fQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('29', '4', 'ywc', null, '已完成任務', 'e2Rpc3RpZCx1aWRpbn0gYW5kIGBzdGF0dXNgPTE:', null, null, '0', null, null, null, null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('30', '7', 'my', null, '我的客戶', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0dXNgPTE:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('31', '7', 'gxgw', 'shate', '共享給我的', 'e3NoYXRlaWQsdWlkaW59', null, null, '21', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('32', '7', 'myall', null, '我全部客戶', 'YHVpZGA9e3VpZH0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('33', '7', 'my_ting', null, '我停用客戶', 'dWlkPXt1aWR9IGFuZCBgc3RhdHVzYD0w', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('34', '7', 'downall', 'down', '下屬全部客戶', 'YHVpZGAgaW4oe3N1cGVyfSk:', null, null, '9', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('35', '7', 'downty', 'down', '下屬停用', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0dXNgPTA:', null, null, '10', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('36', '7', 'downstat', 'down', '下屬標★', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBpc3N0YXRgPTE:', null, null, '11', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('37', '7', 'mystat', null, '我標★客戶', 'YHVpZGA9e3VpZH0gYW5kIGBpc3N0YXRgPTE:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('38', '7', 'distdfp', 'dist', '待分配客戶', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9IG9yIGB1aWRgIGluKHtzdXBlcn0pKSBhbmQgYHVpZGA9MA::', null, null, '31', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('39', '7', 'distyfp', 'dist', '已分配的', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9ICBvciBgdWlkYCBpbih7c3VwZXJ9KSkgYW5kIGB1aWRgPjA:', null, null, '32', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('40', '7', 'distall', 'dist', '全部分配狀態', 'KGB1aWRgPXt1aWR9IG9yIGBmemlkYD17dWlkfSBvciBgY3JlYXRlaWRgPXt1aWR9ICBvciBgdWlkYCBpbih7c3VwZXJ9KSk:', null, null, '33', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('41', '7', 'mycj', null, '我創建', 'YGNyZWF0ZWlkYD17dWlkfQ::', null, null, '4', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('42', '7', 'all', 'all', '所有客戶', 'MT0x', null, null, '50', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('43', '7', 'allty', 'all', '所有停用客戶', 'YHN0YXR1c2A9MA::', null, null, '51', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('44', '29', 'my', null, '我的檔案', 'W0FdYGlkYD17dWlkfQ::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('45', '34', 'my', null, '我的薪資', 'YHh1aWRgPXt1aWR9', null, null, '0', null, null, null, null, null, '0', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('46', '8', 'mygx', null, '我需跟進', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9MA::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('47', '8', 'mycj', null, '已成交', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9MQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('48', '8', 'myds', null, '已丟失', 'YHVpZGA9e3VpZH0gYW5kIGBzdGF0ZWA9Mg::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('49', '8', 'myall', null, '我所有銷售機會', 'YHVpZGA9e3VpZH0g', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('50', '8', 'downgj', 'down', '下屬需跟進', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9MA::', null, null, '11', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('51', '8', 'downcj', 'down', '下屬已成交', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9MQ::', null, null, '12', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('52', '8', 'downds', 'down', '下屬已丟失', 'YHVpZGAgaW4oe3N1cGVyfSkgYW5kIGBzdGF0ZWA9Mg::', null, null, '13', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('53', '8', 'downall', 'down', '下屬所有銷售機會', 'YHVpZGAgaW4oe3N1cGVyfSkg', null, null, '14', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('54', '8', 'all', 'all', '所有銷售機會', 'MT0x', null, null, '22', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('55', '8', 'allgj', 'all', '所有需跟進', 'YHN0YXRlYD0w', null, null, '21', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('56', '8', 'allcj', 'all', '所有已成交', 'YHN0YXRlYD0x', null, null, '23', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('57', '8', 'allds', 'all', '所有已丟失', 'YHN0YXRlYD0y', null, null, '24', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('58', '38', 'my', null, '我的調動', 'W0FdYHRyYW51aWRgPXt1aWR9', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('59', '38', 'mysq', null, '我申請調動', 'YHVpZGA9e3VpZH0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('60', '38', 'all', 'all', '所有調動', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('61', '32', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('62', '32', 'all', 'all', '所有申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('63', '33', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('64', '33', 'all', 'all', '所有申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('65', '37', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('66', '37', 'all', 'all', '所有申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('67', '39', 'objmy', null, '獎懲對象是我', 'YG9iamVjdGlkYD17dWlkfQ::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('68', '39', 'my', null, '我申請的', 'YHVpZGA9e3VpZH0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('69', '39', 'all', 'all', '所有獎懲', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('70', '1', 'all', 'all', '所有公告', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('71', '11', 'all', 'all', '所有費用報銷', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('72', '11', 'my', null, '我的報銷', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('73', '25', 'all', 'all', '所有出差報銷', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('74', '25', 'my', null, '我的出差報銷', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('75', '26', 'all', 'all', '所有借款單', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('76', '26', 'my', null, '我的借款單', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('77', '27', 'all', 'all', '所有還款單', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('78', '27', 'my', null, '我的還款單', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('79', '49', 'all', 'all', '所有印章申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('80', '49', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('81', '44', 'all', 'all', '所有車輛預定', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('82', '44', 'my', null, '我的預定', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('83', '44', 'myjia', null, '駕駛員是我', 'e2ppYWlkLHVpZGlufQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('84', '44', 'myuse', null, '使用人包含我', 'e3VzZWlkLHJlY2VhbGx9', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('85', '46', 'all', 'all', '所有圖書借閱', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('86', '46', 'my', null, '我的借閱', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('87', '29', 'all', 'all', '所有檔案', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('88', '3', 'all', 'all', '所有日報', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('89', '56', 'all', 'all', '所有培訓', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('90', '43', 'all', 'all', '所有題庫', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('91', '43', 'weidu', null, '我未讀', 'e3VucmVhZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('167', '20', 'all', 'all', '所有收文單', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('93', '58', 'all', 'all', '所有登記', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('94', '42', 'all', 'all', '所以車輛', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('95', '42', 'public', 'all', '可預定車輛', 'YGlzcHVibGljYD0x', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('96', '58', 'kydq', 'all', '7天內到期', 'YGVuZGR0YCBpcyBub3QgbnVsbCBhbmQgYGVuZGR0YDx7ZGF0ZSs3fSBhbmQgYGVuZGR0YD49e2RhdGV9', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('97', '35', 'my', null, '我所有合同', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('98', '35', 'ygq', null, '已過期', 'YHVpZGA9e3VpZH0gYW5kIGBlbmRkdGA8e2RhdGV9', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('99', '35', 'daisfk', null, '待收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9MA::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('100', '35', 'qbsfk', null, '已全部收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9MQ::', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('101', '35', 'bfsfk', null, '部分收/付款', 'YHVpZGA9e3VpZH0gYW5kIGBpc3BheWA9Mg::', null, null, '4', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('102', '35', 'downall', 'down', '下屬所有合同', 'IHt1aWQsZG93bn0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('103', '35', 'downygq', 'down', '已過期', 'IHt1aWQsZG93bn0gYW5kIGBlbmRkdGA8e2RhdGV9', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('104', '35', 'all', 'all', '所有合同', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('105', '36', 'myskd', null, '我收款單', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0w', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('106', '36', 'myskdys', null, '我已收款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0wIGFuZCBgaXNwYXlgPTE:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('107', '36', 'myskdws', null, '我未收款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0wIGFuZCBgaXNwYXlgPTA:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('108', '36', 'downskd', 'downskd', '下屬收款單', 'IHt1aWQsZG93bn0gYW5kIGB0eXBlYD0w', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('109', '36', 'downskdys', 'downskd', '下屬已收款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTAgYW5kIGBpc3BheWA9MQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('110', '36', 'downskdwsk', 'downskd', '下屬未收款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTAgYW5kIGBpc3BheWA9MA::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('111', '36', 'allskd', 'allskd', '所有收款單', 'YHR5cGVgPTA:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('112', '36', 'allskdys', 'allskd', '所有已收款', 'YHR5cGVgPTAgYW5kIGBpc3BheWA9MQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('113', '36', 'allskdwsk', 'allskd', '所有未收款', 'YHR5cGVgPTAgYW5kIGBpc3BheWA9MA::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('114', '36', 'myfkd', 'fkd', '我的付款單', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('115', '36', 'myfkdyf', 'fkd', '我已付款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0xIGFuZCBgaXNwYXlgPTE:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('116', '36', 'myfkdwf', 'fkd', '我未付款', 'YHVpZGA9e3VpZH0gYW5kIGB0eXBlYD0xIGFuZCBgaXNwYXlgPTA:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('117', '36', 'downfkd', 'downfkd', '下屬付款單', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTE:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('118', '36', 'downfkdyf', 'downfkd', '下屬已付款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTEgYW5kIGBpc3BheWA9MQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('119', '36', 'downfkdwf', 'downfkd', '下屬未付款', 'e3VpZCxkb3dufSBhbmQgYHR5cGVgPTEgYW5kIGBpc3BheWA9MA::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('120', '36', 'allfkd', 'allfkd', '所有付款單', 'YHR5cGVgPTE:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('121', '36', 'allfkdyf', 'allfkd', '所有已付款', 'YHR5cGVgPTEgYW5kIGBpc3BheWA9MQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('122', '36', 'allfkdwf', 'allfkd', '所有未付款', 'YHR5cGVgPTEgYW5kIGBpc3BheWA9MA::', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('123', '59', 'all', 'all', '所有維修', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('124', '60', 'all', 'all', '所有保養記錄', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('125', '59', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('126', '59', 'myjia', null, '駕駛員包含我', 'e2ppYWlkLHVpZGlufQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('127', '60', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('128', '60', 'myjia', null, '駕駛員包含我', 'IHtqaWFpZCx1aWRpbn0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('129', '6', 'allfee', 'all', '加班費單據', 'YGppYXR5cGVgPTE:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('130', '6', 'all', 'all', '所有加班單', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('131', '6', 'my', null, '我的加班單', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('132', '5', 'my', null, '我的請假條', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('133', '5', 'all', 'all', '所有請假條', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('136', '42', 'my', null, '可預定車輛', 'YGlzcHVibGljYD0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('137', '61', 'my', null, '我的設置', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('138', '62', 'my', null, '我的報修', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('139', '62', 'all', 'all', '所有報修', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('140', '62', 'allsx', 'all', '需要外修', 'YGlzd3hgPTE:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('141', '63', 'all', 'all', '所有公司單位', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('142', '31', 'my', null, '我的合同', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('143', '31', 'all', 'all', '所有合同', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('144', '31', 'all30', 'all', '30天內過期', 'YGVuZGR0YDw9e2RhdGUrMzB9IGFuZCBgc3RhdGVgPTE:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('145', '31', 'allsxz', 'all', '生效中', 'YHN0YXRlYD0x', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('146', '31', 'allyzz', 'all', '已終止', 'YHN0YXRlYD0y', null, null, '3', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('147', '10', 'all', 'all', '所有用戶', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('148', '10', 'allty', 'all', '已停用', 'YHN0YXR1c2A9MA::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('149', '10', 'allgly', 'all', '管理員用戶', 'YHR5cGVgPTE:', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('150', '10', 'txlmy', 'txl', '通訊錄', 'YHN0YXR1c2A9MQ::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('151', '10', 'txldown', 'txl', '我直屬下級', 'YHN0YXR1c2A9MSBhbmQge2lkLGRvd259', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('152', '10', 'txldownall', 'txl', '我全部下屬', 'YHN0YXR1c2A9MSBhbmQge2lkLGRvd25hbGx9', null, null, '2', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('153', '64', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('154', '64', 'all', 'all', '所有申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('155', '65', 'my', null, '我的申請', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('156', '65', 'all', 'all', '所有申請', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('157', '23', 'my', null, '我的外出出差', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('158', '23', 'all', 'all', '所有外出出差', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('159', '23', 'mytoday', null, '我今日外出', 'YHVpZGA9e3VpZH0gYW5kIGBpbnRpbWVgID4gJ1tkYXRlXScgYW5kIGBvdXR0aW1lYDwgJ1tkYXRlXSAyMzo1OTo1OSc:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('160', '23', 'alltoday', 'all', '所有今日外出', 'YGludGltZWAgPiAnW2RhdGVdJyBhbmQgYG91dHRpbWVgPCAnW2RhdGVdIDIzOjU5OjU5Jw::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('161', '23', 'downtoday', 'down', '下屬今日外出', 'e3VpZCxkb3dufSBhbmQgYGludGltZWAgPiAnW2RhdGVdJyBhbmQgYG91dHRpbWVgPCAnW2RhdGVdIDIzOjU5OjU5Jw::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('162', '23', 'downall', 'down', '下屬所有外出', 'e3VpZCxkb3dufQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('163', '51', 'my', null, '我的打卡異常', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('164', '51', 'all', 'all', '所有打卡異常', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('165', '19', 'all', 'all', '所有發文', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('166', '19', 'my', null, '我的發文', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('168', '20', 'my', null, '我的收文單', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('169', '67', 'my', null, '我的訂閱管理', 'YG9wdGlkYD17dWlkfQ::', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('170', '67', 'all', 'all', '所有訂閱管理', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('171', '68', 'my', null, '給我的訂閱', 'e3JlY2VpZCx1aWRpbn0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('172', '68', 'all', 'all', '所有訂閱報表', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('173', '67', 'shate', null, '共享給我訂閱', 'e3NoYXRlaWQscmVjZW5vdH0:', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('174', '69', 'my', null, '需我查閱公文', 'KHtyZWNlaWQscmVjZW5vdH0p', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('175', '69', 'mywcy', null, '未查閱公文', 'e3VucmVhZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('176', '70', 'all', 'all', '所有考勤機設備', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('177', '70', 'offline', 'all', '不在線設備', 'KGBsYXN0ZHRgIGlzIG51bGwgb3IgYGxhc3RkdGA8e3NlY29uZC0zMDB9KQ::', null, null, '1', '最後請求在5分鐘之前就不在線', null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('178', '29', 'nowbirty', 'all', '當月人員生日', 'TUlEKGBiaXJ0aGRheWAsNiwyKT1kYXRlX2Zvcm1hdChub3coKSwnJW0nKQ::', null, null, '1', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('179', '71', 'all', 'all', '所有考核評分', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('180', '71', 'my', null, '我的考核評分', 'YHVpZGA9e3VpZH0:', null, null, '0', null, null, null, null, null, '1', '1', null, null);
INSERT INTO `xinhu_flow_where` VALUES ('181', '72', 'all', 'all', '所有演示數據', 'MT0x', null, null, '0', null, null, null, null, null, '1', '1', null, null);

-- ----------------------------
-- Table structure for `xinhu_goodm`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goodm`;
CREATE TABLE `xinhu_goodm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `type` tinyint(1) DEFAULT '0' COMMENT '0領用,1採購申請',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '費用',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '供應商名稱',
  `discount` decimal(8,2) DEFAULT '0.00' COMMENT '優惠價格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='物品領用採購申請主表';

-- ----------------------------
-- Records of xinhu_goodm
-- ----------------------------
INSERT INTO `xinhu_goodm` VALUES ('1', '1', '2016-09-01 23:08:03', '1', '管理員', '2016-09-01', '領用看看！', '1', '1', '0', null, '0', null, '0.00');
INSERT INTO `xinhu_goodm` VALUES ('2', '1', '2016-09-02 10:43:32', '1', '管理員', '2016-09-02', '哈哈哈', '1', '1', '0', null, '0', null, '0.00');
INSERT INTO `xinhu_goodm` VALUES ('4', '1', '2016-09-02 21:29:42', '1', '管理員', '2016-09-02', '領啦啦', '1', '1', '0', null, '0', null, '0.00');
INSERT INTO `xinhu_goodm` VALUES ('5', '1', '2016-09-03 22:54:31', '1', '管理員', '2016-09-03', '買個鼠標吧', '0', '1', '1', '36.00', '4', '谷歌公司', '0.00');
INSERT INTO `xinhu_goodm` VALUES ('6', '1', '2017-02-09 16:16:12', '1', '管理員', '2017-02-09', null, '0', '1', '0', '0.00', '0', null, '0.00');
INSERT INTO `xinhu_goodm` VALUES ('7', '1', '2017-05-02 13:35:17', '1', '管理員', '2017-05-02', '買嘍', '0', '1', '1', '8400.00', '4', '谷歌公司', '0.00');
INSERT INTO `xinhu_goodm` VALUES ('8', '1', '2017-05-02 14:03:10', '1', '管理員', '2017-05-02', null, '1', '1', '0', '0.00', '0', null, '0.00');
INSERT INTO `xinhu_goodm` VALUES ('9', '1', '2017-10-14 22:49:59', '1', '管理員', '2017-07-05', null, '0', '1', '1', '33.00', '0', '信呼公司', '0.00');
INSERT INTO `xinhu_goodm` VALUES ('10', '4', '2017-08-10 10:29:36', '4', '大喬', '2017-08-10', null, '0', '1', '0', '0.00', '0', null, '0.00');

-- ----------------------------
-- Table structure for `xinhu_goods`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goods`;
CREATE TABLE `xinhu_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '對應分類',
  `name` varchar(30) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL COMMENT '規格',
  `xinghao` varchar(50) DEFAULT NULL COMMENT '型號',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '單價',
  `unit` varchar(5) DEFAULT NULL COMMENT '單位',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '庫存',
  `stockcs` int(11) DEFAULT '0' COMMENT '初始庫存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='物品表';

-- ----------------------------
-- Records of xinhu_goods
-- ----------------------------
INSERT INTO `xinhu_goods` VALUES ('1', '64', '信呼實施維護', null, null, '實施維護包括如下內容\n1、系統bug修改。\n2、需求添加修改等。\n3、數據服務器穩定性維護。\n4、數據分析等。', '3000.00', '月', '2016-07-19 17:53:28', '2016-07-20 12:38:55', '1', '管理員', '86', '0');
INSERT INTO `xinhu_goods` VALUES ('2', '67', '鼠標1', null, null, null, '12.00', '個', '2016-07-20 13:25:17', '2016-07-20 13:25:17', '1', '管理員', '1', '0');
INSERT INTO `xinhu_goods` VALUES ('3', '66', '聯想顯示器', '21寸', 'abc', null, '1200.00', '台', '2017-05-02 13:35:05', '2017-10-14 22:56:25', '1', '管理員', '22', '23');
INSERT INTO `xinhu_goods` VALUES ('4', '356', '2b鉛筆', '0.5mm', '25505-2B', null, '1.50', '支', '2017-07-25 19:59:55', '2017-08-20 12:06:14', '1', '管理員', '22', '22');
INSERT INTO `xinhu_goods` VALUES ('5', '356', '3b鉛筆', '0.8mm', '25505-3B', null, '2.00', '支', '2017-07-25 19:59:55', '2017-08-20 12:06:09', '1', '管理員', '33', '33');
INSERT INTO `xinhu_goods` VALUES ('6', '356', '紅色粉筆', '紅色', '5釐米', null, '0.10', '盒', '2017-08-20 11:52:00', '2017-08-20 11:52:00', '1', '管理員', '20', '20');

-- ----------------------------
-- Table structure for `xinhu_goodss`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goodss`;
CREATE TABLE `xinhu_goodss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` smallint(6) DEFAULT '0' COMMENT '物品Id',
  `count` smallint(6) DEFAULT '0' COMMENT '數量',
  `uid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0入庫,1出庫',
  `kind` tinyint(2) DEFAULT '0' COMMENT '出入庫類型',
  `optname` varchar(20) DEFAULT NULL,
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `optid` int(11) DEFAULT '0',
  `mid` smallint(6) DEFAULT '0' COMMENT '對應主表',
  `sort` smallint(6) DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL COMMENT '單位',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '單價',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='物品庫存詳細表';

-- ----------------------------
-- Records of xinhu_goodss
-- ----------------------------
INSERT INTO `xinhu_goodss` VALUES ('1', '1', '1', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 15:24:01', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('2', '2', '22', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 15:24:01', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('3', '1', '-23', '1', '1', '0', '管理員', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出庫', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('4', '2', '-2', '1', '1', '0', '管理員', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出庫', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('5', '1', '1', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 15:31:42', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('6', '2', '2', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 15:31:42', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('7', '1', '100', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 15:32:03', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('9', '1', '21', '1', '0', '1', '管理員', '2016-07-20', '2016-07-20 15:35:48', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('10', '1', '-1', '1', '1', '1', '管理員', '2016-07-20', '2016-07-20 15:36:26', '有人買了', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('11', '1', '1', '1', '0', '0', '管理員', '2016-07-20', '2016-07-20 19:51:35', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('13', '2', '-4', '1', '1', '0', '管理員', '2016-08-07', '2016-08-07 15:33:51', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('21', '1', '-10', '1', '1', '0', '管理員', '2016-09-01', '2016-09-01 23:08:03', null, '1', '1', '1', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('22', '2', '-2', '1', '1', '0', '管理員', '2016-09-01', '2016-09-01 23:08:03', null, '1', '1', '1', '1', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('23', '2', '-12', '1', '1', '0', '管理員', '2016-09-02', '2016-09-02 10:43:32', null, '1', '1', '2', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('26', '1', '-1', '1', '1', '1', '管理員', '2016-09-02', '2016-09-02 13:48:12', null, '1', '1', '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('28', '1', '-3', '1', '1', '0', '管理員', '2016-09-02', '2016-09-02 21:29:42', null, '1', '1', '4', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('29', '2', '-2', '1', '1', '0', '管理員', '2016-09-02', '2016-09-02 21:29:42', null, '1', '1', '4', '1', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('30', '2', '3', '1', '0', '0', '管理員', '2016-09-03', '2016-09-03 22:54:31', null, '0', '1', '5', '0', '個', '12.00');
INSERT INTO `xinhu_goodss` VALUES ('31', '2', '-1', '1', '1', '0', '管理員', '2017-02-09', '2017-02-09 16:16:12', null, '0', '1', '6', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('32', '1', '2', '1', '0', '0', '管理員', null, '2017-05-02 13:35:17', null, '0', '1', '7', '0', '月', '3000.00');
INSERT INTO `xinhu_goodss` VALUES ('33', '3', '2', '1', '0', '0', '管理員', null, '2017-05-02 13:35:17', null, '0', '1', '7', '1', '台', '1200.00');
INSERT INTO `xinhu_goodss` VALUES ('34', '2', '-1', '1', '1', '0', '管理員', '2017-05-02', '2017-05-02 14:03:10', null, '1', '1', '8', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('35', '3', '-1', '1', '1', '0', '管理員', '2017-05-02', '2017-05-02 14:03:10', null, '1', '1', '8', '1', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('36', '4', '22', '1', '0', '0', '管理員', '2017-07-05', '2017-10-14 22:49:59', null, '0', '1', '9', '0', '支', '1.50');
INSERT INTO `xinhu_goodss` VALUES ('37', '1', '-2', '4', '1', '0', '大喬', '2017-08-10', '2017-08-10 10:29:36', null, '0', '4', '10', '0', null, '0.00');

-- ----------------------------
-- Table structure for `xinhu_group`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_group`;
CREATE TABLE `xinhu_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '組名',
  `sort` tinyint(4) DEFAULT '0',
  `ispir` tinyint(4) DEFAULT '1' COMMENT '是否權限驗證',
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系統組';

-- ----------------------------
-- Records of xinhu_group
-- ----------------------------
INSERT INTO `xinhu_group` VALUES ('1', '組1', '1', '1', '2014-09-04 17:33:47');
INSERT INTO `xinhu_group` VALUES ('2', '組名', '2', '1', '2014-09-04 17:33:56');

-- ----------------------------
-- Table structure for `xinhu_homeitems`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_homeitems`;
CREATE TABLE `xinhu_homeitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名稱',
  `num` varchar(30) NOT NULL COMMENT '編號',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(500) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `row` tinyint(1) DEFAULT '0' COMMENT '所在位置',
  PRIMARY KEY (`id`,`num`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='桌面項目表';

-- ----------------------------
-- Records of xinhu_homeitems
-- ----------------------------
INSERT INTO `xinhu_homeitems` VALUES ('1', '快捷入口', 'kjrk', null, null, '0', '1', '0');
INSERT INTO `xinhu_homeitems` VALUES ('2', '通知公告', 'gong', null, null, '1', '1', '0');
INSERT INTO `xinhu_homeitems` VALUES ('3', '考勤打卡', 'kqdk', null, null, '2', '1', '0');
INSERT INTO `xinhu_homeitems` VALUES ('4', '微信辦公', 'gwwx', 'u1', '管理員', '10', '1', '0');
INSERT INTO `xinhu_homeitems` VALUES ('5', '我的申請', 'apply', null, null, '0', '1', '1');
INSERT INTO `xinhu_homeitems` VALUES ('6', '今日會議', 'meet', null, null, '2', '1', '1');
INSERT INTO `xinhu_homeitems` VALUES ('7', '系統日志', 'syslog', 'u1', '管理員', '3', '1', '1');
INSERT INTO `xinhu_homeitems` VALUES ('8', '關于信呼', 'about', 'u1', '管理員', '10', '1', '1');

-- ----------------------------
-- Table structure for `xinhu_hrcheck`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrcheck`;
CREATE TABLE `xinhu_hrcheck` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `uname` varchar(20) DEFAULT NULL COMMENT '對應人',
  `month` varchar(50) DEFAULT '{month}' COMMENT '月份',
  `content` varchar(2000) DEFAULT NULL COMMENT '考核內容',
  `fenzp` decimal(6,2) DEFAULT '0.00' COMMENT '自評分數',
  `fensj` decimal(6,2) DEFAULT '0.00' COMMENT '上級評分',
  `fenrs` decimal(6,2) DEFAULT '0.00' COMMENT '人事評分',
  `fen` decimal(6,2) DEFAULT '0.00' COMMENT '最後得分',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考核評分表';

-- ----------------------------
-- Records of xinhu_hrcheck
-- ----------------------------
INSERT INTO `xinhu_hrcheck` VALUES ('1', '1', '2017-10-13 23:16:59', '1', '管理員', '2017-10-13', null, '1', '1', null, '2017-10', '開發新功能', '100.00', '60.00', '75.00', '83.75');
INSERT INTO `xinhu_hrcheck` VALUES ('2', '6', '2017-10-14 11:32:28', '6', '張飛', '2017-10-14', null, '0', '1', null, '2017-10', '開發開發開啦啦啦', '22.00', '0.00', '0.00', '0.00');

-- ----------------------------
-- Table structure for `xinhu_hrpositive`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrpositive`;
CREATE TABLE `xinhu_hrpositive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '職位',
  `entrydt` date DEFAULT NULL COMMENT '入職日期',
  `syenddt` date DEFAULT NULL COMMENT '試用到期日',
  `positivedt` date DEFAULT NULL COMMENT '轉正日期',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待審核,1|審核通過,2|審核不通過',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='HR轉正';

-- ----------------------------
-- Records of xinhu_hrpositive
-- ----------------------------
INSERT INTO `xinhu_hrpositive` VALUES ('1', '1', '項目主管', '2016-07-01', '2016-10-01', '2016-10-02', '2016-10-06 20:58:38', '工作認真。', '1', '1', '1', '1', '管理員', '2016-10-06');

-- ----------------------------
-- Table structure for `xinhu_hrredund`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrredund`;
CREATE TABLE `xinhu_hrredund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '職位',
  `entrydt` date DEFAULT NULL COMMENT '入職日期',
  `quitdt` date DEFAULT NULL COMMENT '離職日期',
  `redundtype` varchar(20) DEFAULT NULL COMMENT '離職類型',
  `redundreson` varchar(100) DEFAULT NULL COMMENT '離職原因',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待審核,1|審核通過,2|審核不通過',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='離職申請';

-- ----------------------------
-- Records of xinhu_hrredund
-- ----------------------------
INSERT INTO `xinhu_hrredund` VALUES ('1', '1', '項目主管', '2016-07-01', '2016-10-31', '自動離職', '不想做了，呵呵呵', '2016-10-07 11:42:01', null, '0', '1', '0', '1', '管理員', '2016-10-07');

-- ----------------------------
-- Table structure for `xinhu_hrsalary`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrsalary`;
CREATE TABLE `xinhu_hrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `xuid` smallint(6) DEFAULT '0',
  `uname` varchar(20) DEFAULT NULL COMMENT '對應人',
  `udeptname` varchar(20) DEFAULT NULL COMMENT '對應人員部門',
  `ranking` varchar(20) DEFAULT NULL COMMENT '職位',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `month` varchar(10) NOT NULL COMMENT '月份',
  `base` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '基本工資',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '實發',
  `postjt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '職務津貼',
  `skilljt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '技能津貼',
  `travelbt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交通補貼',
  `telbt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '通信補貼',
  `reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '獎勵',
  `punish` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '處罰',
  `socials` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '個人社保',
  `taxes` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '個人所得稅',
  `ispay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否發放',
  `otherzj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其它增加',
  `otherjs` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其它減少',
  `cidao` smallint(6) NOT NULL DEFAULT '0' COMMENT '遲到(次)',
  `cidaos` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '遲到處罰',
  `zaotui` smallint(6) NOT NULL DEFAULT '0' COMMENT '早退(次)',
  `zaotuis` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '早退處罰',
  `leave` smallint(6) NOT NULL DEFAULT '0' COMMENT '請假(小時)',
  `leaves` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '請假減少',
  `jiaban` smallint(6) NOT NULL DEFAULT '0' COMMENT '加班(小時)',
  `jiabans` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加班補貼',
  `weidk` smallint(6) NOT NULL DEFAULT '0' COMMENT '未打卡(次)',
  `weidks` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未打卡減少',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='工資表';

-- ----------------------------
-- Records of xinhu_hrsalary
-- ----------------------------
INSERT INTO `xinhu_hrsalary` VALUES ('1', '1', '5', '磐石', '管理層', '董事長', '2016-10-10 20:13:37', '1', '管理員', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '10269.00', '8500.00', '200.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('2', '1', '1', '管理員', '開發部', '項目主管', '2016-10-10 20:14:07', '1', '管理員', '2016-10-10', null, '1', '1', '2016-08', '1500.00', '8211.00', '6500.00', '20.00', '322.00', '50.00', '0.00', '0.00', '181.00', '0.00', '1', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('3', '1', '9', '李四', '開發部', '程序員', '2016-10-10 20:14:49', '1', '管理員', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '9139.00', '5500.00', '2000.00', '300.00', '20.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('4', '1', '4', '大喬', '行政人事部', '人事主管', '2016-10-10 20:15:34', '1', '管理員', '2016-10-10', null, '1', '1', '2016-08', '1500.00', '6069.00', '3500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('5', '1', '3', '小喬', '財務部', '出納', '2016-10-10 20:16:13', '1', '管理員', '2016-10-10', null, '1', '1', '2016-08', '1500.00', '5069.00', '2500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('11', '1', '5', '磐石', '管理層', '董事長', '2016-10-10 21:06:00', '1', '管理員', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '10269.00', '8500.00', '200.00', '200.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('12', '1', '1', '管理員', '開發部', '項目主管', '2016-10-10 21:06:00', '1', '管理員', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '8211.00', '6500.00', '20.00', '322.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('13', '1', '9', '李四', '開發部', '程序員', '2016-10-10 21:06:00', '1', '管理員', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '9139.00', '5500.00', '2000.00', '300.00', '20.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('14', '1', '4', '大喬', '行政人事部', '人事主管', '2016-10-10 21:06:00', '1', '管理員', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '6069.00', '3500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('15', '1', '3', '小喬', '財務部', '出納', '2016-10-10 21:06:23', '1', '管理員', '2016-10-10', null, '1', '1', '2016-09', '1500.00', '5069.00', '2500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('16', '1', '2', '貂蟬', '財務部', '財務總監', '2016-10-19 21:24:55', '1', '管理員', '2016-10-10', '2016-08-08入職;', '1', '1', '2016-08', '1500.00', '5569.00', '3500.00', '500.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('21', '1', '2', '貂蟬', '財務部', '財務總監', '2017-09-06 20:57:46', '1', '管理員', '2017-09-06', '本月薪資', '1', '1', '2017-08', '1700.00', '5700.00', '500.00', '3500.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('22', '1', '4', '大喬', '行政人事部', '人事主管', '2017-09-06 20:57:46', '1', '管理員', '2017-09-06', '本月薪資', '0', '1', '2017-08', '1700.00', '5200.00', '500.00', '3000.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('23', '1', '3', '小喬', '財務部', '出納', '2017-09-06 20:57:46', '1', '管理員', '2017-09-06', '導入', '0', '1', '2017-08', '1700.00', '4695.00', '500.00', '2500.00', '0.00', '0.00', '0.00', '5.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('24', '1', '3', '小喬', '財務部', '出納', '2017-09-06 21:00:14', '1', '管理員', '2017-09-06', '導入', '1', '1', '2017-07', '1700.00', '4695.00', '500.00', '2500.00', '0.00', '0.00', '0.00', '5.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');

-- ----------------------------
-- Table structure for `xinhu_hrtransfer`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrtransfer`;
CREATE TABLE `xinhu_hrtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `tranuid` smallint(6) DEFAULT '0',
  `tranname` varchar(20) DEFAULT NULL COMMENT '要調動人',
  `trantype` varchar(20) DEFAULT NULL COMMENT '調動類型',
  `olddeptname` varchar(50) DEFAULT NULL COMMENT '原來部門',
  `oldranking` varchar(20) DEFAULT NULL COMMENT '原來職位',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `newdeptname` varchar(50) DEFAULT NULL COMMENT '調動後部門',
  `newdeptid` smallint(6) DEFAULT NULL,
  `newranking` varchar(20) DEFAULT NULL COMMENT '調動後職位',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已完成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='職位調動';

-- ----------------------------
-- Records of xinhu_hrtransfer
-- ----------------------------
INSERT INTO `xinhu_hrtransfer` VALUES ('1', '1', '2016-10-19 22:03:12', '1', '管理員', '2016-10-19', null, '1', '1', '5', '磐石', '平調', '管理層', '董事長', '2016-10-19', '財務部', '3', 'CEO', '1');

-- ----------------------------
-- Table structure for `xinhu_hrtrsalary`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrtrsalary`;
CREATE TABLE `xinhu_hrtrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `floats` smallint(6) DEFAULT '0' COMMENT '調薪幅度',
  `ranking` varchar(20) DEFAULT NULL COMMENT '職位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='調薪申請';

-- ----------------------------
-- Records of xinhu_hrtrsalary
-- ----------------------------
INSERT INTO `xinhu_hrtrsalary` VALUES ('1', '1', '2016-10-20 22:20:41', '1', '管理員', '2016-11-01', '122121', '0', '1', '2016-10-19', '500', '項目主管');

-- ----------------------------
-- Table structure for `xinhu_im_group`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_group`;
CREATE TABLE `xinhu_im_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名稱',
  `pid` smallint(6) DEFAULT '0' COMMENT '對應上級',
  `types` varchar(10) DEFAULT NULL COMMENT '應用分類',
  `type` tinyint(1) DEFAULT '0' COMMENT '類型@0|群,1|討論組,2|應用',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `createid` int(11) DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL COMMENT '創建人',
  `createdt` datetime DEFAULT NULL COMMENT '創建時間',
  `face` varchar(50) DEFAULT NULL COMMENT '頭像',
  `num` varchar(20) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `explain` varchar(200) DEFAULT NULL,
  `iconfont` varchar(30) DEFAULT NULL COMMENT '對應字體圖標',
  `iconcolor` varchar(7) DEFAULT NULL COMMENT '字體圖標顏色',
  `yylx` tinyint(1) DEFAULT '0' COMMENT '應用類型0全部,1pc,2手機',
  `urlpc` varchar(200) DEFAULT NULL COMMENT '應用上PC地址',
  `urlm` varchar(200) DEFAULT NULL COMMENT '應用上手機端地址',
  `deptid` varchar(100) DEFAULT NULL COMMENT '對應部門id',
  PRIMARY KEY (`id`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='IM會話表';

-- ----------------------------
-- Records of xinhu_im_group
-- ----------------------------
INSERT INTO `xinhu_im_group` VALUES ('1', '信呼團隊', '0', '官網', '2', '0', null, null, null, 'images/xinhus.png', 'xinhu', null, null, 'link', '1', null, 'cf-c90', '#1ABC9C', '0', 'http://www.rockoa.com/', null, null);
INSERT INTO `xinhu_im_group` VALUES ('2', '全體人員', '0', null, '0', '0', '1', null, null, null, null, null, null, null, '1', null, null, null, '0', null, null, '1');
INSERT INTO `xinhu_im_group` VALUES ('3', '通知公告', '0', '基礎', '2', '28', null, null, null, 'images/gong.png', 'gong', null, null, 'link', '1', null, 'xiaolaba', '#f25e94', '0', 'gong', null, null);
INSERT INTO `xinhu_im_group` VALUES ('4', '會議', '0', '基礎', '2', '27', null, null, null, 'images/meet.png', 'meet', null, null, 'auto', '1', null, 'huiyi-copy', '#fc6419', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('7', '工作日報', '0', '基礎', '2', '26', null, null, '2015-06-25 16:03:34', 'images/daily.png', 'daily', null, null, 'auto', '1', null, 'ribaojindu', '#578dc4', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('12', '任務', '0', '流程', '2', '8', '1', '管理員', '2015-09-10 13:38:07', 'images/work.png', 'work', null, null, 'auto', '1', null, 'renwu', '#91cd4a', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('13', '萬年歷', '0', '基礎', '2', '25', null, null, null, 'images/calendar.png', 'calendar', null, null, 'link', '1', null, 'rili', '#e0815c', '0', 'http://www.rili123.cn/rili123.htm', null, null);
INSERT INTO `xinhu_im_group` VALUES ('14', '高管群', '0', null, '0', '0', null, null, null, null, null, null, null, null, '1', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('15', '流程申請', '0', '流程', '2', '10', null, null, null, 'images/flow.png', 'flow', null, null, 'buin', '1', null, 'shenqingliuchengicon', '#3fbfc2', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('16', '流程待辦', '0', '流程', '2', '11', null, null, null, 'images/daiban.png', 'daiban', null, null, 'link', '1', null, 'daiban', '#33b5e5', '0', 'daiban', null, null);
INSERT INTO `xinhu_im_group` VALUES ('17', '客戶管理', '0', '客戶', '2', '51', null, null, null, 'images/crm.png', 'customer', null, null, 'auto', '1', null, 'kehu', '#2e98f1', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('18', '客戶主頁', '0', '客戶', '2', '50', null, null, null, 'images/crm.png', 'crmindex', null, null, 'link', '1', null, 'kehu', '#2e98f1', '1', 'crmindex', null, null);
INSERT INTO `xinhu_im_group` VALUES ('19', '銷售機會', '0', '客戶', '2', '52', null, null, null, 'images/sale.png', 'custsale', null, null, 'auto', '1', null, 'xiaoshou', '#5c8fba', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('20', '文檔', '0', '資源', '2', '31', null, null, null, 'images/folder.png', 'word', null, null, 'buin', '1', null, 'wenjian-copy', '#f5d95a', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('21', '日程', '0', '基礎', '2', '23', null, null, null, 'images/bwl2.png', 'schedule', null, null, 'link', '1', null, 'richeng', '#158aad', '0', 'schedule', null, null);
INSERT INTO `xinhu_im_group` VALUES ('24', '外出出差', '0', '考勤', '2', '7', null, null, null, 'images/waichu.png', 'waichu', null, null, 'auto', '1', null, 'waichu', '#cc9999', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('26', '郵件', '0', '基礎', '2', '22', null, null, null, 'images/email.png', 'emailm', null, null, 'link', '1', null, 'youjian', '#7CD3B0', '0', 'email', null, null);
INSERT INTO `xinhu_im_group` VALUES ('27', '知識信息', '0', '資源', '2', '32', null, null, null, 'images/zhishi.png', 'knowledge', null, null, 'auto', '1', null, 'knowledge', '#F28794', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('5', '通訊錄', '0', '基礎', '2', '21', null, null, null, 'images/tongxunlu.png', 'user', null, null, 'link', '1', null, 'tongxunlu', '#B28649', '0', 'reimtxl', null, null);
INSERT INTO `xinhu_im_group` VALUES ('28', '考勤信息', '0', '考勤', '2', '5', null, null, null, 'images/kaoqin.png', 'kqdkjl', null, null, 'auto', '1', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('29', '考勤打卡', '0', '考勤', '2', '4', null, null, null, 'images/adddk.png', 'kqdaka', null, null, 'link', '1', null, null, null, '0', null, '?d=we&m=ying&a=daka', null);
INSERT INTO `xinhu_im_group` VALUES ('30', '考勤統計', '0', '考勤', '2', '6', null, null, null, 'images/kaoqin.png', 'kqtotal', null, null, 'auto', '1', null, null, null, '2', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('31', '開發部', '0', null, '0', '1', null, null, null, null, null, null, null, null, '1', null, null, null, '0', null, null, '2');
INSERT INTO `xinhu_im_group` VALUES ('32', '題庫', '0', '資源', '2', '33', null, null, null, 'images/tiku.png', 'knowtiku', null, null, 'auto', '1', null, 'tiku', '#fb2b16', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('33', '培訓考試', '0', '資源', '2', '34', null, null, null, 'images/kaoshi.png', 'kaoshi', null, null, 'auto', '1', null, 'kaoshi', '#4f68b0', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('34', '客戶合同', '0', '客戶', '2', '53', null, null, null, 'images/hetong.png', 'custract', null, null, 'auto', '1', null, 'kehu-kehuhetong', '#4ca2fa', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('35', '收款單', '0', '客戶', '2', '54', null, null, null, 'images/skuan.png', 'custfina', null, null, 'auto', '1', null, 'achargeaudit', '#339966', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('36', '付款單', '0', '客戶', '2', '55', null, null, null, 'images/fkuan.png', 'custfkd', null, null, 'auto', '1', null, 'apayaudit', '#cf9d31', '0', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('38', '工資條', '0', '基礎', '2', '29', null, null, null, 'images/gzt.png', 'hrsalary', null, null, 'auto', '1', null, null, '#FF6666', '2', null, null, null);
INSERT INTO `xinhu_im_group` VALUES ('39', '申請流程', '0', '流程', '2', '12', null, null, null, 'images/jia.png', 'flowapply', null, null, 'link', '1', null, null, null, '0', null, '?d=we&m=flow&a=apply', null);
INSERT INTO `xinhu_im_group` VALUES ('40', '訂閱報表', '0', '基礎', '2', '30', null, null, null, 'images/work.png', 'subscribeinfo', null, null, 'auto', '1', null, null, null, '0', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_im_groupuser`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_groupuser`;
CREATE TABLE `xinhu_im_groupuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gid` smallint(6) NOT NULL DEFAULT '0',
  `uid` smallint(6) NOT NULL DEFAULT '0',
  `istx` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COMMENT='IM會話人員';

-- ----------------------------
-- Records of xinhu_im_groupuser
-- ----------------------------
INSERT INTO `xinhu_im_groupuser` VALUES ('75', '2', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('19', '0', '0', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('77', '14', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('65', '2', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('64', '2', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('45', '26', '9', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('73', '14', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('44', '26', '8', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('23', '2', '8', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('43', '26', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('74', '2', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('76', '2', '4', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('70', '14', '5', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('78', '2', '3', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('79', '31', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('80', '31', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('81', '31', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('82', '31', '8', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('95', '2', '5', '1');

-- ----------------------------
-- Table structure for `xinhu_im_history`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_history`;
CREATE TABLE `xinhu_im_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0',
  `uid` smallint(6) DEFAULT NULL,
  `sendid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `cont` varchar(200) DEFAULT NULL,
  `stotal` smallint(6) DEFAULT '0',
  `title` varchar(50) DEFAULT NULL COMMENT '推送時標題',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`receid`,`uid`),
  KEY `optdt` (`optdt`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='IM會話記錄歷史表';

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('1', 'group', '2', '2', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('2', 'group', '2', '7', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('3', 'group', '2', '6', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('4', 'group', '2', '8', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('5', 'group', '2', '5', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('6', 'group', '2', '1', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);
INSERT INTO `xinhu_im_history` VALUES ('7', 'group', '2', '4', '8', '2017-10-26 09:59:25', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '1', null);

-- ----------------------------
-- Table structure for `xinhu_im_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_menu`;
CREATE TABLE `xinhu_im_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) NOT NULL DEFAULT '0',
  `pid` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(10) DEFAULT NULL COMMENT '名稱',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0' COMMENT '1url,0事件',
  `url` varchar(300) DEFAULT NULL COMMENT '對應地址',
  `num` varchar(20) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL COMMENT '顏色',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='IM下應用菜單';

-- ----------------------------
-- Records of xinhu_im_menu
-- ----------------------------
INSERT INTO `xinhu_im_menu` VALUES ('1', '13', '0', '上月', '0', '0', 'prevmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('2', '13', '0', '當月', '0', '0', 'nowmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('3', '13', '0', '下月', '0', '0', 'nextmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('4', '3', '0', '全部信息', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('5', '3', '0', '未讀信息', '0', '0', 'wexx', 'weidu', null);
INSERT INTO `xinhu_im_menu` VALUES ('6', '12', '0', '我的任務', '0', '0', null, 'myrw', null);
INSERT INTO `xinhu_im_menu` VALUES ('7', '12', '0', '下屬任務', '0', '0', 'down', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('8', '12', '0', '＋創建任務', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('9', '3', '0', '新增公告', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('10', '4', '0', '今日會議', '0', '0', 'today', 'today', null);
INSERT INTO `xinhu_im_menu` VALUES ('11', '4', '0', '本週會議', '0', '0', 'week', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('12', '4', '0', '＋新增會議', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('13', '7', '0', '我的日報', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('14', '7', '0', '下屬日報', '0', '0', 'under', 'under', null);
INSERT INTO `xinhu_im_menu` VALUES ('15', '7', '0', '＋寫日報', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('16', '7', '14', '全部', '0', '0', 'undall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('17', '7', '14', '未讀', '1', '0', 'undwd', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('18', '1', '0', '最新信息', '0', '0', 'new', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('19', '1', '0', '＋建議反饋', '1', '1', 'http://www.rockoa.com/fankui.html', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('22', '12', '6', '我創建的', '2', '0', 'wcj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('20', '12', '6', '未完成', '0', '0', 'wwc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('21', '12', '6', '已完成', '1', '0', 'ywc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('23', '15', '0', '流程申請', '3', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('24', '15', '23', '＋請假條', '0', '1', 'add_leave', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('25', '15', '23', '＋加班單', '0', '1', 'add_jiaban', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('26', '15', '0', '我的申請', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('27', '15', '0', '處理未通過', '0', '0', 'wtg', 'mywtg', null);
INSERT INTO `xinhu_im_menu` VALUES ('28', '15', '26', '我所有申請', '0', '0', 'apply', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('29', '15', '26', '未通過', '0', '0', 'wtg', null, 'red');
INSERT INTO `xinhu_im_menu` VALUES ('30', '15', '26', '已完成', '0', '0', 'ywc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('31', '16', '0', '所有待辦', '0', '0', 'daib', 'daiban', null);
INSERT INTO `xinhu_im_menu` VALUES ('32', '16', '0', '單據查看', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('34', '16', '32', '直屬下級申請', '1', '0', 'myxia', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('33', '16', '32', '經我處理', '0', '0', 'jwcl', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('35', '12', '6', '我所有任務', '3', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('36', '19', '0', '我的銷售機會', '0', '0', null, 'gen', null);
INSERT INTO `xinhu_im_menu` VALUES ('37', '17', '40', '我的客戶', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('41', '17', '0', '新增客戶', '2', '1', 'add_customer', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('39', '17', '40', '我全部客戶', '0', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('40', '17', '0', '我的客戶', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('42', '19', '0', '新增銷售', '2', '1', 'add_custsale', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('43', '19', '36', '需跟進', '0', '0', 'mygx', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('44', '19', '36', '已成交', '1', '0', 'mycj', null, 'green');
INSERT INTO `xinhu_im_menu` VALUES ('45', '19', '36', '已丟失', '2', '0', 'myds', null, '');
INSERT INTO `xinhu_im_menu` VALUES ('46', '19', '36', '我所有銷售', '3', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('47', '17', '40', '我標★客戶', '0', '0', 'mystat', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('48', '17', '40', '我停用客戶', '0', '0', 'my_ting', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('49', '15', '26', '待處理', '0', '0', 'dcl', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('50', '20', '0', '新建文件夾', '2', '0', 'create', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('51', '20', '0', '上傳文件', '0', '0', 'up', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('52', '20', '0', '共享的', '1', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('53', '21', '0', '日程', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('54', '21', '53', '當月', '0', '0', 'nowmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('55', '21', '53', '下月', '0', '0', 'nextmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('56', '21', '0', '日程管理', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('57', '21', '0', '＋新增', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('58', '24', '87', '我今日外出', '0', '0', 'mytoday', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('59', '24', '0', '＋新增', '2', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('60', '24', '87', '我所有外出', '1', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('61', '20', '52', '我共享的', '0', '0', 'shate', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('62', '20', '52', '共享給我的', '0', '0', 'fxgw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('63', '15', '23', '更多&gt;&gt;', '0', '0', 'moreapply', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('64', '26', '0', '收件箱', '0', '0', null, 'sjx', null);
INSERT INTO `xinhu_im_menu` VALUES ('65', '26', '0', '＋寫信', '2', '1', 'add_emailm', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('66', '27', '0', '知識信息', '0', '0', 'def', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('67', '26', '0', '草稿箱', '1', '0', 'cgx', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('68', '26', '64', '未讀郵件', '0', '0', 'wdyj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('69', '26', '64', '所有郵件', '0', '0', 'sjx', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('70', '26', '64', '已發送', '0', '0', 'yfs', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('71', '5', '0', '內部通訊錄', '0', '0', 'txlmy|user', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('72', '5', '0', '個人通訊錄', '0', '0', 'def|vcard', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('73', '5', '0', '＋新增', '0', '1', 'add_vcard', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('74', '28', '0', '我的記錄', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('75', '28', '0', '考勤信息', '2', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('80', '28', '74', '我的打卡', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('77', '28', '75', '＋請假條', '0', '1', 'add_leave', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('78', '28', '75', '我的請假條', '3', '0', 'my|leave', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('79', '17', '0', '下屬客戶', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('81', '28', '82', '下屬打卡', '0', '0', 'down', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('82', '28', '0', '下屬記錄', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('83', '28', '74', '我的定位', '0', '0', 'my|kqdw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('84', '28', '82', '下屬定位', '0', '0', 'down|kqdw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('92', '19', '0', '下屬銷售機會', '1', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('85', '28', '75', '我的加班單', '4', '0', 'my|jiaban', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('86', '28', '75', '＋加班單', '1', '1', 'add_jiaban', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('87', '24', '0', '我的外出', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('88', '24', '91', '下屬所有外出', '3', '0', 'downall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('89', '1', '0', '打開官網', '0', '1', 'http://www.rockoa.com/', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('90', '24', '91', '下屬今日外出', '2', '0', 'downtoday', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('91', '24', '0', '下屬外出', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('93', '30', '0', '我的統計', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('94', '30', '0', '下屬統計', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('95', '30', '93', '當月統計', '0', '0', 'mynow', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('96', '30', '93', '上月統計', '0', '0', 'mylast', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('97', '30', '94', '當月統計', '0', '0', 'downnow', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('98', '30', '94', '上月統計', '0', '0', 'downlast', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('99', '21', '56', '我的日程', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('100', '21', '56', '提醒給我的', '1', '0', 'rece', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('101', '17', '40', '我創建', '0', '0', 'mycj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('102', '17', '40', '共享給我的', '0', '0', 'gxgw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('103', '17', '79', '下屬全部客戶', '0', '0', 'downall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('104', '17', '79', '下屬停用', '0', '0', 'downty', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('105', '17', '79', '下屬標★', '0', '0', 'downstat', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('106', '19', '92', '下屬需跟進', '0', '0', 'downgj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('107', '19', '92', '下屬已成交', '1', '0', 'downcj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('108', '19', '92', '下屬已丟失', '2', '0', 'downds', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('109', '19', '92', '所有銷售機會', '3', '0', 'downall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('110', '32', '0', '所有題庫', '0', '0', 'all', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('111', '32', '0', '未讀題庫', '1', '0', 'weidu', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('112', '33', '0', '我未考試', '0', '0', 'weiks', 'weiks', null);
INSERT INTO `xinhu_im_menu` VALUES ('113', '33', '0', '所有考試', '1', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('114', '34', '0', '我的合同', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('115', '34', '114', '我所有合同', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('116', '34', '114', '我的已過期', '1', '0', 'ygq', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('117', '34', '0', '下屬合同', '1', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('118', '34', '117', '下屬所有合同', '0', '0', 'downall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('119', '34', '117', '下屬已過期', '1', '0', 'downygq', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('120', '34', '0', '＋新增', '1', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('121', '35', '0', '我的收款單', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('122', '35', '121', '我未收款', '0', '0', 'myskdws', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('123', '35', '121', '我已收款', '1', '0', 'myskdys', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('124', '35', '121', '我所有的', '2', '0', 'myskd', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('125', '35', '0', '下屬收款單', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('126', '35', '125', '下屬未收款', '0', '0', 'downskdwsk', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('127', '35', '125', '下屬已收款', '0', '0', 'downskdys', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('128', '35', '125', '下屬所有', '0', '0', 'downskd', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('129', '35', '0', '＋新增', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('130', '36', '0', '我的付款單', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('131', '36', '130', '我未付款', '0', '0', 'myfkdwf|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('132', '36', '130', '我已付款', '1', '0', 'myfkdyf|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('133', '36', '130', '我所有的', '2', '0', 'myfkd|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('134', '36', '0', '下屬付款單', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('135', '36', '134', '下屬未付款', '0', '0', 'downfkdwf|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('136', '36', '134', '下屬已付款', '0', '0', 'downfkdyf|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('137', '36', '134', '下屬所有', '0', '0', 'downfkd|custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('138', '36', '0', '＋新增', '0', '1', 'add_custfina', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('139', '38', '0', '我的工資', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('140', '40', '0', '給我的訂閱', '0', '0', 'my', null, null);

-- ----------------------------
-- Table structure for `xinhu_im_mess`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_mess`;
CREATE TABLE `xinhu_im_mess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optdt` datetime DEFAULT NULL,
  `zt` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `cont` varchar(4000) DEFAULT NULL COMMENT '內容',
  `sendid` smallint(6) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0' COMMENT '接收',
  `receuid` varchar(4000) DEFAULT NULL COMMENT '接收用戶id',
  `type` varchar(20) DEFAULT NULL COMMENT '信息類型',
  `url` varchar(1000) DEFAULT NULL COMMENT '相關地址',
  `fileid` int(11) NOT NULL DEFAULT '0' COMMENT '對應文件Id',
  `msgid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optdt` (`optdt`,`receid`),
  KEY `msgid` (`msgid`),
  KEY `type` (`type`,`receid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='IM聊天記錄表';

-- ----------------------------
-- Records of xinhu_im_mess
-- ----------------------------
INSERT INTO `xinhu_im_mess` VALUES ('1', '2017-10-26 09:59:25', '1', '5aSn5a625pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZWK77yB', '8', '2', '2,7,6,8,5,1,4', 'group', null, '0', null);

-- ----------------------------
-- Table structure for `xinhu_im_messzt`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_messzt`;
CREATE TABLE `xinhu_im_messzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '信息id',
  `uid` int(11) DEFAULT NULL COMMENT '人員id',
  `gid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='IM聊天消息狀態表';

-- ----------------------------
-- Records of xinhu_im_messzt
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_infor`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_infor`;
CREATE TABLE `xinhu_infor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `typename` varchar(20) DEFAULT NULL,
  `content` text,
  `url` varchar(200) DEFAULT NULL,
  `receid` varchar(2000) DEFAULT NULL COMMENT '接收人Id',
  `recename` varchar(4000) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `enddt` datetime DEFAULT NULL COMMENT '截止時間',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `zuozhe` varchar(30) DEFAULT NULL COMMENT '發布者',
  `indate` date DEFAULT NULL COMMENT '日期',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `fengmian` varchar(100) DEFAULT NULL COMMENT '封面圖片',
  `mintou` smallint(6) DEFAULT '0' COMMENT '至少投票',
  `maxtou` smallint(6) DEFAULT '0' COMMENT '最多投投票0不限制',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通知公告';

-- ----------------------------
-- Records of xinhu_infor
-- ----------------------------
INSERT INTO `xinhu_infor` VALUES ('1', '歡迎使用信呼工作台', '2017-05-17 20:06:03', '通知公告', '<p>\n	歡迎使用，有任何問題可以隨時聯系我們，幫你解答哦。&nbsp;\n</p>\n<p>\n	信呼是一款開源免費的工作台軟件，可添加應用，管理，pc上，app都可以使用，我們的代碼全部開放，可自由使用。\n</p>', null, 'u1,u2,u3,u4,u5,u6,u7,u8,u9', null, '1', '管理員', null, null, '信呼開發團隊', '2016-08-01', '1', null, '0', '0');
INSERT INTO `xinhu_infor` VALUES ('2', '關于寫日報制度說明', '2017-05-17 20:06:00', '規則制度', '<p>\n	1、每個人工作日在下班後必須寫工作日報，全天請假可不用寫，只要有上班就需要寫，即使你上班1分鐘。\n</p>\n<p>\n	2、也可以隔天寫。\n</p>\n<p>\n	<strong>未寫處罰</strong> \n</p>\n<p>\n	1、未寫一次扣五塊，累計加倍。\n</p>', null, 'u1,u2,u3,u4,u5,u6,u7,u8,u9', null, '1', '管理員', null, null, '人力行政部', '2016-08-01', '1', null, '0', '0');
INSERT INTO `xinhu_infor` VALUES ('8', '關于系統升級問題', '2016-10-26 19:50:50', '通知公告', '<span>關于系統升級問題</span><span></span>', null, 'u6,u8', '張飛,信呼客服', '1', '管理員', null, null, '開發部', '2016-10-26', '1', null, '0', '0');
INSERT INTO `xinhu_infor` VALUES ('6', '信呼更新發布V1.6.0版本！', '2017-10-26 09:34:55', '通知公告', '<p>\n	版本添加了發布如下功能。\n</p>\n<p>\n	1、系統功能完善。\n</p>\n<p>\n	2、更新了很多，自己看<a href=\"http://www.rockoa.com/view_core.html\" target=\"_blank\">升級日志</a>。\n</p>', null, 'd2', '開發部', '1', '管理員', null, null, '信呼開發團隊', '2017-10-26', '1', 'images/logo.png', '0', '0');
INSERT INTO `xinhu_infor` VALUES ('9', '你們覺得這個系統如何？', '2017-08-29 10:25:24', '通知公告', '開始投票拉。', null, 'd1', '信呼開發團隊', '1', '管理員', '2018-08-31 12:42:00', '2017-08-26 12:42:00', '開發部', '2017-08-26', '1', null, '1', '1');

-- ----------------------------
-- Table structure for `xinhu_infors`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_infors`;
CREATE TABLE `xinhu_infors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '對應主表infor.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `touitems` varchar(200) DEFAULT NULL COMMENT '投票選項',
  `touci` int(11) DEFAULT '0' COMMENT '得到票數',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='信息子表投票項';

-- ----------------------------
-- Records of xinhu_infors
-- ----------------------------
INSERT INTO `xinhu_infors` VALUES ('1', '9', '0', '好', '1');
INSERT INTO `xinhu_infors` VALUES ('2', '9', '1', '很好', '3');
INSERT INTO `xinhu_infors` VALUES ('3', '9', '2', '非常好', '4');

-- ----------------------------
-- Table structure for `xinhu_knowledge`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_knowledge`;
CREATE TABLE `xinhu_knowledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `typeid` smallint(6) DEFAULT '0' COMMENT '對應分類',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `content` text,
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='知識信息';

-- ----------------------------
-- Records of xinhu_knowledge
-- ----------------------------
INSERT INTO `xinhu_knowledge` VALUES ('1', '如果提供工作效率！', '199', '0', '<p>\n	1、加班。\n</p>\n<p>\n	2、加班。\n</p>\n<p>\n	3、在加班。\n</p>', '2016-10-24 22:14:26', '管理員', '2016-10-24 22:05:24');

-- ----------------------------
-- Table structure for `xinhu_knowtiku`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_knowtiku`;
CREATE TABLE `xinhu_knowtiku` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL COMMENT '標題',
  `typeid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0單選,1多選',
  `ana` varchar(300) DEFAULT NULL COMMENT '答案A',
  `anb` varchar(300) DEFAULT NULL COMMENT '答案B',
  `anc` varchar(300) DEFAULT NULL COMMENT '答案C',
  `and` varchar(300) DEFAULT NULL COMMENT '答案D',
  `answer` varchar(10) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `content` varchar(1000) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='知識題庫';

-- ----------------------------
-- Records of xinhu_knowtiku
-- ----------------------------
INSERT INTO `xinhu_knowtiku` VALUES ('1', '我們開源系統的名稱是？', '227', '0', '信呼', '呼信', '信乎', '信信', 'A', '0', '2016-10-27 21:33:24', '2016-10-27 21:52:48', null, '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('2', '信呼官網域名是？', '227', '1', 'xh829.com', 'bbs.xh829.com', 'www.rockoa.com', 'www.xh829.com', 'C', '0', '2016-10-27 21:43:04', '2017-08-20 14:03:51', null, '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('3', '信呼第一版本發布時間', '227', '0', '2016.01', '2016.07', '2016.06', '不知道', 'C', '0', '2016-10-27 22:14:09', '2016-10-27 22:14:09', '呵呵，其實我也不知道！', '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('4', 'PHP使用輸出方式', '295', '1', 'echo', 'exit', 'print', 'die', 'AC', '0', '2017-05-09 20:08:51', '2017-05-09 20:10:49', null, '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('8', '信呼要求PHP最低版本', '227', '0', '5.2', '5.3', '5.4', '5.5', 'B', '0', '2017-08-20 14:02:05', '2017-08-20 14:02:05', '詳見官網說明使用', '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('9', '信呼要求MySql最低版本', '227', '0', '5', '5.3', '5.4', '5.5', 'D', '0', '2017-08-20 14:02:05', '2017-08-20 14:02:05', '詳見官網說明使用', '1', null, '1');
INSERT INTO `xinhu_knowtiku` VALUES ('10', 'PHP如何連接數據庫方式', '295', '0', 'mysql', 'mysqli', 'pdo', 'mssql', 'ABC', '0', '2017-08-20 14:02:05', '2017-08-20 14:02:05', 'D選項為別的數據庫', '1', null, '1');

-- ----------------------------
-- Table structure for `xinhu_knowtraim`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_knowtraim`;
CREATE TABLE `xinhu_knowtraim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `optid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `dxshu` smallint(6) DEFAULT '0' COMMENT '多選題目數量',
  `dsshu` smallint(6) DEFAULT '0' COMMENT '單選題目數量',
  `reshu` smallint(6) DEFAULT '0' COMMENT '培訓人數',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `enddt` datetime DEFAULT NULL COMMENT '截止時間',
  `kstime` smallint(6) DEFAULT '0' COMMENT '考試時間(分鐘)',
  `ydshu` smallint(6) DEFAULT '0' COMMENT '已答題人數',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL COMMENT '發給誰培訓',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `state` tinyint(1) DEFAULT '0' COMMENT '0還沒開始,1考試中,2已結束',
  `zfenshu` int(11) DEFAULT '0' COMMENT '總分',
  `hgfen` int(11) DEFAULT '0' COMMENT '合格分數',
  `tikuid` varchar(200) DEFAULT NULL,
  `tikuname` varchar(200) DEFAULT NULL COMMENT '對應題庫',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='培訓表出題考試';

-- ----------------------------
-- Records of xinhu_knowtraim
-- ----------------------------
INSERT INTO `xinhu_knowtraim` VALUES ('1', '新員工培訓考試', '1', '管理員', '2017-05-16 21:43:31', '3', '4', '5', '2017-05-17 11:34:00', '2017-06-17 21:08:30', '30', '2', '1', 'd2', '開發部', null, '2', '100', '60', null, null);
INSERT INTO `xinhu_knowtraim` VALUES ('2', '貫徹樓市投資培訓。', '1', '管理員', '2017-05-19 16:11:25', '3', '2', '9', '2017-05-19 14:00:00', '2017-05-22 16:07:00', '10', '1', '1', 'd1', '信呼開發團隊', null, '2', '100', '60', null, null);
INSERT INTO `xinhu_knowtraim` VALUES ('3', 'PHP筆試考試', '1', '管理員', '2017-05-20 14:31:55', '2', '0', '9', '2017-05-20 14:23:00', '2017-05-26 14:23:00', '10', '1', '1', 'd1', '信呼開發團隊', null, '2', '100', '60', '294,296', '技術姿勢,JS知識');

-- ----------------------------
-- Table structure for `xinhu_knowtrais`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_knowtrais`;
CREATE TABLE `xinhu_knowtrais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `kssdt` datetime DEFAULT NULL COMMENT '考試時間',
  `ksedt` datetime DEFAULT NULL COMMENT '考試結束時間',
  `fenshu` smallint(6) DEFAULT '0' COMMENT '得分',
  `kstime` int(11) DEFAULT '0' COMMENT '考試時間(秒數)',
  `isks` tinyint(1) DEFAULT '0' COMMENT '是否已考試',
  `tkids` varchar(2000) DEFAULT NULL COMMENT '考試題目id',
  `dyids` varchar(1000) DEFAULT NULL COMMENT '我做題得到答案',
  `dyjgs` varchar(1000) DEFAULT NULL COMMENT '答題結果0未答,1正確,2錯誤',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mid` (`mid`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='考試培訓子表';

-- ----------------------------
-- Records of xinhu_knowtrais
-- ----------------------------
INSERT INTO `xinhu_knowtrais` VALUES ('1', '1', '1', '2017-05-19 14:53:12', '2017-05-19 14:53:29', '71', '17', '1', '5,1,3,6,4,2,7', 'B,A,C,C,AC,BC,ABC', '1,1,1,2,1,2,1');
INSERT INTO `xinhu_knowtrais` VALUES ('9', '1', '9', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('8', '1', '8', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('7', '1', '7', '2017-05-19 15:42:39', '2017-05-19 15:42:58', '57', '19', '1', '3,1,6,5,4,2,7', 'B,A,D,B,AC,B,C', '2,1,1,1,1,2,2');
INSERT INTO `xinhu_knowtrais` VALUES ('6', '1', '6', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('11', '2', '2', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('10', '2', '1', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('12', '2', '3', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('13', '2', '4', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('14', '2', '5', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('15', '2', '6', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('16', '2', '7', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('17', '2', '8', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('18', '2', '9', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('19', '3', '1', '2017-05-20 14:32:04', '2017-05-20 14:32:12', '50', '9', '1', '7,4', 'B,AC', '2,1');
INSERT INTO `xinhu_knowtrais` VALUES ('20', '3', '2', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('21', '3', '3', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('22', '3', '4', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('23', '3', '5', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('24', '3', '6', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('25', '3', '7', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('26', '3', '8', null, null, '0', '0', '0', null, null, null);
INSERT INTO `xinhu_knowtrais` VALUES ('27', '3', '9', null, null, '0', '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_kqanay`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqanay`;
CREATE TABLE `xinhu_kqanay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `uid` smallint(6) DEFAULT NULL COMMENT '人員id',
  `ztname` varchar(20) DEFAULT NULL COMMENT '狀態名稱',
  `time` datetime DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL COMMENT '狀態名稱',
  `states` varchar(20) DEFAULT NULL COMMENT '其他狀態,如請假',
  `sort` smallint(6) DEFAULT '0',
  `iswork` tinyint(4) DEFAULT '1' COMMENT '是否工作日',
  `emiao` int(11) DEFAULT '0' COMMENT '秒數',
  `optdt` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dt` (`dt`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考勤分析';

-- ----------------------------
-- Records of xinhu_kqanay
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_kqdist`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdist`;
CREATE TABLE `xinhu_kqdist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(200) DEFAULT NULL,
  `receid` varchar(20) DEFAULT NULL,
  `mid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0考勤時間,1休息,2定位的',
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `sort` int(11) DEFAULT '0' COMMENT '排序號',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='考勤分配表';

-- ----------------------------
-- Records of xinhu_kqdist
-- ----------------------------
INSERT INTO `xinhu_kqdist` VALUES ('1', '信呼開發團隊', 'd1', '1', '0', '2010-01-01', '2021-09-30', '1', '1');
INSERT INTO `xinhu_kqdist` VALUES ('4', '信呼開發團隊', 'd1', '1', '1', '2014-08-01', '2021-08-31', '1', '0');
INSERT INTO `xinhu_kqdist` VALUES ('5', '信呼開發團隊', 'd1', '1', '2', '2016-11-01', '2017-12-31', '1', '0');
INSERT INTO `xinhu_kqdist` VALUES ('6', '信呼客服', 'u8', '33', '0', '2017-05-01', '2017-05-16', '1', '0');
INSERT INTO `xinhu_kqdist` VALUES ('7', '信呼客服', 'u8', '21', '0', '2017-05-17', '2017-05-31', '1', '0');
INSERT INTO `xinhu_kqdist` VALUES ('8', '開發部', 'd2', '2', '2', '2017-05-01', '2017-05-31', '1', '0');
INSERT INTO `xinhu_kqdist` VALUES ('9', '趙子龍', 'u7', '44', '0', '2017-07-01', '2018-07-31', '1', '0');

-- ----------------------------
-- Table structure for `xinhu_kqdisv`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdisv`;
CREATE TABLE `xinhu_kqdisv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plx` tinyint(1) DEFAULT '1' COMMENT '1組排班,2人員',
  `receid` int(11) DEFAULT '0' COMMENT '組id,人員Id',
  `dt` date DEFAULT NULL COMMENT '日期',
  `type` tinyint(1) DEFAULT '0' COMMENT '0考勤時間,1休息,2工作日',
  `mid` int(11) DEFAULT '0' COMMENT '對應主ID',
  PRIMARY KEY (`id`),
  KEY `receid` (`plx`,`receid`,`dt`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考勤排班';

-- ----------------------------
-- Records of xinhu_kqdisv
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_kqdkjl`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdkjl`;
CREATE TABLE `xinhu_kqdkjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `dkdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0在線打卡,1考勤機,2手機定位,3手動添加,4異常添加,5數據導入,6接口導入',
  `address` varchar(50) DEFAULT NULL COMMENT '定位地址',
  `lat` varchar(20) DEFAULT NULL COMMENT '緯度',
  `lng` varchar(20) DEFAULT NULL COMMENT '經度',
  `accuracy` smallint(6) DEFAULT '0' COMMENT '精確範圍',
  `ip` varchar(30) DEFAULT NULL,
  `mac` varchar(30) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  `imgpath` varchar(100) DEFAULT NULL COMMENT '相關圖片',
  `snid` int(11) DEFAULT '0' COMMENT '考勤機設備id',
  `sntype` tinyint(4) DEFAULT '0' COMMENT '考勤機打卡方式0密碼,1指紋,2刷卡',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`dkdt`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='打卡記錄';

-- ----------------------------
-- Records of xinhu_kqdkjl
-- ----------------------------
INSERT INTO `xinhu_kqdkjl` VALUES ('1', '1', '2017-09-29 09:21:41', '2017-09-29 09:21:41', '0', null, null, null, '0', '192.168.1.63', null, null, null, '0', '0');

-- ----------------------------
-- Table structure for `xinhu_kqdw`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdw`;
CREATE TABLE `xinhu_kqdw` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名稱',
  `location_x` varchar(20) DEFAULT NULL,
  `location_y` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL COMMENT '位置名稱',
  `precision` int(11) DEFAULT '0' COMMENT '允許誤差米',
  `scale` smallint(6) DEFAULT '0',
  `wifiname` varchar(100) DEFAULT NULL COMMENT '打卡wifi名',
  `iswgd` tinyint(1) DEFAULT '0' COMMENT '是否為無固定地點',
  `dwids` varchar(50) DEFAULT NULL COMMENT '關聯對應ID,實現多點定位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考勤定位規則';

-- ----------------------------
-- Records of xinhu_kqdw
-- ----------------------------
INSERT INTO `xinhu_kqdw` VALUES ('1', '湖裡萬達', '24.50908107886274', '118.17822575569153', '廈門軟件園', '100', '18', null, '0', '2');
INSERT INTO `xinhu_kqdw` VALUES ('2', '軟件園', '24.485332478987026', '118.18730771541595', '望海路', '300', '15', null, '0', null);

-- ----------------------------
-- Table structure for `xinhu_kqerr`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqerr`;
CREATE TABLE `xinhu_kqerr` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `errtype` varchar(10) DEFAULT NULL COMMENT '異常類型',
  `dt` date DEFAULT NULL COMMENT '異常日期',
  `ytime` varchar(10) DEFAULT NULL COMMENT '應打卡時間',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='打卡異常申請';

-- ----------------------------
-- Records of xinhu_kqerr
-- ----------------------------
INSERT INTO `xinhu_kqerr` VALUES ('1', '1', '2016-12-16 20:54:27', '1', '管理員', '2016-12-16', '忘記了', '1', '1', '忘記打卡', '2016-12-16', '18:00:28');
INSERT INTO `xinhu_kqerr` VALUES ('2', '2', '2017-08-28 12:19:12', '2', '貂蟬', '2017-08-28', 'hehehe', '0', '1', '忘記打卡', '2017-08-24', '18:19:04');

-- ----------------------------
-- Table structure for `xinhu_kqinfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqinfo`;
CREATE TABLE `xinhu_kqinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `uname` varchar(20) DEFAULT NULL,
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `kind` varchar(10) DEFAULT NULL COMMENT '類型',
  `qjkind` varchar(20) DEFAULT NULL COMMENT '請假類型',
  `explain` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `totals` decimal(6,1) DEFAULT '0.0' COMMENT '時間',
  `optdt` datetime DEFAULT NULL,
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否提交',
  `optname` varchar(20) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `jiafee` decimal(6,2) DEFAULT '0.00' COMMENT '加班費',
  `jiatype` tinyint(1) DEFAULT '0' COMMENT '加班方式0換調休,1給加班費',
  `totday` decimal(8,2) DEFAULT '0.00' COMMENT '請假天數',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `kind` (`kind`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='請假條加班單';

-- ----------------------------
-- Records of xinhu_kqinfo
-- ----------------------------
INSERT INTO `xinhu_kqinfo` VALUES ('1', '1', null, '2016-07-29 10:52:51', '2016-07-29 18:52:54', '請假', '事假', '下午請假去騎車兜風啊！', '1', '6.0', '2016-07-29 10:53:11', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('2', '1', null, '2016-07-27 19:00:00', '2016-07-27 23:00:00', '加班', null, '老板說我能做事就多加班，呵呵呵！', '1', '4.0', '2016-07-29 10:56:58', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('3', '6', null, '2016-08-08 09:00:00', '2016-08-08 18:36:40', '請假', '年假', '辛辛苦苦一年終于有一天年假啦，請一下吧！', '1', '8.0', '2016-08-07 18:37:02', '1', '張飛', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('4', '1', null, '2016-08-30 09:00:00', '2016-08-31 18:00:00', '請假', '事假', '年底年假休息！', '0', '16.0', '2016-09-13 16:05:38', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('5', '1', null, '2016-08-25 08:00:00', '2016-08-25 18:01:35', '請假', '事假', '請假1條', '1', '8.0', '2016-08-25 16:01:52', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('6', '8', null, '2016-08-01 08:44:45', '2016-08-02 22:44:54', '請假', '事假', '請假2天去玩嘍', '1', '24.0', '2016-08-26 22:45:35', '1', '信呼客服', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('7', '1', null, '2016-08-28 14:06:25', '2016-08-28 16:06:33', '加班', null, '人傻要多加班！', '1', '2.0', '2016-08-27 14:06:56', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('8', '6', null, '2016-08-02 08:02:21', '2016-08-02 20:02:23', '請假', '事假', '請假啦', '1', '8.0', '2016-08-30 20:12:33', '1', '張飛', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('9', '1', null, '2016-09-08 17:45:57', '2016-09-09 17:46:00', '請假', '事假', '嗯嗯嗯。', '5', '9.0', '2016-09-08 21:14:14', '1', '管理員', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('10', '8', '信呼客服', '2016-09-01 00:02:42', '2016-09-30 14:02:46', '增加年假', null, '入職一年年假', '1', '5.0', '2016-09-13 14:03:37', '0', '信呼客服', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('11', '6', null, '2016-09-27 08:36:19', '2016-09-30 23:36:27', '請假', '事假', '國慶請假啦', '0', '32.0', '2016-09-25 16:04:13', '1', '張飛', '0', null, '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('14', '1', null, '2016-12-13 16:00:00', '2016-12-13 18:00:00', '請假', '調休', '調休啦', '1', '2.0', '2017-07-25 22:09:21', '1', '管理員', '1', null, '0.00', '0', '0.25');
INSERT INTO `xinhu_kqinfo` VALUES ('15', '1', null, '2017-04-17 18:00:00', '2017-04-18 01:00:00', '加班', null, '加班很晚，很辛苦的，我要很多很多錢。', '1', '7.0', '2017-05-18 12:17:51', '1', '管理員', '1', '2017-05-18', '501.20', '1', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('16', '1', null, '2017-06-28 18:00:00', '2017-06-29 00:00:00', '加班', null, '加班加班', '1', '6.0', '2017-06-29 10:14:05', '1', '管理員', '1', '2017-06-29', '354.00', '1', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('17', '5', null, '2017-06-29 00:00:00', '2017-06-29 04:18:00', '加班', null, '服務器突然掛了，起來加班維修啊。', '0', '4.0', '2017-06-29 10:18:35', '1', '磐石', '5', '2017-06-29', '0.00', '0', '0.00');
INSERT INTO `xinhu_kqinfo` VALUES ('97', '1', '管理員', '2017-06-01 00:00:00', '2017-06-01 23:59:59', '增加年假', null, '2016-06-01入職年限滿1年添加年假5天', '1', '40.0', '2017-10-15 15:23:32', '1', '系統', '0', '2017-10-15', '0.00', '0', '5.00');
INSERT INTO `xinhu_kqinfo` VALUES ('98', '2', '貂蟬', '2017-08-09 00:00:00', '2017-08-09 23:59:59', '增加年假', null, '2016-08-09入職年限滿1年添加年假5天', '1', '40.0', '2017-10-15 15:23:32', '1', '系統', '0', '2017-10-15', '0.00', '0', '5.00');
INSERT INTO `xinhu_kqinfo` VALUES ('99', '7', '趙子龍', '2017-07-01 00:00:00', '2017-07-01 23:59:59', '增加年假', null, '2016-07-01入職年限滿1年添加年假5天', '1', '40.0', '2017-10-15 15:23:32', '1', '系統', '0', '2017-10-15', '0.00', '0', '5.00');
INSERT INTO `xinhu_kqinfo` VALUES ('100', '8', '信呼客服', '2017-07-01 00:00:00', '2017-07-01 23:59:59', '增加年假', null, '2016-07-01入職年限滿1年添加年假5天', '1', '40.0', '2017-10-15 15:23:32', '1', '系統', '0', '2017-10-15', '0.00', '0', '5.00');

-- ----------------------------
-- Table structure for `xinhu_kqjcmd`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqjcmd`;
CREATE TABLE `xinhu_kqjcmd` (
  `id` int(11) NOT NULL,
  `snid` int(11) DEFAULT '0' COMMENT '設備ID',
  `cmd` text COMMENT '發送命令內容',
  `status` tinyint(1) DEFAULT '0' COMMENT '運行狀態0待運行,1已運行,2請求中',
  `qjtime` datetime DEFAULT NULL COMMENT '請求時間',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `cjtime` datetime DEFAULT NULL COMMENT '處理時間',
  `atype` varchar(30) DEFAULT NULL COMMENT '類型',
  `others` varchar(500) DEFAULT NULL COMMENT '推送主鍵id',
  PRIMARY KEY (`id`),
  KEY `snid` (`snid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考勤機命令發送表';

-- ----------------------------
-- Records of xinhu_kqjcmd
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_kqjsn`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqjsn`;
CREATE TABLE `xinhu_kqjsn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(50) NOT NULL DEFAULT '' COMMENT '設備號',
  `name` varchar(50) DEFAULT NULL COMMENT '設備名稱',
  `company` varchar(50) DEFAULT NULL COMMENT '公司名',
  `sort` int(11) DEFAULT '0' COMMENT '排序號',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `deptids` varchar(4000) DEFAULT NULL COMMENT '部門ID聚合',
  `userids` text COMMENT '人員ID聚合',
  `lastdt` datetime DEFAULT NULL COMMENT '最後請求時間',
  `space` int(11) DEFAULT '0' COMMENT 'sd卡剩餘空間',
  `memory` int(11) DEFAULT '0' COMMENT '剩餘內存',
  `usershu` int(11) DEFAULT '0' COMMENT '人員數',
  `fingerprintshu` int(11) DEFAULT '0' COMMENT '指紋數',
  `headpicshu` int(11) DEFAULT '0' COMMENT '頭像數量',
  `clockinshu` int(11) DEFAULT '0' COMMENT '打卡數',
  `picshu` int(11) DEFAULT '0' COMMENT '現場照片數',
  `romver` varchar(30) DEFAULT NULL COMMENT '系統版本',
  `appver` varchar(30) DEFAULT NULL COMMENT '應用版本',
  `model` varchar(30) DEFAULT NULL COMMENT '設備型號',
  PRIMARY KEY (`id`,`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考勤機設備表';

-- ----------------------------
-- Records of xinhu_kqjsn
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_kqjuser`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqjuser`;
CREATE TABLE `xinhu_kqjuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `snid` int(11) DEFAULT '0' COMMENT '設備ID',
  `uid` int(11) DEFAULT '0' COMMENT '用戶ID',
  `fingerprint1` text COMMENT '指紋1',
  `fingerprint2` text COMMENT '指紋2',
  `headpic` varchar(100) DEFAULT NULL COMMENT '頭像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `snid_uid` (`snid`,`uid`) USING BTREE,
  KEY `snid` (`snid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='考勤機上人員';

-- ----------------------------
-- Records of xinhu_kqjuser
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_kqout`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqout`;
CREATE TABLE `xinhu_kqout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `outtime` datetime DEFAULT NULL COMMENT '外出時間',
  `intime` datetime DEFAULT NULL COMMENT '回崗時間',
  `address` varchar(50) DEFAULT NULL COMMENT '外出地址',
  `reason` varchar(500) DEFAULT NULL COMMENT '外出事由',
  `atype` varchar(2) DEFAULT NULL COMMENT '外出類型@外出,出差',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待審核,1|審核通過,2|審核不通過',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `isxj` tinyint(1) DEFAULT '0' COMMENT '是否銷假@0|否,1|是',
  `sicksm` varchar(500) DEFAULT NULL COMMENT '銷假說明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='外出出差';

-- ----------------------------
-- Records of xinhu_kqout
-- ----------------------------
INSERT INTO `xinhu_kqout` VALUES ('1', '1', '2016-09-27 08:00:00', '2016-09-27 15:22:42', '火車站', '接人啊', '外出', null, '2016-08-27 15:22:51', '1', '1', '1', '管理員', '2016-08-27', '0', null);
INSERT INTO `xinhu_kqout` VALUES ('2', '8', '2016-11-08 18:52:28', '2016-11-08 21:52:29', '湖裡稅務局', '稅務局辦稅', '外出', null, '2016-11-08 20:52:41', '1', '1', '8', '信呼客服', '2016-11-08', '0', null);
INSERT INTO `xinhu_kqout` VALUES ('3', '1', '2017-04-19 12:56:00', '2017-04-19 19:56:00', '高崎機場', '接信呼作者[磐石]來廈喝茶。', '外出', null, '2017-04-19 12:57:28', '1', '1', '1', '管理員', '2017-04-19', '0', null);
INSERT INTO `xinhu_kqout` VALUES ('4', '1', '2017-08-28 11:54:25', '2017-08-28 12:54:00', '出去辦事', '嗯嗯嗯額', '外出', null, '2017-08-28 11:54:41', '0', '1', '1', '管理員', '2017-08-28', '0', null);

-- ----------------------------
-- Table structure for `xinhu_kqsjgz`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqsjgz`;
CREATE TABLE `xinhu_kqsjgz` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名稱',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `pid` smallint(6) DEFAULT '0' COMMENT '主',
  `stime` varchar(20) DEFAULT NULL COMMENT '開始時間',
  `etime` varchar(20) DEFAULT NULL COMMENT '結束時間',
  `qtype` tinyint(1) DEFAULT '0' COMMENT '取值類型@0|最小值,1|最大值',
  `iskt` tinyint(1) DEFAULT '0' COMMENT '是否跨天',
  `iskq` tinyint(1) DEFAULT '1' COMMENT '是否需要考勤',
  `isxx` tinyint(1) DEFAULT '0' COMMENT '是否休息斷',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='考勤時間規則';

-- ----------------------------
-- Records of xinhu_kqsjgz
-- ----------------------------
INSERT INTO `xinhu_kqsjgz` VALUES ('1', '全體人員考勤', '1', '0', null, null, '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('2', '下班', '3', '1', '13:00:00', '18:00:00', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('5', '正常', '0', '12', '06:00:00', '09:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('6', '遲到', '1', '12', '09:00:01', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('7', '正常', '0', '2', '18:00:00', '23:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('8', '早退', '1', '2', '13:00:00', '17:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('12', '上班', '0', '1', '09:00:00', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('21', '中班(8點-16點)', '3', '0', null, null, '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('22', '上班', '0', '21', '08:00:00', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('23', '下班', '1', '21', '12:00:00', '16:00:00', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('24', '正常', '0', '22', '06:00:00', '08:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('25', '遲到', '1', '22', '08:00:01', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('26', '早退', '1', '23', '12:00:01', '15:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('27', '正常', '0', '23', '16:00:00', '18:00:00', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('30', '晚班(16點-24點)', '4', '0', null, null, '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('31', '上班', '0', '30', '16:00:00', '20:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('32', '下班', '1', '30', '20:00:00', '23:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('33', '早班(0點-8點)', '2', '0', null, null, '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('34', '上班', '0', '33', '00:00:00', '04:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('35', '下班', '0', '33', '04:00:00', '08:00:00', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('36', '正常', '0', '34', '22:00:00', '00:00:00', '0', '2', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('37', '遲到', '0', '34', '00:00:01', '02:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('38', '正常', '0', '35', '08:00:00', '10:00:00', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('39', '早退', '0', '35', '04:00:00', '07:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('40', '正常', '0', '31', '14:00:00', '16:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('41', '遲到', '0', '31', '16:00:01', '20:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('42', '正常', '0', '32', '00:00:00', '02:00:00', '1', '1', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('43', '早退', '0', '32', '20:00:00', '23:59:59', '1', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('44', '全體人員4狀態考勤', '5', '0', null, null, '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('45', '上午上班', '0', '44', '08:00:00', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('46', '上午下班', '1', '44', '12:00:00', '14:30:00', '0', '0', '1', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('47', '下午上班', '2', '44', '14:30:00', '18:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('48', '下午下班', '3', '44', '18:00:00', '23:59:59', '0', '0', '1', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('49', '正常', '0', '45', '06:00:00', '08:00:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('50', '遲到', '1', '45', '08:00:01', '12:00:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('51', '正常', '0', '46', '12:00:00', '14:30:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('52', '早退', '0', '46', '08:00:01', '11:59:59', '1', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('53', '正常', '0', '47', '12:00:00', '14:30:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('54', '遲到', '0', '47', '14:30:00', '18:00:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('55', '正常', '0', '48', '18:00:00', '23:59:59', '1', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('56', '早退', '0', '48', '14:30:01', '17:59:59', '1', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('57', '半天班', '6', '0', null, null, '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('58', '上班', '0', '57', '09:00:00', '12:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('59', '下班', '1', '57', '12:00:00', '23:59:59', '0', '0', '1', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('60', '正常', '0', '58', '06:00:00', '09:00:00', '0', '0', '1', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('61', '遲到', '0', '58', '09:00:01', '12:00:00', '0', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('62', '正常', '0', '59', '12:00:00', '23:59:59', '1', '0', '0', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('63', '早退', '0', '59', '09:00:01', '12:00:00', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for `xinhu_kqxxsj`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqxxsj`;
CREATE TABLE `xinhu_kqxxsj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `pid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0休息日,1工作日',
  `uid` int(11) DEFAULT '0' COMMENT '對應用戶/部門Id',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`dt`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='休息時間規則';

-- ----------------------------
-- Records of xinhu_kqxxsj
-- ----------------------------
INSERT INTO `xinhu_kqxxsj` VALUES ('1', '全體人員休息日', null, '0', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('10', null, '2017-02-01', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('3', null, '2017-02-05', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('4', null, '2017-02-11', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('5', null, '2017-02-12', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('6', null, '2017-02-18', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('7', null, '2017-02-19', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('8', null, '2017-02-25', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('9', null, '2017-02-26', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('11', null, '2017-02-02', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('12', null, '2017-01-01', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('13', null, '2017-01-07', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('14', null, '2017-01-08', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('15', null, '2017-01-14', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('16', null, '2017-01-15', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('17', null, '2017-01-21', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('25', null, '2017-01-29', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('19', null, '2017-01-28', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('23', null, '2017-01-31', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('21', null, '2017-01-02', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('22', null, '2017-01-30', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('24', null, '2017-01-27', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('26', null, '2017-04-01', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('27', null, '2017-04-02', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('28', null, '2017-04-08', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('29', null, '2017-04-09', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('30', null, '2017-04-15', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('31', null, '2017-04-16', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('32', null, '2017-04-22', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('33', null, '2017-04-23', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('34', null, '2017-04-29', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('35', null, '2017-04-30', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('36', null, '2017-05-06', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('37', null, '2017-05-07', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('38', null, '2017-05-13', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('39', null, '2017-05-14', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('40', null, '2017-05-20', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('41', null, '2017-05-21', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('42', null, '2017-05-27', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('43', null, '2017-05-28', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('44', null, '2017-09-02', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('45', null, '2017-09-03', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('46', null, '2017-09-09', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('47', null, '2017-09-10', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('48', null, '2017-09-16', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('49', null, '2017-09-17', '1', '0', '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('51', null, '2017-09-24', '1', '0', '0');

-- ----------------------------
-- Table structure for `xinhu_location`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_location`;
CREATE TABLE `xinhu_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(30) DEFAULT NULL,
  `uid` smallint(6) DEFAULT '0',
  `agentid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `location_x` varchar(30) DEFAULT NULL COMMENT '地理位置緯度',
  `location_y` varchar(30) DEFAULT NULL COMMENT '地理位置經度 ',
  `scale` smallint(6) DEFAULT '0' COMMENT '地圖縮放大小',
  `label` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `msgid` varchar(50) DEFAULT NULL,
  `precision` smallint(6) DEFAULT '0' COMMENT '地理位置精度',
  `type` tinyint(4) DEFAULT '0' COMMENT '0普通,1事件,2企業微信定位',
  `explain` varchar(50) DEFAULT NULL COMMENT '說明',
  `imgpath` varchar(100) DEFAULT NULL COMMENT '相關圖片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='外勤定位';

-- ----------------------------
-- Records of xinhu_location
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_log`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_log`;
CREATE TABLE `xinhu_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '類型',
  `optid` int(11) DEFAULT NULL COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(500) DEFAULT NULL COMMENT '備注',
  `optdt` datetime DEFAULT NULL COMMENT '添加時間',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `web` varchar(100) DEFAULT NULL COMMENT '瀏覽器',
  `device` varchar(50) DEFAULT NULL,
  `level` tinyint(1) DEFAULT '0' COMMENT '日志級別0普通,1提示,2錯誤',
  `url` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `level` (`level`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系統日志';

-- ----------------------------
-- Records of xinhu_log
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_logintoken`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_logintoken`;
CREATE TABLE `xinhu_logintoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用戶ID',
  `name` varchar(20) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `moddt` datetime DEFAULT NULL,
  `cfrom` varchar(10) DEFAULT NULL,
  `device` varchar(50) DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(30) DEFAULT NULL,
  `online` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `token` (`token`,`cfrom`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系統登錄token';

-- ----------------------------
-- Records of xinhu_logintoken
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_meet`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_meet`;
CREATE TABLE `xinhu_meet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hyname` varchar(20) DEFAULT NULL COMMENT '會議室名稱',
  `title` varchar(50) DEFAULT NULL COMMENT '主題',
  `startdt` varchar(50) DEFAULT NULL COMMENT '開始時間',
  `enddt` varchar(50) DEFAULT NULL COMMENT '結束時間',
  `state` tinyint(1) DEFAULT '0' COMMENT '會議狀態@0|正常,1|會議中,2|結束,3|取消',
  `status` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '類型@0|普通,1|固定,2|紀要',
  `joinid` varchar(200) DEFAULT NULL,
  `joinname` varchar(500) DEFAULT NULL COMMENT '參加人員',
  `mid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '發起人',
  `rate` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` int(11) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `cancelreason` varchar(200) DEFAULT NULL,
  `jyid` varchar(100) DEFAULT NULL COMMENT '會議紀要人id',
  `jyname` varchar(100) DEFAULT NULL COMMENT '會議紀要人',
  `content` varchar(4000) DEFAULT NULL COMMENT '會議紀要內容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='會議';

-- ----------------------------
-- Records of xinhu_meet
-- ----------------------------
INSERT INTO `xinhu_meet` VALUES ('1', '會議室1', '關于討論信呼開發問題', '2017-09-24 15:00:00', '2017-09-24 18:00:00', '2', '1', '0', 'd2', '開發部', '0', '管理員', null, '1', '2017-09-24 14:48:44', '1', null, null, null, null, null);

-- ----------------------------
-- Table structure for `xinhu_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_menu`;
CREATE TABLE `xinhu_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '菜單名',
  `pid` smallint(6) DEFAULT '0' COMMENT '上級id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `url` varchar(500) DEFAULT NULL,
  `icons` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '編號',
  `ispir` tinyint(1) DEFAULT '1' COMMENT '1驗證',
  `status` tinyint(1) DEFAULT '1' COMMENT '1啟用',
  `color` varchar(10) DEFAULT NULL,
  `ishs` tinyint(1) DEFAULT '0' COMMENT '是否在首頁顯示',
  `iszm` tinyint(1) DEFAULT '0' COMMENT '是否為桌面版圖標',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`status`)
) ENGINE=MyISAM AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COMMENT='系統菜單';

-- ----------------------------
-- Records of xinhu_menu
-- ----------------------------
INSERT INTO `xinhu_menu` VALUES ('1', '系統', '0', '20', null, 'cog', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('2', '菜單管理', '220', '4', 'system,menu', 'list-ul', null, 'menu', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('3', '用戶管理', '220', '2', 'flow,page,user,atype=all,pnum=all', 'user', null, 'user', '1', '1', '#5AAAE2', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('4', '計劃任務', '46', '7', 'system,task', 'time', null, 'taskrun', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('5', '組管理', '220', '3', 'system,group', 'group', null, 'group', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('6', '組織結構', '220', '1', 'system,dept', 'sitemap', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('7', '流程模塊', '0', '10', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('8', '權限管理', '1', '6', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('9', '人員→菜單', '8', '0', 'system,extent,type=um', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('10', '菜單→人員', '8', '1', 'system,extent,type=mu', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('11', '組→菜單', '8', '2', 'system,extent,type=gm', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('12', '菜單→組', '8', '3', 'system,extent,type=mg', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('13', '人員權限查看', '8', '4', 'system,extent,type=view', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('14', '即時通信管理', '1', '5', null, 'comment', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('15', '應用管理', '14', '4', 'main,yingyong', 'th-large', null, 'yingyong', '1', '1', '#1ABC9C', '0', '0');
INSERT INTO `xinhu_menu` VALUES ('16', '會話管理', '14', '3', 'main,imgroup', 'comments', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('17', '流程模塊列表', '7', '2', 'main,flow,set', 'check', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('18', '服務器設置', '14', '0', 'main,xinhu,cog', 'tasks', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('20', '表單元素管理', '7', '5', 'main,flow,element', 'th-list', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('21', '流程模塊權限', '7', '6', 'main,view', 'lock', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('22', '流程單據查看', '7', '7', 'main,flow,view', 'search', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('23', '系統升級', '46', '10', 'system,upgrade', 'arrow-up', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('24', '數據選項', '7', '1', 'system,option,num=xinhu', 'cog', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('25', '初始化備份', '46', '5', 'system,beifen', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('26', '流程審核步驟', '7', '4', 'main,flow,course', 'resize-vertical', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('27', '人事考勤', '0', '6', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('28', '物品管理', '140', '1', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('29', '單據異常監控', '7', '12', 'main,flow,error', 'briefcase', null, 'danerror', '1', '1', '#800000', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('30', '物品列表', '28', '0', 'main,goods', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('31', '物品出入庫詳情', '28', '0', 'main,goods,xiang', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('32', '考勤設置', '27', '10', null, 'time', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('33', '打卡記錄', '57', '0', 'main,kaoqin,dkjl,atype=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('34', '單據操作菜單', '7', '8', 'main,flow,menu', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('36', '考勤信息', '57', '4', 'main,kaoqin,info', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('37', '客戶統計', '63', '10', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('38', '個人辦公', '0', '0', null, 'desktop', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('39', '個人中心', '38', '0', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('40', '流程', '0', '1', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('41', '我的申請', '40', '2', 'main,fwork,bill,atype=my', 'align-left', null, 'applymy', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('42', '流程申請', '40', '1', 'main,fwork,apply', 'plus', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('43', '待辦/處理', '40', '0', 'main,fwork,bill,atype=daib', 'time', null, 'daiban', '0', '1', '#3BBDDB', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('44', '我的下屬申請', '40', '3', 'main,fwork,bill,atype=xia', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('45', '日程', '38', '2', 'system,schedule,list', 'calendar', null, 'schedule', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('46', '系統工具', '1', '10', null, 'wrench', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('53', '考勤時間規則', '32', '1', 'main,kaoqin,sjgz', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('54', '考勤時間分配', '32', '2', 'main,kaoqin,sjfp,type=0', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('55', '休息時間規則', '32', '4', 'main,kaoqin,xxgz', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('56', '休息時間分配', '32', '5', 'main,kaoqin,sjfp,type=1', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('57', '考勤信息', '27', '11', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('58', '考勤分析', '57', '6', 'main,kaoqin,anay', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('59', '我的考勤', '38', '12', null, 'time', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('60', '考勤統計簡表', '57', '7', 'main,kaoqin,total,atype=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('61', '人員考勤設置', '32', '0', 'main,kaoqin,kqcog', 'cog', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('62', '經我處理', '40', '4', 'main,fwork,bill,atype=jmy', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('63', '客戶', '0', '5', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('64', '客戶', '63', '1', 'main,customer,list,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('65', '我的任務', '66', '1', 'flow,page,work,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('66', '任務', '0', '3', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('67', '我未完成任務', '66', '2', 'flow,page,work,atype=wwc', 'book', null, 'workwwc', '0', '1', '#BFC462', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('68', '我創建任務', '66', '3', 'flow,page,work,atype=wcj', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('69', '我執行的項目', '79', '2', 'flow,page,project,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('70', '我未完成項目', '79', '2', 'flow,page,project,atype=wwc', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('71', '我創建的項目', '79', '3', 'flow,page,project,atype=mycj', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('72', '我負責的項目', '79', '2', 'flow,page,project,atype=myfz', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('73', '銷售機會', '63', '2', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('74', '我申請未通過', '40', '2', 'main,fwork,bill,atype=mywtg', 'info-sign', null, 'applywtg', '0', '1', '#B67FF4', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('75', '共享給我的', '64', '1', 'flow,page,customer,atype=gxgw,pnum=shate', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('76', '工作日報', '38', '13', null, 'edit', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('77', '我的日報', '76', '6', 'flow,page,daily,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('78', '我下屬日報', '76', '8', 'flow,page,daily,atype=undall', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('79', '項目管理', '66', '0', null, 'circle-arrow-right', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('80', '任務督導', '66', '4', 'flow,page,work,atype=dd', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('81', '所有任務一覽', '66', '10', 'flow,page,work,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('82', '所有項目一覽', '79', '10', 'flow,page,project,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('83', '我下屬任務', '66', '2', 'flow,page,work,atype=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('84', '人事檔案', '27', '0', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('85', '人員檔案', '84', '0', 'flow,page,userinfo,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('86', '我的考勤表', '59', '0', 'main,kaoqin,geren', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('87', '我的考勤信息', '59', '4', 'main,kaoqin,kqinfo,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('88', '我的考勤統計', '59', '5', 'main,kaoqin,total,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('89', '會議', '38', '11', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('90', '通知公告', '38', '1', 'flow,page,gong,atype=my', 'volume-up', null, 'gong', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('91', '流程模塊條件', '7', '9', 'main,flow,where', 'asterisk', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('92', '我的打卡記錄', '59', '1', 'main,kaoqin,dkjl,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('93', '我的定位記錄', '59', '6', 'main,kaoqin,location,atype=my', 'map-marker', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('94', '定位記錄', '57', '1', 'main,kaoqin,location,atype=all', 'map-marker', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('95', '員工合同', '84', '0', 'flow,page,userract,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('96', '轉正申請', '127', '0', 'flow,page,hrpositive,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('97', '離職申請', '127', '0', 'flow,page,hrredund,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('98', '薪資管理', '27', '3', null, 'money', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('99', '薪資核算', '98', '0', 'main,salary,list', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('100', '提醒信息', '39', '0', 'system,geren,todo', 'bell', null, 'todo', '0', '1', '#EFBB62', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('101', '個人資料', '39', '1', 'main,userinfo,geren', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('102', '薪資發放', '98', '0', 'main,salary,fafang', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('103', '系統信息', '46', '1', 'system,cog,sysinfo', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('104', '合同', '63', '3', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('105', '收款單', '63', '4', null, 'money', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('106', '我的收款單', '105', '0', 'flow,page,custfina,atype=myskd', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('107', '我的付款單', '118', '0', 'flow,page,custfina,atype=myfkd,pnum=fkd', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('108', '我的合同', '104', '0', 'flow,page,custract,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('109', '我下屬的合同', '104', '1', 'flow,page,custract,atype=downall,pnum=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('110', '我的銷售機會', '73', '0', 'flow,page,custsale,atype=mygx', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('111', '我下屬銷售機會', '73', '1', 'flow,page,custsale,atype=downgj,pnum=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('112', '我的客戶', '64', '0', 'flow,page,customer,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('113', '我下屬客戶', '64', '2', 'flow,page,customer,atype=downall,pnum=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('114', '金額統計', '63', '20', null, 'bar-chart', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('115', '我的財務統計', '114', '0', 'main,customer,total,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('116', '我下屬財務統計', '114', '0', 'main,customer,total,atype=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('117', '我年度統計', '114', '0', 'main,customer,totalge', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('118', '付款單', '63', '5', null, null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('119', '我下屬收款單', '105', '0', 'flow,page,custfina,atype=downskd,pnum=downskd', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('120', '我下屬付款單', '118', '0', 'flow,page,custfina,atype=downfkd,pnum=downfkd', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('121', '所有收款單', '126', '4', 'flow,page,custfina,atype=allskd,pnum=allskd', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('122', '所有付款單', '126', '5', 'flow,page,custfina,atype=allfkd,pnum=allfkd', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('123', '客戶分配', '64', '6', 'flow,page,customer,atype=distdfp,pnum=dist', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('19', '資源', '0', '2', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('124', '個人文檔', '19', '0', 'system,word,guan,showlx=0', 'folder-close-alt', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('125', '共享的文檔', '19', '2', 'system,word,shate', 'folder-open-alt', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('126', '客戶查看', '63', '30', null, 'eye-open', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('127', '人事管理', '27', '1', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('128', '人事調動', '127', '0', 'flow,page,hrtransfer,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('129', '調薪申請', '127', '0', 'flow,page,hrtrsalary,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('130', '獎懲處罰', '127', '0', 'flow,page,reward,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('131', '我的客戶統計', '37', '0', 'main,customer,alllist,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('132', '下屬客戶統計', '37', '0', 'main,customer,alllist,atype=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('133', '我上傳過的文件', '39', '5', 'system,geren,file', 'folder-close-alt', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('134', '知識信息管理', '19', '3', 'system,infor,zhishi', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('135', '知識題庫管理', '19', '4', 'system,infor,tiku', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('136', '知識題庫學習', '19', '10', 'system,infor,tikuxx', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('137', '固定資產', '140', '1', 'main,assetm,list', 'laptop', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('138', '車輛管理', '140', '2', null, 'truck', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('139', '圖書管理', '140', '3', null, 'book', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('140', '行政', '0', '7', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('141', '圖書列表', '139', '0', 'main,book,list', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('142', '信呼官網', '46', '88', 'http://www.rockoa.com/', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('143', '車輛列表', '138', '0', 'flow,page,carm,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('144', '車輛預定查詢', '138', '2', 'flow,page,carmrese,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('145', '圖書借閱', '139', '5', 'flow,page,bookborrow,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('146', '車輛預定情況', '138', '3', 'main,carm,carmqing', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('147', '數據庫表', '46', '2', 'system,table,list', 'table', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('148', '內部通訊錄', '39', '3', 'system,admin,txl', 'phone', null, 'reimtxl', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('149', '人員分析', '84', '0', 'main,userinfo,anay', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('150', '今日會議', '89', '0', 'flow,page,meet,atype=today', null, null, 'meet', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('151', '會議室情況', '89', '0', 'main,fwork,meethy', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('152', '定位打卡位置', '32', '6', 'main,kaoqin,kqdw', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('153', '定位打卡位置分配', '32', '7', 'main,kaoqin,sjfp,type=2', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('154', '郵件管理', '1', '3', null, 'envelope', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('156', '系統設置', '46', '0', 'system,cog,set', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('157', '郵件', '38', '0', 'system,email', 'envelope', null, 'email', '0', '1', '#0099CC', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('158', '知識信息查看', '19', '9', 'system,infor,zhishixx', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('159', '外出記錄', '57', '2', 'flow,page,waichu,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('160', '我的外出記錄', '59', '2', 'flow,page,waichu,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('161', '上傳文件管理', '46', '15', 'system,geren,file,atype=all', 'folder-close-alt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('162', '日志查看', '46', '16', 'system,cog,log', null, null, 'syslog', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('163', '郵件收發設置', '154', '1', 'system,email,cogsfa', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('164', '用戶郵箱設置', '154', '2', 'system,email,coguser', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('165', '印章管理', '140', '4', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('166', '印章列表', '165', '0', 'main,seal,list', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('167', '印章申請查詢', '165', '0', 'flow,page,sealapl,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('168', '個人通訊錄', '39', '4', 'system,geren,vcard', 'credit-card', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('169', '打卡異常', '57', '3', 'flow,page,kqerr,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('170', '我的打卡異常', '59', '3', 'flow,page,kqerr,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('171', '企業微信', '1', '30', null, 'comments-alt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('172', '企業微信設置', '171', '0', 'system,weixinqy,cog', 'cog', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('155', '企業微信部門', '171', '1', 'system,weixinqy,dept', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('173', '企業微信用戶', '171', '2', 'system,weixinqy,user', 'user', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('174', '企業微信應用', '171', '3', 'system,weixinqy,ying', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('179', '客戶主頁', '63', '0', 'main,customer,index', 'user-md', null, 'crmindex', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('175', '客戶一覽表', '126', '0', 'flow,page,customer,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('176', '所有客戶合同', '126', '2', 'flow,page,custract,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('177', '所有銷售機會', '126', '1', 'flow,page,custsale,atype=allgj,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('178', '所有財務統計', '126', '6', 'main,customer,total,atype=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('35', '單據通知設置', '7', '10', 'main,flow,todo', 'bell', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('180', '微信公眾號', '1', '19', null, 'comments-alt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('181', '公眾號設置', '180', '0', 'system,wxgzh,cog', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('182', '授權單據查看', '40', '5', 'main,fwork,bill,atype=grantview', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('183', '單據查看', '38', '3', 'main,fwork,search', 'search', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('184', '我的薪資', '39', '2', 'main,salary,my', 'money', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('185', '流程模塊統計', '7', '11', 'main,flowtotal', 'bar-chart', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('186', '財務管理', '140', '11', null, 'money', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('187', '費用報銷', '186', '0', 'flow,page,finfybx,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('188', '出差報銷', '186', '3', 'flow,page,finccbx,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('189', '借款單', '186', '5', 'flow,page,finjkd,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('190', '還款單', '186', '7', 'flow,page,finhkd,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('191', '費用報銷報表', '186', '1', 'flow,page,finccbxchart', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('192', '工作日報', '27', '2', null, 'edit', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('193', '所有日報', '192', '1', 'flow,page,daily,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('194', '日報統計', '192', '2', 'flow,page,dailytotal', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('195', '我的日報統計', '76', '7', 'flow,page,dailytotal,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('196', '日報統計分析', '192', '3', 'flow,page,dailychart', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('197', '考勤時間排班', '32', '3', 'main,kaoqin,sjpb', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('198', '我下屬日報統計', '76', '9', 'flow,page,dailytotal,atype=down', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('199', '考試培訓', '27', '12', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('200', '考試培訓列表', '199', '0', 'flow,page,knowtraim,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('201', '考試培訓人員', '199', '1', 'flow,page,knowtraimuser,atype=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('202', '我的培訓考試', '39', '6', 'flow,page,knowtraimuser,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('203', '部門文檔', '19', '1', 'system,word,guan,showlx=1', 'folder-close-alt', null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('204', '公文', '0', '4', null, null, null, null, '1', '0', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('205', '收文單', '204', '3', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('206', '所有收文單', '205', '0', 'flow,page,officib,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('207', '單據提醒', '38', '4', 'main,fwork,todo', 'star-empty', null, 'flowtodo', '0', '1', '#ADCC61', '1', '0');
INSERT INTO `xinhu_menu` VALUES ('208', '釘釘管理', '1', '40', null, 'bolt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('209', '釘釘設置', '208', '0', 'system,wding,cog', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('210', '釘釘部門', '208', '1', 'system,wding,dept', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('211', '釘釘用戶', '208', '2', 'system,wding,user', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('212', '釘釘微應用', '208', '3', 'system,wding,ying', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('213', '審核人員分組', '7', '3', 'main,flow,cname', 'group', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('214', '車輛信息登記', '138', '1', 'flow,page,carms,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('215', '車輛維修', '138', '4', 'flow,page,carmwx,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('216', '車輛保養', '138', '5', 'flow,page,carmby,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('217', '加班單核算', '57', '5', 'flow,page,jiaban,atype=allfee,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('218', '借款單統計', '186', '6', 'flow,page,finjkdtotal,atype=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('219', '公司單位', '220', '0', 'flow,page,company,atype=all,pnum=all', 'road', null, 'company', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('220', '基礎管理', '1', '0', null, 'asterisk', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('221', '首頁項管理', '220', '5', 'system,home', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('222', '短信管理', '1', '4', null, 'envelope-alt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('223', '短信設置', '222', '0', 'system,sms,cog', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('224', '短信簽名', '222', '1', 'system,sms,qian', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('225', '短信模版', '222', '2', 'system,sms,tpl', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('226', '短信發送記錄', '222', '3', 'system,sms,record', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('227', '我的會話記錄', '39', '7', 'reim,record,atype=my', 'file-alt', null, 'reimrecord', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('228', '會話記錄', '14', '5', 'reim,record,atype=all', 'file-alt', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('229', '付款申請', '186', '8', 'flow,page,finpay,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('230', '開票申請', '186', '9', 'flow,page,finkai,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('231', '日報授權查看', '76', '10', 'flow,page,daily,atype=grant', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('232', '發文單', '204', '2', null, null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('233', '所有發文單', '232', '0', 'flow,page,officia,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('234', '考勤統計詳表', '57', '8', 'main,kaoqin,total,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('235', '訂閱管理', '237', '0', 'flow,page,subscribe,atype=all,pnum=all', null, null, 'rssglall', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('236', '訂閱報表', '38', '5', 'flow,page,subscribeinfo,atype=my', 'rss', null, 'subscribeinfo', '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('237', '訂閱管理', '1', '5', null, 'rss', null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('238', '訂閱報表', '237', '1', 'flow,page,subscribeinfo,atype=all,pnum=all', null, null, 'rssinfoall', '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('239', '公文查閱', '204', '0', 'flow,page,officic,atype=my', null, null, null, '0', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('240', '考勤機管理', '27', '10', null, 'hdd', null, null, '1', '0', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('241', '考勤機設備', '240', '0', 'flow,page,kqjsn,atype=all,pnum=all', null, null, null, '1', '0', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('242', '考勤機命令查看', '240', '2', 'main,kaoqinj,cmd', null, null, null, '1', '0', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('243', '考勤機上部門人員', '240', '1', 'main,kaoqinj,dept', null, null, null, '1', '0', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('244', '考核評分', '127', '9', 'flow,page,hrcheck,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('245', '城市管理', '46', '17', 'system,city', null, null, null, '1', '1', null, '0', '0');
INSERT INTO `xinhu_menu` VALUES ('246', '演示模塊數據', '46', '89', 'flow,page,demo,atype=all,pnum=all', null, null, null, '1', '1', null, '0', '0');

-- ----------------------------
-- Table structure for `xinhu_official`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_official`;
CREATE TABLE `xinhu_official` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL COMMENT '標題',
  `titles` varchar(255) DEFAULT NULL COMMENT '副標題',
  `class` varchar(10) DEFAULT NULL COMMENT '類型',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收文單,1發文單',
  `grade` varchar(10) DEFAULT NULL COMMENT '等級',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `content` text COMMENT '內容',
  `receid` varchar(200) DEFAULT NULL COMMENT '來源',
  `recename` varchar(200) DEFAULT NULL COMMENT '發給',
  `applydt` date DEFAULT NULL COMMENT '日期',
  `num` varchar(30) DEFAULT NULL COMMENT '編號',
  `optid` smallint(6) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `filecontid` varchar(30) DEFAULT NULL COMMENT '正文文件Id',
  `zinum` varchar(30) DEFAULT NULL COMMENT '發文字號',
  `unitname` varchar(50) DEFAULT NULL COMMENT '發給單位',
  `unitsame` varchar(50) DEFAULT NULL COMMENT '發文單位',
  `miji` varchar(50) DEFAULT NULL COMMENT '公文密級',
  `laidt` date DEFAULT NULL COMMENT '來文日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公文';

-- ----------------------------
-- Records of xinhu_official
-- ----------------------------
INSERT INTO `xinhu_official` VALUES ('1', '1', '發文單', null, '決議', '0', '普通', '管理員', '2016-09-05 20:13:56', '1', null, 'd1', '信呼開發團隊', '2016-09-05', 'WJ-001', '1', null, '1', '0', null, null, null, null, null);
INSERT INTO `xinhu_official` VALUES ('2', '1', '關于下發通知使用', null, '決議', '0', '平急', '管理員', '2017-08-30 23:26:23', '1', '<p>\n	尊敬的領導：\n</p>\n<p>\n	早上好，歡迎來到我們團隊視察，會給你們不一樣的體驗的哦，首先我們來看看我們的產品，創始人，等等的介紹。團隊文化，核心員工。\n</p>', 'd1', '信呼開發團隊', '2017-02-09', '信呼【2017】001', '1', null, '1', '3', '信呼', '信呼開發團隊', '信呼開發團隊', '私密', null);
INSERT INTO `xinhu_official` VALUES ('3', '1', '關于金磚會議放假通知', null, null, '1', '平急', '管理員', '2017-08-30 22:59:35', '0', null, null, null, '2017-08-30', '廈門【2017】005', '1', null, '1', null, null, '信呼開發團隊', '廈門人民政府', '機密', '2017-08-30');
INSERT INTO `xinhu_official` VALUES ('4', '1', '關于上傳文件改善', null, '決議', '0', '加急', '管理員', '2017-10-23 14:50:08', '0', null, 'd2', '開發部', '2017-10-23', '信呼【2017】002', '1', null, '1', '65,66,67,68,69,72', '信呼', '信呼開發團隊', '開發部', '私密', null);

-- ----------------------------
-- Table structure for `xinhu_option`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_option`;
CREATE TABLE `xinhu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名稱',
  `type` int(11) DEFAULT '0' COMMENT '選項類型',
  `pid` int(11) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '編號',
  `value` varchar(500) DEFAULT NULL COMMENT '對應值',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `values` varchar(50) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `receid` varchar(300) DEFAULT NULL,
  `recename` varchar(300) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL COMMENT '說明',
  PRIMARY KEY (`id`),
  KEY `num` (`num`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=366 DEFAULT CHARSET=utf8 COMMENT='系統選項';

-- ----------------------------
-- Records of xinhu_option
-- ----------------------------
INSERT INTO `xinhu_option` VALUES ('4', '流程分類', '0', '1', 'flowfenlei', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('5', '考勤', '0', '4', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('6', '表單類型', '0', '1', 'flowinputtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('7', '文本框', '0', '6', null, 'text', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('8', '日期', '0', '6', null, 'date', '1', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('9', '日期時間', '0', '6', null, 'datetime', '2', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('10', '時間', '0', '6', null, 'time', '3', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('11', '隱藏文本框', '0', '6', null, 'hidden', '4', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('12', '選擇人員(單選)', '0', '6', null, 'changeuser', '7', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('13', '選擇人員(多選)', '0', '6', null, 'changeusercheck', '8', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('14', '自定義', '0', '6', null, 'auto', '30', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('15', '數字', '0', '6', null, 'number', '5', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('16', '文本域', '0', '6', null, 'textarea', '6', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('17', '固定值', '0', '6', null, 'fixed', '11', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('18', '系統選項下拉框', '0', '6', null, 'rockcombo', '12', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('19', '下拉框', '0', '6', null, 'select', '13', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('20', 'html編輯器', '0', '6', null, 'htmlediter', '14', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('21', '選擇部門人員', '0', '6', null, 'changedeptusercheck', '10', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('22', '單個復選框', '0', '6', null, 'checkbox', '15', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('23', '多個復選框', '0', '6', null, 'checkboxall', '16', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('24', '選擇部門', '0', '6', null, 'changedept', '9', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('25', '行政', '0', '4', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('26', '信息類型', '0', '1', 'gongtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('27', '通知公告', '0', '26', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('28', '規則制度', '0', '26', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('29', '會議室', '0', '1', 'hyname', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('30', '會客室', '0', '29', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('1', '信呼', '0', '0', 'xinhu', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('32', '任務類型', '0', '151', 'worktype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('33', '任務等級', '0', '151', 'workgrade', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('34', 'bug', '0', '32', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('35', '改進', '0', '32', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('36', '設計', '0', '32', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('37', '低', '0', '33', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('38', '中', '0', '33', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('39', '高', '0', '33', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('40', '緊急', '0', '33', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('41', '任務狀態', '0', '151', 'workstate', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('42', '待執行', '0', '41', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('43', '執行中', '0', '41', null, '2', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('44', '已完成', '0', '41', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('45', '中止', '0', '41', null, '3', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('46', '請假類型', '0', '144', 'kqqjkind', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('47', '事假', '0', '46', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('48', '病假', '0', '46', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('49', '年假', '0', '46', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('50', '客戶關系', '0', '1', 'crm', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('51', 'CRM', '0', '4', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('52', '客戶來源', '0', '50', 'crmlaiyuan', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('53', '銷售狀態', '0', '50', 'crmstate', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('54', '網上開拓', '0', '52', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('55', '電話開拓', '0', '52', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('56', '跟進中', '0', '53', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('57', '已成交', '0', '53', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('58', '銷售來源', '0', '50', 'custsalelai', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('59', '主動來訪', '0', '58', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('60', '網上聯系', '0', '58', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('61', '電話銷售', '0', '58', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('62', '行政選項', '0', '1', 'goods', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('63', '互聯網', '0', '83', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('64', '信呼', '0', '63', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('65', '辦公耗材', '0', '83', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('66', '顯示器', '0', '65', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('67', '鼠標', '0', '65', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('68', '主機', '0', '65', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('357', '編程', '0', '232', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('70', '資產品牌', '0', '62', 'rockbrand', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('71', '單位', '0', '62', 'rockunit', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('72', '台', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('73', '個', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('74', '件', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('75', '箱', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('76', '年', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('77', '月', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('78', '入庫類型', '0', '62', 'kutype0', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('79', '出庫類型', '0', '62', 'kutype1', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('80', '採購入庫', '0', '78', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('81', '領用出庫', '0', '79', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('82', '歸返入庫', '0', '78', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('83', '物品分類', '0', '62', 'goodstype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('84', '銷售出庫', '0', '79', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('85', '知識信息', '0', '26', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('86', '管理員文件夾目錄', '0', null, 'folder1', null, '0', null, '1', '2016-10-26 20:52:17', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('87', '技術文檔', '0', '86', null, null, '20', null, '1', '2016-08-08 22:07:41', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('88', '需求文檔', '0', '86', null, null, '0', null, '1', '2016-08-08 22:08:27', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('89', '圖片', '0', '86', null, null, '0', null, '1', '2016-08-08 22:44:10', '1', 'd1', '信呼開發團隊', null);
INSERT INTO `xinhu_option` VALUES ('92', '文件夾目錄', '0', null, 'folder3', null, '0', null, '1', '2016-10-19 19:30:59', '3', null, null, null);
INSERT INTO `xinhu_option` VALUES ('93', '個人文件', '0', '92', null, null, '0', null, '1', '2016-08-09 13:57:06', '3', null, null, null);
INSERT INTO `xinhu_option` VALUES ('95', 'js文檔', '0', '89', null, null, '0', null, '1', '2016-08-09 22:20:23', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('94', 'php文檔', '0', '89', null, null, '0', null, '1', '2016-08-09 22:20:17', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('98', '文件夾目錄', '0', null, 'folder4', null, '0', null, '1', '2016-10-19 19:31:27', '4', null, null, null);
INSERT INTO `xinhu_option` VALUES ('99', '公文選項', '0', '1', 'official', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('100', '公文類型', '0', '99', 'officialclass', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('101', '決議', '0', '100', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('102', '決定', '0', '100', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('103', '請示', '0', '100', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('104', '規定', '0', '100', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('105', '公文等級', '0', '99', 'officialgrade', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('106', '平急', '0', '105', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('107', '加急', '0', '105', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('108', '項目選項', '0', '1', 'project', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('109', '項目類型', '0', '108', 'projecttype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('110', '一般項目', '0', '109', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('111', '重要項目', '0', '109', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('112', '關鍵項目', '0', '109', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('113', '項目狀態', '0', '108', 'projectstate', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('114', '待執行', '0', '113', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('115', '執行中', '0', '113', null, '2', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('116', '已取消', '0', '113', null, '3', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('117', '已完成', '0', '113', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('128', '文件夾目錄', '0', null, 'folder8', null, '0', null, '1', '2016-10-01 17:57:12', '8', null, null, null);
INSERT INTO `xinhu_option` VALUES ('130', '財務選項', '0', '1', 'finance', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('131', '付款方式', '0', '130', 'paytype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('132', '現金', '0', '131', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('133', '支付寶', '0', '131', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('134', '微信', '0', '131', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('135', '銀行轉賬', '0', '131', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('136', '報銷項目', '0', '130', 'finaitems', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('137', '市內交通費', '0', '136', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('138', '電話費', '0', '136', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('139', '快遞費', '0', '136', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('140', '停車費', '0', '136', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('141', '文件夾目錄', '0', null, 'folder5', null, '0', null, '1', '2016-09-08 21:13:56', '5', null, null, null);
INSERT INTO `xinhu_option` VALUES ('143', '服務文檔', '0', '128', null, null, '0', null, '1', '2016-09-13 11:32:22', '8', null, null, null);
INSERT INTO `xinhu_option` VALUES ('144', '考勤選項', '0', '1', 'kaoqin', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('145', '人事考勤類型', '0', '144', 'kqkind', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('146', '增加年假', '0', '145', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('147', '增加哺乳假', '0', '145', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('148', '增加陪產假', '0', '145', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('149', '獎懲', '0', '26', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('150', '文件夾目錄', '0', null, 'folder9', null, '0', null, '1', '2016-10-01 18:38:06', '9', null, null, null);
INSERT INTO `xinhu_option` VALUES ('151', '任務選項', '0', '1', 'work', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('154', '人事選項', '0', '1', 'usertype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('155', '學歷', '0', '154', 'xueli', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('156', '小學', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('157', '初中', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('158', '高中', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('159', '中專', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('160', '大專', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('161', '本科', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('162', '自考本科', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('163', '研究生', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('164', '博士', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('165', '其它', '0', '155', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('166', '合同類型', '0', '154', 'userhttype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('167', '勞動合同', '0', '166', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('168', '離職類型', '0', '154', 'redundtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('169', '自動離職', '0', '168', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('170', '退休', '0', '168', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('171', '病辭', '0', '168', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('172', '辭退', '0', '168', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('173', '辭職', '0', '168', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('174', '月份', '0', '6', null, 'month', '17', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('175', '編號', '0', '6', null, 'num', '21', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('176', '客戶類型', '0', '50', 'crmtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('177', '互聯網', '0', '176', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('178', '軟件', '0', '176', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('179', '個體經營', '0', '176', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('180', '個人', '0', '176', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('181', '其它', '0', '176', null, null, '20', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('182', '政府機構', '0', '176', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('183', '人事調動類型', '0', '154', 'transfertype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('184', '平調', '0', '183', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('185', '晉升', '0', '183', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('186', '降職', '0', '183', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('190', '獎懲結果', '0', '154', 'rewardresult', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('191', '獎勵', '0', '190', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('192', '警告', '0', '190', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('193', '辭退', '0', '190', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('194', '降職', '0', '190', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('195', '張飛文件夾目錄', '0', null, 'folder6', null, '0', null, '1', '2016-10-24 21:27:22', '6', null, null, null);
INSERT INTO `xinhu_option` VALUES ('196', '個人經歷', '0', '195', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('197', '知識分類', '0', null, 'knowledgetype', null, '0', null, '1', '2016-10-27 21:10:24', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('198', '工作指南', '0', '197', null, 'title,typename,recename,zuozhe,indate,optname,caozuo', '0', null, '1', '2017-04-21 09:26:50', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('199', '工作效率', '0', '198', null, null, '1', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('200', '工作目標', '0', '198', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('201', '規章制度', '0', '197', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('202', '工作規範', '0', '197', null, null, '0', null, '1', '2016-10-26 20:54:54', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('203', '資產分類', '0', '62', 'assetstype', null, '0', null, '1', '2016-10-27 21:14:45', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('204', '打印機', '0', '203', null, '', '0', null, '1', '2017-04-21 09:26:50', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('205', '固定資產來源', '0', '62', 'wplaiyuan', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('206', '電腦', '0', '203', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('207', '台式電腦', '0', '206', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('208', '筆記本', '0', '206', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('209', '平板', '0', '206', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('210', '一體機', '0', '206', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('211', '倉庫', '0', '62', 'warehouse', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('212', '購入', '0', '205', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('213', '自建', '0', '205', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('214', '倉庫1', '0', '211', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('215', '倉庫2', '0', '211', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('216', '聯想', '0', '70', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('217', '惠普', '0', '70', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('218', '車輛類型', '0', '327', 'cartype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('219', '小型車', '0', '218', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('220', '轎車', '0', '218', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('221', '車輛品牌', '0', '327', 'carbrand', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('222', '奔馳', '0', '221', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('223', '奧迪', '0', '221', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('224', '夏利', '0', '221', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('226', '題庫分類', '0', null, 'knowtikutype', null, '0', null, '1', '2016-10-27 21:17:22', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('227', '官網知識', '0', '226', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('228', 'OA題庫', '0', '226', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('229', '會議室1', '0', '29', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('230', '會議室2', '0', '29', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('231', '圖書分類', '0', null, 'booktype', null, '0', null, '1', '2016-10-28 23:15:11', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('232', '計算機', '0', '231', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('233', '管理書籍', '0', '231', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('244', '印章類型', '0', '62', 'sealtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('245', '合同章', '0', '244', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('246', '法人章', '0', '244', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('247', '財務章', '0', '244', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('248', '公章', '0', '244', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('249', '調休', '0', '46', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('250', '單圖片上傳', '0', '6', null, 'uploadimg', '19', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('251', '打卡異常類型', '0', '144', 'kqerrtype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('252', '忘記打卡', '0', '251', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('253', '打卡不成功', '0', '251', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('254', '郵箱文本框', '0', '6', null, 'email', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('255', 'gerenvcard_1選項', '0', null, 'gerenvcard_1', null, '0', null, '1', '2016-12-20 10:52:49', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('256', '同事', '0', '255', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('257', '盟友', '0', '255', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('258', '敵人', '0', '255', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('259', 'gerenvcard_8選項', '0', null, 'gerenvcard_8', null, '0', null, '1', '2016-12-20 11:23:21', '8', null, null, null);
INSERT INTO `xinhu_option` VALUES ('260', '同事', '0', '259', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('261', 'gerenvcard_5選項', '0', null, 'gerenvcard_5', null, '0', null, '1', '2016-12-20 11:30:38', '5', null, null, null);
INSERT INTO `xinhu_option` VALUES ('262', '彈框下拉選擇(單選)', '0', '6', null, 'selectdatafalse', '22', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('263', '彈框下拉選擇(多選)', '0', '6', null, 'selectdatatrue', '23', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('365', '默認1天上班小時', '0', '144', 'kqsbtime', '8', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('277', '用戶bug1', '0', null, 'adminbug1', '2017-02-15 10:18:19', '0', null, '1', '2017-02-15 10:18:19', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('273', '文件上傳(可多選)', '0', '6', null, 'uploadfile', '20', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('286', '模塊列定義', '0', '-1007', 'columns_customer_shate', 'name,suoname,type,laiyuan,unitname,isstat,caozuo', '0', null, '1', '2017-07-13 19:02:20', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('287', '模塊列定義', '0', '-1007', 'columns_customer_dist', 'name,suoname,type,laiyuan,unitname,isgys,linkname', '0', null, '1', '2017-04-21 11:55:50', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('288', '模塊列定義', '0', '-1007', 'columns_customer_', 'name,suoname,type,unitname,tel,mobile,address,isstat,htshu,moneyz,moneyd,caozuo', '0', null, '1', '2017-04-21 11:55:33', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('294', '技術姿勢', '0', '226', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('295', 'PHP知識', '0', '294', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('296', 'JS知識', '0', '294', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('298', '模塊列定義', '0', '-1004', 'columns_work_', 'title,type,grade,dist,startdt,enddt,ddname,score,optname,optdt,caozuo', '0', null, '1', '2017-05-11 09:55:28', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('299', '模塊列定義', '0', '-1004', 'columns_work_all', 'title,type,grade,dist,startdt,enddt,ddname,score,optname,optdt,caozuo', '0', null, '1', '2017-05-11 10:04:02', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('300', '收款章', '0', '244', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('302', '開發部文件夾目錄', '0', null, 'deptfolderdev', null, '0', null, '1', '2017-05-27 17:36:02', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('303', '技術文檔', '0', '302', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('304', '趙子龍文件夾目錄', '0', null, 'folder7', null, '0', null, '1', '2017-05-27 17:49:46', '7', null, null, null);
INSERT INTO `xinhu_option` VALUES ('305', '公文密級', '0', '99', 'officialmiji', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('306', '私密', '0', '305', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('307', '機密', '0', '305', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('308', '絕密', '0', '305', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('309', '特急', '0', '105', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('310', '特提', '0', '105', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('311', '公文文件類別', '0', '99', 'officialfiletype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('312', '中央省委', '0', '311', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('313', '單選框', '0', '6', null, 'radio', '24', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('320', '車輛登記類型', '0', '327', 'carotype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('321', '加油', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('322', '強險', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('323', '商業險', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('324', '行駛證', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('325', '違章', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('326', '事故', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('327', '車輛管理選項', '0', '62', 'carm', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('328', '車輛幾天內提醒(多個,分開)', '0', '327', 'cartodo', '0,3,7,10,30,45', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('331', '過橋費', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('332', '高速費', '0', '320', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('333', '客戶合同到期幾天內提醒', '0', '50', 'crmtodo', '0,3,7,10,30,45', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('334', '可直接申請請假類型', '0', '144', 'kqsqtype', '病假,事假', '0', null, '1', null, '0', null, null, '多個,分開，沒有設置的請假類型時，申請請假條需要有剩餘假期才可以申請。');
INSERT INTO `xinhu_option` VALUES ('335', '人員狀態', '0', '154', 'userstate', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('336', '試用期', '0', '335', null, '0', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('337', '正式', '0', '335', null, '1', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('338', '實習生', '0', '335', null, '2', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('339', '兼職', '0', '335', null, '3', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('340', '臨時工', '0', '335', null, '4', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('341', '離職', '0', '335', null, '5', '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('342', 'gerenvcar選項', '0', null, 'gerenvcar', null, '0', null, '1', '2017-07-21 13:37:48', '1', null, null, null);
INSERT INTO `xinhu_option` VALUES ('344', '支', '0', '71', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('351', '發票類型', '0', '130', 'openpiaotype', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('352', '增值稅普通發票', '0', '351', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('353', '增值稅專用發票', '0', '351', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('354', '定額發票', '0', '351', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('355', '台式電腦2', '0', '206', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('356', '筆', '0', '65', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('359', '發文字號', '0', '99', 'officiazinum', null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('360', '信呼', '0', '359', null, null, '0', null, '1', null, '0', null, null, null);
INSERT INTO `xinhu_option` VALUES ('363', '選擇部門(多選)', '0', '6', null, 'changedeptcheck', '9', null, '1', null, '0', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_project`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_project`;
CREATE TABLE `xinhu_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) DEFAULT '0',
  `type` varchar(20) DEFAULT NULL COMMENT '項目類型',
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `status` tinyint(1) DEFAULT '0',
  `title` varchar(100) DEFAULT NULL COMMENT '項目名稱',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `enddt` datetime DEFAULT NULL COMMENT '預計結束時間',
  `fuze` varchar(20) DEFAULT NULL COMMENT '負責人',
  `fuzeid` varchar(50) DEFAULT NULL,
  `runuser` varchar(100) DEFAULT NULL COMMENT '執行人員',
  `runuserid` varchar(100) DEFAULT NULL,
  `progress` smallint(6) DEFAULT '0' COMMENT '進度',
  `viewuser` varchar(100) DEFAULT NULL COMMENT '授權查看',
  `viewuserid` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '說明備注',
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `adddt` datetime DEFAULT NULL COMMENT '添加時間',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='項目表';

-- ----------------------------
-- Records of xinhu_project
-- ----------------------------
INSERT INTO `xinhu_project` VALUES ('1', '0', '一般項目', 'wechat-dev', '1', '信呼微信企業號開發', '2016-08-14 09:56:23', '2016-12-31 23:59:59', '管理員', '1', '開發部', 'd2', '100', null, null, null, '1', '管理員', '2016-09-06 19:41:26', '2016-08-14 09:57:21', '0');
INSERT INTO `xinhu_project` VALUES ('2', '0', '重要項目', null, '5', '信呼開發', '2016-09-08 20:26:14', null, '磐石', '5', '開發部', 'd2', '6', null, null, '哈哈哈哈', '1', '管理員', '2016-09-08 20:26:41', '2016-09-08 20:26:41', '0');
INSERT INTO `xinhu_project` VALUES ('3', '0', '關鍵項目', 'androidapp', '0', 'Android原生信呼app開發', '2017-03-01 11:59:00', null, '管理員', '1', '開發部', 'd2', '0', null, null, '做好任務分配開發啊。', '1', '管理員', '2017-04-13 11:59:43', '2017-04-13 11:59:43', '0');
INSERT INTO `xinhu_project` VALUES ('4', '0', '一般項目', 'xiaoxy', '0', '微信小程序開發', '2017-05-01 16:12:51', null, '管理員', '1', '開發部', 'd2', '0', null, null, '開發啊', '1', '管理員', '2017-04-14 16:16:53', '2017-04-14 16:13:30', '0');

-- ----------------------------
-- Table structure for `xinhu_reads`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_reads`;
CREATE TABLE `xinhu_reads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(30) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `optid` smallint(6) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(30) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL COMMENT '第一次瀏覽',
  `stotal` smallint(6) DEFAULT '1' COMMENT '流程次數',
  PRIMARY KEY (`id`),
  UNIQUE KEY `table_2` (`table`,`mid`,`optid`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='單據瀏覽記錄表';

-- ----------------------------
-- Records of xinhu_reads
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_repair`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_repair`;
CREATE TABLE `xinhu_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `assetm` varchar(100) DEFAULT NULL COMMENT '報修資產',
  `reason` varchar(500) DEFAULT NULL COMMENT '保修原因',
  `reasons` varchar(500) DEFAULT NULL COMMENT '實際原因',
  `iswx` tinyint(1) DEFAULT '0' COMMENT '需要外修',
  `money` decimal(8,2) DEFAULT '0.00' COMMENT '維修金額',
  `wxname` varchar(50) DEFAULT NULL COMMENT '維修人員',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='維修報修';

-- ----------------------------
-- Records of xinhu_repair
-- ----------------------------
INSERT INTO `xinhu_repair` VALUES ('1', '1', '2017-07-07 13:12:53', '1', '管理員', '2017-07-07', null, '1', '1', '打印機', '打印機突然打印不了字了', '沒碳粉了，換一下就好了', '0', '0.00', '大喬');
INSERT INTO `xinhu_repair` VALUES ('2', '3', '2017-07-07 13:37:28', '3', '小喬', '2017-07-07', null, '1', '1', '我電腦壞了', '我電腦壞了開不了，一按下鍵盤就重啟。', '鍵盤壞了，需要外修', '1', '30.00', '科技人員');

-- ----------------------------
-- Table structure for `xinhu_reward`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_reward`;
CREATE TABLE `xinhu_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `object` varchar(30) DEFAULT NULL COMMENT '獎懲對象',
  `objectid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '獎懲類型0獎勵,1處罰',
  `result` varchar(50) DEFAULT NULL COMMENT '獎懲結果',
  `money` mediumint(6) DEFAULT NULL COMMENT '獎懲金額',
  `happendt` datetime DEFAULT NULL COMMENT '發生時間',
  `hapaddress` varchar(50) DEFAULT NULL COMMENT '發生地點',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='獎懲';

-- ----------------------------
-- Records of xinhu_reward
-- ----------------------------
INSERT INTO `xinhu_reward` VALUES ('1', '1', '2016-10-20 21:01:10', '1', '管理員', '2016-10-20', '積極做好工作，特此獎勵！', '1', '1', '管理員', '1', '0', '獎勵', '200', '2016-10-01 20:59:14', '公司');
INSERT INTO `xinhu_reward` VALUES ('2', '1', '2016-10-20 21:16:24', '1', '管理員', '2016-10-20', '對客戶言語不確當被投訴了，哈哈。', '0', '1', '信呼客服', '8', '1', '警告', '20', '2016-10-06 21:15:27', '公司');

-- ----------------------------
-- Table structure for `xinhu_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_schedule`;
CREATE TABLE `xinhu_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `startdt` datetime DEFAULT NULL,
  `enddt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT NULL COMMENT '用戶Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '頻率',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `rate` varchar(5) DEFAULT NULL,
  `rateval` varchar(50) DEFAULT NULL,
  `txsj` tinyint(1) DEFAULT '0' COMMENT '是否提醒',
  `status` tinyint(1) DEFAULT '1',
  `receid` varchar(100) DEFAULT NULL,
  `recename` varchar(100) DEFAULT NULL COMMENT '提醒給',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='日程';

-- ----------------------------
-- Records of xinhu_schedule
-- ----------------------------
INSERT INTO `xinhu_schedule` VALUES ('1', '每月初提醒考勤是否正常', '2016-08-01 08:00:00', null, '1', '2017-02-27 10:54:57', '管理員', '0', null, null, 'm', '1', '1', '1', 'd1', '信呼開發團隊');
INSERT INTO `xinhu_schedule` VALUES ('2', '每週五下班前提交這週報告給主管', '2016-08-01 17:00:00', null, '1', '2016-08-30 22:38:48', '管理員', '0', null, null, 'w', '5', '1', '1', null, null);
INSERT INTO `xinhu_schedule` VALUES ('3', '吃飯了嘛？', '2016-09-12 12:00:00', null, '1', '2017-02-27 11:54:17', '管理員', '0', null, null, 'd', null, '1', '1', null, null);
INSERT INTO `xinhu_schedule` VALUES ('4', '該起床拉', '2017-04-17 08:00:00', null, '3', '2017-04-17 08:43:03', '小喬', '0', null, null, 'd', null, '1', '1', null, null);

-- ----------------------------
-- Table structure for `xinhu_seal`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_seal`;
CREATE TABLE `xinhu_seal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '印章名稱',
  `type` varchar(10) DEFAULT NULL COMMENT '印章類型',
  `bgname` varchar(50) DEFAULT NULL COMMENT '保管人',
  `bgid` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `sealimg` varchar(100) DEFAULT NULL COMMENT '對應印章圖片',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='印章表';

-- ----------------------------
-- Records of xinhu_seal
-- ----------------------------
INSERT INTO `xinhu_seal` VALUES ('1', '信呼團隊收款章', '收款章', '張飛', '6', '2017-05-18 20:45:25', '0', 'http://xh829.com/images/zhang_ys.png', null);
INSERT INTO `xinhu_seal` VALUES ('2', '信呼團隊公章', '公章', '管理員', '1', '2017-05-18 21:04:59', '0', 'http://xh829.com/images/gz.png', null);

-- ----------------------------
-- Table structure for `xinhu_sealapl`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_sealapl`;
CREATE TABLE `xinhu_sealapl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `sealid` smallint(6) DEFAULT '0' COMMENT '印章id',
  `sealname` varchar(50) DEFAULT NULL COMMENT '印章名稱',
  `isout` tinyint(1) DEFAULT '0' COMMENT '是否外帶',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='印章申請使用表';

-- ----------------------------
-- Records of xinhu_sealapl
-- ----------------------------
INSERT INTO `xinhu_sealapl` VALUES ('1', '1', '2016-12-08 21:48:02', '1', '管理員', '2016-12-08', '蓋章啦啦啦！', '5', '1', '1', '信呼團隊收款章', '0');
INSERT INTO `xinhu_sealapl` VALUES ('2', '1', '2017-03-20 09:39:47', '1', '管理員', '2017-03-20', '啦啦啦', '1', '1', '1', '信呼團隊收款章', '0');

-- ----------------------------
-- Table structure for `xinhu_sjoin`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_sjoin`;
CREATE TABLE `xinhu_sjoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '類型',
  `mid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_mid` (`type`,`mid`) USING BTREE,
  KEY `type_sid` (`type`,`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='後台菜單權限';

-- ----------------------------
-- Records of xinhu_sjoin
-- ----------------------------
INSERT INTO `xinhu_sjoin` VALUES ('16', 'ug', '6', '2', '2017-07-08 18:51:03');
INSERT INTO `xinhu_sjoin` VALUES ('17', 'ug', '7', '1', '2017-07-08 22:23:39');
INSERT INTO `xinhu_sjoin` VALUES ('3', 'gm', '1', '134', '2016-12-26 19:58:34');
INSERT INTO `xinhu_sjoin` VALUES ('4', 'gm', '1', '135', '2016-12-26 19:58:34');
INSERT INTO `xinhu_sjoin` VALUES ('15', 'ug', '6', '1', '2017-07-08 18:51:03');
INSERT INTO `xinhu_sjoin` VALUES ('8', 'um', '4', '85', '2017-05-11 10:00:07');
INSERT INTO `xinhu_sjoin` VALUES ('9', 'um', '4', '95', '2017-05-11 10:00:07');
INSERT INTO `xinhu_sjoin` VALUES ('10', 'um', '4', '149', '2017-05-11 10:00:07');
INSERT INTO `xinhu_sjoin` VALUES ('11', 'um', '4', '193', '2017-05-11 10:00:07');
INSERT INTO `xinhu_sjoin` VALUES ('12', 'um', '4', '194', '2017-05-11 10:00:07');
INSERT INTO `xinhu_sjoin` VALUES ('13', 'um', '4', '196', '2017-05-11 10:00:07');

-- ----------------------------
-- Table structure for `xinhu_subscribe`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_subscribe`;
CREATE TABLE `xinhu_subscribe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '訂閱標題',
  `cont` varchar(200) DEFAULT NULL COMMENT '訂閱時提醒內容',
  `explain` varchar(100) DEFAULT NULL COMMENT '訂閱說明',
  `optid` int(11) DEFAULT '0' COMMENT '操作人ID',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `suburl` varchar(1000) DEFAULT NULL COMMENT '訂閱地址',
  `suburlpost` varchar(4000) DEFAULT NULL COMMENT '訂閱地址post參數',
  `lastdt` datetime DEFAULT NULL COMMENT '最後運行時間',
  `shateid` varchar(300) DEFAULT NULL,
  `shatename` varchar(300) DEFAULT NULL COMMENT '共享給',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='訂閱管理表';

-- ----------------------------
-- Records of xinhu_subscribe
-- ----------------------------
INSERT INTO `xinhu_subscribe` VALUES ('1', '考勤統計簡表({month-1})', '{month-1}月份人員考勤統計簡表', '訂閱上月考勤統計表', '1', '管理員', '2017-09-03 20:11:24', '1', 'aW5kZXgucGhwP2E9cHVibGljc3RvcmUmbT1rYW9xaW4mZD1tYWluJmFqYXhib29sPXRydWUmcm5kPTY0NjM0OQ::', 'dGFibGVuYW1lX2FiYz11c2VyaW5mbyZsb2FkY2k9MSZzdG9yZWJlZm9yZWFjdGlvbj1rcXRvdGFsYmVmb3Jlc2hvdyZzdG9yZWFmdGVyYWN0aW9uPWtxdG90YWxhZnRlcnNob3cmc3RhcnQ9MCZsaW1pdD0xMDAwMCZhdHlwZT1hbGwmZXhlY2xkb3duPXRydWUmZXhjZWx0aXRsZT3ogIPli6Tnu5.orqHnroDooagmZXhjZWxmaWVsZHM9ZGVwdG5hbWUsbmFtZSxyYW5raW5nLHN0YXRlLHN0YXRlMCxzdGF0ZTEsc3RhdGUyLGppYWJhbixvdXRjaSxlcnJjaSxzYmRheSx5c2JkYXksd2VpZGsmZXhjZWxoZWFkZXI96YOo6ZeoLOWnk!WQjSzogYzkvY0s5Lq65ZGY54q25oCBLOato!W4uCzov5.liLAs5pep6YCALOWKoOePrSjml7YpLOWkluWHuijmrKEpLOW8guW4uCjmrKEpLOW6lOS4iuePrSjlpKkpLOW3suS4iuePrSjlpKkpLOacquaJk!WNoSZtb250aD17bW9udGgtMX0:', '2017-09-30 09:43:41', null, null);

-- ----------------------------
-- Table structure for `xinhu_subscribeinfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_subscribeinfo`;
CREATE TABLE `xinhu_subscribeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT '0' COMMENT '對應定ID',
  `title` varchar(50) DEFAULT NULL COMMENT '標題',
  `cont` varchar(200) DEFAULT NULL COMMENT '內容',
  `optdt` datetime DEFAULT NULL,
  `filepath` varchar(200) DEFAULT NULL COMMENT '文件路徑',
  `receid` varchar(4000) DEFAULT NULL COMMENT '發送給',
  `recename` varchar(200) DEFAULT NULL COMMENT '對應人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='訂閱內容信息';

-- ----------------------------
-- Records of xinhu_subscribeinfo
-- ----------------------------
INSERT INTO `xinhu_subscribeinfo` VALUES ('1', '1', '考勤統計簡表(2017-08)', '2017-08月份人員考勤統計簡表', '2017-09-30 09:43:41', 'upload/2017-09/考勤統計簡表(2017-08)_30_094341.html', '1', '管理員');

-- ----------------------------
-- Table structure for `xinhu_task`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_task`;
CREATE TABLE `xinhu_task` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `fenlei` varchar(10) DEFAULT NULL COMMENT '類型分類',
  `url` varchar(100) DEFAULT NULL COMMENT '運行地址',
  `type` varchar(100) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  `ratecont` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否啟用',
  `state` tinyint(1) DEFAULT '0' COMMENT '最後狀態',
  `lastdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `lastcont` varchar(500) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL COMMENT '說明',
  `todoid` varchar(200) DEFAULT NULL,
  `todoname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='計劃任務';

-- ----------------------------
-- Records of xinhu_task
-- ----------------------------
INSERT INTO `xinhu_task` VALUES ('1', '流程從新匹配', '系統', 'flow,pipei', 'd,d', '00:10:00,12:10:00', '每天0,12點', '1', '0', null, null, '0', null, null, null, null, null);
INSERT INTO `xinhu_task` VALUES ('2', '數據備份', '系統', 'sys,beifen', 'd', '00:20:00', '每天凌晨00:20', '1', '0', null, null, '0', null, null, null, null, null);
INSERT INTO `xinhu_task` VALUES ('3', '系統升級提醒', '系統', 'sys,upgtx', 'd', '00:25:00', '每天凌晨00:25', '1', '0', null, null, '0', null, null, null, '1,8', '管理員,信呼客服');
INSERT INTO `xinhu_task` VALUES ('4', '5分鐘運行1次', '系統', 'minute5,run', 'i5', '00', '每5分鐘運行一次', '1', '0', null, null, '0', null, null, null, null, null);
INSERT INTO `xinhu_task` VALUES ('5', '考勤信息提醒', '考勤', 'kaoqin,todo', 'd', '09:25:00', '每天9點', '1', '0', null, null, '21', null, null, '在模塊【考勤信息】下設置提醒到哪些平台。', null, null);
INSERT INTO `xinhu_task` VALUES ('6', '用戶數據更新', '用戶', 'sys,dataup', 'd', '00:10:00', '每天', '1', '0', null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_task` VALUES ('7', '考勤分析', '考勤', 'kaoqin,anay', 'd', '02:15:00', '每天2點', '1', '0', null, null, '22', null, null, '分析全體人員昨天的考勤', null, null);
INSERT INTO `xinhu_task` VALUES ('8', '員工合同提醒', '人事', 'hr,httodo', 'd', '00:05:00', null, '1', '0', null, null, '30', null, null, '員工合同到期提醒，hr調用轉正離職運行', '4', '大喬');
INSERT INTO `xinhu_task` VALUES ('9', '每天運行一次', '系統', 'day,run', 'd', '09:10:00', '每天09:10', '1', '0', null, null, '0', null, null, '任務到期,流程待辦提醒', null, null);
INSERT INTO `xinhu_task` VALUES ('10', '每月1號分析上月考勤', '考勤', 'kaoqin,lmanay', 'm', '01 05:00:00', '每月1號5點', '1', '0', null, null, '23', null, null, '分析上月全體人員考勤', null, null);
INSERT INTO `xinhu_task` VALUES ('12', '日報統計分析', '考勤', 'kaoqin,dailyfx', 'd', '02:20:00', null, '1', '0', null, null, '24', null, null, null, null, null);
INSERT INTO `xinhu_task` VALUES ('13', '車輛信息提醒', '車輛', 'carm,run', 'd', '08:10:00', null, '1', '0', null, null, '40', null, null, null, '4', '大喬');
INSERT INTO `xinhu_task` VALUES ('14', '客戶提醒', 'CRM', 'crm,run', 'd', '08:15:00', null, '1', '0', null, null, '50', null, null, '客戶合同待收付款提醒', null, null);
INSERT INTO `xinhu_task` VALUES ('15', '考勤每天運行', '考勤', 'kaoqin,day', 'd', '02:30:00', null, '1', '0', null, null, '20', null, null, '年假自動添加等', null, null);

-- ----------------------------
-- Table structure for `xinhu_todo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_todo`;
CREATE TABLE `xinhu_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '類型',
  `mess` varchar(500) DEFAULT NULL COMMENT '信息內容',
  `status` tinyint(1) DEFAULT '0' COMMENT '狀態@0|未讀,1|已讀',
  `optdt` datetime DEFAULT NULL COMMENT '時間',
  `table` varchar(50) DEFAULT NULL,
  `mid` smallint(6) DEFAULT NULL,
  `readdt` datetime DEFAULT NULL COMMENT '已讀時間',
  `tododt` datetime DEFAULT NULL COMMENT '提醒時間',
  `modenum` varchar(20) DEFAULT NULL COMMENT '對應模塊編號',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='提醒消息表';

-- ----------------------------
-- Records of xinhu_todo
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_tovoid`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_tovoid`;
CREATE TABLE `xinhu_tovoid` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `type` tinyint(1) DEFAULT '0' COMMENT '0|作廢,1|刪除',
  `modename` varchar(20) DEFAULT NULL COMMENT '模塊',
  `modeid` smallint(6) DEFAULT '0' COMMENT '對應模塊id',
  `tonum` varchar(200) DEFAULT NULL COMMENT '作廢單號',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='單據申請作廢表';

-- ----------------------------
-- Records of xinhu_tovoid
-- ----------------------------
INSERT INTO `xinhu_tovoid` VALUES ('3', '1', '2016-12-19 13:49:22', '1', '管理員', '2016-12-19', '在刪', '5', '1', '1', '單據作廢申請', '52', 'ZF-20161219-0002');
INSERT INTO `xinhu_tovoid` VALUES ('5', '1', '2016-12-19 14:39:20', '1', '管理員', '2016-12-19', 'hhahhhhaaa', '1', '1', '1', '單據作廢申請', '52', 'ZF-20161219-0004');

-- ----------------------------
-- Table structure for `xinhu_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_userinfo`;
CREATE TABLE `xinhu_userinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `num` varchar(20) DEFAULT NULL COMMENT '編號',
  `deptname` varchar(30) DEFAULT NULL,
  `deptnames` varchar(100) DEFAULT NULL COMMENT '多部門',
  `ranking` varchar(20) DEFAULT NULL,
  `rankings` varchar(100) DEFAULT NULL COMMENT '多職位',
  `dkip` varchar(30) DEFAULT NULL,
  `dkmac` varchar(30) DEFAULT NULL,
  `state` tinyint(1) DEFAULT '0' COMMENT '狀態來自userstate',
  `sex` varchar(10) DEFAULT NULL COMMENT '性別',
  `tel` varchar(50) DEFAULT NULL COMMENT '電話',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手機號',
  `workdate` date DEFAULT NULL COMMENT '入職時間',
  `email` varchar(50) DEFAULT NULL COMMENT '郵箱',
  `quitdt` date DEFAULT NULL COMMENT '離職日期',
  `iskq` tinyint(1) DEFAULT '1' COMMENT '是否考勤',
  `isdwdk` tinyint(1) DEFAULT '0' COMMENT '是否定位打卡',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `xueli` varchar(20) DEFAULT NULL,
  `birtype` tinyint(1) DEFAULT '0' COMMENT '0陽歷1農歷',
  `minzu` varchar(20) DEFAULT NULL COMMENT '民族',
  `hunyin` varchar(10) DEFAULT NULL COMMENT '婚姻',
  `jiguan` varchar(20) DEFAULT NULL COMMENT '籍貫',
  `nowdizhi` varchar(50) DEFAULT NULL COMMENT '現住址',
  `housedizhi` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `syenddt` date DEFAULT NULL COMMENT '試用期到',
  `positivedt` date DEFAULT NULL COMMENT '轉正日期',
  `bankname` varchar(50) DEFAULT NULL COMMENT '開戶行',
  `banknum` varchar(30) DEFAULT NULL COMMENT '工資卡帳號',
  `zhaopian` varchar(100) DEFAULT NULL COMMENT '照片',
  `idnum` varchar(30) DEFAULT NULL COMMENT '身份證號',
  `spareman` varchar(30) DEFAULT NULL COMMENT '備用聯系人',
  `sparetel` varchar(50) DEFAULT NULL COMMENT '備用聯系人電話',
  `isdaily` tinyint(4) DEFAULT '1' COMMENT '是否需要寫日報',
  `companyid` int(11) DEFAULT '0' COMMENT '所在公司單位Id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用戶檔案表';

-- ----------------------------
-- Records of xinhu_userinfo
-- ----------------------------
INSERT INTO `xinhu_userinfo` VALUES ('1', '管理員', null, '開發部', '財務部', '項目主管', '財務總監', '192.168.1.63', null, '1', '男', '0592-1234567', '15800000123', '2016-06-01', 'admin@rockoa.com', null, '1', '0', '1996-10-01', '博士後', '0', '漢', '未婚', '福建', '廈門', '廈門', '2016-10-01', '2016-10-02', '廈門銀行', '6225****', 'images/face.jpg', '3501222222', '磐石', '10086', '1', '1');
INSERT INTO `xinhu_userinfo` VALUES ('2', '貂蟬', null, '財務部', null, '財務總監', null, null, null, '1', '女', '0592-123456', '15800000007', '2016-08-09', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, 'images/diaochan.jpg', null, null, null, '1', '0');
INSERT INTO `xinhu_userinfo` VALUES ('3', '小喬', null, '財務部', null, '出納', null, null, null, '1', '女', null, '15800000001', '2017-05-02', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `xinhu_userinfo` VALUES ('4', '大喬', null, '行政人事部', null, '人事主管', null, null, null, '1', '女', null, '15800000002', '2017-07-01', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '0');
INSERT INTO `xinhu_userinfo` VALUES ('5', '磐石', null, '管理層', null, '董事長', null, null, null, '1', '男', null, '15800000009', '2015-11-01', null, null, '0', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', '1');
INSERT INTO `xinhu_userinfo` VALUES ('6', '張飛', null, '開發部', null, '程序員', null, null, null, '1', '男', null, '15800000004', '2017-07-01', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1');
INSERT INTO `xinhu_userinfo` VALUES ('7', '趙子龍', null, '開發部', null, '高級程序員', null, null, null, '1', '男', null, '15800000005', '2016-07-01', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1');
INSERT INTO `xinhu_userinfo` VALUES ('8', '信呼客服', null, '開發部', null, '客服', null, '192.168.1.63', '64:00:6a:49:20:4b', '0', '男', null, '15800000006', '2016-07-01', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1');
INSERT INTO `xinhu_userinfo` VALUES ('9', '張三', null, '開發部', null, '程序員', null, null, null, '0', '男', '0592-1234567-005', '15812345678', '2017-09-30', 'zhangsan@rockoa.com', null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1');

-- ----------------------------
-- Table structure for `xinhu_userinfos`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_userinfos`;
CREATE TABLE `xinhu_userinfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '對應主表userinfo.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `startdt` date DEFAULT NULL COMMENT '開始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `rank` varchar(50) DEFAULT NULL COMMENT '職位',
  `unitname` varchar(50) DEFAULT NULL COMMENT '單位名稱',
  `sslx` tinyint(1) DEFAULT '0' COMMENT '0工作經歷,1教育經歷',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='人員檔案子表';

-- ----------------------------
-- Records of xinhu_userinfos
-- ----------------------------
INSERT INTO `xinhu_userinfos` VALUES ('1', '1', '0', '2017-01-05', '2017-01-12', '程序員', '微信', '0');
INSERT INTO `xinhu_userinfos` VALUES ('2', '1', '0', '2017-01-05', '2017-01-27', '研究生', '哈弗', '1');
INSERT INTO `xinhu_userinfos` VALUES ('3', '1', '1', '2017-01-13', '2017-01-20', '架構師', '微軟', '0');
INSERT INTO `xinhu_userinfos` VALUES ('4', '1', '1', '2017-01-25', '2017-01-31', '博士', '劍橋', '1');
INSERT INTO `xinhu_userinfos` VALUES ('5', '1', '2', '2017-01-11', '2017-01-31', '博士後', '清華', '1');
INSERT INTO `xinhu_userinfos` VALUES ('6', '1', '2', '2017-05-01', '2017-05-31', '架構師', '微軟', '0');

-- ----------------------------
-- Table structure for `xinhu_userract`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_userract`;
CREATE TABLE `xinhu_userract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `startdt` date DEFAULT NULL COMMENT '開始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `uid` smallint(6) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `httype` varchar(30) DEFAULT NULL COMMENT '合同類型',
  `state` tinyint(1) DEFAULT '0' COMMENT '0|待執行,1|生效中,2|已終止,3|已過期',
  `tqenddt` date DEFAULT NULL COMMENT '提前終止',
  `company` varchar(50) DEFAULT NULL COMMENT '簽署公司',
  `uname` varchar(20) DEFAULT NULL COMMENT '簽署人',
  `companyid` smallint(6) DEFAULT '0' COMMENT '簽署公司Id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用戶合同表';

-- ----------------------------
-- Records of xinhu_userract
-- ----------------------------
INSERT INTO `xinhu_userract` VALUES ('1', '第一次簽勞動合同', '2015-10-01', '2017-05-31', '1', '0', '2017-07-08 15:37:43', null, '勞動合同', '3', null, '信呼開發團隊', '管理員', '1');
INSERT INTO `xinhu_userract` VALUES ('2', '合同', '2015-10-01', '2016-09-30', '6', '0', '2017-07-08 15:40:20', '嗯嗯嗯', '勞動合同', '3', null, '信呼開發團隊', '張飛', '1');
INSERT INTO `xinhu_userract` VALUES ('3', '合同', '2015-10-01', '2017-08-30', '3', '0', '2017-08-23 10:17:36', '諤諤', '勞動合同', '1', null, '信呼開發團隊', '小喬', '1');

-- ----------------------------
-- Table structure for `xinhu_vcard`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_vcard`;
CREATE TABLE `xinhu_vcard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手機號',
  `optdt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT '0',
  `tel` varchar(50) DEFAULT NULL COMMENT '電話',
  `email` varchar(100) DEFAULT NULL COMMENT '郵箱',
  `gname` varchar(20) DEFAULT NULL COMMENT '所在組名',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `address` varchar(100) DEFAULT NULL COMMENT '地址',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序號',
  `unitname` varchar(50) DEFAULT NULL COMMENT '單位名稱',
  `sex` varchar(5) DEFAULT NULL COMMENT '性別',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='個人通訊錄';

-- ----------------------------
-- Records of xinhu_vcard
-- ----------------------------
INSERT INTO `xinhu_vcard` VALUES ('2', '曹操', null, '2017-08-22 16:17:49', '1', null, 'caocao@rockoa.com', '敵人', '管理員', null, '0', '魏國', '男');
INSERT INTO `xinhu_vcard` VALUES ('3', '諸葛亮', null, '2016-12-20 11:27:08', '1', null, 'zgl@rockoa.com', '同事', '管理員', null, '0', '蜀國', null);
INSERT INTO `xinhu_vcard` VALUES ('4', '管理員', null, '2016-12-20 11:31:21', '8', null, 'admin@rockoa.com', '同事', '信呼客服', null, '0', '信呼開發團隊', null);
INSERT INTO `xinhu_vcard` VALUES ('5', '管理員', null, '2016-12-21 14:36:17', '1', null, 'admin@rockoa.com', null, '管理員', null, '0', null, null);
INSERT INTO `xinhu_vcard` VALUES ('7', '關羽', '15812345678', '2017-08-22 16:19:20', '1', '0592-123456', 'guanyu@rockoa.com', '同事', '管理員', '荊州市', '0', '蜀國荊州守將', '男');

-- ----------------------------
-- Table structure for `xinhu_word`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_word`;
CREATE TABLE `xinhu_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `fileid` int(11) DEFAULT '0',
  `shateid` varchar(200) DEFAULT NULL,
  `shate` varchar(200) DEFAULT NULL COMMENT '分享給我的',
  `optdt` datetime DEFAULT NULL,
  `typeid` smallint(6) DEFAULT '0' COMMENT '對應類型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文檔表';

-- ----------------------------
-- Records of xinhu_word
-- ----------------------------
INSERT INTO `xinhu_word` VALUES ('1', '1', '管理員', '1', null, null, '2016-11-23 22:26:22', '95');
INSERT INTO `xinhu_word` VALUES ('2', '1', '管理員', '2', null, null, '2016-11-23 22:26:27', '95');

-- ----------------------------
-- Table structure for `xinhu_work`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_work`;
CREATE TABLE `xinhu_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '標題',
  `type` varchar(20) DEFAULT NULL COMMENT '任務類型',
  `grade` varchar(10) DEFAULT NULL COMMENT '任務等級',
  `distid` varchar(50) DEFAULT NULL,
  `dist` varchar(50) DEFAULT NULL COMMENT '分配給',
  `explain` varchar(4000) DEFAULT NULL COMMENT '說明',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `startdt` datetime DEFAULT NULL COMMENT '開始時間',
  `enddt` datetime DEFAULT NULL COMMENT '結束時間',
  `state` tinyint(1) DEFAULT '0' COMMENT '狀態',
  `txdt` datetime DEFAULT NULL,
  `fen` smallint(6) DEFAULT '0' COMMENT '分值',
  `status` tinyint(1) DEFAULT '1',
  `projectid` smallint(6) DEFAULT '0' COMMENT '對應項目Id',
  `ddid` varchar(50) DEFAULT NULL,
  `ddname` varchar(50) DEFAULT NULL COMMENT '督導人員，不填默認上級',
  `score` smallint(6) DEFAULT '0' COMMENT '任務分數',
  `mark` smallint(6) DEFAULT '0' COMMENT '得分',
  `uid` smallint(6) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='任務';

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('1', null, '流程單據填寫時建議添加保存草稿功能', '改進', '低', '1', '管理員', null, '2017-07-24 10:02:38', '1', '管理員', '2017-03-29 10:57:14', null, '0', null, '0', '5', '2', null, null, '0', '0', '1', '2017-03-29', '1');
INSERT INTO `xinhu_work` VALUES ('2', null, '信呼功能開發', '改進', '中', '1', '管理員', '1、添加編輯器插件。\n', '2017-04-06 14:07:50', '1', '管理員', '2017-04-06 14:07:16', null, '0', null, '0', '1', '2', null, null, '0', '0', '1', '2017-04-06', '1');
INSERT INTO `xinhu_work` VALUES ('3', null, '高級搜索添加', '改進', '中', '1', '管理員', '哈哈哈', '2017-04-18 11:43:47', '1', '管理員', '2017-04-10 17:14:14', null, '0', null, '0', '1', '2', null, null, '0', '45', '1', '2017-04-10', '1');
INSERT INTO `xinhu_work` VALUES ('5', null, '標題改進', 'bug', '低', '7', '趙子龍', null, '2017-08-15 17:43:16', '1', '管理員', '2017-08-12 17:31:18', null, '0', null, '0', '3', '3', '3', '小喬', '0', '0', '1', '2017-08-12', '1');

-- ----------------------------
-- Table structure for `xinhu_wouser`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_wouser`;
CREATE TABLE `xinhu_wouser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '綁定用戶Id',
  `openid` varchar(100) DEFAULT '微信openid',
  `nickname` varchar(30) DEFAULT NULL COMMENT '微信暱稱',
  `sex` tinyint(1) DEFAULT '1' COMMENT '性別1男2女0未知',
  `province` varchar(30) DEFAULT NULL COMMENT '省份',
  `city` varchar(30) DEFAULT NULL COMMENT '城市',
  `country` varchar(30) DEFAULT NULL COMMENT '國家',
  `headimgurl` varchar(300) DEFAULT NULL COMMENT '微信頭像',
  `adddt` datetime DEFAULT NULL COMMENT '添加時間',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `ip` varchar(50) DEFAULT NULL COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信用戶信息表';

-- ----------------------------
-- Records of xinhu_wouser
-- ----------------------------
