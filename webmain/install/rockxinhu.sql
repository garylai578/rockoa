/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rockxinhu

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-07-13 15:13:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `xinhu_admin`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_admin`;
CREATE TABLE `xinhu_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL,
  `user` varchar(50) DEFAULT NULL COMMENT '用户名',
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_admin
-- ----------------------------
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '289', '1', '1', '男', '0592-1234567', 'upload/face/1.jpg', '2', '开发部', '5', '磐石', '项目主管', '0', '[1],[2]', '[5]', null, null, '1', '2016-07-01', 'xinhu@rockoa.com', null);
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蝉', 'e10adc3949ba59abbe56e057f20f883e', '37', '1', '0', '女', null, 'upload/face/2.jpg', '3', '财务部', '5', '磐石', '财务总监', '0', '[1],[3]', '[5]', null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '35', '1', '0', '女', null, 'upload/face/3.jpg', '3', '财务部', '2', '貂蝉', '出纳', '0', '[1],[3]', '[5],[2]', null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '13', '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', '5', '磐石', '人事主管', '0', '[1],[4]', '[5]', null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '48', '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理层', null, null, '董事长', '0', '[1],[5]', null, null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '6', '1', '0', '男', null, 'upload/face/6.jpg', '2', '开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '赵子龙', 'e10adc3949ba59abbe56e057f20f883e', '5', '1', '0', '男', null, 'upload/face/7.jpg', '2', '开发部', '1', '管理员', '高级程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('8', null, 'xinhu', '信呼客服', '6846860684f05029abccc09a53cd66f1', '11', '1', '0', '男', null, 'upload/face/8.jpg', '2', '开发部', '1', '管理员', '客服', '200', '[1],[2]', '[5],[1]', null, null, '1', '2016-07-01', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_file
-- ----------------------------
INSERT INTO `xinhu_file` VALUES ('1', '1', 'add1.png', null, 'png', '2571', '2.51 KB', 'upload/2016-06/17_1924406898.png', null, '1', null, '2016-06-17 19:24:40', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('2', '1', 'add1.png', null, 'png', '2571', '2.51 KB', 'upload/2016-06/17_1927311566.png', null, '1', null, '2016-06-17 19:27:32', '192.168.1.103', 'Chrome', 'daily', '7', '8');
INSERT INTO `xinhu_file` VALUES ('3', '1', 'cam2.png', null, 'png', '4013', '3.92 KB', 'upload/2016-06/17_2013576955.png', 'upload/2016-06/17_2013576955.png', '1', null, '2016-06-17 20:14:00', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('4', '1', 'album1.png', null, 'png', '3589', '3.50 KB', 'upload/2016-06/17_2013587876.png', 'upload/2016-06/17_2013587876.png', '1', null, '2016-06-17 20:14:00', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('5', '1', 'cam1.png', null, 'png', '4044', '3.95 KB', 'upload/2016-06/17_2014589154.png', 'upload/2016-06/17_2014589154.png', '1', '管理员', '2016-06-17 20:14:59', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('6', '1', 'cam2.png', null, 'png', '4013', '3.92 KB', 'upload/2016-06/17_2014589413.png', 'upload/2016-06/17_2014589413.png', '1', '管理员', '2016-06-17 20:14:59', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('7', '1', 'face1.png', null, 'png', '3037', '2.97 KB', 'upload/2016-06/17_2014584921.png', 'upload/2016-06/17_2014584921.png', '1', '管理员', '2016-06-17 20:14:59', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('8', '1', 'emotion.json', null, 'json', '5537', '5.41 KB', 'upload/2016-06/18_10212894.uptemp', 'upload/2016-06/18_10212894.uptemp', '2', '貂蝉', '2016-06-18 10:21:28', '192.168.1.103', 'Chrome', 'im_mess', '43', '1');
INSERT INTO `xinhu_file` VALUES ('9', '1', '截图.png', null, 'png', '95945', '93.70 KB', 'upload/2016-06/20_14061655.png', 'upload/2016-06/20_14061655_s.png', '2', '貂蝉', '2016-06-20 14:06:15', '127.0.0.1', 'Chrome', 'im_mess', '49', '0');
INSERT INTO `xinhu_file` VALUES ('10', '1', 'phprun.bat', null, 'bat', '79', '79.00 Byte', 'upload/2016-06/20_16143521.uptemp', 'upload/2016-06/20_16143521.uptemp', '2', '貂蝉', '2016-06-20 16:14:34', '127.0.0.1', 'Chrome', 'im_mess', '50', '1');
INSERT INTO `xinhu_file` VALUES ('11', '1', 'php-5.4.14.rar', null, 'rar', '12566850', '11.98 MB', 'upload/2016-06/20_17593323.rar', 'upload/2016-06/20_17593323.rar', '2', '貂蝉', '2016-06-20 17:59:32', '127.0.0.1', 'Chrome', 'im_mess', '51', '0');
INSERT INTO `xinhu_file` VALUES ('12', '1', 'php-5.4.14.rar', null, 'rar', '12566850', '11.98 MB', 'upload/2016-06/22_11475963.rar', 'upload/2016-06/22_11475963.rar', '2', '貂蝉', '2016-06-22 11:47:58', '192.168.1.126', 'Chrome', 'im_mess', '52', '0');
INSERT INTO `xinhu_file` VALUES ('22', '1', 'p-9fd23117.jpg', null, 'jpg', '1907', '1.86 KB', 'upload/2016-06/24_13334877.jpg', 'upload/2016-06/24_13334877.jpg', '1', '管理员', '2016-06-24 13:33:47', '192.168.1.176', 'Chrome', 'im_mess', '64', '0');
INSERT INTO `xinhu_file` VALUES ('24', '1', 'ad3.jpg', null, 'jpg', '46010', '44.93 KB', 'upload/2016-06/24_19332791.jpg', 'upload/2016-06/24_19332791_s.jpg', '1', '管理员', '2016-06-24 19:33:27', '192.168.1.103', 'Chrome', 'im_mess', '65', '0');
INSERT INTO `xinhu_file` VALUES ('25', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-06/24_19465911.png', 'upload/2016-06/24_19465911_s.png', '1', '管理员', '2016-06-24 19:46:59', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('26', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-06/24_19480943.png', 'upload/2016-06/24_19480943_s.png', '1', '管理员', '2016-06-24 19:48:09', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('27', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-06/24_19492636.png', 'upload/2016-06/24_19492636_s.png', '1', '管理员', '2016-06-24 19:49:26', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('28', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-06/24_19501731.png', 'upload/2016-06/24_19501731_s.png', '1', '管理员', '2016-06-24 19:50:17', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('29', '1', '50.png', null, 'png', '11680', '11.41 KB', 'upload/2016-06/24_19513422.png', 'upload/2016-06/24_19513422_s.png', '1', '管理员', '2016-06-24 19:51:34', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('30', '1', 'demo4.png', null, 'png', '25737', '25.13 KB', 'upload/2016-06/24_19525145.png', 'upload/2016-06/24_19525145_s.png', '1', '管理员', '2016-06-24 19:52:51', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('31', '1', 'gaoxingneng.png', null, 'png', '12355', '12.07 KB', 'upload/2016-06/24_19532739.png', 'upload/2016-06/24_19532739_s.png', '1', '管理员', '2016-06-24 19:53:27', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('41', '1', 'daiban.png', null, 'png', '3989', '3.90 KB', 'upload/2016-06/24_2032175244.png', 'upload/2016-06/24_2032175244.png', '1', '管理员', '2016-06-24 20:32:18', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('42', '1', 'daiban.png', null, 'png', '3989', '3.90 KB', 'upload/2016-06/24_2033022679.png', 'upload/2016-06/24_2033022679.png', '1', '管理员', '2016-06-24 20:33:03', '192.168.1.103', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('44', '1', 'daiban.png', null, 'png', '3989', '3.90 KB', 'upload/2016-06/24_20350459.png', 'upload/2016-06/24_20350459.png', '1', '管理员', '2016-06-24 20:35:04', '192.168.1.103', 'Chrome', 'daily', '11', '1');
INSERT INTO `xinhu_file` VALUES ('45', '1', 'install.png', null, 'png', '26843', '26.21 KB', 'upload/2016-06/24_21052436.png', 'upload/2016-06/24_21052436_s.png', '1', '管理员', '2016-06-24 21:05:24', '127.0.0.1', 'Firefox', 'im_mess', '90', '0');
INSERT INTO `xinhu_file` VALUES ('47', '1', '截图.png', null, 'png', '19748', '19.29 KB', 'upload/2016-06/24_22292262.png', 'upload/2016-06/24_22292262_s.png', '3', '小乔', '2016-06-24 22:29:22', '192.168.1.103', 'Chrome', 'im_mess', '112', '0');
INSERT INTO `xinhu_file` VALUES ('50', '1', 'wx.png', null, 'png', '57808', '56.45 KB', 'upload/2016-06/27_09292533.png', 'upload/2016-06/27_09292533_s.png', '1', '管理员', '2016-06-27 09:29:23', '192.168.1.126', 'Chrome', null, '0', '0');
INSERT INTO `xinhu_file` VALUES ('68', '1', 'daiban.png', null, 'png', '3989', '3.90 KB', 'upload/2016-07/02_19011868.png', 'upload/2016-07/02_19011868.png', '1', '管理员', '2016-07-02 19:01:18', '192.168.1.103', 'Chrome', 'im_mess', '116', '0');

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
  `allcheckid` varchar(200) DEFAULT NULL COMMENT '@所有审核人',
  `isdel` tinyint(4) DEFAULT '0' COMMENT '是否删除',
  `nstatus` tinyint(1) DEFAULT '0',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `nstatustext` varchar(100) DEFAULT NULL COMMENT '当前状态',
  `status` tinyint(1) DEFAULT '0',
  `nowcheckid` varchar(100) DEFAULT NULL COMMENT '当前审核人',
  `nowcheckname` varchar(100) DEFAULT NULL,
  `checksm` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`),
  KEY `sericnum` (`sericnum`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_bill
-- ----------------------------
INSERT INTO `xinhu_flow_bill` VALUES ('1', 'KA-20160707-0001', 'kqinfo', '1', '5', '请假条', '1', '2016-07-09 12:55:30', '1', '管理员', '4,5', '0', '1', '2016-07-09', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('2', 'KA-20160710-0001', 'kqinfo', '2', '5', '请假条', '4', '2016-07-10 13:36:09', '4', '大乔', '4,5', '0', '1', '2016-07-10', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('3', 'KA-20160710-0002', 'kqinfo', '3', '5', '请假条', '4', '2016-07-10 16:39:15', '4', '大乔', '4,5', '0', '1', '2016-07-10', '大乔通过', '1', null, null, '搞定');
INSERT INTO `xinhu_flow_bill` VALUES ('6', 'KB-20160712-0001', 'kqinfo', '6', '6', '加班单', '1', '2016-07-12 20:41:53', '1', '管理员', '5', '0', '1', '2016-07-12', '磐石通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('5', 'KA-20160711-0001', 'kqinfo', '5', '5', '请假条', '5', '2016-07-11 22:00:16', '5', '磐石', '4,5', '0', '0', '2016-07-11', '待处理', '0', null, null, null);

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
  `status` tinyint(4) DEFAULT '1',
  `courseact` varchar(50) DEFAULT NULL COMMENT '审核动作',
  `checkshu` tinyint(2) DEFAULT '1' COMMENT '至少几人审核 ,0全部',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_course
-- ----------------------------
INSERT INTO `xinhu_flow_course` VALUES ('1', '5', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 21:05:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('2', '5', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-07-07 22:14:24', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('3', '6', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 22:25:29', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('4', '5', '总经理审核', null, 'user', '5', '磐石', '0', 'totals>24', '超3天审核', '2016-07-07 22:17:50', '1', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_flow_element` VALUES ('10', '2', '参会人', 'joinname', 'changedeptusercheck', '0', null, '0', 'joinid', '1', '1', null, '0', '0', null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_log
-- ----------------------------
INSERT INTO `xinhu_flow_log` VALUES ('1', 'kqinfo', '1', '2', '不通过', '上级审核', '1', '2016-07-10 12:54:24', null, '127.0.0.1', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('2', 'kqinfo', '1', '1', '通过', '上级审核', '1', '2016-07-10 13:22:37', '好的', '127.0.0.1', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('3', 'kqinfo', '1', '2', '不通过', '人事审核', '2', '2016-07-10 13:25:12', '不能过啊', '127.0.0.1', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('4', 'kqinfo', '1', '1', '通过', '人事审核', '2', '2016-07-10 13:25:22', '好吧，过了', '127.0.0.1', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('5', 'kqinfo', '2', '1', null, '提交', '0', '2016-07-10 13:36:09', null, '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('6', 'kqinfo', '2', '2', '不通过', '上级审核', '1', '2016-07-10 13:50:56', '嗯', '127.0.0.1', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('7', 'kqinfo', '2', '1', '通过', '上级审核', '1', '2016-07-10 13:51:17', null, '127.0.0.1', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('8', 'kqinfo', '2', '1', '通过', '人事审核', '2', '2016-07-10 13:51:35', null, '127.0.0.1', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('9', 'kqinfo', '3', '1', null, '提交', '0', '2016-07-10 16:27:34', null, '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('10', 'kqinfo', '3', '2', '不通过', '上级审核', '1', '2016-07-10 16:29:57', '不能过啊！', '192.168.1.103', 'Firefox', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('11', 'kqinfo', '3', '1', null, '编辑', '0', '2016-07-10 16:32:21', null, '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('12', 'kqinfo', '3', '1', null, '编辑', '0', '2016-07-10 16:36:37', null, '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('13', 'kqinfo', '3', '1', '通过', '上级审核', '1', '2016-07-10 16:37:39', null, '192.168.1.103', 'Firefox', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('14', 'kqinfo', '3', '2', '不通过', '人事审核', '2', '2016-07-10 16:38:51', '哈哈哈', '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('15', 'kqinfo', '3', '1', null, '编辑', '0', '2016-07-10 16:39:15', null, '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('16', 'kqinfo', '3', '2', '不通过', '人事审核', '2', '2016-07-11 20:09:27', '不能过啊', '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('17', 'kqinfo', '3', '1', '通过', '人事审核', '2', '2016-07-11 20:34:08', '搞定', '192.168.1.103', 'Chrome', '大乔', '4', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('31', 'kqinfo', '6', '1', '通过', '上级审核', '3', '2016-07-12 20:42:04', null, '192.168.1.103', 'Chrome', '磐石', '5', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('30', 'kqinfo', '6', '1', null, '编辑', '0', '2016-07-12 20:41:53', null, '127.0.0.1', 'Chrome', '管理员', '1', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('29', 'kqinfo', '6', '2', '不通过', '上级审核', '3', '2016-07-12 20:41:35', '额', '192.168.1.103', 'Chrome', '磐石', '5', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('28', 'kqinfo', '6', '1', null, '提交', '0', '2016-07-12 20:27:18', null, '127.0.0.1', 'Chrome', '管理员', '1', '6', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('27', 'kqinfo', '5', '1', null, '编辑', '0', '2016-07-11 22:00:16', null, '192.168.1.103', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('26', 'kqinfo', '5', '1', null, '编辑', '0', '2016-07-11 21:57:29', null, '192.168.1.103', 'Chrome', '磐石', '5', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('25', 'kqinfo', '5', '1', null, '提交', '0', '2016-07-11 21:50:43', null, '192.168.1.103', 'Chrome', '磐石', '5', '5', null, '1');

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
  `type` varchar(20) DEFAULT NULL COMMENT '分类',
  `pctx` tinyint(1) DEFAULT '0' COMMENT 'pc端提醒',
  `mctx` tinyint(1) DEFAULT '0' COMMENT '移动端提醒',
  `sericnum` varchar(50) DEFAULT NULL COMMENT '编号规则',
  `isflow` tinyint(1) DEFAULT '1' COMMENT '是否有流程',
  `receid` varchar(255) DEFAULT NULL,
  `recename` varchar(255) DEFAULT NULL COMMENT '针对对象',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`,`num`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '0', 'infor', null, '[{typename}]{title}', '行政', '1', '1', 'XA-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:07', '1');
INSERT INTO `xinhu_flow_set` VALUES ('2', '会议', 'meet', '0', 'meet', null, '[{hyname}]{title},{startdt}→{enddt}', '行政', '1', '1', 'XB-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:21:01', '1');
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日报', 'daily', '0', 'daily', null, '[{optname}]{content}', '行政', '1', '1', 'XC-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:27', '1');
INSERT INTO `xinhu_flow_set` VALUES ('4', '任务', 'work', '0', 'work', null, '[{type}]{title},分配给:{dist}', '工作', '1', '1', 'WO-Ymd-', '0', 'all', '全体人员', '2016-06-28 21:42:47', '1');
INSERT INTO `xinhu_flow_set` VALUES ('5', '请假条', 'leave', '10', 'kqinfo', 'kind=[F]请假[F]', '[{qjkind}]{stime}→{stime}共{totals}小时,{explain}', '考勤', '1', '1', 'KA-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:13:58', '0');
INSERT INTO `xinhu_flow_set` VALUES ('6', '加班单', 'jiaban', '11', 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小时,{explain}', '考勤', '1', '1', 'KB-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:14:08', '0');

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
  `width` smallint(6) DEFAULT '0',
  `height` smallint(6) DEFAULT '0',
  `explain` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `num` (`num`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_group
-- ----------------------------
INSERT INTO `xinhu_im_group` VALUES ('1', '信呼团队', '2', '0', null, null, null, 'images/xinhu.png', 'xinhu', null, null, 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('2', '全体人员', '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('3', '通知公告', '2', '0', null, null, null, 'images/gong.png', 'gong', '', '', 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('4', '会议', '2', '0', null, null, null, 'images/meet.png', 'meet', '', '', 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('5', '技术群', '0', '0', '1', null, null, null, null, null, null, null, '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('7', '工作日报', '2', '0', null, null, '2015-06-25 16:03:34', 'images/daily.png', 'daily', null, null, 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('12', '任务', '2', '8', '1', '管理员', '2015-09-10 13:38:07', 'images/work.png', 'work', null, null, 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('13', '万年历', '2', '10', null, null, null, 'images/calendar.png', 'calendar', null, null, 'buin', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('14', '呵呵', '1', '0', '1', '管理员', '2016-06-30 21:29:52', null, null, null, null, null, '1', '0', '0', '嗯嗯');
INSERT INTO `xinhu_im_group` VALUES ('15', '流程申请', '2', '0', null, null, null, 'images/flow.png', 'flow', null, null, 'auto', '1', '0', '0', null);
INSERT INTO `xinhu_im_group` VALUES ('16', '流程待办', '2', '0', null, null, null, 'images/daiban.png', 'daiban', null, null, 'auto', '1', '0', '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('28', 'user', '1', '2', '1', '2016-07-03 15:34:53', 'MjE:', '2');
INSERT INTO `xinhu_im_history` VALUES ('4', 'group', '2', '2', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('5', 'group', '2', '5', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '0');
INSERT INTO `xinhu_im_history` VALUES ('6', 'group', '2', '6', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '10');
INSERT INTO `xinhu_im_history` VALUES ('7', 'group', '2', '7', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '24');
INSERT INTO `xinhu_im_history` VALUES ('8', 'group', '2', '3', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('9', 'group', '2', '4', '8', '2016-07-06 16:35:50', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '0');
INSERT INTO `xinhu_im_history` VALUES ('10', 'group', '5', '7', '1', '2016-06-24 12:58:37', 'W!WPkeWRhl1b5bC05bCsXVvlj5HmgJJd', '6');
INSERT INTO `xinhu_im_history` VALUES ('12', 'group', '5', '6', '1', '2016-06-24 12:58:37', 'W!WPkeWRhl1b5bC05bCsXVvlj5HmgJJd', '0');
INSERT INTO `xinhu_im_history` VALUES ('16', 'user', '1', '6', '1', '2016-06-22 15:18:57', 'W!Wkp!WTrV0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('18', 'user', '1', '7', '1', '2016-06-22 15:17:50', 'W!iJsl0:', '2');
INSERT INTO `xinhu_im_history` VALUES ('20', 'user', '1', '3', '1', '2016-07-02 19:19:54', '5ZOI5ZOI', '0');
INSERT INTO `xinhu_im_history` VALUES ('61', 'user', '3', '4', '4', '2016-07-06 16:39:00', '5bCP5LmU5aa55aa5', '0');
INSERT INTO `xinhu_im_history` VALUES ('38', 'user', '4', '3', '4', '2016-07-06 16:39:00', '5bCP5LmU5aa55aa5', '1');
INSERT INTO `xinhu_im_history` VALUES ('68', 'user', '1', '5', '1', '2016-07-13 14:56:18', '5ZOI', '1');
INSERT INTO `xinhu_im_history` VALUES ('45', 'user', '2', '3', '3', '2016-07-02 19:46:29', 'MTI:', '0');
INSERT INTO `xinhu_im_history` VALUES ('44', 'user', '3', '2', '3', '2016-07-02 19:46:29', 'MTI:', '0');
INSERT INTO `xinhu_im_history` VALUES ('52', 'user', '8', '6', '8', '2016-07-06 16:36:22', '5qyi6L!O5L2.55So5L!h5ZG8', '1');
INSERT INTO `xinhu_im_history` VALUES ('54', 'user', '8', '7', '8', '2016-07-06 16:36:25', '5qyi6L!O5L2.55So5L!h5ZG8', '1');
INSERT INTO `xinhu_im_history` VALUES ('56', 'user', '8', '5', '8', '2016-07-06 16:36:32', '5qyi6L!O5L2.55So5L!h5ZG8', '0');
INSERT INTO `xinhu_im_history` VALUES ('58', 'user', '8', '2', '8', '2016-07-06 16:36:37', '5qyi6L!O5L2.55So5L!h5ZG8', '1');
INSERT INTO `xinhu_im_history` VALUES ('60', 'user', '8', '4', '8', '2016-07-06 16:36:41', '5qyi6L!O5L2.55So5L!h5ZG8', '0');
INSERT INTO `xinhu_im_history` VALUES ('63', 'user', '8', '3', '8', '2016-07-06 16:39:54', '5qyi6L!O5L2.55So5L!h5ZG8', '1');
INSERT INTO `xinhu_im_history` VALUES ('66', 'user', '4', '4', '4', '2016-07-11 19:19:49', '5L2g5aW95ZWK', '0');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_menu
-- ----------------------------
INSERT INTO `xinhu_im_menu` VALUES ('1', '13', '0', '上月', '0', '0', 'prevmonth', null);
INSERT INTO `xinhu_im_menu` VALUES ('2', '13', '0', '当月', '0', '0', 'nowmonth', null);
INSERT INTO `xinhu_im_menu` VALUES ('3', '13', '0', '下月', '0', '0', 'nextmonth', null);
INSERT INTO `xinhu_im_menu` VALUES ('4', '3', '0', '全部信息', '0', '0', 'all', null);
INSERT INTO `xinhu_im_menu` VALUES ('5', '3', '0', '未读信息', '0', '0', 'wexx', 'weidu');
INSERT INTO `xinhu_im_menu` VALUES ('6', '12', '0', '我的任务', '0', '0', null, 'myrw');
INSERT INTO `xinhu_im_menu` VALUES ('7', '12', '0', '下属任务', '0', '0', 'xxrw', null);
INSERT INTO `xinhu_im_menu` VALUES ('8', '12', '0', '＋创建任务', '0', '1', 'add', null);
INSERT INTO `xinhu_im_menu` VALUES ('9', '3', '0', '＋发布信息', '0', '1', 'add', null);
INSERT INTO `xinhu_im_menu` VALUES ('10', '4', '0', '今日会议', '0', '0', 'today', 'today');
INSERT INTO `xinhu_im_menu` VALUES ('11', '4', '0', '本周会议', '0', '0', 'week', null);
INSERT INTO `xinhu_im_menu` VALUES ('12', '4', '0', '＋新增会议', '0', '1', 'add', null);
INSERT INTO `xinhu_im_menu` VALUES ('13', '7', '0', '我的日报', '0', '0', 'my', null);
INSERT INTO `xinhu_im_menu` VALUES ('14', '7', '0', '下属日报', '0', '0', 'under', 'under');
INSERT INTO `xinhu_im_menu` VALUES ('15', '7', '0', '＋写日报', '0', '1', 'add', null);
INSERT INTO `xinhu_im_menu` VALUES ('16', '7', '14', '全部', '0', '0', 'undall', null);
INSERT INTO `xinhu_im_menu` VALUES ('17', '7', '14', '未读', '1', '0', 'undwd', null);
INSERT INTO `xinhu_im_menu` VALUES ('18', '1', '0', '最新信息', '0', '0', 'new', null);
INSERT INTO `xinhu_im_menu` VALUES ('19', '1', '0', '＋建议反馈', '1', '1', 'http://xinhu.pw/fankui.html', null);
INSERT INTO `xinhu_im_menu` VALUES ('22', '12', '6', '我创建的', '2', '0', 'wcj', null);
INSERT INTO `xinhu_im_menu` VALUES ('20', '12', '6', '未完成', '0', '0', 'wwc', null);
INSERT INTO `xinhu_im_menu` VALUES ('21', '12', '6', '已完成', '1', '0', 'ywc', null);
INSERT INTO `xinhu_im_menu` VALUES ('23', '15', '0', '流程申请', '3', '0', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('24', '15', '23', '请假条', '0', '1', 'add_leave', null);
INSERT INTO `xinhu_im_menu` VALUES ('25', '15', '23', '加班单', '0', '1', 'add_jiaban', null);
INSERT INTO `xinhu_im_menu` VALUES ('26', '15', '0', '我的申请', '0', '0', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('27', '15', '0', '处理未通过', '0', '0', 'wtg', 'mywtg');
INSERT INTO `xinhu_im_menu` VALUES ('28', '15', '26', '我申请的', '0', '0', 'apply', null);
INSERT INTO `xinhu_im_menu` VALUES ('29', '15', '26', '未通过', '0', '0', 'wtg', null);
INSERT INTO `xinhu_im_menu` VALUES ('30', '15', '26', '已完成', '0', '0', 'ywc', null);
INSERT INTO `xinhu_im_menu` VALUES ('31', '16', '0', '所有待办', '0', '0', 'daib', 'daiban');
INSERT INTO `xinhu_im_menu` VALUES ('32', '16', '0', '单据查看', '0', '0', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('34', '16', '32', '直属下级申请', '1', '0', 'myxia', null);
INSERT INTO `xinhu_im_menu` VALUES ('33', '16', '32', '经我处理', '0', '0', 'jwcl', null);

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
  PRIMARY KEY (`id`),
  KEY `optdt` (`optdt`,`receid`)
) ENGINE=MyISAM AUTO_INCREMENT=178 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_mess
-- ----------------------------
INSERT INTO `xinhu_im_mess` VALUES ('1', '2016-06-14 10:22:57', '1', '5om!5oiR5ZCX77yf576O5aWz77yf', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('2', '2016-06-14 10:25:04', '1', '5Zyo5ZCX77yf', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('3', '2016-06-14 10:25:31', '1', '5Zyo5ZWK77yf5ZKL5ZWm', '2', '1', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('4', '2016-06-14 10:25:55', '1', 'QOWFqOS9k!S6uuWRmA::', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('5', '2016-06-14 10:26:14', '1', 'W!WPkeWRhl3lpb3lkJc:', '2', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('6', '2016-06-14 16:56:38', '1', 'W!WbvueJhyAzODkuOTIgS0Jd', '1', '2', '1', 'user', null, '35');
INSERT INTO `xinhu_im_mess` VALUES ('7', '2016-06-14 16:57:03', '1', '5Li65L2V5ZaC5ZaC5ZaC', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('8', '0000-00-00 00:00:00', '1', '5Li65L2V5ZaC5ZaC5ZaC', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('9', '2016-06-14 17:06:47', '1', '6aKd5Zev5Zev6aKd', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('10', '2016-06-14 22:19:47', '1', 'MTI:', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('11', '2016-06-14 22:19:50', '1', 'MTI:', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('177', '2016-07-13 14:56:18', '0', '5ZOI', '1', '5', '1,5', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('13', '2016-06-14 22:19:57', '1', 'MTI:', '1', '6', '1,6', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('14', '2016-06-14 22:19:59', '0', 'MTI:', '1', '7', '1,7', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('15', '2016-06-14 22:20:03', '1', 'MjE:', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('16', '2016-06-14 23:12:01', '1', '5om!5L2g5ZWK', '2', '1', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('17', '2016-06-15 11:13:52', '1', 'MTI:', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('157', '2016-07-03 12:20:14', '0', 'MTI:', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('156', '2016-07-03 11:53:55', '1', 'dw::', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('155', '2016-07-03 11:52:55', '1', 'W!W3puWTvOWTvF0:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('22', '2016-06-15 19:07:11', '1', '5Zyo5bmy5Zib5ZGi77yf', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('158', '2016-07-03 15:34:53', '0', 'MjE:', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('159', '2016-07-03 15:34:55', '1', 'MTI:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('25', '2016-06-17 14:53:22', '1', 'W!WPkeWRhl0:', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('26', '2016-06-17 14:54:05', '1', 'aGFoYWhhaGFoIA::', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('27', '2016-06-17 14:54:05', '1', 'aGFoYWhhaGFoIA::', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('28', '2016-06-17 14:55:26', '1', '5oCO6IO977yf', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('29', '2016-06-17 14:56:08', '1', 'W!WwtOWwrF0:', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('30', '2016-06-17 14:55:26', '1', '5oCO6IO977yf', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('31', '2016-06-17 15:00:18', '1', 'MTIyMTEyMjE:', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('32', '2016-06-17 15:01:22', '1', 'W!W!l!aEj10:', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('33', '2016-06-17 15:02:16', '1', '5ZOI5ZOI5ZOI5ZOI', '5', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('34', '2016-06-17 15:36:56', '1', 'MTIyMQ::', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('35', '2016-06-17 15:37:26', '1', '5ZG15ZG15ZG1', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('36', '2016-06-17 16:36:06', '1', 'W!WRsueJmV0:', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('37', '2016-06-17 17:10:58', '1', '5Lq65ZGi', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('38', '2016-06-17 17:27:48', '1', 'W!WPkeWRhl0:', '7', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('39', '2016-06-18 09:52:38', '1', '6Zeu', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('40', '2016-06-18 09:52:50', '1', '6Zeu', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('41', '2016-06-18 09:53:27', '1', '5aSn5a625aW95ZWK', '2', '2', '1,2,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('42', '2016-06-18 10:12:42', '1', 'MTIxMg::', '2', '1', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('43', '2016-06-18 10:21:28', '1', 'W2Vtb3Rpb24uanNvbiA1LjQxIEtCXQ::', '2', '2', '1,6,7,3,4', 'group', null, '8');
INSERT INTO `xinhu_im_mess` VALUES ('44', '2016-06-18 10:23:50', '1', '5Zu!54mH5ZGi', '2', '2', '2,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('45', '2016-06-20 14:03:51', '1', '5Zyo5ZCX77yf', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('46', '2016-06-20 14:03:59', '1', '5Zyo5ZWK5ZWK77yf', '2', '1', '2,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('47', '2016-06-20 14:04:09', '1', '5pyJ5ZWl5LqL5ZCX77yf', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('48', '2016-06-20 14:05:48', '1', '5ZOI5ZOI5ZOI5ZOI', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('49', '2016-06-20 14:06:13', '1', 'W!WbvueJhyA5My43MCBLQl0:', '2', '1', '2', 'user', null, '9');
INSERT INTO `xinhu_im_mess` VALUES ('50', '2016-06-20 16:14:33', '1', 'W3BocHJ1bi5iYXQgNzkuMDAgQnl0ZV0:', '2', '2', '1,2,5,6,7,3,4', 'group', null, '10');
INSERT INTO `xinhu_im_mess` VALUES ('51', '2016-06-20 17:59:31', '1', 'W3BocC01LjQuMTQucmFyIDExLjk4IE1CXQ::', '2', '2', '1,2,5,6,7,3,4', 'group', null, '11');
INSERT INTO `xinhu_im_mess` VALUES ('52', '2016-06-22 11:47:57', '1', 'W3BocC01LjQuMTQucmFyIDExLjk4IE1CXQ::', '2', '2', '1,2,5,6,7,3,4', 'group', null, '12');
INSERT INTO `xinhu_im_mess` VALUES ('54', '2016-06-22 15:17:50', '0', 'W!iJsl0:', '1', '7', '1,7', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('55', '2016-06-22 15:18:14', '1', '6Z2W', '1', '4', '1,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('56', '2016-06-22 15:18:24', '1', 'W!WwtOWwrF0:', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('57', '2016-06-22 15:18:36', '1', 'W!WPkeaAkl0:', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('58', '2016-06-22 15:18:57', '1', 'W!Wkp!WTrV0:', '1', '6', '1,6', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('59', '2016-06-24 12:49:02', '1', '5Zev5Zev', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('60', '2016-06-24 12:49:36', '1', '5pS554mI', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('61', '2016-06-24 12:50:00', '1', 'W!WPkeaAkl0:', '1', '5', '7,6', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('62', '2016-06-24 12:50:07', '1', '6L!Y', '1', '5', '7,6,1', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('63', '2016-06-24 12:58:37', '1', 'W!WPkeWRhl1b5bC05bCsXVvlj5HmgJJd', '1', '5', '7,6,1', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('64', '2016-06-24 13:33:51', '1', 'W!WbvueJhywxLjg2IEtCXQ::', '1', '2', '2', 'user', null, '22');
INSERT INTO `xinhu_im_mess` VALUES ('65', '2016-06-24 19:33:27', '1', 'W!WbvueJhyA0NC45MyBLQl0:', '1', '2', '1,2', 'user', null, '24');
INSERT INTO `xinhu_im_mess` VALUES ('66', '2016-06-24 20:01:34', '1', '5aW95aSa5L!h5oGv5ZWK', '3', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('67', '2016-06-24 20:08:23', '1', '5ZOI5ZOI5ZOI5ZOI5ZOI', '4', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('68', '2016-06-24 20:08:59', '1', '5aSn5a625aW9', '4', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('69', '2016-06-24 20:09:17', '1', '5aW95aSa576O5aWz5ZWK77yM5ZOI5ZOI', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('70', '2016-06-24 20:41:49', '1', '5Zyo5ZCX77yf566h55CG5ZGY', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('71', '2016-06-24 20:42:01', '1', '5Zyo5ZWK77yf5bmy5Zib5ZWK', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('72', '2016-06-24 20:42:12', '1', '5ZOI5ZOI5ZOI', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('73', '2016-06-24 20:45:49', '1', '6K!06K!d5ZWK77yM5ZOI5ZOI5ZWK', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('74', '2016-06-24 20:58:39', '1', '5Zyo5L!65Lus77yf', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('75', '2016-06-24 20:59:34', '1', '5ZOI5ZOI5ZOI5ZOI5ZOI', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('76', '2016-06-24 20:59:44', '1', '5ZOI5ZOI5ZOI', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('77', '2016-06-24 21:00:43', '1', 'MTIxMjEyMjE:', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('78', '2016-06-24 21:00:57', '1', '5ZOI5ZOI5ZOI', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('79', '2016-06-24 21:01:05', '1', 'MTIyMTIx', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('80', '2016-06-24 21:01:14', '1', 'MTIxMjIx', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('81', '2016-06-24 21:01:17', '1', 'MTIxMjIxMjE:', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('82', '2016-06-24 21:01:20', '1', 'MTIyMTEy', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('83', '2016-06-24 21:01:37', '1', '6K!3', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('84', '2016-06-24 21:03:12', '1', '5L2g5aW9', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('85', '2016-06-24 21:03:16', '1', 'MjMyMzI:', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('86', '2016-06-24 21:03:23', '1', 'MTIyMQ::', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('87', '2016-06-24 21:03:26', '1', 'MTIyMTEy', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('88', '2016-06-24 21:03:29', '1', 'MTIxMjIx', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('89', '2016-06-24 21:04:42', '1', 'W!S6suS6sl0:', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('90', '2016-06-24 21:05:24', '1', 'W!WbvueJhyAyNi4yMSBLQl0:', '1', '3', '1,3', 'user', null, '45');
INSERT INTO `xinhu_im_mess` VALUES ('91', '2016-06-24 21:08:00', '1', 'aGFoYWhhIA::', '4', '2', '1,2,5,6,7,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('92', '2016-06-24 21:08:17', '1', '5Zyo5ZCX77yf', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('93', '2016-06-24 21:19:44', '1', '5ZyoaWHvvJ8:', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('94', '2016-06-24 21:19:50', '1', '5ZG15ZG1', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('95', '2016-06-24 21:20:10', '1', 'MTI:', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('96', '2016-06-24 21:20:29', '1', 'MTIxMjEy', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('97', '2016-06-24 21:24:19', '1', 'MTIyMTI:', '4', '3', '4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('98', '2016-06-24 21:24:24', '1', '5ZOI5ZOI5ZOI5ZOI', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('99', '2016-06-24 21:24:36', '1', '5Zev5Zev6aKd', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('100', '2016-06-24 21:24:41', '1', '5Zue5ZGz5Zue5ZGz', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('101', '2016-06-24 21:24:46', '1', '5Y2D5LiH5Y2D5LiH', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('102', '2016-06-24 21:24:51', '1', 'MTIxMjIx', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('103', '2016-06-24 21:35:51', '1', 'MTI:', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('104', '2016-06-24 21:35:54', '1', 'MTIxMg::', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('105', '2016-06-24 22:02:59', '1', 'MTI:', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('106', '2016-06-24 22:06:11', '1', '5ZOI5ZOI5ZOI', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('107', '2016-06-24 22:06:16', '1', '5ZOI5ZOI5ZOI5ZOI', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('108', '2016-06-24 22:10:06', '1', '5ZOI5ZOI5ZOI77yM5aS05YOP5LiN6ZSZ5ZWK', '3', '4', '3,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('109', '2016-06-24 22:10:11', '1', '6YKj5piv5piv', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('110', '2016-06-24 22:11:29', '1', '5ZOI5ZOI5ZOI', '3', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('111', '2016-06-24 22:11:41', '1', '5ZOI5ZOI5ZWl', '4', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('112', '2016-06-24 22:29:20', '1', 'W!WbvueJhyAxOS4yOSBLQl0:', '3', '2', '2,5,6,7,3,4', 'group', null, '47');
INSERT INTO `xinhu_im_mess` VALUES ('113', '2016-06-30 21:30:28', '1', '5L2g5aW9', '1', '14', '1,5', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('114', '2016-07-01 11:15:29', '1', '5Zev5Zev', '1', '14', '1,5', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('115', '2016-07-01 12:43:57', '1', '5ZiO5ZiO', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('116', '2016-07-02 19:01:18', '1', 'W!WbvueJhyAzLjkwIEtCXQ::', '1', '2', '1,2,5,6,7,3,4', 'group', null, '68');
INSERT INTO `xinhu_im_mess` VALUES ('117', '2016-07-02 19:07:30', '1', 'aGVoZQ::', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('118', '2016-07-02 19:14:50', '1', '6Zeu', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('119', '2016-07-02 19:14:55', '1', '6Zeu', '2', '1', '2,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('120', '2016-07-02 19:16:43', '1', '5aSn5a625aW9', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('121', '2016-07-02 19:16:52', '1', '6aKd', '1', '2', '1,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('122', '2016-07-02 19:17:29', '1', '6aKd', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('123', '2016-07-02 19:17:40', '1', '6Zeu', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('124', '2016-07-02 19:17:50', '1', '5ZOI5ZOI', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('125', '2016-07-02 19:17:52', '1', 'aGFoaGE:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('126', '2016-07-02 19:18:25', '1', 'aGFo', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('127', '2016-07-02 19:19:08', '1', '5aSn5a625aW9', '3', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('128', '2016-07-02 19:19:48', '1', '5ZOI5ZOI', '3', '1', '3,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('129', '2016-07-02 19:19:54', '1', '5ZOI5ZOI', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('130', '2016-07-02 19:20:28', '1', '5L2g5aW9', '1', '2', '1,2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('131', '2016-07-02 19:20:34', '1', '6YeR6aKd6YeR6aKd6L!R', '2', '2', '1,2,5,6,7,3', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('132', '2016-07-02 19:23:44', '1', '6LCU6LCU', '2', '2', '1,2,5,6,7,3', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('133', '2016-07-02 19:25:32', '1', '6aKd5Li6', '2', '2', '1,2,5,6,7,3', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('134', '2016-07-02 19:28:04', '1', '6Zeu', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('135', '2016-07-02 19:34:11', '1', '6ICM', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('136', '2016-07-02 19:35:21', '1', '6LCU6LCU', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('137', '2016-07-02 19:35:26', '1', 'd3dldw::', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('138', '2016-07-02 19:37:11', '1', '6Zeu', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('139', '2016-07-02 19:37:18', '1', 'aGVlaA::', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('140', '2016-07-02 19:37:41', '1', '6aKd', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('141', '2016-07-02 19:37:44', '1', 'd2U:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('142', '2016-07-02 19:38:28', '1', 'ZWU:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('143', '2016-07-02 19:38:39', '1', 'ZWU:', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('144', '2016-07-02 19:39:19', '1', 'aGVoZQ::', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('145', '2016-07-02 19:39:23', '1', 'ZWU:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('146', '2016-07-02 19:40:00', '1', 'ZQ::', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('147', '2016-07-02 19:40:03', '1', 'ZXc:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('148', '2016-07-02 19:41:22', '1', 'ZQ::', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('149', '2016-07-02 19:42:29', '1', 'aGVoZQ::', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('150', '2016-07-02 19:42:34', '1', 'ZQ::', '2', '2', '1,2,5,6,7,3', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('151', '2016-07-02 19:42:37', '1', '6LCU6LCU', '1', '2', '1,2,5,6,7,3', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('152', '2016-07-02 19:46:26', '1', 'MTI:', '2', '3', '2,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('153', '2016-07-02 19:46:29', '1', 'MTI:', '3', '2', '3,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('160', '2016-07-04 19:30:00', '1', 'MTI:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('161', '2016-07-06 16:35:50', '1', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY5Y!v5Lul55u05o6l6L!Z6YeM6Zeu5ZWK77yB', '8', '2', '1,2,5,6,7,3,4,8', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('162', '2016-07-06 16:36:19', '1', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '1', '8,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('163', '2016-07-06 16:36:22', '0', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '6', '8,6', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('164', '2016-07-06 16:36:25', '0', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '7', '8,7', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('165', '2016-07-06 16:36:32', '1', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '5', '8,5', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('166', '2016-07-06 16:36:37', '0', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '2', '8,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('167', '2016-07-06 16:36:41', '1', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '4', '8,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('168', '2016-07-06 16:39:00', '0', '5bCP5LmU5aa55aa5', '4', '3', '4,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('169', '2016-07-06 16:39:54', '0', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '3', '8,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('174', '2016-07-06 21:11:45', '1', '5qyi6L!O5L2.55So5L!h5ZG8', '8', '1', '8,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('176', '2016-07-11 19:19:49', '1', '5L2g5aW95ZWK', '4', '4', '4,4', 'user', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_messzt
-- ----------------------------
INSERT INTO `xinhu_im_messzt` VALUES ('217', '127', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('198', '112', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('180', '91', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('114', '43', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('174', '69', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('212', '117', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('192', '111', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('168', '68', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('108', '41', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('156', '66', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('186', '110', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('162', '67', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('120', '44', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('126', '50', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('211', '117', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('132', '51', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('138', '52', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('140', '57', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('142', '59', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('144', '60', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('146', '61', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('148', '62', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('150', '63', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('205', '116', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('206', '116', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('218', '127', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('223', '130', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('224', '130', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('229', '131', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('230', '131', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('235', '132', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('236', '132', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('241', '133', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('242', '133', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('247', '150', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('248', '150', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('253', '151', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('254', '151', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('256', '161', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('257', '161', '3', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('260', '161', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('261', '161', '7', '2');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_infor
-- ----------------------------
INSERT INTO `xinhu_infor` VALUES ('1', '欢迎使用信呼工作台', '2016-06-22 16:21:04', '通知公告', '<p>\n	欢迎使用，有任何问题可以随时联系我们，帮你解答哦。&nbsp;\n</p>\n<p>\n	信呼是一款开源免费的工作台软件，可添加应用，管理，pc上，app都可以使用，我们的代码全部开放，可自由使用。\n</p>', null, null, null, '1', '管理员');
INSERT INTO `xinhu_infor` VALUES ('2', '关于写日报制度说明', '2016-06-22 16:28:48', '规则制度', '<p>\n	1、每个人工作日在下班后必须写工作日报，全天请假可不用写，只要有上班就需要写，即使你上班1分钟。\n</p>\n<p>\n	2、也可以隔天写。\n</p>\n<p>\n	<strong>未写处罚</strong>\n</p>\n<p>\n	1、未写一次扣五块，累计加倍。\n</p>', null, null, null, '1', '管理员');
INSERT INTO `xinhu_infor` VALUES ('3', '通知公告', '2016-06-25 10:09:15', '通知公告', '嗯嗯嗯嗯', null, null, null, '1', '管理员');

-- ----------------------------
-- Table structure for `xinhu_items`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_items`;
CREATE TABLE `xinhu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table` varchar(20) DEFAULT NULL,
  `mid` int(11) DEFAULT '0',
  `atype` varchar(20) DEFAULT NULL COMMENT '类型',
  `aid` smallint(6) DEFAULT '0',
  `name` varchar(50) DEFAULT NULL COMMENT '相关名称',
  `startdt` varchar(30) DEFAULT NULL COMMENT '开始时间',
  `enddt` varchar(30) DEFAULT NULL COMMENT '截止时间',
  `moneys` decimal(8,2) DEFAULT '0.00' COMMENT '金额',
  `sort` smallint(6) DEFAULT '0',
  `address` varchar(50) DEFAULT NULL COMMENT '相关地点',
  `explain` varchar(100) DEFAULT NULL COMMENT '说明',
  `count` smallint(6) DEFAULT '0' COMMENT '数量',
  `optdt` datetime DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1' COMMENT '是否有效',
  `optid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_items
-- ----------------------------
INSERT INTO `xinhu_items` VALUES ('5', 'fininfom', '1', null, '0', '停车费', '2016-05-05', null, '12.00', '0', null, null, '0', '2016-05-05 20:19:42', '1', '1');
INSERT INTO `xinhu_items` VALUES ('6', 'fininfom', '3', null, '0', '市内交通费', '2016-05-04', null, '399.00', '0', '北京', '火车票', '0', '2016-05-05 21:50:09', '1', '1');
INSERT INTO `xinhu_items` VALUES ('7', 'fininfom', '3', null, '0', '市内交通费', '2016-05-05', null, '200.00', '1', '厦门', '打了黑车啊，坑', '0', '2016-05-05 21:50:09', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqinfo
-- ----------------------------
INSERT INTO `xinhu_kqinfo` VALUES ('1', '1', '2016-07-07 08:14:00', '2016-07-07 21:14:00', '请假', '事假', '休息请假啦', '1', '8.0', '2016-07-09 12:55:30', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('2', '4', '2016-07-09 13:35:00', '2016-07-11 13:35:00', '请假', '事假', '讷讷讷讷讷讷', '1', '12.0', '2016-07-10 13:36:09', '1', '大乔');
INSERT INTO `xinhu_kqinfo` VALUES ('3', '4', '2016-07-19 16:27:00', '2016-07-20 16:27:00', '请假', '事假', '嗯嗯额，请假啦，调整一下，哈哈！', '1', '10.0', '2016-07-10 16:39:15', '1', '大乔');
INSERT INTO `xinhu_kqinfo` VALUES ('5', '5', '2016-07-04 09:00:00', '2016-07-06 12:00:00', '请假', '事假', '我也申请！', '0', '26.0', '2016-07-11 22:00:16', '1', '磐石');
INSERT INTO `xinhu_kqinfo` VALUES ('6', '1', '2016-07-12 18:00:00', '2016-07-12 23:59:00', '加班', null, '好好加班！', '1', '5.0', '2016-07-12 20:41:53', '1', '管理员');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_log
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_logintoken
-- ----------------------------

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
  `status` tinyint(1) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '类型@0|普通,1|固定@not',
  `joinid` varchar(200) DEFAULT NULL,
  `joinname` varchar(500) DEFAULT NULL COMMENT '参加人员',
  `mid` int(11) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '发起人',
  `rate` varchar(100) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` int(11) DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `state` tinyint(1) DEFAULT '0' COMMENT '会议状态@0|正常,1|会议中,2|结束,3|取消',
  `cancelreason` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_meet
-- ----------------------------
INSERT INTO `xinhu_meet` VALUES ('1', '会议室1', '每天部门工作汇报', '09:30:00', '10:30:00', '1', '1', 'd4', '开发部', '0', '管理员', '工作日', null, '2015-11-21 19:34:54', null, null, '1', null);
INSERT INTO `xinhu_meet` VALUES ('2', '会议室1', '每天部门工作汇报', '2016-05-28 09:30:00', '2016-05-28 10:30:00', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('3', '会议室1', '每天部门工作汇报', '2016-05-27 09:30:00', '2016-05-27 09:30:00', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('4', '会议室1', '每天部门工作汇报', '2016-05-31 09:30:00', '2016-05-31 10:30:00', '1', '0', 'u1', '管理员', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('5', '会议室1', '每天部门工作汇报', '2016-05-30 09:30:00', '2016-05-30 10:30:00', '1', '0', 'd2', '开发部', '1', '管理员', null, null, null, null, null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('6', '会议室1', '开会啦', '2016-05-30 13:00', '2016-05-30 13:59', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-05-30 13:58:13', '1', '嗯嗯', '0', null);
INSERT INTO `xinhu_meet` VALUES ('7', '会议室1', '开会啦', '2016-06-14 08:00', '2016-06-14 15:00', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-06-14 15:00:46', '1', null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('8', '会客室', '开会啦', '2016-06-23 15:43:00', '2016-06-23 17:43:00', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 17:44:10', '1', null, '0', null);
INSERT INTO `xinhu_meet` VALUES ('9', '会客室', '开会啦', '2016-06-24 17:02:00', '2016-06-24 18:02:00', '0', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 18:02:19', '1', null, '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_menu
-- ----------------------------
INSERT INTO `xinhu_menu` VALUES ('1', '管理后台', '0', '5', null, 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('2', '菜单管理', '1', '0', 'system,menu', 'list-ul', null, 'menu', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('3', '用户管理', '14', '2', 'system,admin', 'user', null, 'user', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('4', '计划任务', '1', '7', 'system,task', 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('5', '组管理', '1', '3', 'system,group', 'group', null, 'group', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('6', '组织结构', '14', '1', 'system,dept', 'sitemap', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('7', '流程模块管理', '0', '2', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('8', '权限管理', '1', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('9', '人员→菜单', '8', '0', 'system,extent,type=um', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('10', '菜单→人员', '8', '0', 'system,extent,type=mu', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('11', '组→菜单', '8', '0', 'system,extent,type=gm', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('12', '菜单→组', '8', '0', 'system,extent,type=mg', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('13', '人员权限查看', '8', '0', 'system,extent,type=view', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('14', '信呼', '0', '1', null, 'comment', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('15', '应用管理', '14', '4', 'main,yingyong', 'th-large', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('16', '会话管理', '14', '3', 'main,imgroup', 'comments', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('17', '流程模块', '7', '2', 'main,flow,set', 'check', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('18', '服务器设置', '14', '0', 'main,xinhu,cog', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('20', '表单元素管理', '7', '4', 'main,flow,element', 'th-list', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('21', '流程模块权限', '7', '5', 'main,view', 'lock', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('22', '流程单据查看', '7', '6', 'main,flow,view', 'search', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('23', '系统升级', '1', '10', 'system,upgrade', 'arrow-up', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('24', '数据选项', '7', '1', 'system,option,num=xinhu', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('25', '初始化备份', '14', '5', 'main,xinhu,csh', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('26', '流程审核进程', '7', '3', 'main,flow,course', 'resize-vertical', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('27', '个人办公', '0', '0', null, null, null, null, '0', '0', null, '0');
INSERT INTO `xinhu_menu` VALUES ('28', '工作流程', '27', '0', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('29', '流程申请', '28', '0', null, 'push', null, null, '0', '1', null, '0');

-- ----------------------------
-- Table structure for `xinhu_option`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_option`;
CREATE TABLE `xinhu_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `pid` int(11) DEFAULT NULL,
  `num` varchar(50) DEFAULT NULL COMMENT '编号',
  `value` varchar(50) DEFAULT NULL COMMENT '对应值',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序号',
  `values` varchar(50) DEFAULT NULL,
  `valid` tinyint(1) DEFAULT '1',
  `optdt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_option
-- ----------------------------
INSERT INTO `xinhu_option` VALUES ('31', null, null, 'reimrecidsystem', 'rockxinhu', '0', null, '1', '2016-07-06 16:44:37');
INSERT INTO `xinhu_option` VALUES ('2', null, null, 'reimhostsystem', 'ws://127.0.0.1:6552/', '0', null, '1', '2016-07-06 16:44:37');
INSERT INTO `xinhu_option` VALUES ('3', null, null, 'reimpushurlsystem', 'http://127.0.0.1:6553/', '0', null, '1', '2016-07-06 16:44:37');
INSERT INTO `xinhu_option` VALUES ('4', '流程分类', '1', 'flowfenlei', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('5', '考勤', '4', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('6', '表单类型', '1', 'flowinputtype', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('7', '文本框', '6', null, 'text', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('8', '日期', '6', null, 'date', '1', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('9', '日期时间', '6', null, 'datetime', '2', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('10', '时间', '6', null, 'time', '3', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('11', '隐藏文本框', '6', null, 'hidden', '4', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('12', '选择人员(单选)', '6', null, 'changeuser', '7', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('13', '选择人员(多选)', '6', null, 'changeusercheck', '8', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('14', '自定义', '6', null, 'auto', '17', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('15', '数字', '6', null, 'number', '5', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('16', '文本域', '6', null, 'textarea', '6', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('17', '固定值', '6', null, 'fixed', '11', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('18', '系统选项下拉框', '6', null, 'rockcombo', '12', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('19', '下拉框', '6', null, 'select', '13', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('20', 'html编辑器', '6', null, 'htmlediter', '14', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('21', '选择部门人员', '6', null, 'changedeptusercheck', '10', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('22', '单个复选框', '6', null, 'checkbox', '15', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('23', '多个复选框', '6', null, 'checkboxall', '16', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('24', '选择部门', '6', null, 'changedept', '9', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('25', '行政', '4', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('26', '信息类型', '1', 'gongtype', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('27', '通知公告', '26', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('28', '规则制度', '26', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('29', '会议室', '1', 'hyname', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('30', '会客室', '29', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('1', '信呼', '0', 'xinhu', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('32', '任务类型', '1', 'worktype', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('33', '任务等级', '1', 'workgrade', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('34', 'bug', '32', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('35', '改进', '32', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('36', '设计', '32', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('37', '低', '33', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('38', '中', '33', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('39', '高', '33', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('40', '紧急', '33', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('41', '任务状态', '1', 'workstate', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('42', '待执行', '41', null, '0', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('43', '执行中', '41', null, '2', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('44', '已完成', '41', null, '1', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('45', '中止', '41', null, '3', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('46', '请假类型', '1', 'kqqjkind', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('47', '事假', '46', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('48', '病假', '46', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('49', '年假', '46', null, null, '0', null, '1', null);

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_reads
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_task
-- ----------------------------
INSERT INTO `xinhu_task` VALUES ('1', '任务提醒', 'work,todo', 'd', '01:20:00', '每天凌晨1.20', '0', '0', null, null, '0', null, '');
INSERT INTO `xinhu_task` VALUES ('2', '数据备份', 'sys,beifen', 'd', '00:20:00', '每天12点', '1', '1', '2016-07-03 10:47:06', null, '0', null, 'success');

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_todo
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('1', null, '有bug哦', 'bug', '低', '1', '管理员', null, '2016-06-28 20:30:17', '1', '管理员', null, null, '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('2', null, '设计一个信呼的logo出来哦', '设计', '中', '1', '管理员', '1、要求简单美观。\n2、高大上的，能代表出系统的。\n3、先来几个版本看看。', '2016-06-29 09:15:25', '5', '磐石', null, null, '2', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('3', null, '严重的bug修复吧', 'bug', '紧急', '5', '磐石', '页面漂亮需要改进。数据库上表不合理。', '2016-06-29 09:26:57', '5', '磐石', null, null, '0', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('4', null, '官网设计并给预算', '设计', '高', '6', '张飞', '1、美观大气啊。\n2、财务给奖励预算。\n3、1给礼拜完成哦。', '2016-06-29 11:16:40', '1', '管理员', '2016-06-29 11:14:19', '2016-07-06 11:16:00', '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('5', null, '系统用户更新。', '改进', '中', '8', '信呼客服', '1、用户问题解答。\n2、问题反馈。', '2016-07-06 21:41:08', '8', '信呼客服', '2016-07-06 21:40:16', null, '2', null, '0', '1');

-- ----------------------------
-- Table structure for `xinhu_xhinfor`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_xhinfor`;
CREATE TABLE `xinhu_xhinfor` (
  `id` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `cont` varchar(400) DEFAULT NULL,
  `imgurl` varchar(50) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_xhinfor
-- ----------------------------
