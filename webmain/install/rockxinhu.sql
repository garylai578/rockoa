/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50610
Source Host           : localhost:3306
Source Database       : rockxinhu

Target Server Type    : MYSQL
Target Server Version : 50610
File Encoding         : 65001

Date: 2016-08-07 19:26:13
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
  `adddt` datetime DEFAULT NULL,
  `wxhao` varchar(50) DEFAULT NULL COMMENT '微信号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_admin
-- ----------------------------
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '413', '1', '1', '男', '0592-1234567', 'upload/face/1.jpg', '2', '开发部', '5', '磐石', '项目主管', '0', '[1],[2]', '[5]', null, null, '1', '2016-07-01', 'xinhu@rockoa.com', '2016-08-02 11:40:42', null, null);
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蝉', 'e10adc3949ba59abbe56e057f20f883e', '40', '1', '0', '女', null, 'upload/face/2.jpg', '3', '财务部', '5', '磐石', '财务总监', '0', '[1],[3]', '[5]', null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '44', '1', '0', '女', null, 'upload/face/3.jpg', '3', '财务部', '2', '貂蝉', '出纳', '0', '[1],[3]', '[5],[2]', null, null, '1', null, null, '2016-08-06 13:15:46', null, null);
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '26', '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', '5', '磐石', '人事主管', '0', '[1],[4]', '[5]', null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '62', '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理层', null, null, '董事长', '0', '[1],[5]', null, null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '7', '1', '0', '男', null, 'upload/face/6.jpg', '2', '开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '赵子龙', 'e10adc3949ba59abbe56e057f20f883e', '5', '1', '0', '男', null, 'upload/face/7.jpg', '2', '开发部', '1', '管理员', '高级程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('8', null, 'xinhu', '信呼客服', '6846860684f05029abccc09a53cd66f1', '18', '1', '0', '男', null, 'upload/face/8.jpg', '2', '开发部', '1', '管理员', '客服', '200', '[1],[2]', '[5],[1]', null, null, '1', '2016-07-01', null, null, null, null);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_customer
-- ----------------------------
INSERT INTO `xinhu_customer` VALUES ('1', '信呼', '1', '2016-07-17 16:50:54', '管理员', '厦门信呼软件有限公司', '网上开拓', '0592-123456', '15888888888', 'admin@rockoa.com', null, '福建厦门', null, null, '1', null, null, '0', null, null);
INSERT INTO `xinhu_customer` VALUES ('2', 'Rock', '1', '2016-07-17 18:09:00', '管理员', 'RockOA开发团队', '电话开拓', '0592-123456', '15888888', 'xinhu@rockoa.com', null, '厦门', null, null, '1', null, null, '0', null, null);
INSERT INTO `xinhu_customer` VALUES ('3', '微软公司', '1', '2016-07-18 10:36:13', '管理员', null, '网上开拓', null, null, null, null, '美国伦敦', null, null, '0', null, null, '0', '管理员,张飞', '1,6');
INSERT INTO `xinhu_customer` VALUES ('4', '谷歌公司', '8', '2016-07-18 14:11:55', '信呼客服', null, '网上开拓', null, null, null, null, '美国chrome', null, null, '1', null, null, '0', '管理员', '1');

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
INSERT INTO `xinhu_dept` VALUES ('6', null, '业务部', '1', '4', null, null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

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

-- ----------------------------
-- Table structure for `xinhu_fininfo`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_fininfo`;
CREATE TABLE `xinhu_fininfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) DEFAULT '0' COMMENT '单据类型@0|报销单,1|出差报销,2|借款单@not',
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_fininfo
-- ----------------------------
INSERT INTO `xinhu_fininfo` VALUES ('1', '0', '1', '12.00', '壹拾贰元整', '2016-05-05 20:19:42', '1', '管理员', '2016-05-05', null, '1', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', null, null);
INSERT INTO `xinhu_fininfo` VALUES ('3', '1', '1', '599.00', '伍佰玖拾玖元整', '2016-05-05 21:50:09', '1', '管理员', '2016-05-05', null, '0', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', '北京会见马云', '聊的不错');
INSERT INTO `xinhu_fininfo` VALUES ('4', '2', '1', '5000000.00', '伍佰万元整', '2016-05-08 16:10:08', '1', '管理员', '2016-05-08', '启动资金', '0', '1', null, '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴公司', '买房', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_bill
-- ----------------------------
INSERT INTO `xinhu_flow_bill` VALUES ('1', 'KA-20160729-0001', 'kqinfo', '1', '5', '请假条', '1', '2016-07-29 10:53:11', '1', '管理员', '5,4', '0', '1', '2016-07-29', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('2', 'KB-20160729-0001', 'kqinfo', '2', '6', '加班单', '1', '2016-07-29 10:56:58', '1', '管理员', '5', '0', '1', '2016-07-29', '磐石通过', '1', null, null, '好的');
INSERT INTO `xinhu_flow_bill` VALUES ('3', 'KA-20160807-0001', 'kqinfo', '3', '5', '请假条', '6', '2016-08-07 18:37:02', '6', '张飞', '1,4', '0', '0', '2016-08-07', '待管理员处理', '0', '1', '管理员', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_course
-- ----------------------------
INSERT INTO `xinhu_flow_course` VALUES ('1', '5', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 21:05:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('2', '5', '人事审核', null, 'rank', null, '人事主管', '0', null, null, '2016-07-07 22:14:24', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('3', '6', '上级审核', null, 'super', null, null, '0', null, null, '2016-07-02 22:25:29', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('4', '5', '总经理审核', null, 'user', '5', '磐石', '0', 'YHRvdGFsc2AgPiAyNA::', '超过3天24小时', '2016-08-04 21:07:57', '1', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_menu
-- ----------------------------
INSERT INTO `xinhu_flow_menu` VALUES ('1', '标为已读', 'yd', '0', '已读', 'green', '1', '标识', '1', null, null, '1', '0', '0', '0', null);
INSERT INTO `xinhu_flow_menu` VALUES ('2', '全部标识已读', 'allyd', '0', null, null, '1', null, '1', null, null, '1', '0', '0', '0', null);
INSERT INTO `xinhu_flow_menu` VALUES ('3', '标为已读', 'yd', '0', '已读', 'green', '1', '标识', '3', null, null, '1', '0', '0', '0', null);
INSERT INTO `xinhu_flow_menu` VALUES ('4', '全部标识已读', 'allyd', '0', null, null, '1', null, '3', null, null, '1', '0', '0', '0', null);
INSERT INTO `xinhu_flow_menu` VALUES ('5', '点评', null, '0', null, null, '0', null, '3', null, null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('6', '取消会议', null, '0', '取消', 'gray', '3', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ!J3tub3d9JyAgYW5kIHN0YXRlPTA:', '我发起，未开始会议可取消', '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('7', '结束会议', null, '0', '结束', 'orange', '2', null, '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXJ0ZHQ8J3tub3d9JyBhbmQgZW5kZHQ!J3tub3d9JyAgYW5kIHN0YXRlPTE:', '我发起，开会中可提前结束', '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('8', '指派给...', null, '10', null, null, '1', null, '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '2', null);
INSERT INTO `xinhu_flow_menu` VALUES ('9', '标为执行中', null, '0', '执行中', 'orange', '2', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('10', '标已完成', null, '0', '已完成', 'green', '1', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('11', '终止任务', null, '0', '中止', 'gray', '3', '进度报告', '4', 'ZGlzdGlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('12', '＋添加拜访记录', null, '0', '拜访记录', null, '1', null, '7', 'dWlkPXt1aWR9', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('13', '启用', 'ztqh', '0', '启用', 'green', '1', '状态切换', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MA::', null, '1', '1', '0', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('14', '停用', 'ztqh', '0', '停用', 'gray', '0', '状态切换', '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('15', '共享给...', 'shate', '0', null, null, '1', null, '7', 'dWlkPXt1aWR9IGFuZCBzdGF0dXM9MQ::', null, '1', '1', '1', '3', null);
INSERT INTO `xinhu_flow_menu` VALUES ('16', '＋添加跟进', null, '0', null, null, '1', '跟进', '8', 'dWlkPXt1aWR9', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('17', '标为跟进中', 'ztqh', '0', '跟进中', 'blue', '0', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MA::', null, '1', '1', '0', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('18', '标为已成交', 'ztqh', '0', '已成交', 'green', '1', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('19', '标为已丢失', 'ztqh', '0', '已丢失', 'gray', '2', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!Mg::', null, '1', '1', '1', '1', null);
INSERT INTO `xinhu_flow_menu` VALUES ('20', '转移给...', 'zhuan', '0', null, null, '1', null, '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZT0w', null, '1', '1', '1', '2', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '0', 'infor', null, '[{typename}]{title}', '行政', '1', '1', 'XA-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:07', '1');
INSERT INTO `xinhu_flow_set` VALUES ('2', '会议', 'meet', '0', 'meet', null, '[{hyname}]{title},{startdt}→{enddt}', '行政', '1', '1', 'XB-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:21:01', '1');
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日报', 'daily', '0', 'daily', null, '[{optname}]{content}', '行政', '1', '1', 'XC-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:27', '1');
INSERT INTO `xinhu_flow_set` VALUES ('4', '任务', 'work', '0', 'work', null, '[{type}]{title},分配给:{dist}', '工作', '1', '1', 'WO-Ymd-', '0', 'all', '全体人员', '2016-06-28 21:42:47', '1');
INSERT INTO `xinhu_flow_set` VALUES ('5', '请假条', 'leave', '10', 'kqinfo', 'kind=[F]请假[F]', '[{qjkind}]{stime}→{stime}共{totals}小时,{explain}', '考勤', '1', '1', 'KA-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:13:58', '1');
INSERT INTO `xinhu_flow_set` VALUES ('6', '加班单', 'jiaban', '11', 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小时,{explain}', '考勤', '1', '1', 'KB-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:14:08', '1');
INSERT INTO `xinhu_flow_set` VALUES ('7', '客户', 'customer', '0', 'customer', null, null, 'CRM', '1', '1', 'CA-Ymd-', '0', 'all', '全体人员', '2016-07-14 22:33:31', '1');
INSERT INTO `xinhu_flow_set` VALUES ('8', '销售', 'custsale', '0', 'custsale', null, null, 'CRM', '1', '1', 'CB-Ymd-', '0', 'all', '全体人员', '2016-07-18 10:09:29', '1');
INSERT INTO `xinhu_flow_set` VALUES ('9', '物品产品', 'goods', '0', 'goods', null, null, '行政', '0', '0', 'CC-Ymd-', '0', 'all', '全体人员', '2016-07-19 17:21:28', '1');
INSERT INTO `xinhu_flow_set` VALUES ('11', '费用报销', 'finfybx', '0', 'fininfo', 'type=0', null, '财务', '1', '0', 'FA-Ymd-', '1', 'all', '全体人员', '2016-07-29 21:43:19', '0');
INSERT INTO `xinhu_flow_set` VALUES ('10', '用户', 'user', '0', 'admin', null, null, '基础', '0', '0', null, '0', 'u1', '管理员', '2016-08-02 16:42:25', '1');

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
INSERT INTO `xinhu_goods` VALUES ('1', '64', '信呼实施维护', null, null, '实施维护包括如下内容\n1、系统bug修改。\n2、需求添加修改等。\n3、数据服务器稳定性维护。\n4、数据分析等。', '3000.00', '月', '2016-07-19 17:53:28', '2016-07-20 12:38:55', '1', '管理员', '100');
INSERT INTO `xinhu_goods` VALUES ('2', '67', '鼠标1', null, null, null, '12.00', '个', '2016-07-20 13:25:17', '2016-07-20 13:25:17', '1', '管理员', '-1');

-- ----------------------------
-- Table structure for `xinhu_goodss`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_goodss`;
CREATE TABLE `xinhu_goodss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aid` smallint(6) DEFAULT '0',
  `count` smallint(6) DEFAULT '0',
  `uid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '0入库,1出库',
  `kind` tinyint(2) DEFAULT '0' COMMENT '出入库类型',
  `optname` varchar(20) DEFAULT NULL,
  `applydt` date DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_goodss
-- ----------------------------
INSERT INTO `xinhu_goodss` VALUES ('1', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:24:01', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('2', '2', '22', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:24:01', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('3', '1', '-23', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出库', '1');
INSERT INTO `xinhu_goodss` VALUES ('4', '2', '-2', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:24:30', '哈哈，出库', '1');
INSERT INTO `xinhu_goodss` VALUES ('5', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:31:42', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('6', '2', '2', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:31:42', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('7', '1', '100', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 15:32:03', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('8', '2', '-20', '1', '1', '0', '管理员', '2016-07-20', '2016-07-20 15:33:48', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('9', '1', '21', '1', '0', '1', '管理员', '2016-07-20', '2016-07-20 15:35:48', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('10', '1', '-1', '1', '1', '1', '管理员', '2016-07-20', '2016-07-20 15:36:26', '有人买了', '1');
INSERT INTO `xinhu_goodss` VALUES ('11', '1', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 19:51:35', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('12', '2', '1', '1', '0', '0', '管理员', '2016-07-20', '2016-07-20 19:51:35', null, '1');
INSERT INTO `xinhu_goodss` VALUES ('13', '2', '-4', '1', '1', '0', '管理员', '2016-08-07', '2016-08-07 15:33:51', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_group
-- ----------------------------
INSERT INTO `xinhu_im_group` VALUES ('1', '信呼团队', '0', '2', '0', null, null, null, 'images/xinhu.png', 'xinhu', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('2', '全体人员', '0', '0', '0', '1', null, null, null, null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('3', '通知公告', '0', '2', '0', null, null, null, 'images/gong.png', 'gong', '', '', 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('4', '会议', '0', '2', '0', null, null, null, 'images/meet.png', 'meet', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('5', '技术群', '0', '0', '0', '1', null, null, null, null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('7', '工作日报', '0', '2', '0', null, null, '2015-06-25 16:03:34', 'images/daily.png', 'daily', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('12', '任务', '0', '2', '8', '1', '管理员', '2015-09-10 13:38:07', 'images/work.png', 'work', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('13', '万年历', '0', '2', '10', null, null, null, 'images/calendar.png', 'calendar', null, null, 'buin', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('14', '高管群', '0', '0', '0', '1', '管理员', '2016-06-30 21:29:52', null, null, null, null, null, '1', '嗯嗯');
INSERT INTO `xinhu_im_group` VALUES ('15', '流程申请', '0', '2', '0', null, null, null, 'images/flow.png', 'flow', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('16', '流程待办', '0', '2', '0', null, null, null, 'images/daiban.png', 'daiban', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('17', '客户管理', '18', '2', '0', null, null, null, 'images/crm.png', 'customer', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('18', 'CRM客户', '0', '2', '0', null, null, null, 'images/crm.png', null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('19', '客户销售', '18', '2', '0', null, null, null, 'images/sale.png', 'custsale', null, null, 'auto', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('2', 'user', '8', '5', '8', '2016-07-21 10:18:53', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('4', 'user', '8', '1', '8', '2016-07-27 22:13:52', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('6', 'user', '8', '3', '8', '2016-07-21 10:19:05', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('8', 'user', '8', '2', '8', '2016-07-21 10:19:08', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('10', 'user', '8', '4', '8', '2016-07-21 10:19:13', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('11', 'user', '1', '4', '4', '2016-07-22 22:45:15', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('13', 'user', '1', '8', '8', '2016-07-27 22:13:52', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('14', 'group', '2', '1', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('15', 'group', '2', '2', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('16', 'group', '2', '5', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('17', 'group', '2', '6', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('18', 'group', '2', '7', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('19', 'group', '2', '3', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('20', 'group', '2', '4', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '1');
INSERT INTO `xinhu_im_history` VALUES ('21', 'group', '2', '8', '1', '2016-08-01 12:35:02', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('22', 'user', '3', '1', '1', '2016-08-06 13:15:46', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');
INSERT INTO `xinhu_im_history` VALUES ('23', 'user', '1', '3', '1', '2016-08-06 13:15:46', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_mess
-- ----------------------------
INSERT INTO `xinhu_im_mess` VALUES ('1', '2016-07-21 10:18:53', '1', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '5', '8,5', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('2', '2016-07-21 10:18:59', '1', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '1', '8,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('3', '2016-07-21 10:19:05', '0', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '3', '8,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('4', '2016-07-21 10:19:08', '0', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '2', '8,2', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('5', '2016-07-21 10:19:13', '0', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '4', '8,4', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('7', '2016-07-27 22:13:52', '1', '5qyi6L!O5L2.55So5L!h5ZG877yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!044CC', '8', '1', '8', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('8', '2016-08-01 12:35:02', '1', 'W!WRsueJmV0:', '1', '2', '1,2,5,6,7,3,4,8', 'group', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_messzt
-- ----------------------------
INSERT INTO `xinhu_im_messzt` VALUES ('1', '8', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('2', '8', '3', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('3', '8', '4', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('4', '8', '5', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('5', '8', '6', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('6', '8', '7', '2');

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
INSERT INTO `xinhu_infor` VALUES ('1', '欢迎使用信呼工作台', '2016-08-01 11:42:19', '通知公告', '<p>\n	欢迎使用，有任何问题可以随时联系我们，帮你解答哦。&nbsp;\n</p>\n<p>\n	信呼是一款开源免费的工作台软件，可添加应用，管理，pc上，app都可以使用，我们的代码全部开放，可自由使用。\n</p>', null, null, null, '1', '管理员');
INSERT INTO `xinhu_infor` VALUES ('2', '关于写日报制度说明', '2016-06-22 16:28:48', '规则制度', '<p>\n	1、每个人工作日在下班后必须写工作日报，全天请假可不用写，只要有上班就需要写，即使你上班1分钟。\n</p>\n<p>\n	2、也可以隔天写。\n</p>\n<p>\n	<strong>未写处罚</strong>\n</p>\n<p>\n	1、未写一次扣五块，累计加倍。\n</p>', null, null, null, '1', '管理员');

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
-- Table structure for `xinhu_kqdkjl`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_kqdkjl`;
CREATE TABLE `xinhu_kqdkjl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `dkdt` datetime DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0' COMMENT '0在线打卡,1考勤机,2手机定位,3手动添加,4异常添加',
  `address` varchar(50) DEFAULT NULL COMMENT '定位地址',
  `lat` varchar(20) DEFAULT NULL COMMENT '纬度',
  `lng` varchar(20) DEFAULT NULL COMMENT '经度',
  `accuracy` smallint(6) DEFAULT '0' COMMENT '精确范围',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqdkjl
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqinfo
-- ----------------------------
INSERT INTO `xinhu_kqinfo` VALUES ('1', '1', '2016-07-29 10:52:51', '2016-07-29 18:52:54', '请假', '事假', '下午请假去骑车兜风啊！', '0', '6.0', '2016-07-29 10:53:11', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('2', '1', '2016-07-27 19:00:00', '2016-07-27 23:00:00', '加班', null, '老板说我能做事就多加班，呵呵呵！', '1', '4.0', '2016-07-29 10:56:58', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('3', '6', '2016-08-08 09:00:00', '2016-08-08 18:36:40', '请假', '年假', '辛辛苦苦一年终于有一天年假啦，请一下吧！', '0', '8.0', '2016-08-07 18:37:02', '1', '张飞');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_meet
-- ----------------------------
INSERT INTO `xinhu_meet` VALUES ('1', '会议室1', '每天部门工作汇报', '09:30:00', '10:30:00', '1', '1', '1', 'd4', '开发部', '0', '管理员', '工作日', null, '2015-11-21 19:34:54', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('2', '会议室1', '每天部门工作汇报', '2016-05-28 09:30:00', '2016-05-28 10:30:00', '0', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('3', '会议室1', '每天部门工作汇报', '2016-05-27 09:30:00', '2016-05-27 09:30:00', '0', '1', '0', 'd4', '开发部', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('4', '会议室1', '每天部门工作汇报', '2016-05-31 09:30:00', '2016-05-31 10:30:00', '0', '1', '0', 'u1', '管理员', '1', '管理员', null, null, '2016-05-16 21:46:10', null, null, null);
INSERT INTO `xinhu_meet` VALUES ('5', '会议室1', '每天部门工作汇报', '2016-05-30 09:30:00', '2016-05-30 10:30:00', '0', '1', '0', 'd2', '开发部', '1', '管理员', null, null, null, null, null, null);
INSERT INTO `xinhu_meet` VALUES ('6', '会议室1', '开会啦', '2016-05-30 13:00', '2016-05-30 13:59', '0', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-05-30 13:58:13', '1', '嗯嗯', null);
INSERT INTO `xinhu_meet` VALUES ('7', '会议室1', '开会啦', '2016-06-14 08:00', '2016-06-14 15:00', '0', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, null, '2016-06-14 15:00:46', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('8', '会客室', '开会啦', '2016-06-23 15:43:00', '2016-06-23 17:43:00', '0', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 17:44:10', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('9', '会客室', '开会啦', '2016-06-24 17:02:00', '2016-06-24 18:02:00', '0', '0', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-06-22 18:02:19', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('10', '会客室', '今天会议', '2016-07-17 14:29:17', '2016-07-17 14:30:23', '2', '1', '0', 'd1', '信呼开发团队', '0', '大乔', null, '4', '2016-07-16 14:29:34', '4', null, null);
INSERT INTO `xinhu_meet` VALUES ('12', '会客室', '开会啦', '2016-07-19 09:00:00', '2016-07-19 10:00:00', '2', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-07-18 20:00:27', '1', null, null);
INSERT INTO `xinhu_meet` VALUES ('13', '会客室', '要开会啦', '2016-07-29 13:00:00', '2016-07-29 14:00:00', '3', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-07-28 21:26:01', '1', '哈哈哈哈', null);
INSERT INTO `xinhu_meet` VALUES ('14', '会客室', '开发部门的会议', '2016-07-28 21:31:35', '2016-07-28 23:31:36', '2', '1', '0', 'd2', '开发部', '0', '管理员', null, '1', '2016-07-28 21:32:53', '1', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_menu
-- ----------------------------
INSERT INTO `xinhu_menu` VALUES ('1', '系统', '0', '5', null, 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('2', '菜单管理', '1', '0', 'system,menu', 'list-ul', null, 'menu', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('3', '用户管理', '14', '2', 'system,admin', 'user', null, 'user', '1', '1', '#3BBDDB', '1');
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
INSERT INTO `xinhu_menu` VALUES ('14', '信呼', '0', '0', null, 'comment', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('15', '应用管理', '14', '4', 'main,yingyong', 'th-large', null, 'yingyong', '1', '1', '#1ABC9C', '1');
INSERT INTO `xinhu_menu` VALUES ('16', '会话管理', '14', '3', 'main,imgroup', 'comments', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('17', '流程模块', '7', '2', 'main,flow,set', 'check', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('18', '服务器设置', '14', '0', 'main,xinhu,cog', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('20', '表单元素管理', '7', '4', 'main,flow,element', 'th-list', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('21', '流程模块权限', '7', '5', 'main,view', 'lock', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('22', '流程单据查看', '7', '6', 'main,flow,view', 'search', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('23', '系统升级', '1', '10', 'system,upgrade', 'arrow-up', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('24', '数据选项', '7', '1', 'system,option,num=xinhu', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('25', '初始化备份', '1', '5', 'main,xinhu,csh', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('26', '流程审核步骤', '7', '3', 'main,flow,course', 'resize-vertical', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('27', '基础设置', '0', '1', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('28', '物品产品', '27', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('29', '分类选项管理', '28', '0', 'system,option,num=goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('30', '物品产品列表', '28', '0', 'main,goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('31', '物品出入库详情', '28', '0', 'main,goods,xiang', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('32', '人事考勤', '27', '0', null, 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('33', '打卡记录', '32', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('34', '单据操作菜单', '7', '7', 'main,flow,menu', null, null, null, '1', '1', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_option` VALUES ('50', '客户关系', '1', 'crm', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('51', 'CRM', '4', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('52', '客户来源', '50', 'crmlaiyuan', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('53', '销售状态', '50', 'crmstate', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('54', '网上开拓', '52', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('55', '电话开拓', '52', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('56', '跟进中', '53', null, '0', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('57', '已成交', '53', null, '1', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('58', '销售来源', '50', 'custsalelai', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('59', '主动来访', '58', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('60', '网上联系', '58', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('61', '电话销售', '58', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('62', '物品产品分类', '0', 'goods', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('63', '互联网', '83', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('64', '信呼', '63', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('65', '办公耗材', '83', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('66', '显示器', '65', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('67', '鼠标', '65', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('68', '主机', '65', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('69', '笔', '65', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('70', '品牌', '62', 'rockbrand', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('71', '单位', '62', 'rockunit', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('72', '台', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('73', '个', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('74', '件', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('75', '箱', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('76', '年', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('77', '月', '71', null, null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('78', '入库类型', '62', 'kutype0', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('79', '出库类型', '62', 'kutype1', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('80', '采购入库', '78', null, '0', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('81', '领用出库', '79', null, '0', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('82', '归返入库', '78', null, '1', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('83', '分类类别', '62', 'goodstype', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('84', '销售出库', '79', null, '1', '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('85', '知识信息', '26', null, null, '0', null, '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_task
-- ----------------------------
INSERT INTO `xinhu_task` VALUES ('1', '任务提醒', 'work,todo', 'd', '01:20:00', '每天凌晨1.20', '0', '0', null, null, '0', null, '');
INSERT INTO `xinhu_task` VALUES ('2', '数据备份', 'sys,beifen', 'd', '00:20:00', '每天12点', '1', '1', '2016-07-19 22:29:14', null, '0', null, 'success');

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
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('2', null, '设计一个信呼的logo出来哦', '设计', '中', '1', '管理员', '1、要求简单美观。\n2、高大上的，能代表出系统的。\n3、先来几个版本看看。', '2016-06-29 09:15:25', '5', '磐石', null, null, '3', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('3', null, '严重的bug修复吧', 'bug', '紧急', '5', '磐石', '页面漂亮需要改进。数据库上表不合理。', '2016-06-29 09:26:57', '5', '磐石', null, null, '0', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('4', null, '官网设计并给预算', '设计', '高', '6', '张飞', '1、美观大气啊。\n2、财务给奖励预算。\n3、1给礼拜完成哦。', '2016-06-29 11:16:40', '1', '管理员', '2016-06-29 11:14:19', '2016-07-06 11:16:00', '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('5', null, '系统用户更新。', '改进', '中', '8', '信呼客服', '1、用户问题解答。\n2、问题反馈。', '2016-07-06 21:41:08', '8', '信呼客服', '2016-07-06 21:40:16', null, '2', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('6', null, '赶紧弄啊', 'bug', '低', '4', '大乔', null, '2016-07-18 19:49:45', '1', '管理员', '2016-07-18 19:49:19', null, '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('7', null, '漏洞啦，快去改啊。', 'bug', '高', '5', '磐石', '嗯嗯嗯', '2016-07-20 12:59:13', '1', '管理员', '2016-07-20 12:51:17', null, '1', null, '0', '1');
