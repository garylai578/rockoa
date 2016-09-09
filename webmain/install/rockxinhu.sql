/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : rockxinhu

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2016-09-09 12:23:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `xinhu_admin`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_admin`;
CREATE TABLE `xinhu_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL,
  `user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(50) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `loginci` smallint(6) DEFAULT '0' COMMENT '登录次数',
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `type` tinyint(1) DEFAULT '0' COMMENT '0普通1管理员',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `face` varchar(50) DEFAULT NULL,
  `deptid` smallint(6) DEFAULT '0',
  `deptname` varchar(50) DEFAULT NULL COMMENT '部门',
  `superid` varchar(50) DEFAULT NULL,
  `superman` varchar(20) DEFAULT NULL COMMENT '上级主管',
  `ranking` varchar(255) DEFAULT NULL COMMENT '岗位',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `deptpath` varchar(100) DEFAULT NULL,
  `superpath` varchar(100) DEFAULT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `apptx` tinyint(1) DEFAULT '1' COMMENT '是否app提醒',
  `workdate` date DEFAULT NULL COMMENT '入职时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `lastpush` datetime DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `weixinid` varchar(50) DEFAULT NULL COMMENT '微信号',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  PRIMARY KEY (`id`,`user`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_admin
-- ----------------------------
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '607', '1', '1', '男', '0592-1234567', 'upload/face/1.jpg', '2', '开发部', '5', '磐石', '项目主管', '0', '[1],[2]', '[5]', null, '15800000123', '1', '2016-07-01', 'admin@rockoa.com', '2016-08-02 11:40:42', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蝉', 'e10adc3949ba59abbe56e057f20f883e', '52', '1', '0', '女', null, 'upload/face/2.jpg', '3', '财务部', '5', '磐石', '财务总监', '0', '[1],[3]', '[5]', null, '15800000007', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '54', '1', '0', '女', null, 'upload/face/3.jpg', '3', '财务部', '2', '貂蝉', '出纳', '0', '[1],[3]', '[5],[2]', null, '15800000001', '1', null, null, '2016-08-30 20:34:23', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '52', '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', '5', '磐石', '人事主管', '0', '[1],[4]', '[5]', null, '15800000002', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '83', '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理层', null, null, '董事长', '0', '[1],[5]', null, null, '15800000003', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '12', '1', '0', '男', null, 'upload/face/6.jpg', '2', '开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, '15800000004', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '赵子龙', 'e10adc3949ba59abbe56e057f20f883e', '5', '1', '0', '男', null, 'upload/face/7.jpg', '2', '开发部', '1', '管理员', '高级程序员', '100', '[1],[2]', '[5],[1]', null, '15800000005', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('8', null, 'xinhu', '信呼客服', '6846860684f05029abccc09a53cd66f1', '36', '1', '1', '男', null, 'upload/face/8.jpg', '2', '开发部', '1', '管理员', '客服', '200', '[1],[2]', '[5],[1]', null, '15800000006', '1', '2016-07-01', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('9', null, 'lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', '2', '1', '0', '男', null, 'upload/face/9.jpg', '2', '开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', '2016-09-06', '505581617@qq.com', null, '2016-09-06 18:28:57', null, null);

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
  PRIMARY KEY (`id`),
  KEY `type` (`type`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_chargems
-- ----------------------------
INSERT INTO `xinhu_chargems` VALUES ('1', '1', '1', '2016-09-06 11:44:26', '2016-09-06 11:35:26', null);
INSERT INTO `xinhu_chargems` VALUES ('2', '0', '1', '2016-09-06 13:00:33', '2016-09-06 12:59:17', 'oe0oo0tff0at0ef0oo0tff0tfo013');
INSERT INTO `xinhu_chargems` VALUES ('5', '1', '2', '2016-09-01 15:10:31', '2016-09-01 14:38:14', null);
INSERT INTO `xinhu_chargems` VALUES ('6', '0', '2', '2016-09-06 13:14:29', '2016-09-06 13:11:17', 'pw0hr0qt0rrt0pq0fr0rww0rwq0ph0qq0rws0rrl0pq0rwm0fq0fq08');
INSERT INTO `xinhu_chargems` VALUES ('7', '1', '3', '2016-09-06 13:14:29', '2016-09-06 13:11:17', null);
INSERT INTO `xinhu_chargems` VALUES ('8', '1', '4', '2016-09-06 13:08:47', '2016-09-06 13:02:09', null);

-- ----------------------------
-- Table structure for `xinhu_customer`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_customer`;
CREATE TABLE `xinhu_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `unitname` varchar(100) DEFAULT NULL COMMENT '单位名称',
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '来源',
  `tel` varchar(50) DEFAULT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `routeline` varchar(100) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL COMMENT '主页地址',
  `status` tinyint(4) DEFAULT '1',
  `adddt` datetime DEFAULT NULL,
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `shate` varchar(50) DEFAULT NULL COMMENT '共享给',
  `shateid` varchar(50) DEFAULT NULL,
  `isgys` tinyint(1) DEFAULT '0' COMMENT '是否供应商',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_customer
-- ----------------------------
INSERT INTO `xinhu_customer` VALUES ('1', '信呼', '1', '2016-07-17 16:50:54', '管理员', '厦门信呼软件有限公司', '网上开拓', '0592-123456', '15888888888', 'admin@rockoa.com', null, '福建厦门', null, null, '1', null, null, '0', null, null, '0');
INSERT INTO `xinhu_customer` VALUES ('2', 'Rock', '1', '2016-07-17 18:09:00', '管理员', 'RockOA开发团队', '电话开拓', '0592-123456', '15888888', 'xinhu@rockoa.com', null, '厦门', null, null, '1', null, null, '0', null, null, '1');
INSERT INTO `xinhu_customer` VALUES ('3', '微软公司', '1', '2016-07-18 10:36:13', '管理员', null, '网上开拓', null, null, null, null, '美国伦敦', null, null, '1', null, null, '0', '管理员,张飞', '1,6', '1');
INSERT INTO `xinhu_customer` VALUES ('4', '谷歌公司', '8', '2016-07-18 14:11:55', '信呼客服', null, '网上开拓', null, null, null, null, '美国chrome', null, null, '1', null, null, '0', '管理员', '1', '1');

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
  `state` tinyint(4) DEFAULT '0' COMMENT '状态',
  `explain` varchar(500) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `applydt` date DEFAULT NULL,
  `dealdt` datetime DEFAULT NULL COMMENT '成交时间',
  `adddt` datetime DEFAULT NULL,
  `laiyuan` varchar(20) DEFAULT NULL COMMENT '销售来源',
  `createid` smallint(6) DEFAULT '0',
  `createname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_custsale
-- ----------------------------
INSERT INTO `xinhu_custsale` VALUES ('1', '1', '信呼', '3', '小乔', '2016-07-17 22:12:06', '0', '说要买模块定制哦！', '50.00', '2016-07-17', null, '2016-07-17 22:12:06', null, '0', null);
INSERT INTO `xinhu_custsale` VALUES ('2', '3', '微软公司', '1', '管理员', '2016-07-18 10:38:21', '1', '说要收购软件信呼，呵呵！', '50000.00', '2016-07-18', '2016-07-18 14:02:15', '2016-07-18 10:38:21', '主动来访', '0', null);
INSERT INTO `xinhu_custsale` VALUES ('3', '4', '谷歌公司', '8', '信呼客服', '2016-07-18 14:13:17', '1', '可能买安卓手机一部', '500.00', '2016-07-18', '2016-07-18 14:13:39', '2016-07-18 14:13:17', '主动来访', '0', null);
INSERT INTO `xinhu_custsale` VALUES ('4', '1', '信呼', '1', '管理员', '2016-07-18 16:33:17', '0', '呵呵', '58.00', '2016-07-18', '2016-07-29 13:14:41', '2016-07-18 16:33:17', '电话销售', '1', '管理员');
INSERT INTO `xinhu_custsale` VALUES ('5', '3', '微软公司', '4', '大乔', '2016-07-18 20:53:18', '0', '梦梦搭', '511.00', '2016-07-18', null, '2016-07-18 20:53:18', '网上联系', '4', '大乔');

-- ----------------------------
-- Table structure for `xinhu_daily`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_daily`;
CREATE TABLE `xinhu_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `content` varchar(4000) DEFAULT NULL COMMENT '内容',
  `adddt` datetime DEFAULT NULL COMMENT '新增时间',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `uid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '姓名',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|日报,1|周报,2|月报,3|年报',
  `plan` varchar(2000) DEFAULT NULL COMMENT '明日计划',
  `status` tinyint(1) DEFAULT '0',
  `enddt` date DEFAULT NULL,
  `optid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_daily
-- ----------------------------
INSERT INTO `xinhu_daily` VALUES ('1', '2016-04-07', 'REIM系统开发，添加推送密码，官网维护等。', '2016-04-08 23:00:40', '2016-04-08 23:00:40', '1', '管理员', '0', null, '0', null, '1');
INSERT INTO `xinhu_daily` VALUES ('2', '2016-04-08', '1、核心模块流程添加转办给其他人功能。\n2、REIM开发添加手机端提醒。', '2016-04-08 23:01:24', '2016-04-08 23:01:24', '1', '管理员', '0', null, '0', null, '1');
INSERT INTO `xinhu_daily` VALUES ('3', '2016-04-05', '1、官网添加会员用户中心，添加密码修改，REIM密钥创建。', '2016-04-08 23:02:49', '2016-04-08 23:02:49', '1', '管理员', '0', null, '0', null, '1');
INSERT INTO `xinhu_daily` VALUES ('4', '2016-06-16', '1、后台数据权限添加\n2、权限查看编辑应用到各个模块中。\n', null, '2016-06-16 22:45:17', '2', '貂蝉', '0', null, '0', null, '2');
INSERT INTO `xinhu_daily` VALUES ('5', '2016-06-16', '今天查看了其他人员的日报哦，做的还不错，加油！', null, '2016-06-16 23:08:37', '5', '磐石', '0', null, '0', null, '5');
INSERT INTO `xinhu_daily` VALUES ('6', '2016-06-17', '1、救了世子和刘备夫人，不慎他跳井了。\n2、被曹操追上，死里逃生啊。', null, '2016-06-17 10:55:07', '7', '赵子龙', '0', null, '0', null, '7');
INSERT INTO `xinhu_daily` VALUES ('7', '2016-06-17', '1、优化了很多内容APP，测试\n2、添加上传文件功能。', null, '2016-06-17 19:28:30', '1', '管理员', '0', null, '0', null, '1');
INSERT INTO `xinhu_daily` VALUES ('8', '2016-06-13', '1、开发设计维护。\n2、端午来干嘛的？', null, '2016-06-17 20:21:14', '1', '管理员', '1', '1、继续开发。\n2、继续涉及啦，哈哈。', '0', '2016-06-17', '1');
INSERT INTO `xinhu_daily` VALUES ('9', '2016-06-06', '端午放假', '2016-06-17 20:26:27', '2016-06-17 20:26:45', '1', '管理员', '1', null, '0', '2016-06-10', '1');
INSERT INTO `xinhu_daily` VALUES ('10', '2016-06-01', '1、本月主用做信呼系统开发。\n2、信呼APP开发，包括安卓，苹果，接口等。', '2016-06-17 20:27:43', '2016-06-17 20:29:07', '1', '管理员', '2', '1、下月计划信呼官网设计并开发\n2、信呼上线。', '0', '2016-06-30', '1');
INSERT INTO `xinhu_daily` VALUES ('11', '2016-06-24', '1、客户端添加搜索。\n2、添加可上传头像功能。', '2016-06-24 20:34:57', '2016-06-24 20:35:12', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('12', '2016-06-24', '1、修改了自己资料，入职查看相关公司规定。', '2016-06-24 20:39:33', '2016-06-24 20:40:30', '3', '小乔', '0', null, '1', null, '3');
INSERT INTO `xinhu_daily` VALUES ('13', '2016-06-30', '完成了很多任务，呵呵', '2016-06-30 20:15:21', '2016-06-30 20:15:39', '6', '张飞', '0', null, '1', null, '6');

-- ----------------------------
-- Table structure for `xinhu_dept`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_dept`;
CREATE TABLE `xinhu_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(100) DEFAULT NULL,
  `pid` smallint(8) DEFAULT NULL,
  `sort` tinyint(1) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `headman` varchar(50) DEFAULT NULL COMMENT '负责人',
  `headid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_dept
-- ----------------------------
INSERT INTO `xinhu_dept` VALUES ('1', null, '信呼开发团队', '0', '0', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('2', 'dev', '开发部', '1', '1', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('3', null, '财务部', '1', '2', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('4', null, '行政人事部', '1', '3', null, null, null);
INSERT INTO `xinhu_dept` VALUES ('5', null, '管理层', '1', '0', null, null, null);

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
  `optname` varchar(50) DEFAULT NULL,
  `adddt` datetime DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(300) DEFAULT NULL,
  `mtype` varchar(50) DEFAULT NULL COMMENT '对应类型',
  `mid` int(11) DEFAULT '0' COMMENT '管理id',
  `downci` int(11) DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_file
-- ----------------------------
INSERT INTO `xinhu_file` VALUES ('1', '1', '2.png', null, 'png', '635969', '621.06 KB', 'upload/2016-08/07_14294592.png', 'upload/2016-08/07_14294592_s.png', '1', '管理员', '2016-08-07 14:29:45', '192.168.1.103', 'Safari', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('2', '1', '49.png', null, 'png', '8545', '8.34 KB', 'upload/2016-08/07_14303027.png', 'upload/2016-08/07_14303027_s.png', '1', '管理员', '2016-08-07 14:30:30', '192.168.1.103', 'Safari', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('3', '1', '49.png', null, 'png', '8545', '8.34 KB', 'upload/2016-08/07_14305111.png', 'upload/2016-08/07_14305111_s.png', '1', '管理员', '2016-08-07 14:30:51', '192.168.1.103', 'Safari', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('4', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-08/07_14350562.png', 'upload/2016-08/07_14350562_s.png', '1', '管理员', '2016-08-07 14:35:05', '192.168.1.103', 'Safari', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('5', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-08/07_14380186.png', 'upload/2016-08/07_14380186.png', '3', '小乔', '2016-08-07 14:38:01', '127.0.0.1', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('6', '1', 'icon.png', null, 'png', '21567', '21.06 KB', 'upload/2016-08/07_14383212.png', 'upload/2016-08/07_14383212_s.png', '3', '小乔', '2016-08-07 14:38:32', '127.0.0.1', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('7', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-08/07_14385090.png', 'upload/2016-08/07_14385090.png', '3', '小乔', '2016-08-07 14:38:50', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('8', '1', 'icon.png', null, 'png', '21567', '21.06 KB', 'upload/2016-08/07_14391872.png', 'upload/2016-08/07_14391872_s.png', '3', '小乔', '2016-08-07 14:39:18', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('9', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-08/07_14392640.png', 'upload/2016-08/07_14392640.png', '3', '小乔', '2016-08-07 14:39:26', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('10', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-08/07_14405036.png', 'upload/2016-08/07_14405036.png', '3', '小乔', '2016-08-07 14:40:50', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('11', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-08/07_14443992.png', 'upload/2016-08/07_14443992.png', '3', '小乔', '2016-08-07 14:44:39', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('12', '1', 'icon.png', null, 'png', '21567', '21.06 KB', 'upload/2016-08/07_14473914.png', 'upload/2016-08/07_14473914_s.png', '3', '小乔', '2016-08-07 14:47:39', '192.168.1.103', 'MSIE 9', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('13', '1', '48.png', null, 'png', '7774', '7.59 KB', 'upload/2016-08/08_21292771.png', 'upload/2016-08/08_21292771_s.png', '1', '管理员', '2016-08-08 21:29:27', '192.168.1.104', 'Chrome', 'im_mess', '26', '0');
INSERT INTO `xinhu_file` VALUES ('14', '1', 'ad1.jpg', null, 'jpg', '43960', '42.93 KB', 'upload/2016-08/09_10265678.jpg', 'upload/2016-08/09_10265678_s.jpg', '1', '管理员', '2016-08-09 10:26:55', '192.168.1.143', 'Chrome', 'im_mess', '27', '0');
INSERT INTO `xinhu_file` VALUES ('15', '1', '47.png', null, 'png', '6891', '6.73 KB', 'upload/2016-08/09_10301412.png', 'upload/2016-08/09_10301412_s.png', '1', '管理员', '2016-08-09 10:30:13', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('16', '1', '225028_053004076_2.jpg', null, 'jpg', '106614', '104.12 KB', 'upload/2016-08/09_11023740.jpg', 'upload/2016-08/09_11023740_s.jpg', '1', '管理员', '2016-08-09 11:02:36', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('17', '1', 'ad1.jpg', null, 'jpg', '43960', '42.93 KB', 'upload/2016-08/09_11033142.jpg', 'upload/2016-08/09_11033142_s.jpg', '1', '管理员', '2016-08-09 11:03:30', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('18', '1', '1.png', null, 'png', '256721', '250.70 KB', 'upload/2016-08/09_11051374.png', 'upload/2016-08/09_11051374_s.png', '1', '管理员', '2016-08-09 11:05:12', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('19', '1', '225028_053004076_2.jpg', null, 'jpg', '106614', '104.12 KB', 'upload/2016-08/09_11062251.jpg', 'upload/2016-08/09_11062251_s.jpg', '1', '管理员', '2016-08-09 11:06:21', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('20', '1', '225028_053004076_2.jpg', null, 'jpg', '106614', '104.12 KB', 'upload/2016-08/09_11075355.jpg', 'upload/2016-08/09_11075355_s.jpg', '1', '管理员', '2016-08-09 11:07:52', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('21', '1', 'xinhu_server_windows.rar', null, 'rar', '12601542', '12.02 MB', 'upload/2016-08/09_11091075.rar', 'upload/2016-08/09_11091075.rar', '1', '管理员', '2016-08-09 11:09:09', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('22', '1', 'xinhu_server_windows.rar', null, 'rar', '12601542', '12.02 MB', 'upload/2016-08/09_11094654.rar', 'upload/2016-08/09_11094654.rar', '1', '管理员', '2016-08-09 11:09:45', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('23', '1', 'xinhu_server_windows.rar', null, 'rar', '12601542', '12.02 MB', 'upload/2016-08/09_11191920.rar', 'upload/2016-08/09_11191920.rar', '1', '管理员', '2016-08-09 11:19:18', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('61', '1', 'logo.png', null, 'png', '5575', '5.44 KB', 'upload/2016-09/08_17135631.png', 'upload/2016-09/08_17135631.png', '1', '管理员', '2016-09-08 17:13:56', '192.168.1.104', 'Chrome', 'word', '33', '0');
INSERT INTO `xinhu_file` VALUES ('36', '1', 'calendar.png', null, 'png', '5404', '5.28 KB', 'upload/2016-08/09_13565031.png', 'upload/2016-08/09_13565031.png', '3', '小乔', '2016-08-09 13:56:49', '192.168.1.143', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('43', '1', 'QQ图片20160809225830.gif', null, 'gif', '39104', '38.19 KB', 'upload/2016-08/09_22584058.gif', 'upload/2016-08/09_22584058.gif', '1', '管理员', '2016-08-09 22:58:40', '192.168.1.104', 'Chrome', 'im_mess', '28', '0');
INSERT INTO `xinhu_file` VALUES ('55', '1', 'microMsg.1470910486512.jpg', null, 'jpg', '3931977', '3.75 MB', 'upload/2016-08/12_14194025.jpg', 'upload/2016-08/12_14194025_s.jpg', '1', '管理员', '2016-08-12 14:19:40', '192.168.1.102', 'wxbro', 'word', '30', '0');
INSERT INTO `xinhu_file` VALUES ('53', '1', 'checkbox1.png', null, 'png', '1585', '1.55 KB', 'upload/2016-08/12_14141021.png', 'upload/2016-08/12_14141021.png', '1', '管理员', '2016-08-12 14:14:10', '127.0.0.1', 'Safari', 'word', '28', '0');
INSERT INTO `xinhu_file` VALUES ('45', '1', 'diaochan.jpg', null, 'jpg', '4752', '4.64 KB', 'upload/2016-08/10_14523169.jpg', 'upload/2016-08/10_14523169.jpg', '1', '管理员', '2016-08-10 14:52:30', '192.168.1.143', 'Chrome', 'word', '21', '0');
INSERT INTO `xinhu_file` VALUES ('56', '1', 'loginbg.jpg', null, 'jpg', '42702', '41.70 KB', 'upload/2016-08/12_14250013.jpg', 'upload/2016-08/12_14250013_s.jpg', '1', '管理员', '2016-08-12 14:25:00', '192.168.1.143', 'Chrome', 'im_mess', '35', '0');
INSERT INTO `xinhu_file` VALUES ('52', '1', 'diaochan.jpg', null, 'jpg', '4752', '4.64 KB', 'upload/2016-08/12_14005326.jpg', 'upload/2016-08/12_14005326.jpg', '1', '管理员', '2016-08-12 14:00:53', '192.168.1.143', 'Chrome', 'im_mess', '33', '0');
INSERT INTO `xinhu_file` VALUES ('57', '1', 'applogo.psd', null, 'psd', '197451', '192.82 KB', 'upload/2016-08/12_14272262.uptemp', 'upload/2016-08/12_14272262.uptemp', '1', '管理员', '2016-08-12 14:27:22', '192.168.1.143', 'Chrome', 'im_mess', '36', '3');
INSERT INTO `xinhu_file` VALUES ('62', '1', 'mm_facetoface_collect_qrcode_1473321057455.png', null, 'png', '47456', '46.34 KB', 'upload/2016-09/08_17441298.png', 'upload/2016-09/08_17441298_s.png', '1', '管理员', '2016-09-08 17:44:12', '192.168.1.100', 'wxbro', 'kqinfo', '9', '3');

-- ----------------------------
-- Table structure for `xinhu_fininfom`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_fininfom`;
CREATE TABLE `xinhu_fininfom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT '0' COMMENT '单据类型@0|报销单,1|出差报销,2|借款单,3|还款单@not',
  `uid` int(11) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `moneycn` varchar(100) DEFAULT NULL COMMENT '大写金额',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0',
  `isturn` tinyint(1) DEFAULT '0',
  `bills` smallint(6) DEFAULT NULL COMMENT '附单据(张)',
  `paytype` varchar(20) DEFAULT NULL COMMENT '付款方式',
  `fullname` varchar(100) DEFAULT NULL COMMENT '收款人全称',
  `cardid` varchar(50) DEFAULT NULL COMMENT '收款帐号',
  `openbank` varchar(50) DEFAULT NULL COMMENT '开户行',
  `purpose` varchar(100) DEFAULT NULL COMMENT '用途',
  `purresult` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_fininfom
-- ----------------------------
INSERT INTO `xinhu_fininfom` VALUES ('1', '0', '1', '12.00', '壹拾贰元整', '2016-05-05 20:19:42', '1', '管理员', '2016-05-05', null, '1', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', null, null);
INSERT INTO `xinhu_fininfom` VALUES ('3', '1', '1', '500.00', '伍佰元整', '2016-09-03 11:43:36', '1', '管理员', '2016-05-05', null, '1', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', '北京会见马云', '聊的不错');
INSERT INTO `xinhu_fininfom` VALUES ('4', '2', '1', '500.00', '伍佰元整', '2016-09-03 15:43:28', '1', '管理员', '2016-05-08', '启动资金', '1', '1', '1', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴公司', '买房', null);
INSERT INTO `xinhu_fininfom` VALUES ('5', '0', '1', '101.00', '壹佰零壹元整', '2016-09-02 22:54:13', '1', '管理员', '2016-09-02', null, '0', '1', '0', '支付宝', '信呼', 'admin@rockoa.com', '支付宝', null, null);
INSERT INTO `xinhu_fininfom` VALUES ('6', '2', '1', '35000.00', '叁万伍仟元整', '2016-09-03 16:52:52', '1', '管理员', '2016-09-03', null, '1', '1', null, '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', '买车', null);
INSERT INTO `xinhu_fininfom` VALUES ('7', '3', '1', '35000.00', '叁万伍仟元整', '2016-09-03 17:17:44', '1', '管理员', '2016-09-03', null, '1', '1', null, '支付宝', 'RockOA开发团队', 'admin@rockoa.com', null, null, null);

-- ----------------------------
-- Table structure for `xinhu_fininfos`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_fininfos`;
CREATE TABLE `xinhu_fininfos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表fininfom.id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `sdt` date DEFAULT NULL COMMENT '发生日期',
  `name` varchar(20) DEFAULT NULL COMMENT '所属项目',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `sm` varchar(100) DEFAULT NULL COMMENT '说明',
  `didian` varchar(50) DEFAULT NULL COMMENT '发生地点',
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_fininfos
-- ----------------------------
INSERT INTO `xinhu_fininfos` VALUES ('1', '5', '0', '2016-09-02', '市内交通费', '12.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('2', '5', '1', '2016-09-02', '停车费', '89.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('3', '4', '0', '2016-05-05', '电话费', '500.00', '国外电话费贵啊', null);
INSERT INTO `xinhu_fininfos` VALUES ('4', '3', '0', '2016-09-01', '电话费', '45.00', null, '北京');
INSERT INTO `xinhu_fininfos` VALUES ('5', '3', '1', '2016-09-01', '快递费', '455.00', null, '北京');

-- ----------------------------
-- Table structure for `xinhu_flow_bill`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_bill`;
CREATE TABLE `xinhu_flow_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sericnum` varchar(50) DEFAULT NULL COMMENT '单号',
  `table` varchar(50) DEFAULT NULL COMMENT '对应表',
  `mid` int(11) DEFAULT NULL COMMENT '主id',
  `modeid` smallint(6) DEFAULT '0' COMMENT '模块id',
  `modename` varchar(20) DEFAULT NULL COMMENT '模块名称',
  `uid` smallint(6) DEFAULT NULL COMMENT '用户id',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `allcheckid` varchar(500) DEFAULT NULL COMMENT '@所有审核人',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `nstatus` tinyint(1) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `nstatustext` varchar(100) DEFAULT NULL COMMENT '当前状态',
  `status` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(500) DEFAULT NULL COMMENT '当前审核人',
  `nowcheckname` varchar(500) DEFAULT NULL,
  `checksm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`),
  KEY `sericnum` (`sericnum`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_bill
-- ----------------------------
INSERT INTO `xinhu_flow_bill` VALUES ('1', 'KA-20160729-0001', 'kqinfo', '1', '5', '请假条', '1', '2016-08-17 22:50:22', '1', '管理员', '4,5', '0', '1', '2016-07-29', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('2', 'KB-20160729-0001', 'kqinfo', '2', '6', '加班单', '1', '2016-07-29 10:56:58', '1', '管理员', '5', '0', '1', '2016-07-29', '磐石通过', '1', null, null, '好的');
INSERT INTO `xinhu_flow_bill` VALUES ('3', 'KA-20160807-0001', 'kqinfo', '3', '5', '请假条', '6', '2016-08-07 18:37:02', '6', '张飞', '4,1', '0', '1', '2016-08-07', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('4', 'KA-20160815-0001', 'kqinfo', '4', '5', '请假条', '1', '2016-08-15 16:55:26', '1', '管理员', '5,4', '0', '2', '2016-08-15', '待磐石处理', '2', '5', '磐石', 'as');
INSERT INTO `xinhu_flow_bill` VALUES ('5', 'KA-20160825-0001', 'kqinfo', '5', '5', '请假条', '1', '2016-08-25 16:01:52', '1', '管理员', '4,5', '0', '1', '2016-08-25', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('6', 'KA-20160826-0001', 'kqinfo', '6', '5', '请假条', '8', '2016-08-26 22:45:35', '8', '信呼客服', '4,1', '0', '1', '2016-08-26', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('8', 'KB-20160827-0001', 'kqinfo', '7', '6', '加班单', '1', '2016-08-27 14:06:56', '1', '管理员', '5', '0', '1', '2016-08-27', '磐石通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('9', 'KD-20160827-0001', 'kqout', '1', '23', '外出出差', '1', '2016-08-27 15:22:51', '1', '管理员', '5', '0', '1', '2016-08-27', '磐石通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('10', 'KA-20160830-0001', 'kqinfo', '8', '5', '请假条', '6', '2016-08-30 20:12:33', '6', '张飞', '4,6,1', '0', '1', '2016-08-30', '大乔处理通过', '1', null, null, '好的');
INSERT INTO `xinhu_flow_bill` VALUES ('11', 'CD-20160901-0001', 'goodm', '1', '24', '物品领用', '1', '2016-09-01 23:08:03', '1', '管理员', '4', '0', '1', '2016-09-01', '大乔处理发放', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('12', 'CD-20160901-0002', 'goodm', '2', '24', '物品领用', '1', '2016-09-02 10:43:32', '1', '管理员', '4', '0', '1', '2016-09-02', '大乔处理发放', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('14', 'CD-20160901-0004', 'goodm', '4', '24', '物品领用', '1', '2016-09-02 21:29:42', '1', '管理员', '2,1,3,4', '0', '1', '2016-09-02', '貂蝉处理发放', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('15', 'CD-20160901-0005', 'goodm', '5', '28', '物品采购', '1', '2016-09-03 22:54:31', '1', '管理员', '5', '0', '1', '2016-09-03', '待处理', '0', null, null, '哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('16', 'CD-20160901-0006', 'goodm', '6', '24', '物品领用', '1', '2016-09-01 22:37:47', '1', '管理员', '4', '1', '0', '2016-09-01', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('17', 'CD-20160901-0007', 'goodm', '7', '24', '物品领用', '1', '2016-09-01 22:55:25', '1', '管理员', '4', '1', '0', '2016-09-01', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('18', 'FA-20160902-0001', 'fininfom', '5', '11', '费用报销', '1', '2016-09-02 22:54:13', '1', '管理员', '5,4,2', '0', '1', '2016-09-02', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('19', 'FA-20160508-0001', 'fininfom', '4', '26', '借款单', '1', '2016-09-03 15:43:28', '1', '管理员', '2,4,5', '0', '1', '2016-05-08', '貂蝉处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('20', 'FB-20160505-0001', 'fininfom', '3', '25', '出差报销', '1', '2016-09-03 11:43:36', '1', '管理员', '2,8,5,4', '0', '1', '2016-05-05', '貂蝉处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('21', 'FC-20160903-0001', 'fininfom', '6', '26', '借款单', '1', '2016-09-03 16:52:52', '1', '管理员', '2,4,5', '0', '1', '2016-09-03', '貂蝉处理通过', '1', null, null, '哈哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('22', 'FD-20160903-0001', 'fininfom', '7', '27', '还款单', '1', '2016-09-03 17:17:44', '1', '管理员', '2,1', '0', '1', '2016-09-03', '貂蝉处理通过', '1', null, null, '哈哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('23', 'GA-20160905-0001', 'official', '1', '19', '发文单', '1', '2016-09-05 20:13:56', '1', '管理员', '3,8,5', '0', '1', '2016-09-05', '小乔处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('24', 'KA-20160908-0001', 'kqinfo', '9', '5', '请假条', '1', '2016-09-08 21:14:14', '1', '管理员', '5,4', '0', '1', '2016-09-08', '待大乔处理', '0', '4', '大乔', null);

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
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_checks
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_flow_course`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_course`;
CREATE TABLE `xinhu_flow_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL,
  `checktype` varchar(20) DEFAULT NULL,
  `checktypeid` varchar(20) DEFAULT NULL,
  `checktypename` varchar(20) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `where` varchar(100) DEFAULT NULL,
  `explain` varchar(100) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `courseact` varchar(50) DEFAULT NULL COMMENT '审核动作',
  `checkshu` tinyint(2) DEFAULT '1' COMMENT '至少几人审核 ,0全部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_course
-- ----------------------------
INSERT INTO `xinhu_flow_course` VALUES ('1', '5', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 21:05:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('2', '5', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-07-07 22:14:24', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('3', '6', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 22:25:29', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('4', '5', '总经理审核', null, 'user', '5', '磐石', '0', 'YHRvdGFsc2AgPiAyNA::', '超过3天24小时', '2016-08-04 21:07:57', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('5', '23', '上级审核', null, 'super', null, null, '0', null, null, '2016-08-27 08:46:27', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('6', '24', '行政发放', null, 'user', '2,3,4', '貂蝉,小乔,大乔', '0', null, null, '2016-09-05 14:40:54', '1', '发放,驳回|red', '0');
INSERT INTO `xinhu_flow_course` VALUES ('7', '11', '上级审批', null, 'super', null, null, '0', null, null, '2016-09-02 17:36:36', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('8', '11', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-09-02 17:38:15', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('9', '11', '财务审核', null, 'rank', null, '财务总监', '0', null, null, '2016-09-02 17:39:07', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('10', '25', '上级审批', null, 'super', null, null, '0', null, null, '2016-09-03 09:26:32', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('11', '25', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-09-03 09:27:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('12', '25', '财务审核', null, 'rank', null, '财务总监', '0', null, null, '2016-09-03 09:27:26', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('13', '26', '上级审核', null, 'super', null, null, '0', null, null, '2016-09-03 09:27:55', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('14', '26', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-09-03 09:28:18', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('15', '26', '财务审核', null, 'rank', null, '财务总监', '0', null, null, '2016-09-03 09:28:35', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('16', '27', '财务确认', null, 'rank', null, '财务总监', '0', null, null, '2016-09-03 15:29:45', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('17', '27', '付款确认', null, 'apply', null, null, '0', null, null, '2016-09-03 15:32:25', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('18', '27', '确认收款', null, 'rank', null, '财务总监', '0', null, null, '2016-09-03 15:33:23', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('19', '28', '上级审批', null, 'super', null, null, '0', null, null, '2016-09-03 19:45:47', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('20', '28', '行政审批', null, 'rank', null, '行政主管', '0', null, null, '2016-09-03 19:46:19', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('21', '19', '上级审批', null, 'super', null, null, '0', null, null, '2016-09-04 18:48:23', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('22', '19', '办公室批办', null, 'change', null, null, '0', null, null, '2016-09-05 18:46:46', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('23', '19', '领导审批', null, 'change', null, null, '0', null, null, '2016-09-05 18:47:03', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('24', '20', '上级审批', null, 'super', null, null, '0', null, null, '2016-09-05 18:49:16', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('25', '20', '办公室批办', null, 'change', null, null, '0', null, null, '2016-09-05 18:49:41', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('26', '20', '领导审批', null, 'change', null, null, '0', null, null, '2016-09-05 18:49:49', '1', null, '1');

-- ----------------------------
-- Table structure for `xinhu_flow_element`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_element`;
CREATE TABLE `xinhu_flow_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) DEFAULT '0',
  `name` varchar(20) DEFAULT NULL,
  `fields` varchar(50) DEFAULT NULL COMMENT '对应字段',
  `fieldstype` varchar(30) DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `dev` varchar(20) DEFAULT NULL COMMENT '默认值',
  `isbt` tinyint(1) DEFAULT '0' COMMENT '是否必填',
  `data` varchar(500) DEFAULT NULL COMMENT '数据源',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否录入元素',
  `iszs` tinyint(1) DEFAULT '1' COMMENT '是否列表展示',
  `attr` varchar(500) DEFAULT NULL COMMENT '属性',
  `iszb` tinyint(1) DEFAULT '0',
  `isss` tinyint(1) DEFAULT '0',
  `lattr` varchar(100) DEFAULT NULL COMMENT '列属性',
  `width` varchar(10) DEFAULT NULL COMMENT '列宽',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_element
-- ----------------------------
INSERT INTO `xinhu_flow_element` VALUES ('1', '1', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('2', '1', '类型名称', 'typename', 'rockcombo', '1', null, '1', 'gongtype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('3', '1', '内容', 'content', 'htmlediter', '2', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('4', '1', '发送给', 'recename', 'changedeptusercheck', '3', null, '0', 'receid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('5', '1', '相应地址', 'url', 'text', '4', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('6', '2', '会议室', 'hyname', 'rockcombo', '0', null, '1', 'hyname', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('7', '2', '主题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('8', '2', '开始时间', 'startdt', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('9', '2', '结束时间', 'enddt', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('10', '2', '参会人', 'joinname', 'changedeptusercheck', '0', null, '1', 'joinid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('11', '2', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('12', '3', '日期', 'dt', 'date', '1', '{date}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('13', '3', '日报类型', 'type', 'select', '0', null, '1', '0|日报,1|周报,2|月报,3|年报', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('14', '3', '截止日期', 'enddt', 'date', '2', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('15', '3', '内容', 'content', 'textarea', '3', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('16', '3', '明日计划', 'plan', 'textarea', '4', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('17', '3', '新增时间', 'adddt', 'hidden', '5', '{now}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('18', '3', '操作人', 'optname', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('19', '2', '发起人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('20', '4', '类型', 'type', 'rockcombo', '0', null, '1', 'worktype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('21', '4', '等级', 'grade', 'rockcombo', '0', null, '1', 'workgrade', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('22', '4', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('23', '4', '分配给', 'dist', 'changeusercheck', '0', null, '1', 'distid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('24', '4', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('25', '4', '状态', 'state', 'rockcombo', '10', '0', '1', 'workstate,value', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('26', '4', '创建人', 'optname', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('27', '4', '创建时间', 'optdt', 'text', '12', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('28', '4', '开始时间', 'startdt', 'datetime', '8', '{now}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('29', '4', '截止时间', 'enddt', 'datetime', '9', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('30', '5', '请假', 'kind', 'fixed', '0', '请假', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('31', '5', '请假类型', 'qjkind', 'rockcombo', '0', null, '1', 'kqqjkind', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('32', '5', '开始时间', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('33', '5', '截止时间', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('34', '5', '时间(小时)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('35', '5', '说明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('36', '6', '类型', 'kind', 'fixed', '0', '加班', '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('37', '6', '开始时间', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('38', '6', '截止时间', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('39', '6', '时间(小时)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('40', '6', '说明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('41', '7', '客户名称', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('42', '7', '所属人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('43', '7', '最后修改', 'optdt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('44', '7', '来源', 'laiyuan', 'rockcombo', '0', null, '1', 'crmlaiyuan', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('45', '7', '客户单位', 'unitname', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('47', '7', '联系电话', 'tel', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('48', '7', '联系手机', 'mobile', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('49', '7', '邮箱', 'email', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('50', '7', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('51', '7', '地址', 'address', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('52', '7', '交通路线', 'routeline', 'textarea', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('53', '8', '客户', 'custid', 'select', '0', null, '1', 'selectcust', '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('54', '8', '客户', 'custname', 'hidden', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('55', '8', '状态', 'state', 'rockcombo', '0', '0', '1', 'crmstate', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('56', '8', '说明', 'explain', 'textarea', '2', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('57', '8', '申请日期', 'applydt', 'date', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('58', '8', '来源', 'laiyuan', 'rockcombo', '0', null, '1', 'custsalelai', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('59', '8', '金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('60', '8', '添加时间', 'adddt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('61', '8', '创建人', 'createname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('62', '8', '销售人员', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('63', '9', '名称', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('64', '9', '对应分类', 'typeid', 'select', '0', null, '1', 'getgoodstype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('65', '9', '规格', 'guige', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('66', '9', '型号', 'xinghao', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('67', '9', '单价', 'price', 'number', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('68', '9', '单位', 'unit', 'rockcombo', '0', null, '1', 'rockunit', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('69', '9', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('70', '10', '用户Id', 'id', 'number', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('71', '10', '姓名', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('72', '10', '部门Id', 'deptid', 'number', '1', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('73', '10', '部门', 'deptname', 'changedept', '1', null, '1', 'deptid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('74', '10', '职位', 'ranking', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('75', '10', '上级主管', 'superman', 'changeusercheck', '1', null, '0', 'superid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('76', '10', '上级主管id', 'superid', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('77', '10', '用户名', 'user', 'text', '0', null, '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('78', '10', '编号', 'num', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('79', '7', '状态', 'status', 'select', '0', '1', '1', '1|启用,0|停用', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('80', '12', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('81', '12', '时间', 'startdt', 'datetime', '0', '{now}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('82', '12', '重复', 'rate', 'select', '0', null, '0', 'd|每天,w|每周,m|每月', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('83', '12', '重复值', 'rateval', 'checkboxall', '0', null, '0', '0|无,1|啊', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('84', '12', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('85', '12', '记事人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('86', '12', '截止时间', 'enddt', 'datetime', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('87', '12', '提醒', 'txsj', 'select', '0', '0', '1', '0|不提醒,1|提醒', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('88', '21', '打卡时间', 'dkdt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('89', '21', '打卡类型', 'type', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('90', '21', '添加时间', 'optdt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('91', '21', '定位地址', 'address', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('92', '21', '姓名', 'base_name', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('93', '22', '项目类型', 'type', 'rockcombo', '0', null, '1', 'projecttype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('94', '22', '编号', 'num', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('95', '22', '名称', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('96', '22', '开始时间', 'startdt', 'datetime', '0', '{now}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('97', '22', '预计结束时间', 'enddt', 'datetime', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('98', '22', '负责人', 'fuze', 'changeuser', '0', null, '1', 'fuzeid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('99', '22', '执行人', 'runuser', 'changedeptusercheck', '0', null, '1', 'runuserid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('100', '22', '进度(%)', 'progress', 'select', '0', '0', '1', 'progressdata', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('101', '22', '内容', 'content', 'htmlediter', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('102', '22', '状态', 'state', 'rockcombo', '0', '0', '1', 'projectstate,value', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('103', '23', '类型', 'atype', 'select', '0', '外出', '1', '外出,出差', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('104', '23', '外出地址', 'address', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('105', '23', '外出时间', 'outtime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('106', '23', '预计回岗', 'intime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('107', '23', '外出理由', 'reason', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('108', '23', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('109', '24', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('110', '24', '类型', 'type', 'fixed', '0', '0', '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('111', '24', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('112', '24', '物品', 'aid', 'select', '0', null, '1', 'getgoodsdata', '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('113', '24', '领用数量', 'count', 'number', '0', '0', '1', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('114', '11', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('115', '11', '单据数(张)', 'bills', 'number', '0', '0', '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('116', '11', '收款人全称', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('117', '11', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('118', '11', '收款帐号', 'cardid', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('119', '11', '开户行', 'openbank', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('120', '11', '报销金额', 'money', 'text', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('121', '11', '大写金额', 'moneycn', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('122', '11', '发生日期', 'sdt', 'date', '0', null, '1', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('123', '11', '报销项目', 'name', 'rockcombo', '0', null, '1', 'finaitems', '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('124', '11', '金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('125', '11', '说明', 'sm', 'text', '0', null, '0', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('126', '24', '单位', 'unit', 'text', '0', null, '0', null, '0', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('127', '25', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('128', '25', '附单据(张)', 'bills', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('129', '25', '出差目的', 'purpose', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('130', '25', '出差成果', 'purresult', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('131', '25', '收款人全称', 'fullname', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('132', '25', '付款方式', 'paytype', 'rockcombo', '0', '', '1', 'paytype', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('133', '25', '收款帐号', 'cardid', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('134', '25', '开户行', 'openbank', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('135', '25', '报销金额', 'money', 'text', '0', '0', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('136', '25', '大写金额', 'moneycn', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('137', '25', '发生日期', 'sdt', 'date', '1', '', '1', '', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('138', '25', '报销项目', 'name', 'rockcombo', '2', '', '1', 'finaitems', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('139', '25', '金额', 'money', 'number', '3', '0', '1', '', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('140', '25', '说明', 'sm', 'text', '5', '', '0', '', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('141', '25', '发生地点', 'didian', 'text', '4', null, '0', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('142', '25', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('143', '25', '单据类型', 'type', 'fixed', '0', '2', '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('144', '26', '单据类型', 'type', 'fixed', '0', '2', '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('145', '26', '申请日期', 'applydt', 'text', '1', '{date}', '1', null, '1', '1', 'readonly', '0', '1', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('146', '26', '借款用途', 'purpose', 'text', '2', null, '1', null, '1', '1', null, '0', '1', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('147', '26', '收款人全称', 'fullname', 'text', '3', null, '1', null, '1', '1', null, '0', '1', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('148', '26', '付款方式', 'paytype', 'rockcombo', '4', null, '1', 'paytype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('149', '26', '收款帐号', 'cardid', 'text', '5', null, '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('150', '26', '开户行', 'openbank', 'text', '6', null, '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('151', '26', '借款金额', 'money', 'text', '7', '0', '1', null, '1', '1', null, '0', '1', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('152', '26', '借款金额大写', 'moneycn', 'text', '8', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('153', '26', '说明', 'explain', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('154', '11', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('155', '27', '类型', 'type', 'fixed', '0', '3', '1', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('156', '27', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('157', '27', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('158', '27', '收款人全称', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('159', '27', '收款帐号', 'cardid', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('160', '27', '还款金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('161', '27', '还款金额大学', 'moneycn', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('162', '27', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('163', '27', '需还款金额', 'temp_money', 'auto', '0', null, '0', 'jiekuantongs', '0', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('164', '28', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('165', '28', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('166', '28', '类型', 'type', 'fixed', '0', '1', '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('167', '28', '供应商', 'custid', 'select', '0', null, '1', 'getcustgong', '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('168', '28', '供应商名称', 'custname', 'hidden', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('169', '28', '采购金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('170', '28', '物品', 'aid', 'select', '0', '', '1', 'getgoodsdata', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('171', '28', '采购数量', 'count', 'number', '0', '0', '1', '', '1', '1', '', '1', '0', '', '');
INSERT INTO `xinhu_flow_element` VALUES ('172', '28', '单位', 'unit', 'text', '0', null, '0', null, '1', '1', 'readonly', '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('173', '28', '单价', 'price', 'number', '0', '0', '0', null, '1', '1', null, '1', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('174', '7', '是否为供应商', 'isgys', 'checkbox', '0', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('175', '19', '标题', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('176', '19', '副标题', 'titles', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('177', '19', '公文等级', 'grade', 'rockcombo', '1', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('178', '19', '公文类型', 'class', 'rockcombo', '1', null, '1', 'officialclass', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('179', '19', '公文编号', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('180', '19', '公文内容', 'content', 'htmlediter', '1', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('181', '19', '说明', 'explain', 'textarea', '5', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('182', '19', '发给', 'recename', 'changedeptusercheck', '1', null, '1', 'receid', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('183', '20', '标题', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('184', '20', '副标题', 'titles', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('185', '20', '公文等级', 'grade', 'rockcombo', '1', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('186', '20', '公文类型', 'class', 'rockcombo', '1', null, '1', 'officialclass', '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('187', '20', '公文编号', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('188', '20', '公文内容', 'content', 'htmlediter', '1', null, '0', null, '1', '0', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('189', '20', '说明', 'explain', 'textarea', '5', null, '0', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('190', '20', '来源单位', 'recename', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null);
INSERT INTO `xinhu_flow_element` VALUES ('191', '20', '类型', 'type', 'fixed', '0', '1', '1', null, '1', '0', null, '0', '0', null, null);

-- ----------------------------
-- Table structure for `xinhu_flow_extent`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_extent`;
CREATE TABLE `xinhu_flow_extent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(200) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT '0' COMMENT '模块',
  `type` tinyint(1) DEFAULT '0' COMMENT '0查看,1添加,2编辑,3删除',
  `wherestr` varchar(500) DEFAULT NULL COMMENT '条件',
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_extent
-- ----------------------------
INSERT INTO `xinhu_flow_extent` VALUES ('1', '全体人员', 'all', '1', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('2', '全体人员', 'all', '1', '0', 'e3JlY2VpZH0:', '发布给包含我', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('3', '全体人员', 'all', '3', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('4', '全体人员', 'all', '2', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('5', '全体人员', 'all', '2', '0', 'YWxs', '全部数据', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('6', '全体人员', 'all', '3', '0', 'e2FsbHN1cGVyfQ::', '所有下属人员', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('10', '全体人员', 'all', '1', '2', 'b3B0aWQ9e3VpZH0:', '自己发布的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('11', '全体人员', 'all', '2', '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPTA:', '我创建的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('12', '全体人员', 'all', '4', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('13', '全体人员', 'all', '4', '0', 'YWxs', '任何人都可以看到任务', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('14', '全体人员', 'all', '5', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('15', '全体人员', 'all', '6', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('16', '管理员', 'u1', '1', '3', 'b3B0aWQ!MA::', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('17', '全体人员', 'all', '4', '3', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPD4x', '我创建未完成可删除', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('18', '全体人员', 'all', '2', '3', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlIGluKDAsMyk:', '可删除我创建的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('19', '全体人员', 'all', '8', '3', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', '删除自己未成交的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('20', '全体人员', 'all', '7', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('21', '全体人员', 'all', '8', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('22', '全体人员', 'all', '9', '2', 'b3B0aWQ9e3VpZH0:', '本人添加可编辑', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('23', '全体人员', 'all', '4', '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPD4x', '创建人可以修改未完成的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('24', '全体人员', 'all', '3', '0', 'dWlkPXt1aWR9', '可查看我自己', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('25', '全体人员', 'all', '8', '0', 'dWlkPXt1aWR9', '可查看我自己', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('26', '全体人员', 'all', '7', '0', 'dWlkPXt1aWR9', '可查看我自己的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('27', '全体人员', 'all', '12', '2', 'dWlkPXt1aWR9', '编辑我自己', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('28', '全体人员', 'all', '12', '3', 'dWlkPXt1aWR9', '删除自己', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('29', '全体人员', 'all', '12', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('30', '全体人员', 'all', '12', '0', 'dWlkPXt1aWR9', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('31', '管理员', 'u1', '10', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('32', '管理员', 'u1', '13', '0', 'YWxs', '管理员可查看全部', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('33', '管理员', 'u1', '13', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('34', '管理员', 'u1', '10', '3', 'YWxs', '管理员可删除全部人员', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('35', '管理员', 'u1', '14', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('36', '管理员', 'u1', '14', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('37', '管理员', 'u1', '15', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('38', '管理员', 'u1', '15', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('39', '管理员', 'u1', '16', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('40', '管理员', 'u1', '16', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('41', '管理员', 'u1', '17', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('42', '管理员', 'u1', '17', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('43', '管理员', 'u1', '18', '0', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('44', '管理员', 'u1', '18', '3', 'YWxs', null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('45', '管理员', 'u1', '9', '3', 'YWxs', '管理可删除全部', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('46', '全体人员', 'all', '24', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('47', '全体人员', 'all', '25', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('48', '全体人员', 'all', '26', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('49', '全体人员', 'all', '7', '2', 'dWlkPXt1aWR9', '可编辑我自己的', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('50', '全体人员', 'all', '22', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('51', '全体人员', 'all', '22', '2', 'b3B0aWQ9e3VpZH0:', '创建人可修改', '1');
INSERT INTO `xinhu_flow_extent` VALUES ('52', '全体人员', 'all', '23', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('53', '全体人员', 'all', '11', '1', null, null, '1');
INSERT INTO `xinhu_flow_extent` VALUES ('54', '全体人员', 'all', '27', '1', null, null, '1');

-- ----------------------------
-- Table structure for `xinhu_flow_log`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_log`;
CREATE TABLE `xinhu_flow_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1通过',
  `statusname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `name` varchar(50) DEFAULT NULL COMMENT '进程名称',
  `courseid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `ip` varchar(30) DEFAULT NULL,
  `web` varchar(50) DEFAULT NULL COMMENT '浏览器',
  `checkname` varchar(20) DEFAULT NULL,
  `checkid` smallint(6) DEFAULT NULL,
  `modeid` smallint(6) DEFAULT NULL COMMENT '@模块Id',
  `color` varchar(10) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_log
-- ----------------------------
INSERT INTO `xinhu_flow_log` VALUES ('1', 'kqinfo', '1', '1', null, '提交', '0', '2016-07-29 10:53:11', null, '192.168.1.143', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('2', 'kqinfo', '1', '2', '不通过', '上级审核', '1', '2016-07-29 10:53:48', '哈哈哈，不给你过，看怎么兜风', '192.168.1.143', 'Chrome', '磐石', '5', '5', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('3', 'kqinfo', '1', '1', '通过', '上级审核', '1', '2016-07-29 10:54:12', null, '192.168.1.143', 'Chrome', '磐石', '5', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('4', 'kqinfo', '2', '1', null, '提交', '0', '2016-07-29 10:55:16', null, '192.168.1.143', 'Chrome', '管理员', '1', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('5', 'kqinfo', '2', '2', '不通过', '上级审核', '3', '2016-07-29 10:56:03', '哈哈啊', '192.168.1.143', 'Chrome', '磐石', '5', '6', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('6', 'kqinfo', '2', '1', null, '编辑', '0', '2016-07-29 10:56:58', null, '192.168.1.143', 'Chrome', '管理员', '1', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('7', 'kqinfo', '2', '1', '通过', '上级审核', '3', '2016-07-29 10:58:51', '好的', '127.0.0.1', 'Firefox', '磐石', '5', '6', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('8', 'infor', '2', '1', '已读', '标识', '0', '2016-07-29 11:55:56', null, '127.0.0.1', 'Safari', '管理员', '1', '1', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('9', 'infor', '1', '1', '已读', '标识', '0', '2016-07-29 11:56:49', null, '127.0.0.1', 'Safari', '管理员', '1', '1', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('10', 'work', '7', '2', '执行中', '进度报告', '0', '2016-07-29 12:09:01', '嗯嗯', '192.168.1.143', 'Chrome', '管理员', '1', '4', 'orange', '1');
INSERT INTO `xinhu_flow_log` VALUES ('11', 'work', '7', '1', null, '指派给', '0', '2016-07-29 12:10:00', '指派给:磐石', '192.168.1.143', 'Chrome', '管理员', '1', '4', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('12', 'work', '7', '2', '执行中', '进度报告', '0', '2016-07-29 12:10:44', '呵呵呵', '127.0.0.1', 'Firefox', '磐石', '5', '4', 'orange', '1');
INSERT INTO `xinhu_flow_log` VALUES ('13', 'work', '7', '1', '已完成', '进度报告', '0', '2016-07-29 12:11:01', '好了', '127.0.0.1', 'Firefox', '磐石', '5', '4', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('14', 'customer', '3', '0', '停用', '状态切换', '0', '2016-07-29 12:48:51', 'h', '192.168.1.143', 'Chrome', '管理员', '1', '7', 'gray', '1');
INSERT INTO `xinhu_flow_log` VALUES ('15', 'customer', '3', '0', '停用', '状态切换', '0', '2016-07-29 12:50:10', '12', '192.168.1.143', 'Chrome', '管理员', '1', '7', 'gray', '1');
INSERT INTO `xinhu_flow_log` VALUES ('16', 'customer', '3', '1', '启用', '状态切换', '0', '2016-07-29 12:50:18', null, '192.168.1.143', 'Chrome', '管理员', '1', '7', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('17', 'customer', '3', '1', null, '共享给', '0', '2016-07-29 12:55:51', '共享给:管理员,张飞', '192.168.1.143', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('18', 'custsale', '4', '2', '已丢失', '状态切换', '0', '2016-07-29 13:08:59', '丢了', '192.168.1.143', 'Chrome', '管理员', '1', '8', 'gray', '1');
INSERT INTO `xinhu_flow_log` VALUES ('19', 'custsale', '4', '0', '跟进中', '状态切换', '0', '2016-07-29 13:09:13', '12', '192.168.1.143', 'Chrome', '管理员', '1', '8', 'blue', '1');
INSERT INTO `xinhu_flow_log` VALUES ('20', 'custsale', '4', '1', null, '转移给', '0', '2016-07-29 13:09:27', '转移给:管理员', '192.168.1.143', 'Chrome', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('21', 'custsale', '4', '1', null, '转移给', '0', '2016-07-29 13:10:12', '转移给:管理员', '192.168.1.143', 'Chrome', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('22', 'custsale', '4', '1', '已成交', '状态切换', '0', '2016-07-29 13:10:26', '啊', '192.168.1.143', 'Chrome', '管理员', '1', '8', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('23', 'custsale', '4', '1', null, '跟进', '0', '2016-07-29 13:12:10', '啊', '192.168.1.143', 'Chrome', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('24', 'custsale', '4', '0', '跟进中', '状态切换', '0', '2016-07-29 13:12:27', null, '192.168.1.143', 'Chrome', '管理员', '1', '8', 'blue', '1');
INSERT INTO `xinhu_flow_log` VALUES ('25', 'custsale', '4', '1', null, '转移给', '0', '2016-07-29 13:14:08', '转移给:管理员', '192.168.1.102', 'wxbro', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('26', 'custsale', '4', '1', null, '跟进', '0', '2016-07-29 13:14:29', '哈哈', '192.168.1.102', 'wxbro', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('27', 'custsale', '4', '1', '已成交', '状态切换', '0', '2016-07-29 13:14:41', '好啦', '192.168.1.102', 'wxbro', '管理员', '1', '8', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('28', 'infor', '1', '1', '已读', '标识', '0', '2016-07-29 13:40:23', null, '127.0.0.1', 'Firefox', '磐石', '5', '1', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('29', 'customer', '3', '0', '停用', '状态切换', '0', '2016-07-29 13:53:07', '哈哈', '192.168.1.102', 'Chrome', '管理员', '1', '7', 'gray', '1');
INSERT INTO `xinhu_flow_log` VALUES ('30', 'customer', '2', '1', '拜访记录', '＋添加拜访记录', '0', '2016-07-29 20:28:52', '哈哈哈', '127.0.0.1', 'Safari', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('31', 'infor', '1', '1', null, '编辑', '0', '2016-08-01 11:42:19', null, '192.168.1.143', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('32', 'custsale', '4', '0', '跟进中', '状态切换', '0', '2016-08-01 19:52:18', 'a', '192.168.1.103', 'Chrome', '管理员', '1', '8', 'blue', '1');
INSERT INTO `xinhu_flow_log` VALUES ('33', 'customer', '4', '1', null, '共享给', '0', '2016-08-02 11:39:42', '共享给:管理员', '127.0.0.1', 'Firefox', '信呼客服', '8', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('34', 'customer', '4', '1', null, '共享给', '0', '2016-08-02 11:40:42', '共享给:管理员', '127.0.0.1', 'Firefox', '信呼客服', '8', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('35', 'kqinfo', '3', '1', null, '提交', '0', '2016-08-07 18:37:02', null, '192.168.1.104', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('36', 'schedule', '24', '1', null, '提交', '0', '2016-08-11 15:49:12', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('37', 'schedule', '25', '1', null, '提交', '0', '2016-08-11 15:49:52', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('38', 'schedule', '26', '1', null, '提交', '0', '2016-08-11 15:50:46', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('39', 'schedule', '27', '1', null, '提交', '0', '2016-08-11 15:51:57', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('40', 'schedule', '28', '1', null, '提交', '0', '2016-08-11 15:52:56', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('41', 'schedule', '29', '1', null, '提交', '0', '2016-08-11 15:53:06', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('42', 'schedule', '30', '1', null, '提交', '0', '2016-08-11 15:53:14', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('43', 'schedule', '31', '1', null, '提交', '0', '2016-08-11 15:55:16', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('45', 'schedule', '33', '1', null, '提交', '0', '2016-08-11 16:19:27', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('46', 'schedule', '31', '1', null, '编辑', '0', '2016-08-11 17:13:24', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('47', 'schedule', '31', '1', null, '编辑', '0', '2016-08-11 17:26:39', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('48', 'schedule', '33', '1', null, '编辑', '0', '2016-08-11 17:29:04', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('49', 'schedule', '34', '1', null, '提交', '0', '2016-08-12 11:51:54', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('50', 'schedule', '35', '1', null, '提交', '0', '2016-08-12 11:54:15', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('51', 'schedule', '31', '1', null, '编辑', '0', '2016-08-12 12:23:37', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('52', 'schedule', '36', '1', null, '提交', '0', '2016-08-12 12:47:17', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('53', 'schedule', '34', '1', null, '编辑', '0', '2016-08-12 13:47:42', null, '192.168.1.143', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('54', 'project', '5', '1', null, '提交', '0', '2016-08-14 09:57:21', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('55', 'kqinfo', '4', '1', null, '提交', '0', '2016-08-15 16:55:26', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('56', 'schedule', '17', '1', null, '编辑', '0', '2016-08-15 21:01:28', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('57', 'kqinfo', '1', '1', null, '提交', '0', '2016-08-17 22:50:22', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('58', 'schedule', '34', '1', null, '编辑', '0', '2016-08-25 10:04:55', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('59', 'kqinfo', '5', '1', null, '提交', '0', '2016-08-25 16:01:52', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('60', 'kqinfo', '5', '1', '通过', '上级审核', '1', '2016-08-25 16:02:15', null, '127.0.0.1', 'Chrome', '磐石', '5', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('61', 'kqinfo', '5', '1', '通过', '人事审核', '2', '2016-08-25 16:03:22', null, '127.0.0.1', 'Chrome', '大乔', '4', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('62', 'kqinfo', '6', '1', null, '提交', '0', '2016-08-26 22:45:35', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('63', 'kqinfo', '6', '1', '通过', '上级审核', '1', '2016-08-26 23:35:26', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('64', 'kqinfo', '3', '1', '通过', '上级审核', '1', '2016-08-26 23:36:28', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('65', 'kqinfo', '6', '1', '通过', '人事审核', '2', '2016-08-26 23:36:46', null, '127.0.0.1', 'Chrome', '大乔', '4', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('66', 'kqinfo', '3', '1', '通过', '人事审核', '2', '2016-08-26 23:36:50', null, '127.0.0.1', 'Chrome', '大乔', '4', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('67', 'kqinfo', '1', '1', '通过', '人事审核', '2', '2016-08-26 23:36:55', null, '127.0.0.1', 'Chrome', '大乔', '4', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('71', 'kqinfo', '7', '1', '通过', '上级审核', '3', '2016-08-27 15:14:50', null, '127.0.0.1', 'Chrome', '磐石', '5', '6', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('70', 'kqinfo', '7', '1', null, '提交', '0', '2016-08-27 14:06:56', null, '127.0.0.1', 'Chrome', '管理员', '1', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('72', 'kqout', '1', '1', null, '提交', '0', '2016-08-27 15:22:51', null, '127.0.0.1', 'Chrome', '管理员', '1', '23', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('73', 'kqout', '1', '1', '通过', '上级审核', '5', '2016-08-27 15:23:05', null, '127.0.0.1', 'Chrome', '磐石', '5', '23', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('74', 'kqinfo', '8', '1', null, '提交', '0', '2016-08-30 20:02:40', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('75', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:04:00', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('76', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:05:11', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('77', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:05:18', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('78', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:05:55', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('79', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:06:30', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('80', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:07:37', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('81', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:08:36', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('82', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:10:04', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('83', 'kqinfo', '8', '1', null, '编辑', '0', '2016-08-30 20:12:33', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('84', 'infor', '1', '1', null, '编辑', '0', '2016-08-30 20:15:21', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('85', 'infor', '1', '1', null, '编辑', '0', '2016-08-30 20:16:13', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('86', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:16:52', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('87', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:19:12', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('88', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:23:48', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('89', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:27:22', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('90', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:30:55', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('91', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:31:13', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('92', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:34:23', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('93', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:46:51', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('94', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:47:25', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('95', 'infor', '2', '1', null, '编辑', '0', '2016-08-30 20:57:45', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('96', 'schedule', '1', '1', null, '提交', '0', '2016-08-30 22:37:18', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('97', 'schedule', '2', '1', null, '提交', '0', '2016-08-30 22:38:48', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('98', 'schedule', '1', '1', null, '编辑', '0', '2016-08-30 22:39:13', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('99', 'meet', '15', '1', null, '提交', '0', '2016-09-01 15:44:51', null, '192.168.1.104', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('100', 'meet', '15', '1', null, '编辑', '0', '2016-09-01 15:51:34', null, '192.168.1.104', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('101', 'goodm', '1', '1', null, '提交', '0', '2016-09-01 22:28:51', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('102', 'goodm', '2', '1', null, '提交', '0', '2016-09-01 22:30:12', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('154', 'kqinfo', '8', '1', '通过', '上级审核', '0', '2016-09-04 21:51:27', '转给：磐石', '127.0.0.1', 'Chrome', '管理员', '1', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('104', 'goodm', '4', '1', null, '提交', '0', '2016-09-01 22:35:39', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('105', 'goodm', '5', '1', null, '提交', '0', '2016-09-01 22:36:20', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('106', 'goodm', '6', '1', null, '提交', '0', '2016-09-01 22:37:47', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('107', 'goodm', '7', '1', null, '提交', '0', '2016-09-01 22:46:23', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('108', 'goodm', '7', '1', null, '编辑', '0', '2016-09-01 22:55:25', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('109', 'goodm', '1', '1', null, '提交', '0', '2016-09-01 22:56:15', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('110', 'goodm', '1', '1', null, '编辑', '0', '2016-09-01 23:08:03', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('111', 'goodm', '1', '2', '驳回', '行政发放', '6', '2016-09-01 23:12:12', '哈哈', '127.0.0.1', 'Chrome', '大乔', '4', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('112', 'goodm', '1', '1', '发放', '行政发放', '6', '2016-09-01 23:16:44', null, '127.0.0.1', 'Chrome', '大乔', '4', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('113', 'goodm', '2', '1', null, '提交', '0', '2016-09-02 10:12:34', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('114', 'goodm', '2', '2', '驳回', '行政发放', '6', '2016-09-02 10:13:00', '哈哈', '127.0.0.1', 'Chrome', '大乔', '4', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('115', 'goodm', '2', '2', '驳回', '行政发放', '6', '2016-09-02 10:43:13', '12', '127.0.0.1', 'Chrome', '大乔', '4', '24', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('116', 'goodm', '2', '1', null, '编辑', '0', '2016-09-02 10:43:32', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('117', 'goodm', '2', '1', '发放', '行政发放', '6', '2016-09-02 10:43:45', null, '127.0.0.1', 'Chrome', '大乔', '4', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('153', 'goodm', '5', '1', null, '编辑', '0', '2016-09-03 22:54:31', null, '127.0.0.1', 'Chrome', '管理员', '1', '28', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('152', 'goodm', '5', '1', null, '编辑', '0', '2016-09-03 22:53:40', null, '127.0.0.1', 'Chrome', '管理员', '1', '28', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('151', 'goodm', '5', '1', null, '提交', '0', '2016-09-03 22:52:44', null, '127.0.0.1', 'Chrome', '管理员', '1', '28', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('121', 'meet', '16', '1', null, '提交', '0', '2016-09-02 14:26:56', null, '127.0.0.1', 'Safari', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('122', 'goodm', '4', '1', null, '提交', '0', '2016-09-02 15:29:52', null, '192.168.1.102', 'wxbro', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('123', 'goodm', '4', '1', null, '编辑', '0', '2016-09-02 15:31:10', null, '127.0.0.1', 'Safari', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('124', 'goodm', '4', '1', null, '编辑', '0', '2016-09-02 15:36:14', null, '127.0.0.1', 'Safari', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('125', 'goodm', '4', '1', null, '编辑', '0', '2016-09-02 21:20:54', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('126', 'goodm', '4', '1', null, '编辑', '0', '2016-09-02 21:29:42', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('127', 'fininfom', '5', '1', null, '提交', '0', '2016-09-02 22:48:27', null, '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('128', 'fininfom', '5', '1', null, '编辑', '0', '2016-09-02 22:54:13', null, '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('129', 'fininfom', '5', '1', '通过', '上级审批', '7', '2016-09-02 23:03:45', null, '127.0.0.1', 'Chrome', '磐石', '5', '11', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('130', 'kqinfo', '4', '2', '不通过', '上级审核', '1', '2016-09-02 23:06:03', 'as', '127.0.0.1', 'Chrome', '磐石', '5', '5', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('131', 'fininfom', '4', '1', null, '编辑', '0', '2016-09-03 10:27:03', null, '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('132', 'fininfom', '3', '1', null, '编辑', '0', '2016-09-03 11:43:36', null, '127.0.0.1', 'Chrome', '管理员', '1', '25', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('133', 'fininfom', '6', '1', null, '提交', '0', '2016-09-03 12:18:35', null, '127.0.0.1', 'Chrome', '管理员', '1', '26', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('134', 'fininfom', '7', '1', null, '提交', '0', '2016-09-03 15:22:37', null, '127.0.0.1', 'Chrome', '管理员', '1', '27', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('135', 'fininfom', '7', '1', null, '编辑', '0', '2016-09-03 15:26:40', null, '127.0.0.1', 'Chrome', '管理员', '1', '27', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('136', 'fininfom', '3', '1', '通过', '上级审批', '10', '2016-09-03 15:39:01', null, '127.0.0.1', 'Chrome', '磐石', '5', '25', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('137', 'fininfom', '4', '1', null, '编辑', '0', '2016-09-03 15:43:28', null, '127.0.0.1', 'Chrome', '管理员', '1', '26', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('138', 'fininfom', '4', '1', '通过', '上级审核', '13', '2016-09-03 15:44:02', null, '127.0.0.1', 'Chrome', '磐石', '5', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('139', 'fininfom', '6', '2', '不通过', '上级审核', '13', '2016-09-03 15:46:03', '哈哈', '127.0.0.1', 'Chrome', '磐石', '5', '26', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('140', 'fininfom', '4', '1', '通过', '人事审核', '14', '2016-09-03 15:50:17', null, '127.0.0.1', 'Chrome', '大乔', '4', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('141', 'fininfom', '4', '1', '通过', '财务审核', '15', '2016-09-03 16:51:39', null, '127.0.0.1', 'Chrome', '貂蝉', '2', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('142', 'fininfom', '6', '1', null, '编辑', '0', '2016-09-03 16:52:52', null, '127.0.0.1', 'Chrome', '管理员', '1', '26', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('143', 'fininfom', '6', '1', '通过', '上级审核', '13', '2016-09-03 16:53:05', null, '127.0.0.1', 'Chrome', '磐石', '5', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('145', 'fininfom', '6', '1', '通过', '人事审核', '14', '2016-09-03 17:16:16', 'hahah', '127.0.0.1', 'Chrome', '大乔', '4', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('146', 'fininfom', '6', '1', '通过', '财务审核', '15', '2016-09-03 17:16:59', '哈哈哈哈', '127.0.0.1', 'Chrome', '貂蝉', '2', '26', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('147', 'fininfom', '7', '1', null, '编辑', '0', '2016-09-03 17:17:44', null, '127.0.0.1', 'Chrome', '管理员', '1', '27', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('148', 'fininfom', '7', '1', '通过', '财务确认', '16', '2016-09-03 17:18:06', null, '127.0.0.1', 'Chrome', '貂蝉', '2', '27', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('149', 'fininfom', '7', '1', '通过', '付款确认', '17', '2016-09-03 17:18:37', '哈哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '27', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('150', 'fininfom', '7', '1', '通过', '确认收款', '18', '2016-09-03 17:19:43', '哈哈哈哈', '127.0.0.1', 'Chrome', '貂蝉', '2', '27', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('155', 'kqinfo', '8', '1', '通过', '上级审核', '0', '2016-09-04 22:03:54', '飞哥给你看看啊,转给：张飞', '127.0.0.1', 'Chrome', '磐石', '5', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('156', 'kqinfo', '8', '1', '通过', '上级审核', '1', '2016-09-04 22:06:25', '给你吧，哈哈哈', '127.0.0.1', 'Chrome', '张飞', '6', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('157', 'kqinfo', '8', '1', '通过', '人事审核', '2', '2016-09-05 14:22:32', '好的', '127.0.0.1', 'Chrome', '大乔', '4', '5', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('158', 'fininfom', '3', '1', '通过', '人事审核', '0', '2016-09-05 14:29:51', '转给：信呼客服', '127.0.0.1', 'Chrome', '大乔', '4', '25', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('159', 'fininfom', '3', '1', '通过', '人事审核', '11', '2016-09-05 14:34:49', 'hahah', '127.0.0.1', 'Chrome', '信呼客服', '8', '25', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('160', 'fininfom', '3', '1', '通过', '财务审核', '12', '2016-09-05 14:35:07', null, '127.0.0.1', 'Chrome', '貂蝉', '2', '25', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('161', 'goodm', '4', '1', '发放', '行政发放', '6', '2016-09-05 14:41:11', '哈哈哈', '127.0.0.1', 'Chrome', '大乔', '4', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('162', 'goodm', '4', '1', '发放', '行政发放', '6', '2016-09-05 15:29:17', '哈哈哈', '127.0.0.1', 'Chrome', '小乔', '3', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('163', 'goodm', '4', '2', '驳回', '行政发放', '6', '2016-09-05 15:29:33', '问', '127.0.0.1', 'Chrome', '貂蝉', '2', '24', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('164', 'goodm', '4', '1', '发放', '行政发放', '0', '2016-09-05 15:30:09', '给管理员,转给：管理员', '127.0.0.1', 'Chrome', '貂蝉', '2', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('165', 'goodm', '4', '1', '发放', '行政发放', '6', '2016-09-05 15:30:27', null, '127.0.0.1', 'Chrome', '管理员', '1', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('166', 'goodm', '4', '1', '发放', '行政发放', '6', '2016-09-05 15:48:41', null, '127.0.0.1', 'Chrome', '貂蝉', '2', '24', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('167', 'official', '1', '1', null, '提交', '0', '2016-09-05 20:13:56', null, '127.0.0.1', 'Chrome', '管理员', '1', '19', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('168', 'official', '1', '1', '通过', '上级审批', '21', '2016-09-05 20:41:33', null, '127.0.0.1', 'Chrome', '磐石', '5', '19', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('169', 'official', '1', '1', '通过', '办公室批办', '22', '2016-09-05 20:53:17', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '19', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('170', 'official', '1', '1', '通过', '领导审批', '0', '2016-09-05 21:03:38', '转给：小乔', '127.0.0.1', 'Chrome', '貂蝉', '2', '19', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('171', 'official', '1', '1', '通过', '领导审批', '23', '2016-09-05 21:04:50', null, '127.0.0.1', 'Chrome', '小乔', '3', '19', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('172', 'work', '2', '2', '执行中', '进度报告', '0', '2016-09-06 16:12:23', '哈哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '4', 'orange', '1');
INSERT INTO `xinhu_flow_log` VALUES ('173', 'customer', '3', '1', '启用', '状态切换', '0', '2016-09-06 16:16:57', '启用', '127.0.0.1', 'Chrome', '管理员', '1', '7', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('174', 'goodm', '5', '2', '不通过', '上级审批', '19', '2016-09-06 16:38:30', '不能通过', '127.0.0.1', 'Chrome', '磐石', '5', '28', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('175', 'goodm', '5', '1', '通过', '上级审批', '19', '2016-09-06 16:38:56', '哈哈哈', '127.0.0.1', 'Chrome', '磐石', '5', '28', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('176', 'work', '3', '1', null, '指派给', '0', '2016-09-06 17:29:07', '指派给:管理员', '127.0.0.1', 'Chrome', '磐石', '5', '4', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('177', 'project', '1', '1', null, '编辑', '0', '2016-09-06 19:41:26', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('178', 'project', '1', '2', '执行中', '进度报告', '0', '2016-09-06 22:07:11', '哈哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '22', 'orange', '1');
INSERT INTO `xinhu_flow_log` VALUES ('179', 'kqinfo', '9', '1', null, '提交', '0', '2016-09-08 17:44:12', null, '192.168.1.100', 'wxbro', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('180', 'kqinfo', '9', '1', null, '编辑', '0', '2016-09-08 17:45:42', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('181', 'project', '1', '0', null, '更新进度', '0', '2016-09-08 18:05:55', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('182', 'project', '1', '0', null, '更新进度', '0', '2016-09-08 19:13:17', '不错嘛', '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('183', 'project', '1', '1', '已完成', '进度报告', '0', '2016-09-08 20:05:03', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('184', 'project', '1', '2', '执行中', '进度报告', '0', '2016-09-08 20:05:07', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', 'orange', '1');
INSERT INTO `xinhu_flow_log` VALUES ('185', 'project', '2', '1', null, '提交', '0', '2016-09-08 20:26:41', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('186', 'project', '1', '1', '已完成', '进度报告', '0', '2016-09-08 20:26:54', null, '127.0.0.1', 'Chrome', '管理员', '1', '22', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('187', 'project', '1', '0', null, '更新进度', '0', '2016-09-08 20:27:11', 'OK', '127.0.0.1', 'Chrome', '管理员', '1', '22', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('188', 'kqinfo', '9', '2', '不通过', '上级审核', '1', '2016-09-08 20:38:05', 'hahaha', '192.168.1.104', 'Chrome', '磐石', '5', '5', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('189', 'kqinfo', '9', '1', null, '编辑', '0', '2016-09-08 21:14:14', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('190', 'kqinfo', '9', '1', '通过', '上级审核', '1', '2016-09-08 21:39:10', null, '192.168.1.100', 'wxbro', '磐石', '5', '5', 'green', '1');

-- ----------------------------
-- Table structure for `xinhu_flow_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_menu`;
CREATE TABLE `xinhu_flow_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '显示名称',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `sort` tinyint(4) DEFAULT '0',
  `statusname` varchar(20) DEFAULT NULL,
  `statuscolor` varchar(20) DEFAULT NULL,
  `statusvalue` tinyint(1) DEFAULT '1' COMMENT '状态值',
  `actname` varchar(20) DEFAULT NULL COMMENT '动作名称',
  `setid` smallint(6) DEFAULT '0' COMMENT '对应模块',
  `wherestr` varchar(300) DEFAULT NULL COMMENT '显示条件',
  `explain` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `islog` tinyint(1) DEFAULT '1',
  `issm` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型',
  `changeaction` varchar(20) DEFAULT NULL COMMENT '触发的方法',
  `fields` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_menu
-- ----------------------------
INSERT INTO `xinhu_flow_menu` VALUES ('1', '标为已读', 'yd', '0', '已读', 'green', '1', '标识', '1', null, null, '1', '0', '0', '0', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('2', '全部标识已读', 'allyd', '0', null, null, '1', null, '1', null, null, '1', '0', '0', '0', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('3', '标为已读', 'yd', '0', '已读', 'green', '1', '标识', '3', null, null, '1', '0', '0', '0', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('4', '全部标识已读', 'allyd', '0', null, null, '1', null, '3', null, null, '1', '0', '0', '0', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('5', '点评', null, '0', null, null, '0', null, '3', null, null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('6', '取消会议', null, '0', '取消', 'gray', '3', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ!J3tub3d9JyAgYW5kIHN0YXRlPTA:', '我发起，未开始会议可取消', '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('7', '结束会议', null, '0', '结束', 'orange', '2', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ8J3tub3d9JyBhbmQgZW5kZHQ!J3tub3d9JyAgYW5kIHN0YXRlPTE:', '我发起，开会中可提前结束', '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('8', '指派给...', null, '10', null, null, '1', null, '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '2', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('9', '标为执行中', null, '0', '执行中', 'orange', '2', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('10', '标已完成', null, '0', '已完成', 'green', '1', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('11', '终止任务', null, '0', '终止', 'gray', '3', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('12', '＋添加拜访记录', null, '0', '拜访记录', null, '1', null, '7', 'dWlkPXt1aWR9', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('13', '启用', 'ztqh', '0', '启用', 'green', '1', '状态切换', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MA::', null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('14', '停用', 'ztqh', '0', '停用', 'gray', '0', '状态切换', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('15', '共享给...', 'shate', '0', null, null, '1', null, '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '1', '3', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('16', '＋添加跟进', null, '0', null, null, '1', '跟进', '8', 'dWlkPXt1aWR9', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('17', '标为跟进中', 'ztqh', '0', '跟进中', 'blue', '0', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MA::', null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('18', '标为已成交', 'ztqh', '0', '已成交', 'green', '1', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('19', '标为已丢失', 'ztqh', '0', '已丢失', 'gray', '2', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!Mg::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('20', '转移给...', 'zhuan', '0', null, null, '1', null, '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZT0w', null, '1', '1', '1', '2', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('21', '标为执行中', 'state2', '1', '执行中', 'orange', '2', '进度报告', '22', null, null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('22', '更新进度', 'upprogress', '0', null, null, '0', null, '22', null, null, '1', '1', '0', '4', null, 'progress');
INSERT INTO `xinhu_flow_menu` VALUES ('23', '标为已完成', 'state1', '1', '已完成', 'green', '1', '进度报告', '22', 'c3RhdGU8PjE:', null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('24', '终止项目', 'state3', '1', '终止', 'gray', '3', '进度报告', '22', 'c3RhdGU8PjM:', null, '1', '1', '1', '1', null, null);

-- ----------------------------
-- Table structure for `xinhu_flow_set`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_set`;
CREATE TABLE `xinhu_flow_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '配置名称',
  `num` varchar(30) NOT NULL DEFAULT '' COMMENT '编号',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `table` varchar(50) DEFAULT NULL COMMENT '对应的表',
  `where` varchar(500) DEFAULT NULL COMMENT '相关条件',
  `summary` varchar(500) DEFAULT NULL COMMENT '摘要',
  `summarx` varchar(500) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT '分类',
  `pctx` tinyint(1) DEFAULT '0' COMMENT 'pc端提醒',
  `mctx` tinyint(1) DEFAULT '0' COMMENT 'app提醒',
  `wxtx` tinyint(1) DEFAULT '0' COMMENT '微信提醒',
  `sericnum` varchar(50) DEFAULT NULL COMMENT '编号规则',
  `isflow` tinyint(1) DEFAULT '1' COMMENT '是否有流程',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '1',
  `islu` tinyint(1) DEFAULT '1' COMMENT '是否可录入',
  `tables` varchar(20) DEFAULT NULL COMMENT '多行子表',
  `names` varchar(50) DEFAULT NULL COMMENT '多行子表名称',
  PRIMARY KEY (`id`,`num`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '1', 'infor', null, '[{typename}]{title}', null, '行政', '1', '1', '1', 'XA-Ymd-', '0', 'all', '全体人员', '2016-09-01 21:04:57', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('2', '会议', 'meet', '2', 'meet', null, '[{hyname}]{title},{startdt}→{enddt}', null, '行政', '1', '1', '1', 'XB-Ymd-', '0', 'all', '全体人员', '2016-09-01 21:13:43', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日报', 'daily', '10', 'daily', null, '[{optname}]{content}', null, '基础', '1', '1', '0', 'XC-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:27', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('4', '任务', 'work', '12', 'work', null, '[{type}]{title},分配给:{dist}', null, '基础', '1', '1', '0', null, '0', 'all', '全体人员', '2016-08-13 21:23:42', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('5', '请假条', 'leave', '30', 'kqinfo', 'kind=[F]请假[F]', '[{qjkind}]{stime}→{etime}共{totals}小时,{explain}', null, '考勤', '1', '1', '1', 'KA-Ymd-', '1', 'all', '全体人员', '2016-08-26 23:26:09', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('6', '加班单', 'jiaban', '31', 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小时,{explain}', null, '考勤', '1', '1', '1', 'KB-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:14:08', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('7', '客户', 'customer', '50', 'customer', null, '{name}', null, 'CRM', '1', '1', '0', 'CA-Ymd-', '0', 'all', '全体人员', '2016-09-03 22:41:24', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('8', '销售', 'custsale', '51', 'custsale', null, null, null, 'CRM', '1', '1', '0', 'CB-Ymd-', '0', 'all', '全体人员', '2016-07-18 10:09:29', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('9', '物品产品', 'goods', '4', 'goods', null, null, null, '行政', '0', '0', '0', 'CC-Ymd-', '0', 'all', '全体人员', '2016-09-01 20:51:47', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('11', '费用报销', 'finfybx', '90', 'fininfom', 'type=0', '报销：{money},收款人：{fullname}', null, '财务', '1', '1', '0', 'FA-Ymd-', '1', 'all', '全体人员', '2016-09-03 09:38:39', '1', '1', 'fininfos', '报销明细');
INSERT INTO `xinhu_flow_set` VALUES ('10', '用户', 'user', '101', 'admin', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-02 16:42:25', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('12', '备忘记事', 'schedule', '13', 'schedule', null, '{title}', null, '基础', '1', '1', '1', null, '0', 'all', '全体人员', '2016-08-13 16:40:25', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('13', '部门', 'dept', '102', 'dept', null, '{name}', null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 16:44:30', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('14', '系统组', 'group', '103', 'group', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:47:58', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('15', '计划任务', 'task', '104', 'task', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:23:01', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('16', '会话管理', 'huihua', '105', 'im_group', 'type<>2', null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:26:59', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('17', '应用管理', 'yingyong', '106', 'im_group', 'type=2', null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:26:25', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('18', '应用菜单', 'yymenu', '107', 'im_menu', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:27:41', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('19', '发文单', 'officia', '40', 'official', 'type=0', '{num}[{class}]{title}', null, '公文', '1', '1', '0', 'GA-Ymd-', '1', 'all', '全体人员', '2016-09-05 20:18:14', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('20', '收文单', 'officib', '41', 'official', 'type=1', null, null, '公文', '1', '1', '0', 'GB-Ymd-', '1', 'all', '全体人员', '2016-09-04 18:47:00', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('21', '打卡记录', 'kqdkjl', '32', 'kqdkjl', null, null, null, '考勤', '0', '0', '0', null, '0', 'all', '全体人员', '2016-08-13 20:02:23', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('22', '项目', 'project', '11', 'project', null, null, null, '基础', '1', '1', '0', null, '0', 'all', '全体人员', '2016-08-13 21:23:38', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('23', '外出出差', 'waichu', '33', 'kqout', null, '[{atype}]{address}{outtime}', null, '考勤', '1', '0', '0', 'KD-Ymd-', '1', 'all', '全体人员', '2016-08-27 08:54:33', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('24', '物品领用', 'goodly', '5', 'goodm', 'type=0', '{explain}', null, '行政', '1', '1', '0', 'CD-Ymd-', '1', 'all', '全体人员', '2016-09-03 09:39:06', '1', '1', 'goodss', '领用物品');
INSERT INTO `xinhu_flow_set` VALUES ('25', '出差报销', 'finccbx', '91', 'fininfom', 'type=1', '报销金额:{money},目的:{purpose},成果:{purresult}', null, '财务', '1', '1', '0', 'FB-Ymd-', '1', 'all', '全体人员', '2016-09-03 11:44:24', '1', '1', 'fininfos', '报销明细');
INSERT INTO `xinhu_flow_set` VALUES ('26', '借款单', 'finjkd', '92', 'fininfom', 'type=2', '借款金额:{money},用途:{purpose}', null, '财务', '1', '1', '0', 'FC-Ymd-', '1', 'all', '全体人员', '2016-09-03 11:44:34', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('27', '还款单', 'finhkd', '93', 'fininfom', 'type=3', '还款金额：{money}，还款方式:{paytype}，还款到：{fullname}', null, '财务', '1', '1', '0', 'FD-Ymd-', '1', 'all', '全体人员', '2016-09-03 15:35:56', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('28', '物品采购', 'caigou', '6', 'goodm', 'type=1', '从[{custname}]采购金额:{money}元', null, '行政', '1', '1', '0', 'CE-Ymd-', '1', 'all', '全体人员', '2016-09-03 22:58:07', '1', '1', 'goodss', '采购物品');

-- ----------------------------
-- Table structure for `xinhu_goodm`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goodm`;
CREATE TABLE `xinhu_goodm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `type` tinyint(1) DEFAULT '0' COMMENT '0领用,1采购申请',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '费用',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_goodm
-- ----------------------------
INSERT INTO `xinhu_goodm` VALUES ('1', '1', '2016-09-01 23:08:03', '1', '管理员', '2016-09-01', '领用看看！', '1', '1', '0', null, '0', null);
INSERT INTO `xinhu_goodm` VALUES ('2', '1', '2016-09-02 10:43:32', '1', '管理员', '2016-09-02', '哈哈哈', '1', '1', '0', null, '0', null);
INSERT INTO `xinhu_goodm` VALUES ('4', '1', '2016-09-02 21:29:42', '1', '管理员', '2016-09-02', '领啦啦', '1', '1', '0', null, '0', null);
INSERT INTO `xinhu_goodm` VALUES ('5', '1', '2016-09-03 22:54:31', '1', '管理员', '2016-09-03', '买个鼠标吧', '0', '1', '1', '36.00', '4', '谷歌公司');

-- ----------------------------
-- Table structure for `xinhu_goods`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goods`;
CREATE TABLE `xinhu_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应分类',
  `name` varchar(30) DEFAULT NULL,
  `guige` varchar(50) DEFAULT NULL COMMENT '规格',
  `xinghao` varchar(50) DEFAULT NULL COMMENT '型号',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `adddt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `stock` int(11) DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_goods
-- ----------------------------
INSERT INTO `xinhu_goods` VALUES ('1', '64', '信呼实施维护', null, null, '实施维护包括如下内容\n1、系统bug修改。\n2、需求添加修改等。\n3、数据服务器稳定性维护。\n4、数据分析等。', '3000.00', '月', '2016-07-19 17:53:28', '2016-07-20 12:38:55', '1', '管理员', '86');
INSERT INTO `xinhu_goods` VALUES ('2', '67', '鼠标1', null, null, null, '12.00', '个', '2016-07-20 13:25:17', '2016-07-20 13:25:17', '1', '管理员', '-18');

-- ----------------------------
-- Table structure for `xinhu_goodss`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goodss`;
CREATE TABLE `xinhu_goodss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` smallint(6) DEFAULT '0' COMMENT '物品Id',
  `count` smallint(6) DEFAULT '0' COMMENT '数量',
  `uid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0入库,1出库',
  `kind` tinyint(2) DEFAULT '0' COMMENT '出入库类型',
  `optname` varchar(20) DEFAULT NULL,
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `optid` int(11) DEFAULT '0',
  `mid` smallint(6) DEFAULT '0' COMMENT '对应主表',
  `sort` smallint(6) DEFAULT '0',
  `unit` varchar(5) DEFAULT NULL COMMENT '单位',
  `price` decimal(6,2) DEFAULT '0.00' COMMENT '单价',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_goodss
-- ----------------------------
INSERT INTO `xinhu_goodss` VALUES ('1', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:24:01', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('2', '2', '22', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:24:01', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('3', '1', '-23', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出库', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('4', '2', '-2', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出库', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('5', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:31:42', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('6', '2', '2', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:31:42', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('7', '1', '100', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:32:03', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('8', '2', '-20', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:33:48', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('9', '1', '21', '1', '0', '1', '管理员', '2016-07-20', '2016-07-20 15:35:48', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('10', '1', '-1', '1', '1', '1', '管理员', '2016-07-20', '2016-07-20 15:36:26', '有人买了', '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('11', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 19:51:35', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('12', '2', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 19:51:35', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('13', '2', '-4', '1', '1', '0', '管理员', '2016-08-07', '2016-08-07 15:33:51', null, '1', null, '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('21', '1', '-10', '1', '1', '0', '管理员', '2016-09-01', '2016-09-01 23:08:03', null, '1', '1', '1', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('22', '2', '-2', '1', '1', '0', '管理员', '2016-09-01', '2016-09-01 23:08:03', null, '1', '1', '1', '1', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('23', '2', '-12', '1', '1', '0', '管理员', '2016-09-02', '2016-09-02 10:43:32', null, '1', '1', '2', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('26', '1', '-1', '1', '1', '1', '管理员', '2016-09-02', '2016-09-02 13:48:12', null, '1', '1', '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('27', '2', '-1', '1', '1', '1', '管理员', '2016-09-02', '2016-09-02 13:48:12', null, '1', '1', '0', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('28', '1', '-3', '1', '1', '0', '管理员', '2016-09-02', '2016-09-02 21:29:42', null, '1', '1', '4', '0', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('29', '2', '-2', '1', '1', '0', '管理员', '2016-09-02', '2016-09-02 21:29:42', null, '1', '1', '4', '1', null, '0.00');
INSERT INTO `xinhu_goodss` VALUES ('30', '2', '3', '1', '0', '0', '管理员', '2016-09-03', '2016-09-03 22:54:31', null, '0', '1', '5', '0', '个', '12.00');

-- ----------------------------
-- Table structure for `xinhu_group`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_group`;
CREATE TABLE `xinhu_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '组名',
  `sort` tinyint(4) DEFAULT '0',
  `ispir` tinyint(4) DEFAULT '1' COMMENT '是否权限验证',
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_group
-- ----------------------------
INSERT INTO `xinhu_group` VALUES ('1', '系统管理员', '1', '0', '2014-09-04 17:33:47');
INSERT INTO `xinhu_group` VALUES ('2', '组名', '2', '1', '2014-09-04 17:33:56');

-- ----------------------------
-- Table structure for `xinhu_im_group`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_group`;
CREATE TABLE `xinhu_im_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '名称',
  `pid` smallint(6) DEFAULT '0' COMMENT '对应上级',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|群,1|讨论组,2|应用',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `createid` int(11) DEFAULT NULL,
  `createname` varchar(20) DEFAULT NULL COMMENT '创建人',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `face` varchar(50) DEFAULT NULL COMMENT '头像',
  `num` varchar(20) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `explain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_group
-- ----------------------------
INSERT INTO `xinhu_im_group` VALUES ('1', '信呼团队', '0', '2', '0', null, null, null, 'images/xinhu.png', 'xinhu', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('2', '全体人员', '0', '0', '0', '1', null, null, null, null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('3', '通知公告', '0', '2', '1', null, null, null, 'images/gong.png', 'gong', '', '', 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('4', '会议', '0', '2', '4', null, null, null, 'images/meet.png', 'meet', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('5', '技术群', '0', '0', '0', '1', null, null, null, null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('7', '工作日报', '0', '2', '5', null, null, '2015-06-25 16:03:34', 'images/daily.png', 'daily', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('12', '任务', '0', '2', '9', '1', '管理员', '2015-09-10 13:38:07', 'images/work.png', 'work', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('13', '万年历', '0', '2', '100', null, null, null, 'images/calendar.png', 'calendar', null, null, 'buin', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('14', '高管群', '0', '0', '0', '1', '管理员', '2016-06-30 21:29:52', null, null, null, null, null, '1', '嗯嗯');
INSERT INTO `xinhu_im_group` VALUES ('15', '流程申请', '0', '2', '6', null, null, null, 'images/flow.png', 'flow', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('16', '流程待办', '0', '2', '7', null, null, null, 'images/daiban.png', 'daiban', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('17', '客户管理', '18', '2', '0', null, null, null, 'images/crm.png', 'customer', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('18', 'CRM客户', '0', '2', '8', null, null, null, 'images/crm.png', null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('19', '客户销售', '18', '2', '0', null, null, null, 'images/sale.png', 'custsale', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('20', '文档', '0', '2', '2', null, null, null, 'images/folder.png', 'word', null, null, 'buin', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('21', '备忘记事', '0', '2', '3', null, null, null, 'images/bwl2.png', 'schedule', null, null, 'buin', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_groupuser
-- ----------------------------
INSERT INTO `xinhu_im_groupuser` VALUES ('2', '2', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('17', '5', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('19', '0', '0', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('6', '2', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('18', '5', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('12', '2', '5', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('13', '2', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('14', '2', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('15', '2', '3', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('16', '2', '4', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('20', '5', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('21', '14', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('22', '14', '5', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('23', '2', '8', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('26', '14', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('25', '23', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('27', '2', '9', '1');

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
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`receid`,`uid`),
  KEY `optdt` (`optdt`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('1', 'group', '2', '1', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('2', 'group', '2', '2', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('3', 'group', '2', '5', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('4', 'group', '2', '6', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('5', 'group', '2', '7', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('6', 'group', '2', '3', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('7', 'group', '2', '4', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('8', 'group', '2', '8', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '0');
INSERT INTO `xinhu_im_history` VALUES ('9', 'group', '2', '9', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');

-- ----------------------------
-- Table structure for `xinhu_im_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_menu`;
CREATE TABLE `xinhu_im_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` smallint(6) NOT NULL DEFAULT '0',
  `pid` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(10) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) NOT NULL DEFAULT '0',
  `type` tinyint(4) DEFAULT '0' COMMENT '1url,0事件',
  `url` varchar(50) DEFAULT NULL COMMENT '对应地址',
  `num` varchar(10) DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL COMMENT '颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_menu
-- ----------------------------
INSERT INTO `xinhu_im_menu` VALUES ('1', '13', '0', '上月', '0', '0', 'prevmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('2', '13', '0', '当月', '0', '0', 'nowmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('3', '13', '0', '下月', '0', '0', 'nextmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('4', '3', '0', '全部信息', '0', '0', 'all', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('5', '3', '0', '未读信息', '0', '0', 'wexx', 'weidu', null);
INSERT INTO `xinhu_im_menu` VALUES ('6', '12', '0', '我的任务', '0', '0', null, 'myrw', null);
INSERT INTO `xinhu_im_menu` VALUES ('7', '12', '0', '下属任务', '0', '0', 'xxrw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('8', '12', '0', '＋创建任务', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('9', '3', '0', '＋发布信息', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('10', '4', '0', '今日会议', '0', '0', 'today', 'today', null);
INSERT INTO `xinhu_im_menu` VALUES ('11', '4', '0', '本周会议', '0', '0', 'week', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('12', '4', '0', '＋新增会议', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('13', '7', '0', '我的日报', '0', '0', 'my', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('14', '7', '0', '下属日报', '0', '0', 'under', 'under', null);
INSERT INTO `xinhu_im_menu` VALUES ('15', '7', '0', '＋写日报', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('16', '7', '14', '全部', '0', '0', 'undall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('17', '7', '14', '未读', '1', '0', 'undwd', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('18', '1', '0', '最新信息', '0', '0', 'new', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('19', '1', '0', '＋建议反馈', '1', '1', 'http://xinhu.pw/fankui.html', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('22', '12', '6', '我创建的', '2', '0', 'wcj', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('20', '12', '6', '未完成', '0', '0', 'wwc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('21', '12', '6', '已完成', '1', '0', 'ywc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('23', '15', '0', '流程申请', '3', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('24', '15', '23', '＋请假条', '0', '1', 'add_leave', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('25', '15', '23', '＋加班单', '0', '1', 'add_jiaban', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('26', '15', '0', '我的申请', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('27', '15', '0', '处理未通过', '0', '0', 'wtg', 'mywtg', null);
INSERT INTO `xinhu_im_menu` VALUES ('28', '15', '26', '我所有申请', '0', '0', 'apply', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('29', '15', '26', '未通过', '0', '0', 'wtg', null, 'red');
INSERT INTO `xinhu_im_menu` VALUES ('30', '15', '26', '已完成', '0', '0', 'ywc', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('31', '16', '0', '所有待办', '0', '0', 'daib', 'daiban', null);
INSERT INTO `xinhu_im_menu` VALUES ('32', '16', '0', '单据查看', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('34', '16', '32', '直属下级申请', '1', '0', 'myxia', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('33', '16', '32', '经我处理', '0', '0', 'jwcl', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('35', '12', '6', '我所有任务', '3', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('36', '19', '0', '销售跟进', '0', '0', null, 'gen', null);
INSERT INTO `xinhu_im_menu` VALUES ('37', '17', '40', '已停用客户', '0', '0', 'myty', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('41', '17', '0', '新增客户', '2', '1', 'add_customer', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('39', '17', '40', '我所有客户', '0', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('40', '17', '0', '我的客户', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('42', '19', '0', '新增销售', '0', '1', 'add_custsale', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('43', '19', '36', '需跟进', '0', '0', 'def', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('44', '19', '36', '已成交', '0', '0', 'saleycj', null, 'green');
INSERT INTO `xinhu_im_menu` VALUES ('45', '19', '36', '已丢失', '0', '0', 'saleyds', null, '');
INSERT INTO `xinhu_im_menu` VALUES ('46', '19', '36', '我所有销售', '0', '0', 'saleall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('47', '17', '40', '共享给我', '0', '0', 'gxgw', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('48', '17', '40', '我共享出去', '0', '0', 'mygx', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('49', '15', '26', '待处理', '0', '0', 'dcl', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('50', '20', '0', '新建文件夹', '2', '0', 'create', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('51', '20', '0', '上传文件', '0', '0', 'up', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('52', '20', '0', '我分享的', '1', '0', 'shate', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('53', '21', '0', '记事', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('54', '21', '53', '当月', '0', '0', 'nowmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('55', '21', '53', '下月', '0', '0', 'nextmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('56', '21', '0', '记事管理', '0', '0', 'guan', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('57', '21', '0', '新增记事', '0', '1', 'add', null, null);

-- ----------------------------
-- Table structure for `xinhu_im_mess`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_mess`;
CREATE TABLE `xinhu_im_mess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `optdt` datetime DEFAULT NULL,
  `zt` tinyint(1) DEFAULT '0' COMMENT '状态',
  `cont` varchar(4000) DEFAULT NULL COMMENT '内容',
  `sendid` smallint(6) DEFAULT NULL,
  `receid` smallint(6) DEFAULT '0' COMMENT '接收',
  `receuid` varchar(1000) DEFAULT NULL COMMENT '接收用户id',
  `type` varchar(20) DEFAULT NULL COMMENT '信息类型',
  `url` varchar(1000) DEFAULT NULL COMMENT '相关地址',
  `fileid` int(11) NOT NULL DEFAULT '0' COMMENT '对应文件Id',
  `msgid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `optdt` (`optdt`,`receid`),
  KEY `msgid` (`msgid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_mess
-- ----------------------------
INSERT INTO `xinhu_im_mess` VALUES ('1', '2016-09-08 23:38:17', '1', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '8', '2', '1,2,5,6,7,3,4,8,9', 'group', null, '0', null);

-- ----------------------------
-- Table structure for `xinhu_im_messzt`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_im_messzt`;
CREATE TABLE `xinhu_im_messzt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL COMMENT '信息id',
  `uid` int(11) DEFAULT NULL COMMENT '人员id',
  `gid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_messzt
-- ----------------------------
INSERT INTO `xinhu_im_messzt` VALUES ('1', '1', '1', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('2', '1', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('3', '1', '3', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('4', '1', '4', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('5', '1', '5', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('6', '1', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('7', '1', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('8', '1', '9', '2');

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
  `url` varchar(50) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL,
  `enddt` datetime DEFAULT NULL COMMENT '截止时间',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_infor
-- ----------------------------
INSERT INTO `xinhu_infor` VALUES ('1', '欢迎使用信呼工作台', '2016-08-30 20:16:13', '通知公告', '<p>\n	欢迎使用，有任何问题可以随时联系我们，帮你解答哦。&nbsp;\n</p>\n<p>\n	信呼是一款开源免费的工作台软件，可添加应用，管理，pc上，app都可以使用，我们的代码全部开放，可自由使用。\n</p>', null, null, null, '1', '管理员', null, null);
INSERT INTO `xinhu_infor` VALUES ('2', '关于写日报制度说明', '2016-08-30 20:57:45', '规则制度', '<p>\n	1、每个人工作日在下班后必须写工作日报，全天请假可不用写，只要有上班就需要写，即使你上班1分钟。\n</p>\n<p>\n	2、也可以隔天写。\n</p>\n<p>\n	<strong>未写处罚</strong> \n</p>\n<p>\n	1、未写一次扣五块，累计加倍。\n</p>', null, null, null, '1', '管理员', null, null);

-- ----------------------------
-- Table structure for `xinhu_kqanay`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqanay`;
CREATE TABLE `xinhu_kqanay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dt` date DEFAULT NULL COMMENT '日期',
  `uid` smallint(6) DEFAULT NULL COMMENT '人员id',
  `ztname` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `time` datetime DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL COMMENT '状态名称',
  `states` varchar(20) DEFAULT NULL COMMENT '其他状态,如请假',
  `sort` smallint(6) DEFAULT '0',
  `iswork` tinyint(4) DEFAULT '1' COMMENT '是否工作日',
  `emiao` int(11) DEFAULT '0' COMMENT '秒数',
  `optdt` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dt` (`dt`,`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=513 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqanay
-- ----------------------------
INSERT INTO `xinhu_kqanay` VALUES ('1', '2016-08-01', '1', '上班', '2016-08-01 08:55:10', '迟到', null, '0', '1', '3309', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('2', '2016-08-01', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('3', '2016-08-02', '1', '上班', '2016-08-02 08:05:38', '迟到', null, '0', '1', '337', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('4', '2016-08-02', '1', '下班', '2016-08-02 17:54:38', '早退', null, '1', '1', '321', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('5', '2016-08-03', '1', '上班', '2016-08-03 07:54:38', '正常', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('6', '2016-08-03', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('7', '2016-08-04', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('8', '2016-08-04', '1', '下班', '2016-08-04 18:46:32', '正常', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('9', '2016-08-05', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('10', '2016-08-05', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('11', '2016-08-06', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('12', '2016-08-06', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('13', '2016-08-07', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('14', '2016-08-07', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('15', '2016-08-08', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('16', '2016-08-08', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('17', '2016-08-09', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('18', '2016-08-09', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('19', '2016-08-10', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('20', '2016-08-10', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('21', '2016-08-11', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('22', '2016-08-11', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('23', '2016-08-12', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('24', '2016-08-12', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('25', '2016-08-13', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('26', '2016-08-13', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('27', '2016-08-14', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('28', '2016-08-14', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('29', '2016-08-15', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('30', '2016-08-15', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('31', '2016-08-16', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('32', '2016-08-16', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('33', '2016-08-17', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('34', '2016-08-17', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('35', '2016-08-18', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('36', '2016-08-18', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('37', '2016-08-19', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('38', '2016-08-19', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('39', '2016-08-20', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('40', '2016-08-20', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('41', '2016-08-21', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('42', '2016-08-21', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('43', '2016-08-22', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('44', '2016-08-22', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('45', '2016-08-23', '1', '上班', '2016-08-23 07:37:28', '正常', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('46', '2016-08-23', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('47', '2016-08-24', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('48', '2016-08-24', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('49', '2016-08-25', '1', '上班', null, '未打卡', '事假', '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('50', '2016-08-25', '1', '下班', null, '未打卡', '事假', '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('51', '2016-08-26', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('52', '2016-08-26', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('53', '2016-08-27', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('54', '2016-08-27', '1', '下班', '2016-08-27 22:45:06', '正常', null, '1', '0', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('55', '2016-08-28', '1', '上班', '2016-08-28 09:36:29', '迟到', null, '0', '0', '5788', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('56', '2016-08-28', '1', '下班', '2016-08-28 17:28:19', '早退', null, '1', '0', '1900', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('57', '2016-08-29', '1', '上班', null, '未打卡', '外出', '0', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('58', '2016-08-29', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 22:12:55', null);
INSERT INTO `xinhu_kqanay` VALUES ('59', '2016-08-30', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 22:33:01', null);
INSERT INTO `xinhu_kqanay` VALUES ('60', '2016-08-30', '1', '下班', '2016-08-30 22:33:01', '正常', null, '1', '1', '0', '2016-08-30 22:33:01', null);
INSERT INTO `xinhu_kqanay` VALUES ('61', '2016-08-01', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('62', '2016-08-01', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('63', '2016-08-02', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('64', '2016-08-02', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('65', '2016-08-03', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('66', '2016-08-03', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('67', '2016-08-04', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('68', '2016-08-04', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('69', '2016-08-05', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('70', '2016-08-05', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('71', '2016-08-06', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('72', '2016-08-06', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('73', '2016-08-07', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('74', '2016-08-07', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('75', '2016-08-08', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('76', '2016-08-08', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('77', '2016-08-09', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('78', '2016-08-09', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('79', '2016-08-10', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('80', '2016-08-10', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('81', '2016-08-11', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('82', '2016-08-11', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('83', '2016-08-12', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('84', '2016-08-12', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('85', '2016-08-13', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('86', '2016-08-13', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('87', '2016-08-14', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('88', '2016-08-14', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('89', '2016-08-15', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('90', '2016-08-15', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('91', '2016-08-16', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('92', '2016-08-16', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('93', '2016-08-17', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('94', '2016-08-17', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('95', '2016-08-18', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('96', '2016-08-18', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('97', '2016-08-19', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('98', '2016-08-19', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('99', '2016-08-20', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('100', '2016-08-20', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('101', '2016-08-21', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('102', '2016-08-21', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('103', '2016-08-22', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('104', '2016-08-22', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('105', '2016-08-23', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('106', '2016-08-23', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('107', '2016-08-24', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('108', '2016-08-24', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('109', '2016-08-25', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('110', '2016-08-25', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('111', '2016-08-26', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('112', '2016-08-26', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('113', '2016-08-27', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('114', '2016-08-27', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('115', '2016-08-28', '2', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('116', '2016-08-28', '2', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('117', '2016-08-29', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('118', '2016-08-29', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('119', '2016-08-30', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('120', '2016-08-30', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('121', '2016-08-01', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('122', '2016-08-01', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('123', '2016-08-02', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('124', '2016-08-02', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('125', '2016-08-03', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('126', '2016-08-03', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('127', '2016-08-04', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('128', '2016-08-04', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('129', '2016-08-05', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('130', '2016-08-05', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('131', '2016-08-06', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('132', '2016-08-06', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('133', '2016-08-07', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('134', '2016-08-07', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('135', '2016-08-08', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('136', '2016-08-08', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('137', '2016-08-09', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('138', '2016-08-09', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('139', '2016-08-10', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('140', '2016-08-10', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('141', '2016-08-11', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('142', '2016-08-11', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('143', '2016-08-12', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('144', '2016-08-12', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('145', '2016-08-13', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('146', '2016-08-13', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('147', '2016-08-14', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('148', '2016-08-14', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('149', '2016-08-15', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('150', '2016-08-15', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('151', '2016-08-16', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('152', '2016-08-16', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('153', '2016-08-17', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('154', '2016-08-17', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('155', '2016-08-18', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('156', '2016-08-18', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('157', '2016-08-19', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('158', '2016-08-19', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('159', '2016-08-20', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('160', '2016-08-20', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('161', '2016-08-21', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('162', '2016-08-21', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('163', '2016-08-22', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('164', '2016-08-22', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('165', '2016-08-23', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('166', '2016-08-23', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('167', '2016-08-24', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('168', '2016-08-24', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('169', '2016-08-25', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('170', '2016-08-25', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('171', '2016-08-26', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('172', '2016-08-26', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('173', '2016-08-27', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('174', '2016-08-27', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('175', '2016-08-28', '3', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('176', '2016-08-28', '3', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('177', '2016-08-29', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('178', '2016-08-29', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('179', '2016-08-30', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('180', '2016-08-30', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('181', '2016-08-01', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('182', '2016-08-01', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('183', '2016-08-02', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('184', '2016-08-02', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('185', '2016-08-03', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('186', '2016-08-03', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('187', '2016-08-04', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('188', '2016-08-04', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('189', '2016-08-05', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('190', '2016-08-05', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('191', '2016-08-06', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('192', '2016-08-06', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('193', '2016-08-07', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('194', '2016-08-07', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('195', '2016-08-08', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('196', '2016-08-08', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('197', '2016-08-09', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('198', '2016-08-09', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('199', '2016-08-10', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('200', '2016-08-10', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('201', '2016-08-11', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('202', '2016-08-11', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('203', '2016-08-12', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('204', '2016-08-12', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('205', '2016-08-13', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('206', '2016-08-13', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('207', '2016-08-14', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('208', '2016-08-14', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('209', '2016-08-15', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('210', '2016-08-15', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('211', '2016-08-16', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('212', '2016-08-16', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('213', '2016-08-17', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('214', '2016-08-17', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('215', '2016-08-18', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('216', '2016-08-18', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('217', '2016-08-19', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('218', '2016-08-19', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('219', '2016-08-20', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('220', '2016-08-20', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('221', '2016-08-21', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('222', '2016-08-21', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('223', '2016-08-22', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('224', '2016-08-22', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('225', '2016-08-23', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('226', '2016-08-23', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('227', '2016-08-24', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('228', '2016-08-24', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('229', '2016-08-25', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('230', '2016-08-25', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('231', '2016-08-26', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('232', '2016-08-26', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('233', '2016-08-27', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('234', '2016-08-27', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('235', '2016-08-28', '4', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('236', '2016-08-28', '4', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('237', '2016-08-29', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('238', '2016-08-29', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('239', '2016-08-30', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('240', '2016-08-30', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('241', '2016-08-01', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('242', '2016-08-01', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('243', '2016-08-02', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('244', '2016-08-02', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('245', '2016-08-03', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('246', '2016-08-03', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('247', '2016-08-04', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('248', '2016-08-04', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('249', '2016-08-05', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('250', '2016-08-05', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('251', '2016-08-06', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('252', '2016-08-06', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('253', '2016-08-07', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('254', '2016-08-07', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('255', '2016-08-08', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('256', '2016-08-08', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('257', '2016-08-09', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('258', '2016-08-09', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('259', '2016-08-10', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('260', '2016-08-10', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('261', '2016-08-11', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('262', '2016-08-11', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('263', '2016-08-12', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('264', '2016-08-12', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('265', '2016-08-13', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('266', '2016-08-13', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('267', '2016-08-14', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('268', '2016-08-14', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('269', '2016-08-15', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('270', '2016-08-15', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('271', '2016-08-16', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('272', '2016-08-16', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('273', '2016-08-17', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('274', '2016-08-17', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('275', '2016-08-18', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('276', '2016-08-18', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('277', '2016-08-19', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('278', '2016-08-19', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('279', '2016-08-20', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('280', '2016-08-20', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('281', '2016-08-21', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('282', '2016-08-21', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('283', '2016-08-22', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('284', '2016-08-22', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('285', '2016-08-23', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('286', '2016-08-23', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('287', '2016-08-24', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('288', '2016-08-24', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('289', '2016-08-25', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('290', '2016-08-25', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('291', '2016-08-26', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('292', '2016-08-26', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('293', '2016-08-27', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('294', '2016-08-27', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('295', '2016-08-28', '5', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('296', '2016-08-28', '5', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('297', '2016-08-29', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('298', '2016-08-29', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('299', '2016-08-30', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('300', '2016-08-30', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('301', '2016-08-01', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('302', '2016-08-01', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('303', '2016-08-02', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('304', '2016-08-02', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('305', '2016-08-03', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('306', '2016-08-03', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('307', '2016-08-04', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('308', '2016-08-04', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('309', '2016-08-05', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('310', '2016-08-05', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('311', '2016-08-06', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('312', '2016-08-06', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('313', '2016-08-07', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('314', '2016-08-07', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('315', '2016-08-08', '6', '上班', null, '未打卡', '年假', '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('316', '2016-08-08', '6', '下班', null, '未打卡', '年假', '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('317', '2016-08-09', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('318', '2016-08-09', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('319', '2016-08-10', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('320', '2016-08-10', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('321', '2016-08-11', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('322', '2016-08-11', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('323', '2016-08-12', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('324', '2016-08-12', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('325', '2016-08-13', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('326', '2016-08-13', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('327', '2016-08-14', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('328', '2016-08-14', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('329', '2016-08-15', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('330', '2016-08-15', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('331', '2016-08-16', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('332', '2016-08-16', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('333', '2016-08-17', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('334', '2016-08-17', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('335', '2016-08-18', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('336', '2016-08-18', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('337', '2016-08-19', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('338', '2016-08-19', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('339', '2016-08-20', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('340', '2016-08-20', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('341', '2016-08-21', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('342', '2016-08-21', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('343', '2016-08-22', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('344', '2016-08-22', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('345', '2016-08-23', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('346', '2016-08-23', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('347', '2016-08-24', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('348', '2016-08-24', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('349', '2016-08-25', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('350', '2016-08-25', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('351', '2016-08-26', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('352', '2016-08-26', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('353', '2016-08-27', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('354', '2016-08-27', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('355', '2016-08-28', '6', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('356', '2016-08-28', '6', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('357', '2016-08-29', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('358', '2016-08-29', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('359', '2016-08-30', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('360', '2016-08-30', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('361', '2016-08-01', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('362', '2016-08-01', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('363', '2016-08-02', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('364', '2016-08-02', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('365', '2016-08-03', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('366', '2016-08-03', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('367', '2016-08-04', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('368', '2016-08-04', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('369', '2016-08-05', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('370', '2016-08-05', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('371', '2016-08-06', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('372', '2016-08-06', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('373', '2016-08-07', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('374', '2016-08-07', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('375', '2016-08-08', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('376', '2016-08-08', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('377', '2016-08-09', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('378', '2016-08-09', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('379', '2016-08-10', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('380', '2016-08-10', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('381', '2016-08-11', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('382', '2016-08-11', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('383', '2016-08-12', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('384', '2016-08-12', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('385', '2016-08-13', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('386', '2016-08-13', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('387', '2016-08-14', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('388', '2016-08-14', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('389', '2016-08-15', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('390', '2016-08-15', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('391', '2016-08-16', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('392', '2016-08-16', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('393', '2016-08-17', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('394', '2016-08-17', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('395', '2016-08-18', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('396', '2016-08-18', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('397', '2016-08-19', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('398', '2016-08-19', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('399', '2016-08-20', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('400', '2016-08-20', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('401', '2016-08-21', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('402', '2016-08-21', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('403', '2016-08-22', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('404', '2016-08-22', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('405', '2016-08-23', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('406', '2016-08-23', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('407', '2016-08-24', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('408', '2016-08-24', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('409', '2016-08-25', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('410', '2016-08-25', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('411', '2016-08-26', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('412', '2016-08-26', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('413', '2016-08-27', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('414', '2016-08-27', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('415', '2016-08-28', '7', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('416', '2016-08-28', '7', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('417', '2016-08-29', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('418', '2016-08-29', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('419', '2016-08-30', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('420', '2016-08-30', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('421', '2016-08-01', '8', '上班', null, '未打卡', '事假', '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('422', '2016-08-01', '8', '下班', null, '未打卡', '事假', '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('423', '2016-08-02', '8', '上班', null, '未打卡', '事假', '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('424', '2016-08-02', '8', '下班', null, '未打卡', '事假', '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('425', '2016-08-03', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('426', '2016-08-03', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('427', '2016-08-04', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('428', '2016-08-04', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('429', '2016-08-05', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('430', '2016-08-05', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('431', '2016-08-06', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('432', '2016-08-06', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('433', '2016-08-07', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('434', '2016-08-07', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('435', '2016-08-08', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('436', '2016-08-08', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('437', '2016-08-09', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('438', '2016-08-09', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('439', '2016-08-10', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('440', '2016-08-10', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('441', '2016-08-11', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('442', '2016-08-11', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('443', '2016-08-12', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('444', '2016-08-12', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('445', '2016-08-13', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('446', '2016-08-13', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('447', '2016-08-14', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('448', '2016-08-14', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('449', '2016-08-15', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('450', '2016-08-15', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('451', '2016-08-16', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('452', '2016-08-16', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('453', '2016-08-17', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('454', '2016-08-17', '8', '下班', '2016-08-17 13:13:10', '早退', null, '1', '1', '17209', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('455', '2016-08-18', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('456', '2016-08-18', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('457', '2016-08-19', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('458', '2016-08-19', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('459', '2016-08-20', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('460', '2016-08-20', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('461', '2016-08-21', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('462', '2016-08-21', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('463', '2016-08-22', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('464', '2016-08-22', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('465', '2016-08-23', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('466', '2016-08-23', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('467', '2016-08-24', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('468', '2016-08-24', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('469', '2016-08-25', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('470', '2016-08-25', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('471', '2016-08-26', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('472', '2016-08-26', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('473', '2016-08-27', '8', '上班', null, '未打卡', null, '0', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('474', '2016-08-27', '8', '下班', null, '未打卡', null, '1', '0', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('475', '2016-08-28', '8', '上班', '2016-08-28 10:31:46', '迟到', null, '0', '0', '5505', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('476', '2016-08-28', '8', '下班', '2016-08-28 17:20:59', '早退', null, '1', '0', '2340', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('477', '2016-08-29', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('478', '2016-08-29', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('479', '2016-08-30', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('480', '2016-08-30', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-30 21:38:27', null);
INSERT INTO `xinhu_kqanay` VALUES ('481', '2016-08-31', '1', '上班', '2016-08-31 09:10:26', '迟到', null, '0', '1', '4225', '2016-08-31 09:10:26', null);
INSERT INTO `xinhu_kqanay` VALUES ('482', '2016-08-31', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-08-31 09:10:26', null);
INSERT INTO `xinhu_kqanay` VALUES ('483', '2016-09-01', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('484', '2016-09-01', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('485', '2016-09-01', '2', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('486', '2016-09-01', '2', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('487', '2016-09-01', '3', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('488', '2016-09-01', '3', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('489', '2016-09-01', '4', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('490', '2016-09-01', '4', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('491', '2016-09-01', '5', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('492', '2016-09-01', '5', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('493', '2016-09-01', '6', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('494', '2016-09-01', '6', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('495', '2016-09-01', '7', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('496', '2016-09-01', '7', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('497', '2016-09-01', '8', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('498', '2016-09-01', '8', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-01 15:42:59', null);
INSERT INTO `xinhu_kqanay` VALUES ('499', '2016-09-02', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('500', '2016-09-02', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('501', '2016-09-03', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('502', '2016-09-03', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('503', '2016-09-04', '1', '上班', null, '未打卡', null, '0', '0', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('504', '2016-09-04', '1', '下班', null, '未打卡', null, '1', '0', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('505', '2016-09-05', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('506', '2016-09-05', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('507', '2016-09-06', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('508', '2016-09-06', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('509', '2016-09-07', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('510', '2016-09-07', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('511', '2016-09-08', '1', '上班', null, '未打卡', null, '0', '1', '0', '2016-09-08 21:49:18', null);
INSERT INTO `xinhu_kqanay` VALUES ('512', '2016-09-08', '1', '下班', null, '未打卡', null, '1', '1', '0', '2016-09-08 21:49:18', null);

-- ----------------------------
-- Table structure for `xinhu_kqdist`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdist`;
CREATE TABLE `xinhu_kqdist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recename` varchar(200) DEFAULT NULL,
  `receid` varchar(20) DEFAULT NULL,
  `mid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0考勤时间,1休息',
  `startdt` date DEFAULT NULL,
  `enddt` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqdist
-- ----------------------------
INSERT INTO `xinhu_kqdist` VALUES ('1', '信呼开发团队', 'd1', '1', '0', '2010-01-01', '2021-08-31', '1');
INSERT INTO `xinhu_kqdist` VALUES ('3', '管理员', 'u1', '21', '0', '2016-08-01', '2016-08-31', '1');
INSERT INTO `xinhu_kqdist` VALUES ('4', '信呼开发团队', 'd1', '1', '1', '2014-08-01', '2021-08-31', '1');

-- ----------------------------
-- Table structure for `xinhu_kqdkjl`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdkjl`;
CREATE TABLE `xinhu_kqdkjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `dkdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0在线打卡,1考勤机,2手机定位,3手动添加,4异常添加,5数据导入',
  `address` varchar(50) DEFAULT NULL COMMENT '定位地址',
  `lat` varchar(20) DEFAULT NULL COMMENT '纬度',
  `lng` varchar(20) DEFAULT NULL COMMENT '经度',
  `accuracy` smallint(6) DEFAULT '0' COMMENT '精确范围',
  `ip` varchar(30) DEFAULT NULL,
  `mac` varchar(30) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`,`dkdt`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqdkjl
-- ----------------------------
INSERT INTO `xinhu_kqdkjl` VALUES ('1', '1', '2016-08-02 17:54:38', '2016-08-13 19:54:40', '0', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('2', '1', '2016-08-02 09:54:38', null, '0', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('3', '1', '2016-08-02 08:05:38', null, '0', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('4', '1', '2016-08-03 07:54:38', null, '0', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('5', '1', '2016-08-23 07:37:28', null, '0', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('6', '1', '2016-08-27 19:01:28', '2016-08-27 19:01:29', '3', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('7', '1', '2016-08-27 21:11:41', '2016-08-27 21:11:41', '0', null, null, null, '0', '127.0.0.1', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('8', '1', '2016-08-27 22:45:06', '2016-08-27 22:45:06', '0', null, null, null, '0', '127.0.0.1', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('9', '1', '2016-08-28 09:36:29', '2016-08-28 09:36:29', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('10', '1', '2016-08-28 10:19:25', '2016-08-28 10:19:25', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('11', '8', '2016-08-28 10:31:46', '2016-08-28 10:31:46', '0', null, null, null, '0', '127.0.0.1', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('12', '1', '2016-08-28 10:32:50', '2016-08-28 10:32:50', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('13', '8', '2016-08-28 10:34:11', '2016-08-28 10:34:11', '0', null, null, null, '0', '127.0.0.1', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('14', '8', '2016-08-28 10:34:55', '2016-08-28 10:34:55', '0', null, null, null, '0', '127.0.0.1', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('15', '8', '2016-08-28 10:38:03', '2016-08-28 10:38:03', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('16', '8', '2016-08-28 10:38:53', '2016-08-28 10:38:53', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('17', '1', '2016-08-28 10:47:15', '2016-08-28 10:47:15', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('18', '1', '2016-08-28 13:10:42', '2016-08-28 13:10:42', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('19', '8', '2016-08-28 13:13:07', '2016-08-28 13:13:07', '0', null, null, null, '0', '127.0.0.1', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('20', '8', '2016-08-28 13:13:10', '2016-08-28 13:42:37', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('21', '8', '2016-08-28 13:13:11', '2016-08-28 13:42:37', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('22', '8', '2016-08-28 13:13:12', '2016-08-28 13:42:37', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('23', '8', '2016-08-28 13:13:13', '2016-08-28 13:42:37', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('24', '8', '2016-08-17 13:13:10', '2016-08-28 13:44:02', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('25', '1', '2016-08-17 13:13:10', '2016-08-28 13:50:54', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('26', '1', '2016-08-01 08:55:10', '2016-08-28 14:09:26', '3', null, null, null, '0', null, null, '第一天入职添加');
INSERT INTO `xinhu_kqdkjl` VALUES ('27', '1', '2016-08-28 17:04:01', '2016-08-28 17:04:01', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('28', '1', '2016-08-28 17:06:55', '2016-08-28 17:06:55', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('29', '1', '2016-08-28 17:07:03', '2016-08-28 17:07:03', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('30', '1', '2016-08-28 17:08:40', '2016-08-28 17:08:40', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('31', '8', '2016-08-28 17:13:43', '2016-08-28 17:13:43', '0', null, null, null, '0', '127.0.0.1', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('32', '8', '2016-08-28 17:14:42', '2016-08-28 17:14:42', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('33', '8', '2016-08-28 17:16:10', '2016-08-28 17:16:10', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('34', '8', '2016-08-28 17:16:18', '2016-08-28 17:16:18', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('35', '8', '2016-08-28 17:19:28', '2016-08-28 17:19:28', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('36', '8', '2016-08-28 17:20:59', '2016-08-28 17:20:59', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('37', '1', '2016-08-28 17:28:19', '2016-08-28 17:28:19', '0', null, null, null, '0', '192.168.1.104', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('38', '1', '2016-08-04 18:46:32', '2016-08-28 18:46:39', '3', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('39', '1', '2016-08-08 12:00:01', '2016-08-30 21:36:09', '5', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('40', '1', '2016-08-30 22:33:01', '2016-08-30 22:33:01', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);
INSERT INTO `xinhu_kqdkjl` VALUES ('41', '1', '2016-08-31 09:10:26', '2016-08-31 09:10:26', '0', null, null, null, '0', '192.168.1.104', '34:97:f6:9c:c8:e8', null);

-- ----------------------------
-- Table structure for `xinhu_kqinfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqinfo`;
CREATE TABLE `xinhu_kqinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `stime` datetime DEFAULT NULL,
  `etime` datetime DEFAULT NULL,
  `kind` varchar(10) DEFAULT NULL COMMENT '类型',
  `qjkind` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `explain` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `totals` decimal(6,1) DEFAULT '0.0' COMMENT '时间',
  `optdt` datetime DEFAULT NULL,
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否提交',
  `optname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqinfo
-- ----------------------------
INSERT INTO `xinhu_kqinfo` VALUES ('1', '1', '2016-07-29 10:52:51', '2016-07-29 18:52:54', '请假', '事假', '下午请假去骑车兜风啊！', '1', '6.0', '2016-07-29 10:53:11', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('2', '1', '2016-07-27 19:00:00', '2016-07-27 23:00:00', '加班', null, '老板说我能做事就多加班，呵呵呵！', '1', '4.0', '2016-07-29 10:56:58', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('3', '6', '2016-08-08 09:00:00', '2016-08-08 18:36:40', '请假', '年假', '辛辛苦苦一年终于有一天年假啦，请一下吧！', '1', '8.0', '2016-08-07 18:37:02', '1', '张飞');
INSERT INTO `xinhu_kqinfo` VALUES ('4', '1', '2016-08-30 09:00:00', '2016-08-31 18:00:00', '请假', '年假', '年底年假休息！', '2', '16.0', '2016-08-15 16:55:26', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('5', '1', '2016-08-25 08:00:00', '2016-08-25 18:01:35', '请假', '事假', '请假1条', '1', '8.0', '2016-08-25 16:01:52', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('6', '8', '2016-08-01 08:44:45', '2016-08-02 22:44:54', '请假', '事假', '请假2天去玩喽', '1', '24.0', '2016-08-26 22:45:35', '1', '信呼客服');
INSERT INTO `xinhu_kqinfo` VALUES ('7', '1', '2016-08-28 14:06:25', '2016-08-28 16:06:33', '加班', null, '人傻要多加班！', '1', '2.0', '2016-08-27 14:06:56', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('8', '6', '2016-08-02 08:02:21', '2016-08-02 20:02:23', '请假', '事假', '请假啦', '1', '8.0', '2016-08-30 20:12:33', '1', '张飞');
INSERT INTO `xinhu_kqinfo` VALUES ('9', '1', '2016-09-08 17:45:57', '2016-09-09 17:46:00', '请假', '事假', '嗯嗯嗯。', '0', '9.0', '2016-09-08 21:14:14', '1', '管理员');

-- ----------------------------
-- Table structure for `xinhu_kqout`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqout`;
CREATE TABLE `xinhu_kqout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `outtime` datetime DEFAULT NULL COMMENT '外出时间',
  `intime` datetime DEFAULT NULL COMMENT '回岗时间',
  `address` varchar(50) DEFAULT NULL COMMENT '外出地址',
  `reason` varchar(500) DEFAULT NULL COMMENT '外出事由',
  `atype` varchar(2) DEFAULT NULL COMMENT '外出类型@外出,出差',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `isxj` tinyint(1) DEFAULT '0' COMMENT '是否销假@0|否,1|是',
  `sicksm` varchar(500) DEFAULT NULL COMMENT '销假说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqout
-- ----------------------------
INSERT INTO `xinhu_kqout` VALUES ('1', '1', '2016-08-29 08:00:00', '2016-08-29 15:22:42', '火车站', '接人啊', '外出', null, '2016-08-27 15:22:51', '1', '1', '1', '管理员', '2016-08-27', '0', null);

-- ----------------------------
-- Table structure for `xinhu_kqsjgz`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqsjgz`;
CREATE TABLE `xinhu_kqsjgz` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `pid` smallint(6) DEFAULT '0' COMMENT '主',
  `stime` varchar(20) DEFAULT NULL COMMENT '开始时间',
  `etime` varchar(20) DEFAULT NULL COMMENT '结束时间',
  `qtype` tinyint(1) DEFAULT '0' COMMENT '取值类型@0|最小值,1|最大值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqsjgz
-- ----------------------------
INSERT INTO `xinhu_kqsjgz` VALUES ('1', '全体人员考勤', '1', '0', null, null, '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('2', '下班', '3', '1', '13:00:00', '18:00:00', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('5', '正常', '0', '12', '06:00:00', '09:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('6', '迟到', '1', '12', '09:00:01', '12:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('7', '正常', '0', '2', '18:00:00', '23:59:00', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('8', '早退', '1', '2', '13:00:00', '17:59:59', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('12', '上班', '0', '1', '09:00:00', '12:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('21', '8点上班', '2', '0', null, null, '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('22', '上班', '0', '21', '08:00:00', '12:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('23', '下班', '1', '21', '14:00:00', '18:00:00', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('24', '正常', '0', '22', '06:00:00', '08:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('25', '迟到', '1', '22', '08:00:01', '12:00:00', '0');
INSERT INTO `xinhu_kqsjgz` VALUES ('26', '早退', '1', '23', '14:00:01', '17:59:59', '1');
INSERT INTO `xinhu_kqsjgz` VALUES ('27', '正常', '0', '23', '18:00:00', '23:59:59', '1');

-- ----------------------------
-- Table structure for `xinhu_kqxxsj`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqxxsj`;
CREATE TABLE `xinhu_kqxxsj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `dt` date DEFAULT NULL,
  `pid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqxxsj
-- ----------------------------
INSERT INTO `xinhu_kqxxsj` VALUES ('1', '全体人员休息日', null, '0');
INSERT INTO `xinhu_kqxxsj` VALUES ('2', null, '2016-08-06', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('3', null, '2016-08-07', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('4', null, '2016-08-13', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('5', null, '2016-08-14', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('6', null, '2016-08-20', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('7', null, '2016-08-21', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('8', null, '2016-08-27', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('10', null, '2016-08-28', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('11', null, '2016-09-03', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('12', null, '2016-09-04', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('13', null, '2016-09-10', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('14', null, '2016-09-11', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('17', null, '2016-09-24', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('18', null, '2016-09-25', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('19', null, '2016-09-15', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('20', null, '2016-09-16', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('21', null, '2016-09-17', '1');

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
  `location_x` varchar(30) DEFAULT NULL COMMENT '地理位置纬度',
  `location_y` varchar(30) DEFAULT NULL COMMENT '地理位置经度 ',
  `scale` smallint(6) DEFAULT '0' COMMENT '地图缩放大小',
  `label` varchar(50) DEFAULT NULL COMMENT '地理位置',
  `msgid` varchar(50) DEFAULT NULL,
  `precision` smallint(6) DEFAULT '0' COMMENT '地理位置精度',
  `type` tinyint(4) DEFAULT '0' COMMENT '0普通,1事件',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_location
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_log`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_log`;
CREATE TABLE `xinhu_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL COMMENT '类型',
  `optid` int(11) DEFAULT NULL COMMENT '操作人id',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `optdt` datetime DEFAULT NULL COMMENT '添加时间',
  `ip` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `web` varchar(100) DEFAULT NULL COMMENT '浏览器',
  `device` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_log
-- ----------------------------
INSERT INTO `xinhu_log` VALUES ('1', 'pc登录', '8', '信呼客服', '[xinhu]超级密码登录成功', '2016-09-08 23:39:49', '127.0.0.1', 'Chrome', '1469187263496');
INSERT INTO `xinhu_log` VALUES ('2', 'pc登录', '5', '磐石', '[rock]超级密码登录成功', '2016-09-08 23:41:43', '127.0.0.1', 'Chrome', '1469187263496');
INSERT INTO `xinhu_log` VALUES ('3', 'pc登录', '1', '管理员', '[admin]超级密码登录成功', '2016-09-08 23:41:49', '127.0.0.1', 'Chrome', '1469187263496');
INSERT INTO `xinhu_log` VALUES ('4', 'pc登录', '1', '管理员', '[admin]超级密码登录成功', '2016-09-09 10:09:05', '127.0.0.1', 'Chrome', '1469187263496');

-- ----------------------------
-- Table structure for `xinhu_logintoken`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_logintoken`;
CREATE TABLE `xinhu_logintoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_logintoken
-- ----------------------------
INSERT INTO `xinhu_logintoken` VALUES ('1', '8', '信呼客服', 'hervp7ba', '2016-09-08 23:39:49', '2016-09-08 23:39:49', 'pc', '1469187263496', '127.0.0.1', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('2', '5', '磐石', 'xhrct9n8', '2016-09-08 23:41:43', '2016-09-08 23:41:43', 'pc', '1469187263496', '127.0.0.1', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('4', '1', '管理员', 'zqgh3o2x', '2016-09-09 10:09:05', '2016-09-09 10:09:05', 'pc', '1469187263496', '127.0.0.1', 'Chrome', '0');

-- ----------------------------
-- Table structure for `xinhu_meet`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_meet`;
CREATE TABLE `xinhu_meet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hyname` varchar(20) DEFAULT NULL COMMENT '会议室名称',
  `title` varchar(50) DEFAULT NULL COMMENT '主题',
  `startdt` varchar(50) DEFAULT NULL COMMENT '开始时间',
  `enddt` varchar(50) DEFAULT NULL COMMENT '结束时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '会议状态@0|正常,1|会议中,2|结束,3|取消',
  `status` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|普通,1|固定@not',
  `joinid` varchar(200) DEFAULT NULL,
  `joinname` varchar(500) DEFAULT NULL COMMENT '参加人员',
  `mid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '发起人',
  `rate` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `cancelreason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_meet
-- ----------------------------
INSERT INTO `xinhu_meet` VALUES ('1', '会议室1', '每天部门工作汇报', '09:30:00', '10:30:00', '1', '1', '1', 'd4', '开发部', '0', '管理员', '工作日', null, '2015-11-21 19:34:54', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('2', '会议室1', '每天部门工作汇报', '2016-05-28 09:30:00', '2016-05-28 10:30:00', '0', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('3', '会议室1', '每天部门工作汇报', '2016-05-27 09:30:00', '2016-05-27 09:30:00', '0', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('4', '会议室1', '每天部门工作汇报', '2016-05-31 09:30:00', '2016-05-31 10:30:00', '0', '1', '0', 'u1', '管理员', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('5', '会议室1', '每天部门工作汇报', '2016-05-30 09:30:00', '2016-05-30 10:30:00', '0', '1', '0', 'd2', '开发部', '1', '管理员', null, null, null, null, null, null);
INSERT INTO `xinhu_meet` VALUES ('6', '会议室1', '开会啦', '2016-05-30 13:00:00', '2016-05-30 13:59:00', '0', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-05-30 13:58:13', '1', '嗯嗯', null);
INSERT INTO `xinhu_meet` VALUES ('7', '会议室1', '开会啦', '2016-06-14 08:00:00', '2016-06-14 15:00:00', '0', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-06-14 15:00:46', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('8', '会客室', '开会啦', '2016-08-31 15:43:00', '2016-08-31 17:43:00', '2', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 17:44:10', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('9', '会客室', '开会啦', '2016-06-24 17:02:00', '2016-06-24 18:02:00', '0', '0', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 18:02:19', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('10', '会客室', '今天会议', '2016-07-17 14:29:17', '2016-07-17 14:30:23', '2', '1', '0', 'd1', '信呼开发团队', '0', '大乔', null, '4', '2016-07-16 14:29:34', '4', null, null);
INSERT INTO `xinhu_meet` VALUES ('12', '会客室', '开会啦', '2016-07-19 09:00:00', '2016-07-19 10:00:00', '2', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-07-18 20:00:27', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('13', '会客室', '要开会啦', '2016-07-29 13:00:00', '2016-07-29 14:00:00', '3', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-07-28 21:26:01', '1', '哈哈哈哈', null);
INSERT INTO `xinhu_meet` VALUES ('14', '会客室', '开发部门的会议', '2016-07-28 21:31:35', '2016-07-28 23:31:36', '2', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-07-28 21:32:53', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('15', '会客室', '开会啦，来拉拉', '2016-09-01 15:52:00', '2016-09-01 16:44:39', '2', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-09-01 15:51:34', '1', '嗯嗯嗯额', null);
INSERT INTO `xinhu_meet` VALUES ('16', '会客室', '开会了？', '2016-09-02 14:37:13', '2016-09-02 15:26:29', '2', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-09-02 14:26:56', '1', '开会啦', null);

-- ----------------------------
-- Table structure for `xinhu_menu`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_menu`;
CREATE TABLE `xinhu_menu` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名',
  `pid` smallint(6) DEFAULT '0' COMMENT '上级id',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `url` varchar(50) DEFAULT NULL,
  `icons` varchar(50) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `ispir` tinyint(1) DEFAULT '1' COMMENT '1验证',
  `status` tinyint(1) DEFAULT '1' COMMENT '1启用',
  `color` varchar(10) DEFAULT NULL,
  `ishs` tinyint(4) DEFAULT '0' COMMENT '是否在首页显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_menu
-- ----------------------------
INSERT INTO `xinhu_menu` VALUES ('1', '系统', '0', '20', null, 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('2', '菜单管理', '1', '0', 'system,menu', 'list-ul', null, 'menu', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('3', '用户管理', '14', '2', 'system,admin', 'user', null, 'user', '1', '1', '#5AAAE2', '1');
INSERT INTO `xinhu_menu` VALUES ('4', '计划任务', '46', '7', 'system,task', 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('5', '组管理', '1', '1', 'system,group', 'group', null, 'group', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('6', '组织结构', '14', '1', 'system,dept', 'sitemap', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('7', '流程模块', '0', '10', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('8', '权限管理', '1', '2', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('9', '人员→菜单', '8', '0', 'system,extent,type=um', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('10', '菜单→人员', '8', '0', 'system,extent,type=mu', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('11', '组→菜单', '8', '0', 'system,extent,type=gm', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('12', '菜单→组', '8', '0', 'system,extent,type=mg', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('13', '人员权限查看', '8', '0', 'system,extent,type=view', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('14', '信呼', '0', '2', null, 'comment', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('15', '应用管理', '14', '4', 'main,yingyong', 'th-large', null, 'yingyong', '1', '1', '#1ABC9C', '1');
INSERT INTO `xinhu_menu` VALUES ('16', '会话管理', '14', '3', 'main,imgroup', 'comments', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('17', '流程模块列表', '7', '2', 'main,flow,set', 'check', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('18', '服务器设置', '14', '0', 'main,xinhu,cog', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('20', '表单元素管理', '7', '4', 'main,flow,element', 'th-list', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('21', '流程模块权限', '7', '5', 'main,view', 'lock', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('22', '流程单据查看', '7', '6', 'main,flow,view', 'search', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('23', '系统升级', '46', '10', 'system,upgrade', 'arrow-up', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('24', '数据选项', '7', '1', 'system,option,num=xinhu', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('25', '初始化备份', '46', '5', 'system,beifen', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('26', '流程审核步骤', '7', '3', 'main,flow,course', 'resize-vertical', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('27', '行政考勤', '0', '5', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('28', '物品产品', '27', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('29', '分类选项管理', '28', '0', 'system,option,num=goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('30', '物品产品列表', '28', '0', 'main,goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('31', '物品出入库详情', '28', '0', 'main,goods,xiang', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('32', '考勤设置', '27', '0', null, 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('33', '打卡记录', '57', '0', 'main,kaoqin,dkjl', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('34', '单据操作菜单', '7', '7', 'main,flow,menu', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('36', '考勤信息', '57', '1', 'main,kaoqin,info', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('37', '报表', '0', '9', null, 'bar-chart', null, null, '1', '0', null, '0');
INSERT INTO `xinhu_menu` VALUES ('38', '个人办公', '0', '0', null, 'desktop', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('39', '提醒信息', '38', '0', 'system,geren,todo', 'bell', null, 'todo', '0', '1', '#EFBB62', '1');
INSERT INTO `xinhu_menu` VALUES ('40', '工作流程', '38', '5', null, 'book', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('41', '我的申请', '40', '2', 'main,fwork,bill,atype=my', 'bookmark-empty', null, 'applymy', '0', '1', '#B67FF4', '1');
INSERT INTO `xinhu_menu` VALUES ('42', '流程申请', '40', '1', 'main,fwork,apply', 'plus', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('43', '待办/处理', '40', '0', 'main,fwork,bill,atype=daib', 'time', null, 'daiban', '0', '1', '#3BBDDB', '1');
INSERT INTO `xinhu_menu` VALUES ('44', '我的下属申请', '40', '3', 'main,fwork,bill,atype=xia', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('45', '备忘记事', '38', '0', 'system,schedule,calendar', 'calendar', null, 'schedule', '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('46', '系统工具', '1', '3', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('47', '微信企业号', '1', '4', null, 'comments', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('48', '微信设置', '47', '0', 'system,weixin,cog', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('49', '微信部门', '47', '0', 'system,weixin,dept', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('50', '微信用户', '47', '0', 'system,weixin,user', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('51', '应用设置', '47', '0', 'system,weixin,ying', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('52', '会话IM', '47', '0', 'system,weixin,chat', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('53', '考勤时间规则', '32', '0', 'main,kaoqin,sjgz', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('54', '考勤时间分配', '32', '0', 'main,kaoqin,sjfp,type=0', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('55', '休息时间规则', '32', '0', 'main,kaoqin,xxgz', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('56', '休息时间分配', '32', '0', 'main,kaoqin,sjfp,type=1', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('57', '考勤信息', '27', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('58', '考勤分析', '57', '2', 'main,kaoqin,anay', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('59', '我的考勤表', '38', '0', 'main,kaoqin,geren', 'time', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('60', '考勤统计', '57', '3', 'main,kaoqin,total', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('61', '人员考勤设置', '32', '0', 'main,kaoqin,kqcog', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('62', '经我处理', '40', '4', 'main,fwork,bill,atype=jmy', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('63', '客户', '0', '1', null, 'user', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('64', '我的客户', '63', '0', 'main,customer,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('65', '我的任务', '66', '0', 'main,work,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('66', '项目任务', '38', '10', null, 'circle-blank', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('67', '我未完成任务', '66', '0', 'main,work,list,atype=wwc', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('68', '我创建任务', '66', '0', 'main,work,list,atype=mycj', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('69', '我执行的项目', '66', '2', 'main,work,project,atype=myzx', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('70', '我未完成项目', '66', '2', 'main,work,project,atype=wwc', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('71', '我创建的项目', '66', '3', 'main,work,project,atype=mycj', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('72', '我负责的项目', '66', '2', 'main,work,project,atype=myfz', null, null, null, '0', '1', null, '0');

-- ----------------------------
-- Table structure for `xinhu_official`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_official`;
CREATE TABLE `xinhu_official` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `titles` varchar(255) DEFAULT NULL COMMENT '副标题',
  `class` varchar(10) DEFAULT NULL COMMENT '类型',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收文单,1发文单',
  `grade` varchar(10) DEFAULT NULL COMMENT '等级',
  `optname` varchar(20) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `content` text COMMENT '内容',
  `receid` varchar(200) DEFAULT NULL COMMENT '来源',
  `recename` varchar(200) DEFAULT NULL COMMENT '发给',
  `applydt` date DEFAULT NULL COMMENT '日期',
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `optid` smallint(6) DEFAULT '0',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_official
-- ----------------------------
INSERT INTO `xinhu_official` VALUES ('1', '1', '发文单', null, '决议', '0', '普通', '管理员', '2016-09-05 20:13:56', '1', null, 'd1', '信呼开发团队', '2016-09-05', 'WJ-001', '1', null, '1');

-- ----------------------------
-- Table structure for `xinhu_option`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_option`;
CREATE TABLE `xinhu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `value` varchar(100) DEFAULT NULL COMMENT '对应值',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `values` varchar(50) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  `optid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_option
-- ----------------------------
INSERT INTO `xinhu_option` VALUES ('31', null, null, 'reimrecidsystem', 'rockxinhu', '0', null, '1', '2016-07-06 16:44:37', '0');
INSERT INTO `xinhu_option` VALUES ('2', null, null, 'reimhostsystem', 'ws://127.0.0.1:6552/', '0', null, '1', '2016-07-06 16:44:37', '0');
INSERT INTO `xinhu_option` VALUES ('3', null, null, 'reimpushurlsystem', 'http://127.0.0.1:6553/', '0', null, '1', '2016-07-06 16:44:37', '0');
INSERT INTO `xinhu_option` VALUES ('4', '流程分类', '1', 'flowfenlei', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('5', '考勤', '4', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('6', '表单类型', '1', 'flowinputtype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('7', '文本框', '6', null, 'text', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('8', '日期', '6', null, 'date', '1', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('9', '日期时间', '6', null, 'datetime', '2', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('10', '时间', '6', null, 'time', '3', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('11', '隐藏文本框', '6', null, 'hidden', '4', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('12', '选择人员(单选)', '6', null, 'changeuser', '7', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('13', '选择人员(多选)', '6', null, 'changeusercheck', '8', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('14', '自定义', '6', null, 'auto', '17', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('15', '数字', '6', null, 'number', '5', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('16', '文本域', '6', null, 'textarea', '6', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('17', '固定值', '6', null, 'fixed', '11', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('18', '系统选项下拉框', '6', null, 'rockcombo', '12', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('19', '下拉框', '6', null, 'select', '13', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('20', 'html编辑器', '6', null, 'htmlediter', '14', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('21', '选择部门人员', '6', null, 'changedeptusercheck', '10', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('22', '单个复选框', '6', null, 'checkbox', '15', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('23', '多个复选框', '6', null, 'checkboxall', '16', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('24', '选择部门', '6', null, 'changedept', '9', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('25', '行政', '4', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('26', '信息类型', '1', 'gongtype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('27', '通知公告', '26', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('28', '规则制度', '26', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('29', '会议室', '1', 'hyname', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('30', '会客室', '29', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('1', '信呼', '0', 'xinhu', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('32', '任务类型', '1', 'worktype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('33', '任务等级', '1', 'workgrade', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('34', 'bug', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('35', '改进', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('36', '设计', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('37', '低', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('38', '中', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('39', '高', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('40', '紧急', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('41', '任务状态', '1', 'workstate', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('42', '待执行', '41', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('43', '执行中', '41', null, '2', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('44', '已完成', '41', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('45', '中止', '41', null, '3', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('46', '请假类型', '1', 'kqqjkind', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('47', '事假', '46', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('48', '病假', '46', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('49', '年假', '46', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('50', '客户关系', '1', 'crm', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('51', 'CRM', '4', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('52', '客户来源', '50', 'crmlaiyuan', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('53', '销售状态', '50', 'crmstate', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('54', '网上开拓', '52', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('55', '电话开拓', '52', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('56', '跟进中', '53', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('57', '已成交', '53', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('58', '销售来源', '50', 'custsalelai', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('59', '主动来访', '58', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('60', '网上联系', '58', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('61', '电话销售', '58', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('62', '物品产品分类', '0', 'goods', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('63', '互联网', '83', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('64', '信呼', '63', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('65', '办公耗材', '83', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('66', '显示器', '65', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('67', '鼠标', '65', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('68', '主机', '65', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('69', '笔', '65', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('70', '品牌', '62', 'rockbrand', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('71', '单位', '62', 'rockunit', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('72', '台', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('73', '个', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('74', '件', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('75', '箱', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('76', '年', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('77', '月', '71', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('78', '入库类型', '62', 'kutype0', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('79', '出库类型', '62', 'kutype1', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('80', '采购入库', '78', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('81', '领用出库', '79', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('82', '归返入库', '78', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('83', '分类类别', '62', 'goodstype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('84', '销售出库', '79', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('85', '知识信息', '26', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('86', '文件夹目录', null, 'folder1', null, '0', null, '1', '2016-09-08 17:14:18', '1');
INSERT INTO `xinhu_option` VALUES ('87', '技术文档', '86', null, null, '0', null, '1', '2016-08-08 22:07:41', '1');
INSERT INTO `xinhu_option` VALUES ('88', '需求文档', '86', null, null, '0', null, '1', '2016-08-08 22:08:27', '1');
INSERT INTO `xinhu_option` VALUES ('89', '图片', '86', null, null, '0', null, '1', '2016-08-08 22:44:10', '1');
INSERT INTO `xinhu_option` VALUES ('92', '文件夹目录', null, 'folder3', null, '0', null, '1', '2016-08-09 13:59:22', '3');
INSERT INTO `xinhu_option` VALUES ('93', '个人文件', '92', null, null, '0', null, '1', '2016-08-09 13:57:06', '3');
INSERT INTO `xinhu_option` VALUES ('95', 'js文档', '87', null, null, '0', null, '1', '2016-08-09 22:20:23', '1');
INSERT INTO `xinhu_option` VALUES ('94', 'php文档', '87', null, null, '0', null, '1', '2016-08-09 22:20:17', '1');
INSERT INTO `xinhu_option` VALUES ('98', '文件夹目录', null, 'folder4', null, '0', null, '1', '2016-08-12 14:53:28', '4');
INSERT INTO `xinhu_option` VALUES ('99', '公文选项', '1', 'official', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('100', '公文类型', '99', 'officialclass', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('101', '决议', '100', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('102', '决定', '100', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('103', '请示', '100', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('104', '规定', '100', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('105', '公文等级', '99', 'officialgrade', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('106', '普通', '105', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('107', '绝密', '105', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('108', '项目选项', '1', 'project', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('109', '项目类型', '108', 'projecttype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('110', '一般项目', '109', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('111', '重要项目', '109', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('112', '关键项目', '109', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('113', '项目状态', '108', 'projectstate', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('114', '待执行', '113', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('115', '执行中', '113', null, '2', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('116', '已取消', '113', null, '3', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('117', '已完成', '113', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('118', null, null, 'weixin_corpid', 'wx50b5364464b7e29e', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('119', null, null, 'weixin_secret', 'msvoxsaKP7wJmlc4Dn8tD55eKsLgKSF0d3Vysvd5tzSenqb21Hems4e4xmP4Fxla', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('120', null, null, 'weixin_token0', 'Ozzp8fl7AmGxNidnhds_LBCTmW2tkEmG0-cOFdrX87Le9U1BlYdt1mub6JyxH46X', '0', null, '1', '2016-09-09 10:10:21', '1');
INSERT INTO `xinhu_option` VALUES ('121', null, null, 'weixin_token1', 'kgt8ON7yVITDhtdwci0qeTAc0Iio8dvoZrVYr65GFFnrCZsobcO_Vht8suf_U5Q5DOVeRHFjx-OySZmlzmpZsg', '0', null, '1', '2016-08-30 19:51:26', '1');
INSERT INTO `xinhu_option` VALUES ('122', null, null, 'weixin_chatsecret', 'Ku5sFUjZYV15eGbympCfdp-1caam4h9yC5dIROg8lbv7rAOFdHfIVulQi3eOKHB5', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('123', null, null, 'weixin_huitoken', 'xinhuchattoken', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('124', null, null, 'weixin_aeskey', 'kcF6dPm91S2c7UwIc3xzyVY9yTy6mXWLvSVN6DhzB6X', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('125', null, null, 'weixin_chattb', '1', '0', null, '1', '2016-08-17 11:07:23', '1');
INSERT INTO `xinhu_option` VALUES ('126', null, null, 'weixin_token3', 'gOTpqRdTqku3nqZFWRy23sSfZ7NxG4L7Q09GBL4g_XhPaheFKeEBnhxmoVkWVs-6', '0', null, '1', '2016-09-08 23:38:20', '0');
INSERT INTO `xinhu_option` VALUES ('127', null, null, 'systemnum', '2acc93656cd04c13443a360bea425af3', '0', null, '1', '2016-08-25 14:20:43', '1');
INSERT INTO `xinhu_option` VALUES ('128', '文件夹目录', null, 'folder8', null, '0', null, '1', '2016-08-28 18:14:56', '8');
INSERT INTO `xinhu_option` VALUES ('129', null, null, 'sysupg_lastdt', '1472385707', '0', null, '1', '2016-08-28 20:01:47', '0');
INSERT INTO `xinhu_option` VALUES ('130', '财务选项', '1', 'finance', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('131', '付款方式', '130', 'paytype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('132', '现金', '131', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('133', '支付宝', '131', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('134', '微信', '131', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('135', '银行转账', '131', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('136', '报销项目', '130', 'finaitems', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('137', '市内交通费', '136', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('138', '电话费', '136', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('139', '快递费', '136', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('140', '停车费', '136', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('141', '文件夹目录', null, 'folder5', null, '0', null, '1', '2016-09-08 21:13:56', '5');
INSERT INTO `xinhu_option` VALUES ('142', null, null, 'systaskrun', '2016-09-09 10:01:17', '0', null, '1', '2016-09-09 10:01:16', '0');

-- ----------------------------
-- Table structure for `xinhu_project`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_project`;
CREATE TABLE `xinhu_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` smallint(6) DEFAULT '0',
  `type` varchar(20) DEFAULT NULL COMMENT '项目类型',
  `num` varchar(20) DEFAULT NULL COMMENT '编号',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态@0|待执行,1|已完成,2|执行中,3|已取消',
  `title` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '预计结束时间',
  `fuze` varchar(20) DEFAULT NULL COMMENT '负责人',
  `fuzeid` varchar(50) DEFAULT NULL,
  `runuser` varchar(100) DEFAULT NULL COMMENT '执行人员',
  `runuserid` varchar(100) DEFAULT NULL,
  `progress` smallint(6) DEFAULT '0' COMMENT '进度',
  `viewuser` varchar(100) DEFAULT NULL COMMENT '授权查看',
  `viewuserid` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL COMMENT '说明备注',
  `optid` smallint(6) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `optdt` datetime DEFAULT NULL,
  `adddt` datetime DEFAULT NULL COMMENT '添加时间',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_project
-- ----------------------------
INSERT INTO `xinhu_project` VALUES ('1', '0', '一般项目', 'wechat-dev', '1', '信呼微信企业号开发', '2016-08-14 09:56:23', '2016-12-31 23:59:59', '管理员', '1', '开发部', 'd2', '100', null, null, null, '1', '管理员', '2016-09-06 19:41:26', '2016-08-14 09:57:21', '0');
INSERT INTO `xinhu_project` VALUES ('2', '0', '重要项目', null, '2', '信呼开发', '2016-09-08 20:26:14', null, '磐石', '5', '开发部', 'd2', '5', null, null, '哈哈哈哈', '1', '管理员', '2016-09-08 20:26:41', '2016-09-08 20:26:41', '0');

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
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_reads
-- ----------------------------
INSERT INTO `xinhu_reads` VALUES ('1', 'kqinfo', '9', '1', '2016-09-09 10:43:23', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('2', 'goodm', '5', '1', '2016-09-09 10:45:43', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('3', 'project', '1', '1', '2016-09-09 10:51:25', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('4', 'project', '2', '1', '2016-09-09 10:51:27', '127.0.0.1', 'Chrome');

-- ----------------------------
-- Table structure for `xinhu_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_schedule`;
CREATE TABLE `xinhu_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `startdt` datetime DEFAULT NULL,
  `enddt` datetime DEFAULT NULL,
  `uid` smallint(6) DEFAULT NULL COMMENT '用户Id',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `mid` int(11) DEFAULT '0' COMMENT '主Id',
  `ratecont` varchar(500) DEFAULT NULL COMMENT '频率',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `rate` varchar(5) DEFAULT NULL,
  `rateval` varchar(50) DEFAULT NULL,
  `txsj` tinyint(1) DEFAULT '0' COMMENT '是否提醒',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_schedule
-- ----------------------------
INSERT INTO `xinhu_schedule` VALUES ('1', '每月初提醒考勤是否正常', '2016-08-01 08:00:00', null, '1', '2016-08-30 22:39:13', '管理员', '0', null, null, 'm', '1', '1', '1');
INSERT INTO `xinhu_schedule` VALUES ('2', '每周五下班前提交这周报告给主管', '2016-08-01 17:00:00', null, '1', '2016-08-30 22:38:48', '管理员', '0', null, null, 'w', '5', '1', '1');

-- ----------------------------
-- Table structure for `xinhu_sjoin`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_sjoin`;
CREATE TABLE `xinhu_sjoin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `mid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `indate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_sjoin
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_task`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_task`;
CREATE TABLE `xinhu_task` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL COMMENT '运行地址',
  `type` varchar(50) DEFAULT NULL,
  `time` varchar(50) DEFAULT NULL,
  `ratecont` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否启用',
  `state` tinyint(1) DEFAULT '0' COMMENT '最后状态',
  `lastdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `sort` smallint(6) DEFAULT '0',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `lastcont` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_task
-- ----------------------------
INSERT INTO `xinhu_task` VALUES ('1', '任务提醒', 'work,todo', 'h2', '30:20', '每天凌晨1.20', '1', '1', '2016-09-09 10:30:18', null, '0', null, 'success');
INSERT INTO `xinhu_task` VALUES ('2', '数据备份', 'sys,beifen', 'd', '00:20:00', '每天12点', '1', '0', null, null, '0', null, 'success');
INSERT INTO `xinhu_task` VALUES ('3', '系统升级提醒', 'sys,upgtx', 'd', '00:25:00', '每天凌晨00:25', '1', '0', null, null, '0', null, 'success');
INSERT INTO `xinhu_task` VALUES ('4', '5分钟运行1次', 'minute5,run', 'i5', '00', null, '1', '1', '2016-09-09 12:19:58', null, '0', null, 'success');
INSERT INTO `xinhu_task` VALUES ('5', '流程从新匹配', 'flow,pipei', 'd,d', '00:10:00,12:10:00', null, '1', '1', '2016-09-09 12:09:57', null, '0', null, 'success');

-- ----------------------------
-- Table structure for `xinhu_todo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_todo`;
CREATE TABLE `xinhu_todo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL COMMENT '类型',
  `mess` varchar(500) DEFAULT NULL COMMENT '信息内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@0|未读,1|已读',
  `optdt` datetime DEFAULT NULL COMMENT '时间',
  `table` varchar(50) DEFAULT NULL,
  `mid` smallint(6) DEFAULT NULL,
  `readdt` datetime DEFAULT NULL COMMENT '已读时间',
  `tododt` datetime DEFAULT NULL COMMENT '提醒时间',
  `num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_todo
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_userinfo`;
CREATE TABLE `xinhu_userinfo` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `deptname` varchar(30) DEFAULT NULL,
  `ranking` varchar(20) DEFAULT NULL,
  `dkip` varchar(30) DEFAULT NULL,
  `dkmac` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_userinfo
-- ----------------------------
INSERT INTO `xinhu_userinfo` VALUES ('1', '管理员', '开发部', '项目主管', '192.168.1.104', '34:97:f6:9c:c8:e8');
INSERT INTO `xinhu_userinfo` VALUES ('2', '貂蝉', '财务部', '财务总监', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('3', '小乔', '财务部', '出纳', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('4', '大乔', '行政人事部', '人事主管', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('5', '磐石', '管理层', '董事长', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('6', '张飞', '开发部', '程序员', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('7', '赵子龙', '开发部', '高级程序员', null, null);
INSERT INTO `xinhu_userinfo` VALUES ('8', '信呼客服', '开发部', '客服', null, null);

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
  `shate` varchar(200) DEFAULT NULL COMMENT '分享给我的',
  `optdt` datetime DEFAULT NULL,
  `typeid` smallint(6) DEFAULT '0' COMMENT '对应类型',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_word
-- ----------------------------
INSERT INTO `xinhu_word` VALUES ('33', '1', '管理员', '61', null, null, '2016-09-08 17:13:56', '89');
INSERT INTO `xinhu_word` VALUES ('13', '3', '小乔', '36', null, null, '2016-08-09 13:56:49', '0');
INSERT INTO `xinhu_word` VALUES ('30', '1', '管理员', '55', null, null, '2016-08-12 14:19:40', '89');
INSERT INTO `xinhu_word` VALUES ('28', '1', '管理员', '53', null, null, '2016-08-12 14:14:10', '89');
INSERT INTO `xinhu_word` VALUES ('21', '1', '管理员', '45', null, null, '2016-08-10 14:52:30', '89');

-- ----------------------------
-- Table structure for `xinhu_work`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_work`;
CREATE TABLE `xinhu_work` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(30) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `type` varchar(20) DEFAULT NULL COMMENT '任务类型',
  `grade` varchar(10) DEFAULT NULL COMMENT '任务等级',
  `distid` varchar(200) DEFAULT NULL,
  `dist` varchar(200) DEFAULT NULL COMMENT '分配给',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `startdt` datetime DEFAULT NULL COMMENT '开始时间',
  `enddt` datetime DEFAULT NULL COMMENT '结束时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态',
  `txdt` datetime DEFAULT NULL,
  `fen` smallint(6) DEFAULT '0' COMMENT '分值',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('2', null, '设计一个信呼的logo出来哦', '设计', '中', '1', '管理员', '1、要求简单美观。\n2、高大上的，能代表出系统的。\n3、先来几个版本看看。', '2016-06-29 09:15:25', '5', '磐石', null, null, '2', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('3', null, '严重的bug修复吧', 'bug', '紧急', '1', '管理员', '页面漂亮需要改进。数据库上表不合理。', '2016-06-29 09:26:57', '5', '磐石', null, null, '0', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('4', null, '官网设计并给预算', '设计', '高', '6', '张飞', '1、美观大气啊。\n2、财务给奖励预算。\n3、1给礼拜完成哦。', '2016-06-29 11:16:40', '1', '管理员', '2016-06-29 11:14:19', '2016-07-06 11:16:00', '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('5', null, '系统用户更新。', '改进', '中', '8', '信呼客服', '1、用户问题解答。\n2、问题反馈。', '2016-07-06 21:41:08', '8', '信呼客服', '2016-07-06 21:40:16', null, '2', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('6', null, '赶紧弄啊', 'bug', '低', '4', '大乔', null, '2016-07-18 19:49:45', '1', '管理员', '2016-07-18 19:49:19', null, '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('7', null, '漏洞啦，快去改啊。', 'bug', '高', '5', '磐石', '嗯嗯嗯', '2016-07-20 12:59:13', '1', '管理员', '2016-07-20 12:51:17', null, '1', null, '0', '1');

-- ----------------------------
-- Table structure for `xinhu_wx_agent`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_wx_agent`;
CREATE TABLE `xinhu_wx_agent` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '应用名称',
  `agentid` smallint(6) DEFAULT '0' COMMENT '应用Id',
  `sort` smallint(6) DEFAULT '0',
  `square_logo_url` varchar(500) DEFAULT NULL,
  `redirect_domain` varchar(50) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `description` varchar(500) DEFAULT NULL,
  `allow_userinfos` varchar(500) DEFAULT NULL,
  `allow_partys` varchar(500) DEFAULT NULL,
  `allow_tags` varchar(500) DEFAULT NULL,
  `close` tinyint(1) DEFAULT '0' COMMENT '是否被禁用',
  `report_location_flag` tinyint(1) DEFAULT '0' COMMENT '@地理位置上报 0：不上报；1：进入会话上报；2：持续上报',
  `isreportenter` tinyint(1) DEFAULT '0' COMMENT '是否上报用户进入应用事件',
  `isreportuser` tinyint(1) DEFAULT '0' COMMENT '是否接收用户变更通知',
  `home_url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_wx_agent
-- ----------------------------
INSERT INTO `xinhu_wx_agent` VALUES ('1', '办公助手', '0', '0', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM6PwAay1PUiblr2Nhkbxz7IUfziaIg9liam4EJfQqDe9EpRQ/0', 'demo.xh829.com', '1', '信呼办公助手', '{\"user\":[]}', '{\"partyid\":[1]}', '{\"tagid\":[]}', '0', '0', '0', '0', null);
INSERT INTO `xinhu_wx_agent` VALUES ('2', '主页', '1', '0', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7Qdialf2855e1wFxO9fqX2PPu3T6do3UPyT6mqsrBfRWg/0', 'demo.xh829.com', '2', '主页功能', '{\"user\":[]}', '{\"partyid\":[1]}', '{\"tagid\":[]}', '0', '0', '0', '1', null);
INSERT INTO `xinhu_wx_agent` VALUES ('3', '定位打卡', '3', '0', 'http://wx.qlogo.cn/mmhead/Q3auHgzwzM7Cn0iaKhPUlEIWcJY72PlJbqG7mPWf9OOdySgDe2eYiaDQ/0', 'demo.xh829.com', '1', '全体人员打卡定位，外勤打开使用。', '{\"user\":[]}', '{\"partyid\":[1]}', '{\"tagid\":[]}', '0', '1', '0', '1', null);

-- ----------------------------
-- Table structure for `xinhu_wx_chat`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_wx_chat`;
CREATE TABLE `xinhu_wx_chat` (
  `id` int(11) DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `owner` varchar(20) DEFAULT NULL COMMENT '管理员id',
  `userlist` varchar(4000) DEFAULT NULL COMMENT '成员',
  `chatid` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`chatid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_wx_chat
-- ----------------------------
INSERT INTO `xinhu_wx_chat` VALUES ('5', '技术群', 'admin', 'admin|zhaozl|zhangfei', 'chatwx5');
INSERT INTO `xinhu_wx_chat` VALUES ('2', '全体人员', 'admin', 'admin|daqiao|diaochan|lisi|rock|xiaoqiao|xinhu|zhangfei|zhaozl', 'chatwx2');
INSERT INTO `xinhu_wx_chat` VALUES ('14', '高管群', 'admin', 'admin|rock|diaochan', 'chatwx14');

-- ----------------------------
-- Table structure for `xinhu_wx_dept`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_wx_dept`;
CREATE TABLE `xinhu_wx_dept` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `order` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_wx_dept
-- ----------------------------
INSERT INTO `xinhu_wx_dept` VALUES ('1', '信呼开发团队', '0', '0');
INSERT INTO `xinhu_wx_dept` VALUES ('5', '管理层', '1', '0');
INSERT INTO `xinhu_wx_dept` VALUES ('2', '开发部', '1', '1');
INSERT INTO `xinhu_wx_dept` VALUES ('3', '财务部', '1', '2');
INSERT INTO `xinhu_wx_dept` VALUES ('4', '行政人事部', '1', '3');

-- ----------------------------
-- Table structure for `xinhu_wx_user`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_wx_user`;
CREATE TABLE `xinhu_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(30) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `department` varchar(20) DEFAULT NULL,
  `position` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `gender` varchar(5) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `weixinid` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态@1|已关注,2|已冻结,4|未关注',
  `avatar` varchar(300) DEFAULT NULL COMMENT '头像url',
  `enable` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_wx_user
-- ----------------------------
INSERT INTO `xinhu_wx_user` VALUES ('1', 'admin', '管理员', '[2]', '项目主管', '15800000000', '1', 'admin@rockoa.com', 'chenxihu829', '1', 'http://shp.qpic.cn/bizmp/ibfWnHfCtYUibOceWtaib0XAV8sckc46gymkhyXnq3nTI5WadrhevO0qA/', '1', '2016-08-18 17:30:25');
INSERT INTO `xinhu_wx_user` VALUES ('11', 'diaochan', '貂蝉', '[3]', '财务总监', '15800000007', '2', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('4', 'xiaoqiao', '小乔', '[3]', '出纳', '15800000001', '2', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('5', 'daqiao', '大乔', '[4]', '人事主管', '15800000002', '2', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('6', 'rock', '磐石', '[5]', '董事长', '15800000003', '1', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('7', 'zhangfei', '张飞', '[2]', '程序员', '15800000004', '1', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('8', 'zhaozl', '赵子龙', '[2]', '高级程序员', '15800000005', '1', null, null, '4', null, '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('9', 'xinhu', '信呼客服', '[2]', '客服', '15800000006', '1', null, 'rainrock829', '1', 'http://shp.qpic.cn/bizmp/ibfWnHfCtYUibOceWtaib0XAV8sckc46gymMg9Fc1HicAOIibhXnIpU3X0w/', '1', null);
INSERT INTO `xinhu_wx_user` VALUES ('12', 'lisi', '李四', '[2]', '程序员', null, '1', '505581617@qq.com', null, '1', 'http://shp.qpic.cn/bizmp/ibfWnHfCtYU8FH4rb9cTHqm5s5BKGr2HXNClhsQ6CvTW05rTkd8hM1A/', '1', null);
