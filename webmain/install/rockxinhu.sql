/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rockxinhu_fabu

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-10-21 09:07:23
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
  `deptallname` varchar(100) DEFAULT NULL COMMENT '部门全部路径',
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
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '780', '1', '1', '男', '0592-123456', 'upload/face/1.jpg', '2', '开发部', '信呼开发团队/开发部', '5', '磐石', '项目主管', '0', '[1],[2]', '[5]', null, '15800000123', '1', '2016-07-01', 'admin@rockoa.com', '2016-08-02 11:40:42', null, 'chenxihu829', null);
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蝉', 'e10adc3949ba59abbe56e057f20f883e', '52', '1', '0', '女', null, 'upload/face/2.jpg', '3', '财务部', '信呼开发团队/财务部', '5', '磐石', '财务总监', '0', '[1],[3]', '[5]', null, '15800000007', '1', '2016-08-08', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '62', '1', '0', '女', null, 'upload/face/3.jpg', '3', '财务部', '信呼开发团队/财务部', '2', '貂蝉', '出纳', '0', '[1],[3]', '[5],[2]', null, '15800000001', '1', null, null, '2016-08-30 20:34:23', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '78', '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', '信呼开发团队/行政人事部', '5', '磐石', '人事主管', '0', '[1],[4]', '[5]', null, '15800000002', '1', null, null, '2016-10-20 22:27:51', null, null, null);
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '87', '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理层', '信呼开发团队/管理层', null, null, '董事长', '0', '[1],[5]', null, null, '15800000003', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '17', '1', '0', '男', null, 'upload/face/6.jpg', '2', '开发部', '信呼开发团队/开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, '15800000004', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '赵子龙', 'e10adc3949ba59abbe56e057f20f883e', '9', '1', '0', '男', null, 'upload/face/7.jpg', '2', '开发部', '信呼开发团队/开发部', '1', '管理员', '高级程序员', '100', '[1],[2]', '[5],[1]', null, '15800000005', '1', null, null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('8', null, 'xinhu', '信呼客服', '6846860684f05029abccc09a53cd66f1', '54', '1', '1', '男', null, 'upload/face/8.jpg', '2', '开发部', '信呼开发团队/开发部', '1', '管理员', '客服', '200', '[1],[2]', '[5],[1]', null, '15800000006', '1', '2016-07-01', null, null, null, null, null);
INSERT INTO `xinhu_admin` VALUES ('9', null, 'lisi', '李四', 'e10adc3949ba59abbe56e057f20f883e', '8', '1', '0', '男', null, 'upload/face/9.jpg', '2', '开发部', '信呼开发团队/开发部', '1', '管理员', '程序员', '100', '[1],[2]', '[5],[1]', null, null, '1', '2016-09-06', '505581617@qq.com', null, '2016-09-06 18:28:57', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_chargems
-- ----------------------------
INSERT INTO `xinhu_chargems` VALUES ('1', '1', '1', '2016-10-21 14:32:00', '2016-10-09 14:19:39', null);
INSERT INTO `xinhu_chargems` VALUES ('2', '1', '2', '2016-10-21 14:32:00', '2016-10-01 14:38:14', null);
INSERT INTO `xinhu_chargems` VALUES ('3', '0', '1', '2016-10-21 14:32:00', '2016-10-09 14:19:39', null);

-- ----------------------------
-- Table structure for `xinhu_custfina`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_custfina`;
CREATE TABLE `xinhu_custfina` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `htid` int(11) DEFAULT '0' COMMENT '合同ID',
  `htnum` varchar(20) DEFAULT NULL,
  `dt` date DEFAULT NULL COMMENT '所属日期',
  `uid` smallint(6) DEFAULT '0',
  `custid` smallint(6) DEFAULT '0',
  `custname` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT '0.00',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款单,1付款单',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '是否收款,付款',
  `paydt` datetime DEFAULT NULL COMMENT '收付款时间',
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `createdt` datetime DEFAULT NULL COMMENT '创建时间',
  `createname` varchar(10) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  `ismove` tinyint(1) DEFAULT '0' COMMENT '是否转移的',
  PRIMARY KEY (`id`),
  KEY `htid` (`htid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_custfina
-- ----------------------------
INSERT INTO `xinhu_custfina` VALUES ('1', '1', 'HT-001', '2016-10-15', '1', '1', '信呼办公软件', '2016-10-15 16:24:59', '管理员', '520.00', '0', '1', '2016-10-19 18:36:29', null, '2016-10-15 16:24:59', '管理员', '1', '0');
INSERT INTO `xinhu_custfina` VALUES ('2', '0', null, '2016-10-15', '1', '1', '信呼办公软件', '2016-10-15 18:40:20', '管理员', '2100.00', '1', '1', '2016-10-19 18:42:22', '服务器费用', '2016-10-15 18:40:20', '管理员', '1', '0');
INSERT INTO `xinhu_custfina` VALUES ('3', '2', 'HT-002', '2016-10-15', '7', '3', '微软公司', '2016-10-15 19:10:04', '赵子龙', '20000.00', '0', '1', '2016-10-05 19:10:20', null, '2016-10-15 19:10:04', '管理员', '1', '1');
INSERT INTO `xinhu_custfina` VALUES ('4', '3', 'HT-003', '2016-10-15', '1', '1', '信呼办公软件', '2016-10-19 16:05:06', '管理员', '25.00', '1', '0', null, null, '2016-10-15 19:36:08', '管理员', '1', '0');
INSERT INTO `xinhu_custfina` VALUES ('5', '2', 'HT-002', '2016-10-16', '7', '3', '微软公司', '2016-10-16 13:32:11', '赵子龙', '30000.00', '0', '0', null, null, '2016-10-16 13:32:11', '管理员', '1', '0');
INSERT INTO `xinhu_custfina` VALUES ('6', '4', 'HT-004', '2016-10-16', '6', '5', '腾讯科技', '2016-10-16 16:01:11', '张飞', '2300.00', '0', '0', null, null, '2016-10-16 16:01:11', '张飞', '6', '0');

-- ----------------------------
-- Table structure for `xinhu_customer`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_customer`;
CREATE TABLE `xinhu_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `type` varchar(20) DEFAULT NULL COMMENT '客户类型',
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `optname` varchar(10) DEFAULT NULL,
  `linkname` varchar(20) DEFAULT NULL COMMENT '联系人',
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
  `isstat` tinyint(1) DEFAULT '0' COMMENT '是否标*客户',
  `fzid` smallint(6) DEFAULT '0',
  `fzname` varchar(20) DEFAULT NULL COMMENT '客户负责人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_customer
-- ----------------------------
INSERT INTO `xinhu_customer` VALUES ('1', '信呼办公软件', '互联网', '1', '2016-10-19 21:24:39', '管理员', null, '厦门信呼软件有限公司', '网上开拓', '0592-123456', '15888888888', 'admin@rockoa.com', null, '福建厦门', null, null, '1', null, '管理员', '1', null, null, '0', '0', '0', null);
INSERT INTO `xinhu_customer` VALUES ('2', 'Rock', '软件', '1', '2016-10-17 09:24:32', '管理员', null, 'RockOA开发团队', '电话开拓', '0592-123456', '15888888', 'xinhu@rockoa.com', null, '厦门', null, null, '0', null, '管理员', '1', null, null, '1', '0', '0', null);
INSERT INTO `xinhu_customer` VALUES ('3', '微软公司', '软件', '7', '2016-10-17 09:24:22', '赵子龙', null, null, '网上开拓', null, null, null, null, '美国伦敦', null, null, '1', null, '管理员', '1', '管理员,张飞', '1,6', '1', '0', '0', null);
INSERT INTO `xinhu_customer` VALUES ('4', '谷歌公司', null, '8', '2016-07-18 14:11:55', '信呼客服', null, null, '网上开拓', null, null, null, null, '美国chrome', null, null, '1', null, '信呼客服', '6', '管理员', '1', '1', '0', '0', null);
INSERT INTO `xinhu_customer` VALUES ('5', '腾讯科技', null, '6', '2016-10-16 16:00:31', '张飞', null, null, '网上开拓', null, null, null, null, '深圳', null, null, '1', '2016-10-16 16:00:31', '张飞', '6', null, null, '0', '0', '0', null);

-- ----------------------------
-- Table structure for `xinhu_custract`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_custract`;
CREATE TABLE `xinhu_custract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `num` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `custid` int(11) DEFAULT '0',
  `custname` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `linkman` varchar(20) DEFAULT NULL COMMENT '客户联系人',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '合同金额',
  `moneys` decimal(10,2) DEFAULT '0.00' COMMENT '待收金额',
  `startdt` date DEFAULT NULL COMMENT '生效日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `content` text COMMENT '合同内容',
  `saleid` smallint(6) DEFAULT '0' COMMENT '销售机会Id',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `signdt` date DEFAULT NULL COMMENT '签约日期',
  `type` tinyint(1) DEFAULT '0' COMMENT '0收款合同，1付款合同',
  `ispay` tinyint(1) DEFAULT '0' COMMENT '0待,1已完成,2部分',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已全部创建收付款单',
  `createname` varchar(20) DEFAULT NULL,
  `createid` smallint(6) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_custract
-- ----------------------------
INSERT INTO `xinhu_custract` VALUES ('1', '1', 'HT-001', '2016-10-15 10:59:40', '管理员', '2016-10-12', null, '1', '1', '信呼办公软件', null, '520.00', '0.00', '2016-10-01', '2016-10-31', '1、技术支持一个月。\n2、部署安装2次。', null, '1', '2016-10-12', '0', '1', '1', '管理员', '1');
INSERT INTO `xinhu_custract` VALUES ('2', '7', 'HT-002', '2016-10-13 20:18:04', '赵子龙', '2016-10-13', null, '1', '3', '微软公司', null, '50000.00', '30000.00', '2016-10-01', '2017-10-31', null, '2', '1', '2016-10-13', '0', '2', '1', '管理员', '1');
INSERT INTO `xinhu_custract` VALUES ('3', '1', 'HT-003', '2016-10-19 16:02:53', '管理员', '2016-10-15', null, '1', '1', '信呼办公软件', null, '25.00', '25.00', '2016-10-01', '2016-10-31', '采购了啥！', null, '1', '2016-10-15', '1', '0', '1', '管理员', '1');
INSERT INTO `xinhu_custract` VALUES ('4', '6', 'HT-004', '2016-10-16 16:01:06', '张飞', '2016-10-16', null, '1', '5', '腾讯科技', null, '2300.00', '2300.00', '2015-10-01', '2017-10-31', null, null, '1', '2016-10-16', '0', '0', '1', '张飞', '6');

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
  `htid` smallint(6) DEFAULT '0' COMMENT '合同ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_custsale
-- ----------------------------
INSERT INTO `xinhu_custsale` VALUES ('1', '1', '信呼办公软件', '3', '小乔', '2016-07-17 22:12:06', '0', '说要买模块定制哦！', '50.00', '2016-07-17', null, '2016-07-17 22:12:06', null, '3', '小乔', '0');
INSERT INTO `xinhu_custsale` VALUES ('2', '3', '微软公司', '7', '赵子龙', '2016-07-18 10:38:21', '1', '说要收购软件信呼，呵呵！', '50000.00', '2016-07-18', '2016-07-18 14:02:15', '2016-07-18 10:38:21', '主动来访', '1', '管理员', '2');
INSERT INTO `xinhu_custsale` VALUES ('3', '4', '谷歌公司', '8', '信呼客服', '2016-07-18 14:13:17', '1', '可能买安卓手机一部', '500.00', '2016-07-18', '2016-07-18 14:13:39', '2016-07-18 14:13:17', '主动来访', '8', '信呼客服', '0');
INSERT INTO `xinhu_custsale` VALUES ('4', '1', '信呼办公软件', '1', '管理员', '2016-07-18 16:33:17', '0', '呵呵', '58.00', '2016-07-18', '2016-07-29 13:14:41', '2016-07-18 16:33:17', '电话销售', '1', '管理员', '0');
INSERT INTO `xinhu_custsale` VALUES ('5', '3', '微软公司', '4', '大乔', '2016-07-18 20:53:18', '0', '梦梦搭', '511.00', '2016-07-18', null, '2016-07-18 20:53:18', '网上联系', '4', '大乔', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_daily
-- ----------------------------
INSERT INTO `xinhu_daily` VALUES ('1', '2016-04-07', 'REIM系统开发，添加推送密码，官网维护等。', '2016-04-08 23:00:40', '2016-04-08 23:00:40', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('2', '2016-04-08', '1、核心模块流程添加转办给其他人功能。\n2、REIM开发添加手机端提醒。', '2016-04-08 23:01:24', '2016-04-08 23:01:24', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('3', '2016-04-05', '1、官网添加会员用户中心，添加密码修改，REIM密钥创建。', '2016-04-08 23:02:49', '2016-04-08 23:02:49', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('4', '2016-06-16', '1、后台数据权限添加\n2、权限查看编辑应用到各个模块中。\n', null, '2016-06-16 22:45:17', '2', '貂蝉', '0', null, '1', null, '2');
INSERT INTO `xinhu_daily` VALUES ('5', '2016-06-16', '今天查看了其他人员的日报哦，做的还不错，加油！', null, '2016-06-16 23:08:37', '5', '磐石', '0', null, '1', null, '5');
INSERT INTO `xinhu_daily` VALUES ('6', '2016-06-17', '1、救了世子和刘备夫人，不慎他跳井了。\n2、被曹操追上，死里逃生啊。', null, '2016-06-17 10:55:07', '7', '赵子龙', '0', null, '1', null, '7');
INSERT INTO `xinhu_daily` VALUES ('7', '2016-06-17', '1、优化了很多内容APP，测试\n2、添加上传文件功能。', null, '2016-06-17 19:28:30', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('8', '2016-06-13', '1、开发设计维护。\n2、端午来干嘛的？', null, '2016-06-17 20:21:14', '1', '管理员', '1', '1、继续开发。\n2、继续涉及啦，哈哈。', '1', '2016-06-17', '1');
INSERT INTO `xinhu_daily` VALUES ('9', '2016-06-06', '端午放假端午放假', '2016-06-17 20:26:27', '2016-10-19 21:27:03', '1', '管理员', '1', null, '1', '2016-06-12', '1');
INSERT INTO `xinhu_daily` VALUES ('10', '2016-06-01', '1、本月主用做信呼系统开发。\n2、信呼APP开发，包括安卓，苹果，接口等。', '2016-06-17 20:27:43', '2016-06-17 20:29:07', '1', '管理员', '2', '1、下月计划信呼官网设计并开发\n2、信呼上线。', '1', '2016-06-30', '1');
INSERT INTO `xinhu_daily` VALUES ('11', '2016-06-24', '1、客户端添加搜索。\n2、添加可上传头像功能。', '2016-06-24 20:34:57', '2016-06-24 20:35:12', '1', '管理员', '0', null, '1', null, '1');
INSERT INTO `xinhu_daily` VALUES ('12', '2016-06-24', '1、修改了自己资料，入职查看相关公司规定。', '2016-06-24 20:39:33', '2016-06-24 20:40:30', '3', '小乔', '0', null, '1', null, '3');
INSERT INTO `xinhu_daily` VALUES ('13', '2016-06-30', '完成了很多任务，呵呵', '2016-06-30 20:15:21', '2016-06-30 20:15:39', '6', '张飞', '0', null, '1', null, '6');
INSERT INTO `xinhu_daily` VALUES ('14', '2016-09-14', '日报修改时间切换等。', '2016-09-14 15:40:38', '2016-09-14 15:40:38', '1', '管理员', '0', null, '1', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_file
-- ----------------------------
INSERT INTO `xinhu_file` VALUES ('5', '1', 'icon150x150.png', null, 'png', '4904', '4.79 KB', 'upload/2016-10/19_1931195786.png', 'upload/2016-10/19_1931195786.png', '4', '大乔', '2016-10-19 19:31:20', '127.0.0.1', 'Chrome', 'word', '5', '0');
INSERT INTO `xinhu_file` VALUES ('12', '1', '背景图.jpg', null, 'jpg', '331861', '324.08 KB', 'images/loginbg.jpg', 'upload/2016-10/20_2010067984.jpg', '1', '管理员', '2016-10-20 20:10:08', '127.0.0.1', 'Chrome', 'word', '13', '0');
INSERT INTO `xinhu_file` VALUES ('8', '1', '系统logo.png', null, 'png', '25651', '25.05 KB', 'images/logo.png', 'upload/2016-10/20_11585028_s.png', '1', '管理员', '2016-10-20 11:58:50', '127.0.0.1', 'Safari', 'word', '8', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_fininfom
-- ----------------------------
INSERT INTO `xinhu_fininfom` VALUES ('1', '0', '1', '12.00', '壹拾贰元整', '2016-05-05 20:19:42', '1', '管理员', '2016-05-05', null, '1', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', null, null);
INSERT INTO `xinhu_fininfom` VALUES ('3', '1', '1', '500.00', '伍佰元整', '2016-09-03 11:43:36', '1', '管理员', '2016-05-05', null, '1', '1', '0', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', '北京会见马云', '聊的不错');
INSERT INTO `xinhu_fininfom` VALUES ('4', '2', '1', '500.00', '伍佰元整', '2016-09-03 15:43:28', '1', '管理员', '2016-05-08', '启动资金', '1', '1', '1', '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴公司', '买房', null);
INSERT INTO `xinhu_fininfom` VALUES ('5', '0', '1', '101.00', '壹佰零壹元整', '2016-09-02 22:54:13', '1', '管理员', '2016-09-02', null, '0', '1', '0', '支付宝', '信呼', 'admin@rockoa.com', '支付宝', null, null);
INSERT INTO `xinhu_fininfom` VALUES ('6', '2', '1', '35000.00', '叁万伍仟元整', '2016-09-03 16:52:52', '1', '管理员', '2016-09-03', null, '1', '1', null, '支付宝', 'RockOA开发团队', 'admin@rockoa.com', '阿里巴巴', '买车', null);
INSERT INTO `xinhu_fininfom` VALUES ('7', '3', '1', '35000.00', '叁万伍仟元整', '2016-09-03 17:17:44', '1', '管理员', '2016-09-03', null, '1', '1', null, '支付宝', 'RockOA开发团队', 'admin@rockoa.com', null, null, null);
INSERT INTO `xinhu_fininfom` VALUES ('8', '0', '1', '20.00', '贰拾元整', '2016-09-28 20:56:02', '1', '管理员', '2016-09-28', null, '0', '1', '0', '支付宝', '信呼开发团队', 'admin@rockoa.com', '阿里巴巴', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_fininfos
-- ----------------------------
INSERT INTO `xinhu_fininfos` VALUES ('1', '5', '0', '2016-09-02', '市内交通费', '12.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('2', '5', '1', '2016-09-02', '停车费', '89.00', null, null);
INSERT INTO `xinhu_fininfos` VALUES ('3', '4', '0', '2016-05-05', '电话费', '500.00', '国外电话费贵啊', null);
INSERT INTO `xinhu_fininfos` VALUES ('4', '3', '0', '2016-09-01', '电话费', '45.00', null, '北京');
INSERT INTO `xinhu_fininfos` VALUES ('5', '3', '1', '2016-09-01', '快递费', '455.00', null, '北京');
INSERT INTO `xinhu_fininfos` VALUES ('6', '8', '0', '2016-09-01', '市内交通费', '20.00', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_bill
-- ----------------------------
INSERT INTO `xinhu_flow_bill` VALUES ('1', 'KA-20160729-0001', 'kqinfo', '1', '5', '请假条', '1', '2016-08-17 22:50:22', '1', '管理员', '4,5', '0', '1', '2016-07-29', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('2', 'KB-20160729-0001', 'kqinfo', '2', '6', '加班单', '1', '2016-07-29 10:56:58', '1', '管理员', '5', '0', '1', '2016-07-29', '磐石通过', '1', null, null, '好的');
INSERT INTO `xinhu_flow_bill` VALUES ('3', 'KA-20160807-0001', 'kqinfo', '3', '5', '请假条', '6', '2016-08-07 18:37:02', '6', '张飞', '4,1', '0', '1', '2016-08-07', '大乔通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('4', 'KA-20160815-0001', 'kqinfo', '4', '5', '请假条', '1', '2016-09-13 16:05:38', '1', '管理员', '5,4', '0', '2', '2016-09-13', '待磐石处理', '0', '5', '磐石', 'as');
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
INSERT INTO `xinhu_flow_bill` VALUES ('18', 'FA-20160902-0001', 'fininfom', '5', '11', '费用报销', '1', '2016-09-12 14:52:28', '1', '管理员', '4,5,2', '0', '2', '2016-09-02', '待大乔处理', '0', '4', '大乔', '12');
INSERT INTO `xinhu_flow_bill` VALUES ('19', 'FA-20160508-0001', 'fininfom', '4', '26', '借款单', '1', '2016-09-03 15:43:28', '1', '管理员', '2,4,5', '0', '1', '2016-05-08', '貂蝉处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('20', 'FB-20160505-0001', 'fininfom', '3', '25', '出差报销', '1', '2016-09-03 11:43:36', '1', '管理员', '2,8,5,4', '0', '1', '2016-05-05', '貂蝉处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('21', 'FC-20160903-0001', 'fininfom', '6', '26', '借款单', '1', '2016-09-03 16:52:52', '1', '管理员', '2,4,5', '0', '1', '2016-09-03', '貂蝉处理通过', '1', null, null, '哈哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('22', 'FD-20160903-0001', 'fininfom', '7', '27', '还款单', '1', '2016-09-03 17:17:44', '1', '管理员', '2,1', '0', '1', '2016-09-03', '貂蝉处理通过', '1', null, null, '哈哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('23', 'GA-20160905-0001', 'official', '1', '19', '发文单', '1', '2016-09-05 20:13:56', '1', '管理员', '3,8,5', '0', '1', '2016-09-05', '小乔处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('24', 'KA-20160908-0001', 'kqinfo', '9', '5', '请假条', '1', '2016-09-12 14:50:07', '1', '管理员', '4,5', '0', '2', '2016-09-08', '待大乔处理', '0', '4', '大乔', '哈哈哈');
INSERT INTO `xinhu_flow_bill` VALUES ('25', 'KA-20160925-0001', 'kqinfo', '11', '5', '请假条', '6', '2016-09-25 16:04:13', '6', '张飞', '1,4,5', '0', '0', '2016-09-25', '待管理员处理', '0', '1', '管理员', null);
INSERT INTO `xinhu_flow_bill` VALUES ('26', 'FA-20160928-0001', 'fininfom', '8', '11', '费用报销', '1', '2016-09-28 20:56:02', '1', '管理员', '5,4,2', '0', '0', '2016-09-28', '待磐石处理', '0', '5', '磐石', null);
INSERT INTO `xinhu_flow_bill` VALUES ('27', 'CD-20160901-0008', 'goodm', '0', '24', '物品领用', '1', '2016-10-06 12:09:58', '0', null, null, '1', '1', '2016-09-01', null, '0', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('28', 'HA-20161006-0001', 'hrpositive', '1', '32', '转正申请', '1', '2016-10-06 20:58:38', '1', '管理员', '4,5', '0', '1', '2016-10-06', '大乔处理通过', '1', null, null, '好哦奥');
INSERT INTO `xinhu_flow_bill` VALUES ('29', 'HB-20161007-0001', 'hrredund', '1', '33', '离职申请', '1', '2016-10-07 11:55:33', '1', '管理员', '5,4', '0', '2', '2016-10-07', '待磐石处理', '0', '5', '磐石', '没事提啥离职啊，我去');
INSERT INTO `xinhu_flow_bill` VALUES ('37', 'HC-20161010-0001', 'hrsalary', '1', '34', '薪资', '1', '2016-10-10 20:13:37', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('38', 'HC-20161010-0002', 'hrsalary', '2', '34', '薪资', '1', '2016-10-10 20:14:07', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('39', 'HC-20161010-0003', 'hrsalary', '3', '34', '薪资', '1', '2016-10-10 20:14:49', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('40', 'HC-20161010-0004', 'hrsalary', '4', '34', '薪资', '1', '2016-10-10 20:15:34', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('41', 'HC-20161010-0005', 'hrsalary', '5', '34', '薪资', '1', '2016-10-10 20:16:13', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('42', 'HC-20161010-0006', 'hrsalary', '15', '34', '薪资', '1', '2016-10-10 21:06:23', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('43', 'HC-20161010-0007', 'hrsalary', '14', '34', '薪资', '1', '2016-10-10 21:06:42', '1', '管理员', null, '0', '0', '2016-10-10', null, '0', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('44', 'HC-20161010-0008', 'hrsalary', '16', '34', '薪资', '1', '2016-10-19 21:24:55', '1', '管理员', '4', '0', '0', '2016-10-10', '待大乔处理', '0', '4', '大乔', null);
INSERT INTO `xinhu_flow_bill` VALUES ('45', 'HC-20161010-0009', 'hrsalary', '13', '34', '薪资', '1', '2016-10-10 21:06:00', '1', '管理员', null, '0', '0', '2016-10-10', null, '0', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('46', 'HC-20161010-0010', 'hrsalary', '11', '34', '薪资', '1', '2016-10-10 21:06:00', '1', '管理员', null, '0', '0', '2016-10-10', null, '0', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('47', 'HE-20161019-0001', 'hrtransfer', '1', '38', '人事调动', '1', '2016-10-19 22:03:12', '1', '管理员', '4', '0', '1', '2016-10-19', '大乔处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('48', 'HD-20161101-0001', 'hrtrsalary', '1', '37', '调薪申请', '1', '2016-10-20 22:20:41', '1', '管理员', '5,4', '0', '0', '2016-11-01', '待磐石处理', '0', '5', '磐石', null);
INSERT INTO `xinhu_flow_bill` VALUES ('49', 'HF-20161020-0001', 'reward', '1', '39', '奖惩处罚', '1', '2016-10-20 21:01:10', '1', '管理员', '4,1', '0', '1', '2016-10-20', '大乔处理通过', '1', null, null, null);
INSERT INTO `xinhu_flow_bill` VALUES ('50', 'HF-20161020-0002', 'reward', '2', '39', '奖惩处罚', '1', '2016-10-20 21:16:24', '1', '管理员', '8,4', '0', '0', '2016-10-20', '待信呼客服处理', '0', '8', '信呼客服', null);

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
  `whereid` smallint(6) DEFAULT '0' COMMENT '模块条件的Id',
  `where` varchar(100) DEFAULT NULL,
  `explain` varchar(100) DEFAULT NULL,
  `optdt` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `courseact` varchar(50) DEFAULT NULL COMMENT '审核动作',
  `checkshu` tinyint(2) DEFAULT '1' COMMENT '至少几人审核 ,0全部',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_course
-- ----------------------------
INSERT INTO `xinhu_flow_course` VALUES ('1', '5', '上级审核', null, 'super', null, null, '0', '0', null, null, '2016-07-02 21:05:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('2', '5', '人事审核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-07-07 22:14:24', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('3', '6', '上级审核', null, 'super', null, null, '0', '0', null, null, '2016-07-02 22:25:29', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('4', '5', '总经理审核', null, 'user', '5', '磐石', '0', '2', null, '超过3天24小时', '2016-09-25 14:53:34', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('5', '23', '上级审核', null, 'super', null, null, '0', '0', null, null, '2016-08-27 08:46:27', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('6', '24', '行政发放', null, 'user', '4', '大乔', '0', '0', null, null, '2016-09-25 17:23:28', '1', '发放,驳回|red', '1');
INSERT INTO `xinhu_flow_course` VALUES ('7', '11', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-09-02 17:36:36', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('8', '11', '人事审核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-02 17:38:15', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('9', '11', '财务审核', null, 'rank', null, '财务总监', '0', '0', null, null, '2016-09-02 17:39:07', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('10', '25', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-09-03 09:26:32', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('11', '25', '人事审核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-03 09:27:00', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('12', '25', '财务审核', null, 'rank', null, '财务总监', '0', '0', null, null, '2016-09-03 09:27:26', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('13', '26', '上级审核', null, 'super', null, null, '0', '0', null, null, '2016-09-03 09:27:55', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('14', '26', '人事审核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-09-03 09:28:18', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('15', '26', '财务审核', null, 'rank', null, '财务总监', '0', '0', null, null, '2016-09-03 09:28:35', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('16', '27', '财务确认', null, 'rank', null, '财务总监', '0', '0', null, null, '2016-09-03 15:29:45', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('17', '27', '付款确认', null, 'apply', null, null, '0', '0', null, null, '2016-09-03 15:32:25', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('18', '27', '确认收款', null, 'rank', null, '财务总监', '0', '0', null, null, '2016-09-03 15:33:23', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('19', '28', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-09-03 19:45:47', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('20', '28', '行政审批', null, 'rank', null, '行政主管', '0', '0', null, null, '2016-09-03 19:46:19', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('21', '19', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-09-04 18:48:23', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('22', '19', '办公室批办', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:46:46', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('23', '19', '领导审批', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:47:03', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('24', '20', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-09-05 18:49:16', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('25', '20', '办公室批办', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:49:41', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('26', '20', '领导审批', null, 'change', null, null, '0', '0', null, null, '2016-09-05 18:49:49', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('27', '32', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-10-06 20:43:27', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('28', '32', '人事审批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 10:24:03', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('29', '33', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-10-07 11:41:01', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('30', '33', '人事审批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 11:41:17', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('31', '34', '人事审核', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-07 19:24:54', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('32', '38', '人事审批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-19 21:48:34', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('33', '37', '上级审批', null, 'super', null, null, '0', '0', null, null, '2016-10-19 22:28:02', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('34', '37', '人事审批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-19 22:28:17', '1', null, '1');
INSERT INTO `xinhu_flow_course` VALUES ('35', '39', '当事人确认', 'objectque', 'auto', null, null, '0', '0', null, null, '2016-10-20 20:52:15', '1', '无异议,不认可', '1');
INSERT INTO `xinhu_flow_course` VALUES ('36', '39', '人事审批', null, 'rank', null, '人事主管', '0', '0', null, null, '2016-10-20 20:53:10', '1', null, '1');

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
  `lens` smallint(6) DEFAULT '0' COMMENT '字段长度',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=311 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_element
-- ----------------------------
INSERT INTO `xinhu_flow_element` VALUES ('1', '1', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('2', '1', '类型名称', 'typename', 'rockcombo', '1', null, '1', 'gongtype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('3', '1', '内容', 'content', 'htmlediter', '2', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('4', '1', '发送给', 'recename', 'changedeptusercheck', '3', null, '0', 'receid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('5', '1', '相应地址', 'url', 'text', '4', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('6', '2', '会议室', 'hyname', 'rockcombo', '0', null, '1', 'hyname', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('7', '2', '主题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('8', '2', '开始时间', 'startdt', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('9', '2', '结束时间', 'enddt', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('10', '2', '参会人', 'joinname', 'changedeptusercheck', '0', null, '1', 'joinid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('11', '2', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('12', '3', '日期', 'dt', 'date', '1', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('13', '3', '日报类型', 'type', 'select', '0', '0', '1', '0|日报,1|周报,2|月报,3|年报', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('14', '3', '截止日期', 'enddt', 'date', '2', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('15', '3', '内容', 'content', 'textarea', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('16', '3', '明日计划', 'plan', 'textarea', '4', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('17', '3', '新增时间', 'adddt', 'hidden', '5', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('18', '3', '操作人', 'optname', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('19', '2', '发起人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('20', '4', '类型', 'type', 'rockcombo', '0', null, '1', 'worktype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('21', '4', '等级', 'grade', 'rockcombo', '0', null, '1', 'workgrade', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('22', '4', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('23', '4', '分配给', 'dist', 'changeusercheck', '0', null, '1', 'distid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('24', '4', '说明', 'explain', 'textarea', '7', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('25', '4', '状态', 'state', 'rockcombo', '10', '0', '1', 'workstate,value', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('26', '4', '创建人', 'optname', 'text', '11', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('27', '4', '创建时间', 'optdt', 'text', '12', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('28', '4', '开始时间', 'startdt', 'datetime', '8', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('29', '4', '截止时间', 'enddt', 'datetime', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('30', '5', '请假', 'kind', 'fixed', '0', '请假', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('31', '5', '请假类型', 'qjkind', 'rockcombo', '0', null, '1', 'kqqjkind', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('32', '5', '开始时间', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('33', '5', '截止时间', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('34', '5', '时间(小时)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('35', '5', '说明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('36', '6', '类型', 'kind', 'fixed', '0', '加班', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('37', '6', '开始时间', 'stime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('38', '6', '截止时间', 'etime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('39', '6', '时间(小时)', 'totals', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('40', '6', '说明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('41', '7', '客户名称', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('42', '7', '所属人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('43', '7', '客户类型', 'type', 'rockcombo', '0', null, '1', 'crmtype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('44', '7', '来源', 'laiyuan', 'rockcombo', '0', null, '1', 'crmlaiyuan', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('45', '7', '客户单位', 'unitname', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('47', '7', '联系电话', 'tel', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('48', '7', '联系手机', 'mobile', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('49', '7', '邮箱', 'email', 'text', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('50', '7', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('51', '7', '地址', 'address', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('52', '7', '交通路线', 'routeline', 'textarea', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('53', '8', '客户', 'custid', 'select', '0', null, '1', 'selectcust', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('54', '8', '客户', 'custname', 'hidden', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('55', '8', '状态', 'state', 'rockcombo', '0', '0', '1', 'crmstate,value', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('56', '8', '说明', 'explain', 'textarea', '2', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('57', '8', '申请日期', 'applydt', 'date', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('58', '8', '来源', 'laiyuan', 'rockcombo', '0', null, '1', 'custsalelai', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('59', '8', '金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('60', '8', '添加时间', 'adddt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('61', '8', '创建人', 'createname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('62', '8', '销售人员', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('63', '9', '名称', 'name', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('64', '9', '对应分类', 'typeid', 'select', '0', null, '1', 'getgoodstype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('65', '9', '规格', 'guige', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('66', '9', '型号', 'xinghao', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('67', '9', '单价', 'price', 'number', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('68', '9', '单位', 'unit', 'rockcombo', '0', null, '1', 'rockunit', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('69', '9', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('70', '10', '用户Id', 'id', 'number', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('71', '10', '姓名', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('72', '10', '部门Id', 'deptid', 'number', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('73', '10', '部门', 'deptname', 'changedept', '1', null, '1', 'deptid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('74', '10', '职位', 'ranking', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('75', '10', '上级主管', 'superman', 'changeusercheck', '1', null, '0', 'superid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('76', '10', '上级主管id', 'superid', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('77', '10', '用户名', 'user', 'text', '0', null, '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('78', '10', '编号', 'num', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('79', '7', '状态', 'status', 'select', '0', '1', '1', '1|启用,0|停用', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('80', '12', '标题', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('81', '12', '时间', 'startdt', 'datetime', '0', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('82', '12', '重复', 'rate', 'select', '0', null, '0', 'd|每天,w|每周,m|每月', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('83', '12', '重复值', 'rateval', 'checkboxall', '0', null, '0', '0|无,1|啊', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('84', '12', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('85', '12', '记事人', 'optname', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('86', '12', '截止时间', 'enddt', 'datetime', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('87', '12', '提醒', 'txsj', 'select', '0', '0', '1', '0|不提醒,1|提醒', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('88', '21', '打卡时间', 'dkdt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('89', '21', '打卡类型', 'type', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('90', '21', '添加时间', 'optdt', 'datetime', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('91', '21', '定位地址', 'address', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('92', '21', '姓名', 'base_name', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('93', '22', '项目类型', 'type', 'rockcombo', '0', null, '1', 'projecttype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('94', '22', '编号', 'num', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('95', '22', '名称', 'title', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('96', '22', '开始时间', 'startdt', 'datetime', '0', '{now}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('97', '22', '预计结束时间', 'enddt', 'datetime', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('98', '22', '负责人', 'fuze', 'changeuser', '0', null, '1', 'fuzeid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('99', '22', '执行人', 'runuser', 'changedeptusercheck', '0', null, '1', 'runuserid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('100', '22', '进度(%)', 'progress', 'select', '0', '0', '1', 'progressdata', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('101', '22', '内容', 'content', 'htmlediter', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('102', '22', '状态', 'state', 'rockcombo', '0', '0', '1', 'projectstate,value', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('103', '23', '类型', 'atype', 'select', '0', '外出', '1', '外出,出差', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('104', '23', '外出地址', 'address', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('105', '23', '外出时间', 'outtime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('106', '23', '预计回岗', 'intime', 'datetime', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('107', '23', '外出理由', 'reason', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('108', '23', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('109', '24', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('110', '24', '类型', 'type', 'fixed', '0', '0', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('111', '24', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('112', '24', '物品', 'aid', 'select', '0', null, '1', 'getgoodsdata', '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('113', '24', '领用数量', 'count', 'number', '0', '0', '1', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('114', '11', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('115', '11', '单据数(张)', 'bills', 'number', '0', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('116', '11', '收款人全称', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('117', '11', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('118', '11', '收款帐号', 'cardid', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('119', '11', '开户行', 'openbank', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('120', '11', '报销金额', 'money', 'text', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('121', '11', '大写金额', 'moneycn', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('122', '11', '发生日期', 'sdt', 'date', '0', null, '1', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('123', '11', '报销项目', 'name', 'rockcombo', '0', null, '1', 'finaitems', '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('124', '11', '金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('125', '11', '说明', 'sm', 'text', '0', null, '0', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('126', '24', '单位', 'unit', 'text', '0', null, '0', null, '0', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('127', '25', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('128', '25', '附单据(张)', 'bills', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('129', '25', '出差目的', 'purpose', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('130', '25', '出差成果', 'purresult', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('131', '25', '收款人全称', 'fullname', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('132', '25', '付款方式', 'paytype', 'rockcombo', '0', '', '1', 'paytype', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('133', '25', '收款帐号', 'cardid', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('134', '25', '开户行', 'openbank', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('135', '25', '报销金额', 'money', 'text', '0', '0', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('136', '25', '大写金额', 'moneycn', 'text', '0', '', '1', '', '1', '1', '', '0', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('137', '25', '发生日期', 'sdt', 'date', '1', '', '1', '', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('138', '25', '报销项目', 'name', 'rockcombo', '2', '', '1', 'finaitems', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('139', '25', '金额', 'money', 'number', '3', '0', '1', '', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('140', '25', '说明', 'sm', 'text', '5', '', '0', '', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('141', '25', '发生地点', 'didian', 'text', '4', null, '0', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('142', '25', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('143', '25', '单据类型', 'type', 'fixed', '0', '2', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('144', '26', '单据类型', 'type', 'fixed', '0', '2', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('145', '26', '申请日期', 'applydt', 'text', '1', '{date}', '1', null, '1', '1', 'readonly', '0', '1', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('146', '26', '借款用途', 'purpose', 'text', '2', null, '1', null, '1', '1', null, '0', '1', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('147', '26', '收款人全称', 'fullname', 'text', '3', null, '1', null, '1', '1', null, '0', '1', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('148', '26', '付款方式', 'paytype', 'rockcombo', '4', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('149', '26', '收款帐号', 'cardid', 'text', '5', null, '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('150', '26', '开户行', 'openbank', 'text', '6', null, '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('151', '26', '借款金额', 'money', 'text', '7', '0', '1', null, '1', '1', null, '0', '1', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('152', '26', '借款金额大写', 'moneycn', 'text', '8', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('153', '26', '说明', 'explain', 'textarea', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('154', '11', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('155', '27', '类型', 'type', 'fixed', '0', '3', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('156', '27', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('157', '27', '付款方式', 'paytype', 'rockcombo', '0', null, '1', 'paytype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('158', '27', '收款人全称', 'fullname', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('159', '27', '收款帐号', 'cardid', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('160', '27', '还款金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('161', '27', '还款金额大学', 'moneycn', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('162', '27', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('163', '27', '需还款金额', 'temp_money', 'auto', '0', null, '0', 'jiekuantongs', '0', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('164', '28', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('165', '28', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('166', '28', '类型', 'type', 'fixed', '0', '1', '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('167', '28', '供应商', 'custid', 'select', '0', null, '1', 'getcustgong', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('168', '28', '供应商名称', 'custname', 'hidden', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('169', '28', '采购金额', 'money', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('170', '28', '物品', 'aid', 'select', '0', '', '1', 'getgoodsdata', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('171', '28', '采购数量', 'count', 'number', '0', '0', '1', '', '1', '1', '', '1', '0', '', '', '0');
INSERT INTO `xinhu_flow_element` VALUES ('172', '28', '单位', 'unit', 'text', '0', null, '0', null, '1', '1', 'readonly', '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('173', '28', '单价', 'price', 'number', '0', '0', '0', null, '1', '1', null, '1', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('174', '7', '是否为供应商', 'isgys', 'checkbox', '0', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('175', '19', '标题', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('176', '19', '副标题', 'titles', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('177', '19', '公文等级', 'grade', 'rockcombo', '1', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('178', '19', '公文类型', 'class', 'rockcombo', '1', null, '1', 'officialclass', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('179', '19', '公文编号', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('180', '19', '公文内容', 'content', 'htmlediter', '1', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('181', '19', '说明', 'explain', 'textarea', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('182', '19', '发给', 'recename', 'changedeptusercheck', '1', null, '1', 'receid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('183', '20', '标题', 'title', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('184', '20', '副标题', 'titles', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('185', '20', '公文等级', 'grade', 'rockcombo', '1', null, '1', 'officialgrade', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('186', '20', '公文类型', 'class', 'rockcombo', '1', null, '1', 'officialclass', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('187', '20', '公文编号', 'num', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('188', '20', '公文内容', 'content', 'htmlediter', '1', null, '0', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('189', '20', '说明', 'explain', 'textarea', '5', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('190', '20', '来源单位', 'recename', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('191', '20', '类型', 'type', 'fixed', '0', '1', '1', null, '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('192', '4', '所属项目', 'projectid', 'select', '6', null, '0', 'projectdata', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('193', '30', '类型', 'kind', 'rockcombo', '1', '请假', '1', 'kqkind', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('199', '30', '对应人员', 'uname', 'changeuser', '0', null, '1', 'uid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('195', '30', '开始时间', 'stime', 'datetime', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('196', '30', '截止时间', 'etime', 'datetime', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('197', '30', '时间(小时)', 'totals', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('198', '30', '说明', 'explain', 'textarea', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('200', '2', '状态', 'state', 'text', '0', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('201', '1', '来源', 'zuozhe', 'text', '5', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('202', '1', '日期', 'indate', 'date', '7', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('203', '29', '电话', 'tel', 'text', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('204', '29', '手机号', 'mobile', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('205', '29', '邮箱', 'email', 'text', '1', null, '0', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('206', '29', '生日类型', 'birtype', 'select', '1', null, '1', '0|阳历,1|农历', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('207', '29', '生日', 'birthday', 'date', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('208', '29', '学历', 'xueli', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('209', '29', '民族', 'minzu', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('210', '29', '籍贯', 'jiguan', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('211', '29', '婚姻', 'hunyin', 'select', '1', null, '1', '未婚,已婚', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('212', '29', '现住址', 'nowdizhi', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('213', '29', '家庭住址', 'housedizhi', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('214', '29', '姓名', 'name', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('215', '29', '部门', 'deptname', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('216', '29', '职位', 'ranking', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('217', '29', '人员状态', 'state', 'select', '0', null, '1', '0|试用期,1|正式,2|实习生,3|兼职,4|临时工,5|离职', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('218', '31', '合同名称', 'name', 'text', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('219', '31', '开始日期', 'startdt', 'date', '4', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('220', '31', '截止日期', 'enddt', 'date', '5', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('221', '31', '合同类型', 'httype', 'rockcombo', '3', null, '1', 'userhttype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('222', '31', '状态', 'state', 'text', '6', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('223', '31', '签署单位', 'company', 'rockcombo', '2', null, '1', 'unitlist', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('224', '31', '签署人', 'uname', 'changeuser', '0', null, '1', 'uid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('225', '31', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('226', '31', '提前终止日期', 'tqenddt', 'date', '9', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('227', '32', '职位', 'ranking', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('228', '32', '入职日期', 'entrydt', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('229', '32', '试用到期日', 'syenddt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('230', '32', '转正日期', 'positivedt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('231', '32', '申请说明', 'explain', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('232', '33', '职位', 'ranking', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('233', '33', '入职日期', 'entrydt', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('234', '33', '离职类型', 'redundtype', 'rockcombo', '0', null, '1', 'redundtype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('235', '33', '离职日期', 'quitdt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('236', '33', '离职原因', 'redundreson', 'textarea', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('237', '33', '说明', 'explain', 'textarea', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('238', '34', '月份', 'month', 'month', '0', '{month}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('239', '34', '对应人', 'uname', 'changeuser', '0', null, '1', 'xuid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('240', '34', '基本工资', 'base', 'number', '1', '1500', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('241', '34', '职位津贴', 'postjt', 'number', '1', '3500', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('242', '34', '技能津贴', 'skilljt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('243', '34', '交通补贴', 'travelbt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('244', '34', '通信补贴', 'telbt', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('245', '34', '实发工资', 'money', 'text', '100', '0', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('246', '34', '对应人员部门', 'udeptname', 'text', '0', '{deptname}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('247', '34', '职位', 'ranking', 'text', '0', '{ranking}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('248', '34', '奖励', 'reward', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('249', '34', '处罚', 'punish', 'number', '40', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('250', '34', '说明', 'explain', 'textarea', '101', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('251', '34', '个人社保', 'socials', 'number', '41', '181', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('252', '34', '个人所得税', 'taxes', 'number', '42', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('253', '29', '开户行', 'bankname', 'text', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('254', '29', '工资卡帐号', 'banknum', 'text', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('255', '34', '其它增加', 'otherzj', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('256', '34', '其它减少', 'otherjs', 'number', '43', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('257', '34', '迟到(次)', 'cidao', 'text', '50', '0', '0', null, '1', '0', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('258', '34', '迟到处罚', 'cidaos', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('259', '34', '早退(次)', 'zaotui', 'text', '50', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('260', '34', '早退处罚', 'zaotuis', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('261', '34', '请假(小时)', 'leave', 'text', '51', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('262', '34', '请假减少', 'leaves', 'number', '51', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('263', '34', '加班(小时)', 'jiaban', 'text', '20', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('264', '34', '加班补贴', 'jiabans', 'number', '20', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('265', '34', '未打卡(次)', 'weidk', 'text', '50', '0', '0', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('266', '34', '未打卡处罚', 'weidks', 'number', '50', '0', '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('267', '35', '客户名称', 'custid', 'select', '1', null, '1', 'selectcust', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('268', '35', '客户名称', 'custname', 'hidden', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('269', '35', '销售机会', 'saleid', 'select', '1', null, '0', 'selectsale', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('270', '35', '签约日期', 'signdt', 'date', '1', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('271', '35', '合同金额', 'money', 'number', '1', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('272', '35', '生效日期', 'startdt', 'date', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('273', '35', '截止日期', 'enddt', 'date', '1', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('274', '35', '合同内容', 'content', 'textarea', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('275', '35', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('276', '35', '合同编号', 'num', 'num', '0', null, '1', 'HT-', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('277', '35', '合同类型', 'type', 'select', '1', '0', '1', '0|收款合同,1|付款合同', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('278', '36', '合同', 'htid', 'select', '0', null, '0', 'hetongdata', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('279', '36', '合同编号', 'htnum', 'hidden', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('280', '36', '客户名称', 'custname', 'hidden', '1', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('281', '36', '类型', 'type', 'select', '2', '0', '1', '0|收款单,1|付款单', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('282', '36', '金额', 'money', 'number', '2', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('283', '36', '说明', 'explain', 'textarea', '20', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('284', '35', '待收/付金额', 'moneys', 'text', '1', null, '0', null, '0', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('285', '36', '客户名称', 'custid', 'select', '1', null, '1', 'selectcust', '1', '0', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('286', '36', '是否付款', 'ispay', 'select', '3', '0', '1', '0|否,1|是', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('287', '36', '收付款时间', 'paydt', 'datetime', '3', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('288', '7', '联系人', 'linkname', 'text', '0', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('289', '36', '所属日期', 'dt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('290', '38', '要调动人', 'tranname', 'changeuser', '0', null, '1', 'tranuid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('291', '38', '调动类型', 'trantype', 'rockcombo', '0', null, '1', 'transfertype', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('292', '38', '原来部门', 'olddeptname', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('293', '38', '原来职位', 'oldranking', 'text', '0', null, '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('294', '38', '调动后部门', 'newdeptname', 'changedept', '0', null, '1', 'newdeptid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('295', '38', '调动后职位', 'newranking', 'text', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('296', '38', '生效日期', 'effectivedt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('297', '38', '说明', 'explain', 'textarea', '10', null, '0', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('298', '37', '调薪幅度', 'floats', 'number', '0', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('299', '37', '生效日期', 'effectivedt', 'date', '0', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('300', '37', '申请日期', 'applydt', 'date', '0', '{date}', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('301', '37', '说明', 'explain', 'textarea', '20', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('302', '37', '职位', 'ranking', 'text', '0', '{ranking}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('303', '39', '奖惩对象', 'object', 'changeuser', '1', null, '1', 'objectid', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('304', '39', '奖惩类型', 'type', 'select', '4', '0', '1', '0|奖励,1|处罚', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('305', '39', '奖惩结果', 'result', 'rockcombo', '5', null, '1', 'rewardresult', '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('306', '39', '奖惩金额', 'money', 'number', '5', '0', '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('307', '39', '说明', 'explain', 'textarea', '10', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('308', '39', '申请日期', 'applydt', 'text', '0', '{date}', '1', null, '1', '1', 'readonly', '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('309', '39', '发生时间', 'happendt', 'datetime', '2', null, '1', null, '1', '1', null, '0', '0', null, null, '0');
INSERT INTO `xinhu_flow_element` VALUES ('310', '39', '发生地点', 'hapaddress', 'text', '3', null, '1', null, '1', '1', null, '0', '0', null, null, '0');

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
  `whereid` smallint(6) DEFAULT '0' COMMENT '条件Id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_extent
-- ----------------------------
INSERT INTO `xinhu_flow_extent` VALUES ('1', '全体人员', 'all', '1', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('2', '全体人员', 'all', '1', '0', 'e3JlY2VpZH0:', '发布给包含我', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('3', '全体人员', 'all', '3', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('4', '全体人员', 'all', '2', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('5', '全体人员', 'all', '2', '0', 'YWxs', '全部数据', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('6', '全体人员', 'all', '3', '0', 'e2FsbHN1cGVyfQ::', '所有下属人员', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('10', '全体人员', 'all', '1', '2', 'b3B0aWQ9e3VpZH0:', '自己发布的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('11', '全体人员', 'all', '2', '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPTA:', '我创建的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('12', '全体人员', 'all', '4', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('13', '全体人员', 'all', '4', '0', 'YWxs', '任何人都可以看到任务', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('14', '全体人员', 'all', '5', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('15', '全体人员', 'all', '6', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('16', '管理员', 'u1', '1', '3', 'b3B0aWQ!MA::', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('17', '全体人员', 'all', '4', '3', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPD4x', '我创建未完成可删除', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('18', '全体人员', 'all', '2', '3', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlIGluKDAsMyk:', '可删除我创建的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('19', '全体人员', 'all', '8', '3', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', '删除自己未成交的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('20', '全体人员', 'all', '7', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('21', '全体人员', 'all', '8', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('22', '全体人员', 'all', '9', '2', 'b3B0aWQ9e3VpZH0:', '本人添加可编辑', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('23', '全体人员', 'all', '4', '2', 'b3B0aWQ9e3VpZH0gYW5kIHN0YXRlPD4x', '创建人可以修改未完成的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('24', '全体人员', 'all', '3', '0', 'dWlkPXt1aWR9', '可查看我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('25', '全体人员', 'all', '8', '0', 'dWlkPXt1aWR9', '可查看我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('26', '全体人员', 'all', '7', '0', 'dWlkPXt1aWR9', '可查看我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('27', '全体人员', 'all', '12', '2', 'dWlkPXt1aWR9', '编辑我自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('28', '全体人员', 'all', '12', '3', 'dWlkPXt1aWR9', '删除自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('29', '全体人员', 'all', '12', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('30', '全体人员', 'all', '12', '0', 'dWlkPXt1aWR9', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('31', '管理员', 'u1', '10', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('32', '管理员', 'u1', '13', '0', 'YWxs', '管理员可查看全部', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('33', '管理员', 'u1', '13', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('34', '管理员', 'u1', '10', '3', 'YWxs', '管理员可删除全部人员', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('35', '管理员', 'u1', '14', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('36', '管理员', 'u1', '14', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('37', '管理员', 'u1', '15', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('38', '管理员', 'u1', '15', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('39', '管理员', 'u1', '16', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('40', '管理员', 'u1', '16', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('41', '管理员', 'u1', '17', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('42', '管理员', 'u1', '17', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('43', '管理员', 'u1', '18', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('44', '管理员', 'u1', '18', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('45', '管理员', 'u1', '9', '3', 'YWxs', '管理可删除全部', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('46', '全体人员', 'all', '24', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('47', '全体人员', 'all', '25', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('48', '全体人员', 'all', '26', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('49', '全体人员', 'all', '7', '2', 'dWlkPXt1aWR9', '可编辑我自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('50', '全体人员', 'all', '22', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('51', '全体人员', 'all', '22', '2', 'b3B0aWQ9e3VpZH0:', '创建人可修改', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('52', '全体人员', 'all', '23', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('53', '全体人员', 'all', '11', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('54', '全体人员', 'all', '27', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('55', '全体人员', 'all', '8', '2', 'dWlkPXt1aWR9IGFuZCBodGlkPTA:', '可编辑自己未创建合同的单子', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('56', '全体人员', 'all', '3', '2', 'dWlkPXt1aWR9', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('57', '全体人员', 'all', '29', '2', 'aWQ9e3VpZH0:', '可编辑自己的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('58', '管理员', 'u1', '29', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('59', '全体人员', 'all', '29', '0', 'aWQ9e3VpZH0:', '可查看自己', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('60', '管理员', 'u1', '31', '0', 'YWxs', '可查看所有人', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('61', '管理员', 'u1', '31', '2', 'YWxs', '管理员可编辑所有人', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('62', '管理员,行政人事部', 'u1,d4', '29', '3', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('63', '全体人员', 'all', '33', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('64', '全体人员', 'all', '32', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('65', '全体人员', 'all', '34', '0', 'eHVpZD17dWlkfQ::', '可查看自己薪资', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('66', '全体人员', 'all', '34', '0', 'b3B0aWQ9e3VpZH0:', '可查看我提交的', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('67', '管理员,信呼客服', 'u1,u8', '34', '0', null, null, '1', '3');
INSERT INTO `xinhu_flow_extent` VALUES ('68', '全体人员', 'all', '35', '1', null, null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('69', '全体人员', 'all', '35', '2', 'dWlkPXt1aWR9IGFuZCBtb25leT1tb25leXM:', '编辑我的合同', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('70', '全体人员', 'all', '36', '2', 'dWlkPXt1aWR9IGFuZCBpc3BheT0w', '未付款前可以编辑', '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('71', '管理员', 'u1', '36', '0', 'YWxs', null, '1', '0');
INSERT INTO `xinhu_flow_extent` VALUES ('72', '全体人员', 'all', '37', '1', null, null, '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=320 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_flow_log` VALUES ('191', 'customer', '3', '1', null, '共享给', '0', '2016-09-09 15:15:03', '共享给:管理员', '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('192', 'customer', '3', '1', null, '共享给', '0', '2016-09-09 15:15:11', '共享给:管理员,张飞', '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('193', 'custsale', '4', '1', null, '跟进', '0', '2016-09-09 23:03:59', '哈哈哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '8', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('194', 'daily', '11', '0', null, '点评', '0', '2016-09-10 14:52:48', '很好啊', '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('195', 'work', '8', '1', null, '提交', '0', '2016-09-10 22:05:52', null, '127.0.0.1', 'Chrome', '管理员', '1', '4', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('196', 'schedule', '3', '1', null, '提交', '0', '2016-09-12 11:43:53', null, '127.0.0.1', 'Chrome', '管理员', '1', '12', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('197', 'kqinfo', '9', '1', null, '追加说明', '0', '2016-09-12 14:38:12', '哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('198', 'kqinfo', '9', '1', null, '追加说明', '0', '2016-09-12 14:45:50', '快去审批吧！', '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('199', 'kqinfo', '9', '2', '不通过', '人事审核', '2', '2016-09-12 14:49:37', '哈哈哈', '127.0.0.1', 'Firefox', '大乔', '4', '5', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('200', 'kqinfo', '9', '1', null, '追加说明', '0', '2016-09-12 14:50:07', '哈哈哈哈', '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('201', 'fininfom', '5', '2', '不通过', '人事审核', '8', '2016-09-12 14:51:29', '12', '127.0.0.1', 'Firefox', '大乔', '4', '11', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('202', 'fininfom', '5', '1', null, '追加说明', '0', '2016-09-12 14:52:28', '为什么不通过？', '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('203', 'fininfom', '5', '1', null, '追加说明', '0', '2016-09-12 14:53:18', '我额外我饿', '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('204', 'meet', '17', '1', null, '提交', '0', '2016-09-12 18:29:03', null, '192.168.1.105', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('205', 'meet', '18', '1', null, '提交', '0', '2016-09-12 18:29:45', null, '192.168.1.105', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('206', 'kqinfo', '10', '1', null, '提交', '0', '2016-09-13 14:03:37', null, '127.0.0.1', 'Chrome', '信呼客服', '8', '30', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('207', 'kqinfo', '4', '1', null, '编辑', '0', '2016-09-13 16:05:38', null, '127.0.0.1', 'Chrome', '管理员', '1', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('208', 'meet', '19', '1', null, '提交', '0', '2016-09-13 22:43:40', null, '127.0.0.1', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('209', 'meet', '19', '1', null, '编辑', '0', '2016-09-13 22:44:21', null, '127.0.0.1', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('210', 'daily', '14', '1', null, '提交', '0', '2016-09-14 15:40:38', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('211', 'daily', '9', '1', null, '编辑', '0', '2016-09-14 16:56:42', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('212', 'infor', '1', '1', null, '编辑', '0', '2016-09-24 17:24:55', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('213', 'infor', '2', '1', null, '编辑', '0', '2016-09-24 17:25:15', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('214', 'infor', '5', '1', null, '提交', '0', '2016-09-24 17:34:17', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('215', 'infor', '6', '1', null, '提交', '0', '2016-09-24 18:15:32', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('216', 'infor', '6', '1', null, '编辑', '0', '2016-09-24 22:40:23', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('217', 'kqinfo', '11', '1', null, '提交', '0', '2016-09-25 15:36:41', null, '127.0.0.1', 'Chrome', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('218', 'kqinfo', '11', '1', null, '编辑', '0', '2016-09-25 16:04:13', null, '127.0.0.1', 'Firefox', '张飞', '6', '5', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('219', 'infor', '6', '1', null, '编辑', '0', '2016-09-27 23:08:05', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('220', 'infor', '6', '1', null, '编辑', '0', '2016-09-27 23:08:51', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('221', 'infor', '5', '1', null, '编辑', '0', '2016-09-27 23:23:58', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('222', 'fininfom', '8', '1', null, '提交', '0', '2016-09-28 20:56:02', null, '127.0.0.1', 'Chrome', '管理员', '1', '11', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('223', 'infor', '5', '1', null, '编辑', '0', '2016-09-28 21:14:25', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('224', 'infor', '5', '1', null, '编辑', '0', '2016-09-28 21:17:10', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('225', 'infor', '5', '1', null, '编辑', '0', '2016-09-28 21:17:37', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('226', 'infor', '7', '1', null, '提交', '0', '2016-09-28 21:19:05', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('227', 'infor', '7', '1', null, '编辑', '0', '2016-09-28 21:20:43', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('228', 'userinfo', '1', '1', null, '编辑', '0', '2016-10-01 19:26:57', null, '127.0.0.1', 'Chrome', '管理员', '1', '29', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('229', 'userinfo', '1', '1', null, '编辑', '0', '2016-10-01 19:57:31', null, '127.0.0.1', 'Chrome', '管理员', '1', '29', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('230', 'userract', '1', '1', null, '提交', '0', '2016-10-06 10:03:26', null, '127.0.0.1', 'Chrome', '管理员', '1', '31', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('231', 'userract', '3', '1', null, '提交', '0', '2016-10-06 11:20:29', null, '127.0.0.1', 'Chrome', '管理员', '1', '31', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('232', 'userract', '3', '2', '终止', '提前终止', '0', '2016-10-06 11:37:02', null, '127.0.0.1', 'Chrome', '管理员', '1', '31', 'gray', '1');
INSERT INTO `xinhu_flow_log` VALUES ('233', 'userract', '1', '1', null, '编辑', '0', '2016-10-06 15:55:18', null, '127.0.0.1', 'Chrome', '管理员', '1', '31', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('234', 'hrpositive', '1', '1', null, '提交', '0', '2016-10-06 20:58:38', null, '127.0.0.1', 'Chrome', '管理员', '1', '32', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('235', 'hrpositive', '1', '1', '通过', '上级审批', '27', '2016-10-07 10:24:33', '表现不错转正吧', '127.0.0.1', 'Chrome', '磐石', '5', '32', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('236', 'hrpositive', '1', '1', '通过', '人事审批', '28', '2016-10-07 10:25:56', '好哦奥', '127.0.0.1', 'Chrome', '大乔', '4', '32', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('237', 'hrredund', '1', '1', null, '提交', '0', '2016-10-07 11:42:01', null, '127.0.0.1', 'Chrome', '管理员', '1', '33', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('238', 'hrredund', '1', '2', '不通过', '上级审批', '29', '2016-10-07 11:55:03', '没事提啥离职啊，我去', '127.0.0.1', 'Chrome', '磐石', '5', '33', 'red', '1');
INSERT INTO `xinhu_flow_log` VALUES ('239', 'hrredund', '1', '1', null, '追加说明', '0', '2016-10-07 11:55:33', '呵呵，想走了', '127.0.0.1', 'Chrome', '管理员', '1', '33', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('262', 'hrsalary', '1', '1', null, '提交', '0', '2016-10-10 20:13:37', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('263', 'hrsalary', '2', '1', null, '提交', '0', '2016-10-10 20:14:07', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('245', 'userinfo', '1', '1', null, '编辑', '0', '2016-10-07 21:39:48', null, '127.0.0.1', 'Chrome', '管理员', '1', '29', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('264', 'hrsalary', '3', '1', null, '提交', '0', '2016-10-10 20:14:49', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('248', 'userinfo', '1', '1', null, '编辑', '0', '2016-10-08 19:36:32', null, '127.0.0.1', 'Chrome', '管理员', '1', '29', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('274', 'custract', '1', '1', null, '编辑', '0', '2016-10-15 10:56:14', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('275', 'custract', '1', '1', null, '编辑', '0', '2016-10-15 10:57:30', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('265', 'hrsalary', '4', '1', null, '提交', '0', '2016-10-10 20:15:34', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('266', 'hrsalary', '5', '1', null, '提交', '0', '2016-10-10 20:15:56', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('267', 'hrsalary', '5', '1', null, '编辑', '0', '2016-10-10 20:16:13', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('268', 'hrsalary', '15', '1', null, '编辑', '0', '2016-10-10 21:06:23', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('269', 'hrsalary', '16', '1', null, '提交', '0', '2016-10-10 21:14:22', null, '127.0.0.1', 'Firefox', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('270', 'hrsalary', '16', '1', null, '编辑', '0', '2016-10-12 22:16:08', null, '127.0.0.1', 'Chrome', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('271', 'custract', '1', '1', null, '提交', '0', '2016-10-12 22:25:02', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('272', 'custract', '1', '1', null, '编辑', '0', '2016-10-12 22:28:48', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('273', 'custract', '2', '1', null, '提交', '0', '2016-10-13 20:18:04', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('276', 'custract', '1', '1', null, '编辑', '0', '2016-10-15 10:58:35', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('277', 'custract', '1', '1', null, '编辑', '0', '2016-10-15 10:58:54', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('278', 'custfina', '1', '1', null, '提交', '0', '2016-10-15 16:24:59', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('279', 'customer', '1', '1', null, '编辑', '0', '2016-10-15 18:12:48', null, '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('280', 'custfina', '1', '0', '已收款', '标已收款', '0', '2016-10-15 18:28:11', '好的', '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('281', 'custfina', '1', '0', '已收款', '标已收款', '0', '2016-10-15 18:36:38', '收到钱了', '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('282', 'custfina', '2', '1', null, '提交', '0', '2016-10-15 18:40:20', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('283', 'custfina', '2', '0', '已付款', '标已付款', '0', '2016-10-15 18:42:12', '呵呵呵', '127.0.0.1', 'Chrome', '管理员', '1', '36', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('284', 'custfina', '2', '0', '已付款', '标已付款', '0', '2016-10-15 18:42:26', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('285', 'custfina', '3', '1', null, '提交', '0', '2016-10-15 19:10:04', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('286', 'custfina', '3', '0', '已收款', '标已收款', '0', '2016-10-15 19:10:22', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('287', 'infor', '6', '1', null, '编辑', '0', '2016-10-15 22:06:30', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('288', 'infor', '6', '1', null, '编辑', '0', '2016-10-15 22:08:49', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('289', 'customer', '5', '1', null, '提交', '0', '2016-10-16 16:00:31', null, '127.0.0.1', 'Chrome', '张飞', '6', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('290', 'custract', '4', '1', null, '提交', '0', '2016-10-16 16:01:06', null, '127.0.0.1', 'Chrome', '张飞', '6', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('291', 'customer', '1', '1', null, '编辑', '0', '2016-10-17 09:23:44', null, '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('292', 'customer', '3', '1', null, '编辑', '0', '2016-10-17 09:24:22', null, '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('293', 'customer', '2', '1', null, '编辑', '0', '2016-10-17 09:24:32', null, '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('294', 'custract', '3', '1', null, '编辑', '0', '2016-10-19 16:02:53', null, '127.0.0.1', 'Chrome', '管理员', '1', '35', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('295', 'custfina', '4', '1', null, '编辑', '0', '2016-10-19 16:05:06', null, '127.0.0.1', 'Chrome', '管理员', '1', '36', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('296', 'hrsalary', '16', '1', null, '编辑', '0', '2016-10-19 19:34:00', null, '127.0.0.1', 'Chrome', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('297', 'meet', '1', '1', null, '提交', '0', '2016-10-19 21:06:14', null, '127.0.0.1', 'Chrome', '管理员', '1', '2', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('298', 'customer', '1', '1', null, '编辑', '0', '2016-10-19 21:24:39', null, '127.0.0.1', 'Chrome', '管理员', '1', '7', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('299', 'hrsalary', '16', '1', null, '编辑', '0', '2016-10-19 21:24:55', null, '127.0.0.1', 'Chrome', '管理员', '1', '34', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('300', 'daily', '9', '1', null, '编辑', '0', '2016-10-19 21:26:03', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('301', 'daily', '9', '1', null, '编辑', '0', '2016-10-19 21:26:33', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('302', 'daily', '9', '1', null, '编辑', '0', '2016-10-19 21:26:50', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('303', 'daily', '9', '1', null, '编辑', '0', '2016-10-19 21:27:03', null, '127.0.0.1', 'Chrome', '管理员', '1', '3', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('304', 'hrtransfer', '1', '1', null, '提交', '0', '2016-10-19 22:03:12', null, '127.0.0.1', 'Chrome', '管理员', '1', '38', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('305', 'hrtransfer', '1', '1', '通过', '人事审批', '32', '2016-10-19 22:04:24', null, '127.0.0.1', 'Chrome', '大乔', '4', '38', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('306', 'hrtrsalary', '1', '1', null, '提交', '0', '2016-10-19 22:37:00', null, '127.0.0.1', 'Chrome', '管理员', '1', '37', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('307', 'reward', '1', '1', null, '提交', '0', '2016-10-20 20:59:42', null, '127.0.0.1', 'Chrome', '管理员', '1', '39', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('308', 'reward', '1', '1', null, '编辑', '0', '2016-10-20 21:01:10', null, '127.0.0.1', 'Chrome', '管理员', '1', '39', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('309', 'reward', '1', '1', '无异议', '当事人确认', '35', '2016-10-20 21:08:27', '谢谢奖励', '127.0.0.1', 'Chrome', '管理员', '1', '39', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('310', 'reward', '2', '1', null, '提交', '0', '2016-10-20 21:16:24', null, '127.0.0.1', 'Chrome', '管理员', '1', '39', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('311', 'reward', '1', '1', '通过', '人事审批', '36', '2016-10-20 21:17:12', null, '127.0.0.1', 'Chrome', '大乔', '4', '39', 'green', '1');
INSERT INTO `xinhu_flow_log` VALUES ('312', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:18:05', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('313', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:18:23', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('314', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:18:39', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('315', 'hrtrsalary', '1', '1', null, '编辑', '0', '2016-10-20 22:20:41', null, '127.0.0.1', 'Chrome', '管理员', '1', '37', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('316', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:24:29', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('317', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:25:38', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('318', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:27:24', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');
INSERT INTO `xinhu_flow_log` VALUES ('319', 'infor', '6', '1', null, '编辑', '0', '2016-10-20 22:27:51', null, '127.0.0.1', 'Chrome', '管理员', '1', '1', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_flow_menu` VALUES ('17', '标为跟进中', 'ztqh', '0', '跟进中', 'blue', '0', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MCBhbmQgaHRpZD0w', null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('18', '标为已成交', 'ztqh', '0', '已成交', 'green', '1', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MQ::', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('19', '标为已丢失', 'ztqh', '0', '已丢失', 'gray', '2', '状态切换', '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZTw!MiBhbmQgaHRpZD0w', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('20', '转移给...', 'zhuan', '0', null, null, '1', null, '8', 'dWlkPXt1aWR9IGFuZCBzdGF0ZT0w', null, '1', '1', '1', '2', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('21', '标为执行中', 'state2', '1', '执行中', 'orange', '2', '进度报告', '22', null, null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('22', '更新进度', 'upprogress', '0', null, null, '0', null, '22', null, null, '1', '1', '0', '4', null, 'progress');
INSERT INTO `xinhu_flow_menu` VALUES ('23', '标为已完成', 'state1', '1', '已完成', 'green', '1', '进度报告', '22', 'c3RhdGU8PjE:', null, '1', '1', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('24', '终止项目', 'state3', '1', '终止', 'gray', '3', '进度报告', '22', 'c3RhdGU8PjM:', null, '1', '1', '1', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('25', '提前终止', null, '0', '终止', 'gray', '2', '提前终止', '31', 'c3RhdGU9MQ::', null, '1', '1', '1', '4', null, 'tqenddt');
INSERT INTO `xinhu_flow_menu` VALUES ('26', '创建收款单', 'cjdaishou', '0', null, 'chocolate', '1', null, '35', 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0w', null, '1', '0', '0', '1', null, null);
INSERT INTO `xinhu_flow_menu` VALUES ('27', '标已收款', 'pay', '0', '已收款', 'green', '0', null, '36', 'dWlkPXt1aWR9IGFuZCB0eXBlPTAgYW5kIGlzcGF5PTA:', null, '1', '1', '1', '4', null, 'paydt');
INSERT INTO `xinhu_flow_menu` VALUES ('28', '标已付款', 'pay', '0', '已付款', 'green', '0', null, '36', 'dWlkPXt1aWR9IGFuZCB0eXBlPTEgYW5kIGlzcGF5PTA:', null, '1', '1', '1', '4', null, 'paydt');
INSERT INTO `xinhu_flow_menu` VALUES ('29', '创建付款单', 'cjdaishou', '0', null, 'chocolate', '1', null, '35', 'dWlkPXt1aWR9IGFuZCBpc292ZXI9MCBhbmQgdHlwZT0x', null, '1', '0', '0', '1', null, null);

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
  `summarx` varchar(500) DEFAULT NULL COMMENT '应用摘要',
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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '1', 'infor', null, '[{typename}]{title}', 'title:[{typename}]{title}\noptdt:{optdt}', '行政', '1', '1', '0', 'XA-Ymd-', '0', 'all', '全体人员', '2016-09-24 19:11:22', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('2', '会议', 'meet', '2', 'meet', null, '[{hyname}]{title},{startdt}→{enddt}', null, '行政', '1', '1', '0', 'XB-Ymd-', '0', 'all', '全体人员', '2016-09-01 21:13:43', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日报', 'daily', '10', 'daily', null, '[{optname}]{content}', 'title:[{optname}]{dt}的{type}\noptdt:{optdt}\ncont:{content}', '基础', '1', '1', '0', 'XC-Ymd-', '0', 'all', '全体人员', '2016-09-24 21:58:37', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('4', '任务', 'work', '12', 'work', null, '[{type}]{title},分配给:{dist}', 'title:{title}\noptdt:{optdt}\ncont:类型：{type}[br]等级：{grade}[br]分配给：{dist}[br]创建者：{optname}[br]截止时间：{enddt}', '基础', '1', '1', '0', null, '0', 'all', '全体人员', '2016-09-25 10:32:18', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('5', '请假条', 'leave', '30', 'kqinfo', 'kind=[F]请假[F]', '[{qjkind}]{stime}→{etime}共{totals}小时,{explain}', null, '考勤', '1', '1', '0', 'KA-Ymd-', '1', 'all', '全体人员', '2016-08-26 23:26:09', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('6', '加班单', 'jiaban', '31', 'kqinfo', 'kind=[F]加班[F]', '{stime}→{stime}共加班{totals}小时,{explain}', null, '考勤', '1', '1', '0', 'KB-Ymd-', '1', 'all', '全体人员', '2016-07-02 22:14:08', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('7', '客户', 'customer', '50', 'customer', null, '{name}', 'title:{name}\noptdt:{optdt}\ncont:来源：{laiyuan}[br]操作人：{optname}[br]共享给：{shate}', 'CRM', '1', '1', '0', 'CA-Ymd-', '0', 'all', '全体人员', '2016-09-25 08:42:17', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('8', '销售机会', 'custsale', '51', 'custsale', null, null, 'title:{custname}\noptdt:{optdt}\ncont:来源：{laiyuan}[br]销售人：{optname}[br]申请日期：{applydt}[br]预计金额：{money}', 'CRM', '1', '1', '0', 'CB-Ymd-', '0', 'all', '全体人员', '2016-09-25 09:01:25', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('9', '物品产品', 'goods', '4', 'goods', null, null, null, '行政', '0', '0', '0', 'CC-Ymd-', '0', 'all', '全体人员', '2016-09-01 20:51:47', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('11', '费用报销', 'finfybx', '90', 'fininfom', 'type=0', '报销：{money},收款人：{fullname}', null, '财务', '1', '1', '0', 'FA-Ymd-', '1', 'all', '全体人员', '2016-09-03 09:38:39', '1', '1', 'fininfos', '报销明细');
INSERT INTO `xinhu_flow_set` VALUES ('10', '用户', 'user', '201', 'admin', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-02 16:42:25', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('12', '备忘记事', 'schedule', '13', 'schedule', null, '{title}', 'title:{title}\noptdt:{optdt}\ncont:时间：{startdt}[br]截止：{enddt}[br]说明：{explain}[br]重复：{rate}{rateval}[br]提醒：{txsj}', '基础', '1', '1', '0', null, '0', 'all', '全体人员', '2016-09-25 11:51:09', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('13', '部门', 'dept', '202', 'dept', null, '{name}', null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 16:44:30', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('14', '系统组', 'group', '203', 'group', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:47:58', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('15', '计划任务', 'task', '204', 'task', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:23:01', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('16', '会话管理', 'huihua', '205', 'im_group', 'type<>2', null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:26:59', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('17', '应用管理', 'yingyong', '206', 'im_group', 'type=2', null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:26:25', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('18', '应用菜单', 'yymenu', '207', 'im_menu', null, null, null, '系统', '0', '0', '0', null, '0', 'u1', '管理员', '2016-08-13 17:27:41', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('19', '发文单', 'officia', '40', 'official', 'type=0', '{num}[{class}]{title}', null, '公文', '1', '1', '0', 'GA-Ymd-', '1', 'all', '全体人员', '2016-09-05 20:18:14', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('20', '收文单', 'officib', '41', 'official', 'type=1', null, null, '公文', '1', '1', '0', 'GB-Ymd-', '1', 'all', '全体人员', '2016-09-04 18:47:00', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('21', '打卡记录', 'kqdkjl', '32', 'kqdkjl', null, null, null, '考勤', '0', '0', '0', null, '0', 'all', '全体人员', '2016-08-13 20:02:23', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('22', '项目', 'project', '11', 'project', null, null, null, '基础', '1', '1', '0', null, '0', 'all', '全体人员', '2016-08-13 21:23:38', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('23', '外出出差', 'waichu', '33', 'kqout', null, '[{atype}]{address}{outtime}', 'title:{optname}[{atype}]{reason}\noptdt:{optdt}\ncont:外出时间：{outtime}[br]预计回岗：{intime}[br]地点：{address}[br]', '考勤', '1', '0', '0', 'KD-Ymd-', '1', 'all', '全体人员', '2016-09-26 22:03:19', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('24', '物品领用', 'goodly', '5', 'goodm', 'type=0', '{explain}', null, '行政', '1', '1', '0', 'CD-Ymd-', '1', 'all', '全体人员', '2016-09-03 09:39:06', '1', '1', 'goodss', '领用物品');
INSERT INTO `xinhu_flow_set` VALUES ('25', '出差报销', 'finccbx', '91', 'fininfom', 'type=1', '报销金额:{money},目的:{purpose},成果:{purresult}', null, '财务', '1', '1', '0', 'FB-Ymd-', '1', 'all', '全体人员', '2016-09-03 11:44:24', '1', '1', 'fininfos', '报销明细');
INSERT INTO `xinhu_flow_set` VALUES ('26', '借款单', 'finjkd', '92', 'fininfom', 'type=2', '借款金额:{money},用途:{purpose}', null, '财务', '1', '1', '0', 'FC-Ymd-', '1', 'all', '全体人员', '2016-09-03 11:44:34', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('27', '还款单', 'finhkd', '93', 'fininfom', 'type=3', '还款金额：{money}，还款方式:{paytype}，还款到：{fullname}', null, '财务', '1', '1', '0', 'FD-Ymd-', '1', 'all', '全体人员', '2016-09-03 15:35:56', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('28', '物品采购', 'caigou', '6', 'goodm', 'type=1', '从[{custname}]采购金额:{money}元', null, '行政', '1', '1', '0', 'CE-Ymd-', '1', 'all', '全体人员', '2016-09-03 22:58:07', '1', '1', 'goodss', '采购物品');
INSERT INTO `xinhu_flow_set` VALUES ('29', '人员档案', 'userinfo', '60', 'userinfo', null, null, null, '人事', '0', '0', '0', null, '0', 'all', '全体人员', '2016-09-11 16:20:26', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('30', '考勤信息', 'leavehr', '34', 'kqinfo', null, null, null, '考勤', '1', '1', '0', null, '0', 'd4', '行政人事部', '2016-09-13 13:46:55', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('31', '员工合同', 'userract', '61', 'userract', null, null, null, '人事', '1', '0', '0', null, '0', 'all', '全体人员', '2016-10-06 09:41:26', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('32', '转正申请', 'hrpositive', '62', 'hrpositive', null, '申请[{positivedt}]转正', null, '人事', '1', '1', '0', 'HA-Ymd-', '1', 'all', '全体人员', '2016-10-06 21:00:30', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('33', '离职申请', 'hrredund', '63', 'hrredund', null, '[{redundtype}],在{quitdt}离职', null, '人事', '1', '1', '0', 'HB-Ymd-', '1', 'all', '全体人员', '2016-10-07 11:42:28', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('34', '薪资', 'hrsalary', '65', 'hrsalary', null, '{uname}[{month}]月份的薪资', null, '人事', '1', '1', '0', 'HC-Ymd-', '1', 'all', '全体人员', '2016-10-07 19:46:00', '1', '0', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('35', '合同', 'custract', '52', 'custract', null, '编号[{num}],客户:{custname},{enddt}到期', null, 'CRM', '0', '0', '0', 'CC-Ymd-', '0', 'all', '全体人员', '2016-10-13 22:31:22', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('36', '收付款单', 'custfina', '53', 'custfina', null, null, null, 'CRM', '0', '0', '0', 'CD-Ymd-', '0', 'all', '全体人员', '2016-10-13 22:31:43', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('37', '调薪申请', 'hrtrsalary', '66', 'hrtrsalary', null, null, null, '人事', '1', '1', '0', 'HD-Ymd-', '1', 'all', '全体人员', '2016-10-19 20:57:04', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('38', '人事调动', 'hrtransfer', '67', 'hrtransfer', null, '[{tranname}]【{trantype}】:{olddeptname}→{newdeptname},{oldranking}→{newranking}', null, '人事', '1', '1', '0', 'HE-Ymd-', '1', 'all', '全体人员', '2016-10-19 20:59:26', '1', '1', null, null);
INSERT INTO `xinhu_flow_set` VALUES ('39', '奖惩处罚', 'reward', '68', 'reward', null, '对【{object}】的{atype},奖惩结果:{result},金额:{money}', null, '人事', '1', '1', '0', 'HF-Ymd-', '1', 'all', '全体人员', '2016-10-20 20:23:39', '1', '1', null, null);

-- ----------------------------
-- Table structure for `xinhu_flow_where`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_flow_where`;
CREATE TABLE `xinhu_flow_where` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `setid` smallint(6) DEFAULT '0' COMMENT '对应模块',
  `num` varchar(30) DEFAULT NULL COMMENT '编号',
  `name` varchar(50) DEFAULT NULL COMMENT '条件名称',
  `wheresstr` varchar(500) DEFAULT NULL COMMENT '对应表条件',
  `whereustr` varchar(500) DEFAULT NULL COMMENT '用户条件',
  `wheredstr` varchar(500) DEFAULT NULL COMMENT '对应部门条件',
  `sort` smallint(6) DEFAULT NULL,
  `explain` varchar(200) DEFAULT NULL,
  `receid` varchar(200) DEFAULT NULL,
  `recename` varchar(200) DEFAULT NULL COMMENT '包含用户',
  `nreceid` varchar(200) DEFAULT NULL,
  `nrecename` varchar(200) DEFAULT NULL COMMENT '不包含用户',
  PRIMARY KEY (`id`),
  KEY `setid` (`setid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_where
-- ----------------------------
INSERT INTO `xinhu_flow_where` VALUES ('1', '1', null, '任何用户的通知公告', 'e3JlY2VpZH0:', null, null, '0', 'receid包含用户', null, null, null, null);
INSERT INTO `xinhu_flow_where` VALUES ('2', '5', null, '大于3天', 'YHRvdGFsc2AgPiAyNA::', null, null, '0', '时间(小时) 大于 24', null, null, null, null);
INSERT INTO `xinhu_flow_where` VALUES ('3', '34', null, '管理员对应开发部', null, null, null, '0', null, 'd2', '开发部', null, null);

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
-- Table structure for `xinhu_hrpositive`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrpositive`;
CREATE TABLE `xinhu_hrpositive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `syenddt` date DEFAULT NULL COMMENT '试用到期日',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_hrpositive
-- ----------------------------
INSERT INTO `xinhu_hrpositive` VALUES ('1', '1', '项目主管', '2016-07-01', '2016-10-01', '2016-10-02', '2016-10-06 20:58:38', '工作认真。', '1', '1', '1', '1', '管理员', '2016-10-06');

-- ----------------------------
-- Table structure for `xinhu_hrredund`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrredund`;
CREATE TABLE `xinhu_hrredund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `ranking` varchar(30) DEFAULT NULL COMMENT '职位',
  `entrydt` date DEFAULT NULL COMMENT '入职日期',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `redundtype` varchar(20) DEFAULT NULL COMMENT '离职类型',
  `redundreson` varchar(100) DEFAULT NULL COMMENT '离职原因',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '0' COMMENT '@0|待审核,1|审核通过,2|审核不通过',
  `isturn` tinyint(1) DEFAULT '0' COMMENT '@0|未提交,1|提交',
  `isover` tinyint(1) DEFAULT '0',
  `optid` int(11) DEFAULT NULL,
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_hrredund
-- ----------------------------
INSERT INTO `xinhu_hrredund` VALUES ('1', '1', '项目主管', '2016-07-01', '2016-10-31', '自动离职', '不想做了，呵呵呵', '2016-10-07 11:42:01', null, '0', '1', '0', '1', '管理员', '2016-10-07');

-- ----------------------------
-- Table structure for `xinhu_hrsalary`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrsalary`;
CREATE TABLE `xinhu_hrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `xuid` smallint(6) DEFAULT '0',
  `uname` varchar(20) DEFAULT NULL COMMENT '对应人',
  `udeptname` varchar(20) DEFAULT NULL COMMENT '对应人员部门',
  `ranking` varchar(20) DEFAULT NULL COMMENT '职位',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `month` varchar(10) NOT NULL COMMENT '月份',
  `base` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '基本工资',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实发',
  `postjt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '职务津贴',
  `skilljt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '技能津贴',
  `travelbt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '交通补贴',
  `telbt` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '通信补贴',
  `reward` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖励',
  `punish` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '处罚',
  `socials` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '个人社保',
  `taxes` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '个人所得税',
  `ispay` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否发放',
  `otherzj` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其它增加',
  `otherjs` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其它减少',
  `cidao` smallint(6) NOT NULL DEFAULT '0' COMMENT '迟到(次)',
  `cidaos` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '迟到处罚',
  `zaotui` smallint(6) NOT NULL DEFAULT '0' COMMENT '早退(次)',
  `zaotuis` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '早退处罚',
  `leave` smallint(6) NOT NULL DEFAULT '0' COMMENT '请假(小时)',
  `leaves` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '请假减少',
  `jiaban` smallint(6) NOT NULL DEFAULT '0' COMMENT '加班(小时)',
  `jiabans` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加班补贴',
  `weidk` smallint(6) NOT NULL DEFAULT '0' COMMENT '未打卡(次)',
  `weidks` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '未打卡减少',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_hrsalary
-- ----------------------------
INSERT INTO `xinhu_hrsalary` VALUES ('1', '1', '5', '磐石', '管理层', '董事长', '2016-10-10 20:13:37', '1', '管理员', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '10269.00', '8500.00', '200.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('2', '1', '1', '管理员', '开发部', '项目主管', '2016-10-10 20:14:07', '1', '管理员', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '8211.00', '6500.00', '20.00', '322.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('3', '1', '9', '李四', '开发部', '程序员', '2016-10-10 20:14:49', '1', '管理员', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '9139.00', '5500.00', '2000.00', '300.00', '20.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('4', '1', '4', '大乔', '行政人事部', '人事主管', '2016-10-10 20:15:34', '1', '管理员', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '6069.00', '3500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('5', '1', '3', '小乔', '财务部', '出纳', '2016-10-10 20:16:13', '1', '管理员', '2016-10-10', null, '0', '1', '2016-08', '1500.00', '5069.00', '2500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('11', '1', '5', '磐石', '管理层', '董事长', '2016-10-10 21:06:00', '1', '管理员', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '10269.00', '8500.00', '200.00', '200.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('12', '1', '1', '管理员', '开发部', '项目主管', '2016-10-10 21:06:00', '1', '管理员', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '8211.00', '6500.00', '20.00', '322.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('13', '1', '9', '李四', '开发部', '程序员', '2016-10-10 21:06:00', '1', '管理员', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '9139.00', '5500.00', '2000.00', '300.00', '20.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('14', '1', '4', '大乔', '行政人事部', '人事主管', '2016-10-10 21:06:00', '1', '管理员', '2016-10-10', null, '0', '0', '2016-09', '1500.00', '6069.00', '3500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '0.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('15', '1', '3', '小乔', '财务部', '出纳', '2016-10-10 21:06:23', '1', '管理员', '2016-10-10', null, '0', '1', '2016-09', '1500.00', '5069.00', '2500.00', '1000.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');
INSERT INTO `xinhu_hrsalary` VALUES ('16', '1', '2', '貂蝉', '财务部', '财务总监', '2016-10-19 21:24:55', '1', '管理员', '2016-10-10', '2016-08-08入职;', '0', '1', '2016-08', '1500.00', '5569.00', '3500.00', '500.00', '200.00', '50.00', '0.00', '0.00', '181.00', '0.00', '0', '0.00', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00', '0', '0.00');

-- ----------------------------
-- Table structure for `xinhu_hrtransfer`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrtransfer`;
CREATE TABLE `xinhu_hrtransfer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `tranuid` smallint(6) DEFAULT '0',
  `tranname` varchar(20) DEFAULT NULL COMMENT '要调动人',
  `trantype` varchar(20) DEFAULT NULL COMMENT '调动类型',
  `olddeptname` varchar(50) DEFAULT NULL COMMENT '原来部门',
  `oldranking` varchar(20) DEFAULT NULL COMMENT '原来职位',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `newdeptname` varchar(50) DEFAULT NULL COMMENT '调动后部门',
  `newdeptid` smallint(6) DEFAULT NULL,
  `newranking` varchar(20) DEFAULT NULL COMMENT '调动后职位',
  `isover` tinyint(1) DEFAULT '0' COMMENT '是否已完成',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_hrtransfer
-- ----------------------------
INSERT INTO `xinhu_hrtransfer` VALUES ('1', '1', '2016-10-19 22:03:12', '1', '管理员', '2016-10-19', null, '1', '1', '5', '磐石', '平调', '管理层', '董事长', '2016-10-19', '财务部', '3', 'CEO', '1');

-- ----------------------------
-- Table structure for `xinhu_hrtrsalary`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_hrtrsalary`;
CREATE TABLE `xinhu_hrtrsalary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `effectivedt` date DEFAULT NULL COMMENT '生效日期',
  `floats` smallint(6) DEFAULT '0' COMMENT '调薪幅度',
  `ranking` varchar(20) DEFAULT NULL COMMENT '职位',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_hrtrsalary
-- ----------------------------
INSERT INTO `xinhu_hrtrsalary` VALUES ('1', '1', '2016-10-20 22:20:41', '1', '管理员', '2016-11-01', '122121', '0', '1', '2016-10-19', '500', '项目主管');

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_im_group` VALUES ('15', '流程申请', '0', '2', '10', null, null, null, 'images/flow.png', 'flow', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('16', '流程待办', '0', '2', '11', null, null, null, 'images/daiban.png', 'daiban', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('17', '客户管理', '18', '2', '0', null, null, null, 'images/crm.png', 'customer', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('18', 'CRM客户', '0', '2', '12', null, null, null, 'images/crm.png', null, null, null, null, '1', null);
INSERT INTO `xinhu_im_group` VALUES ('19', '销售机会', '18', '2', '0', null, null, null, 'images/sale.png', 'custsale', null, null, 'auto', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('20', '文档', '0', '2', '2', null, null, null, 'images/folder.png', 'word', null, null, 'buin', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('21', '备忘记事', '0', '2', '3', null, null, null, 'images/bwl2.png', 'schedule', null, null, 'buin', '1', null);
INSERT INTO `xinhu_im_group` VALUES ('24', '外出出差', '0', '2', '6', null, null, null, 'images/waichu.png', 'waichu', null, null, 'auto', '1', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_groupuser
-- ----------------------------
INSERT INTO `xinhu_im_groupuser` VALUES ('2', '2', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('32', '5', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('19', '0', '0', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('33', '2', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('31', '5', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('12', '2', '5', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('13', '2', '6', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('14', '2', '7', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('15', '2', '3', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('16', '2', '4', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('28', '5', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('21', '14', '1', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('22', '14', '5', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('23', '2', '8', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('26', '14', '2', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('27', '2', '9', '1');
INSERT INTO `xinhu_im_groupuser` VALUES ('39', '5', '3', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('1', 'group', '2', '1', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '0');
INSERT INTO `xinhu_im_history` VALUES ('2', 'group', '2', '2', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('3', 'group', '2', '5', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('4', 'group', '2', '6', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('5', 'group', '2', '7', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '0');
INSERT INTO `xinhu_im_history` VALUES ('6', 'group', '2', '3', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '1');
INSERT INTO `xinhu_im_history` VALUES ('7', 'group', '2', '4', '8', '2016-09-08 23:38:17', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '0');
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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_im_menu` VALUES ('37', '17', '40', '已停用客户', '0', '0', 'my_ting', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('41', '17', '0', '新增客户', '2', '1', 'add_customer', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('39', '17', '40', '我所有客户', '0', '0', 'my_all', null, null);
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
INSERT INTO `xinhu_im_menu` VALUES ('52', '20', '0', '分享的', '1', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('53', '21', '0', '记事', '0', '0', null, null, null);
INSERT INTO `xinhu_im_menu` VALUES ('54', '21', '53', '当月', '0', '0', 'nowmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('55', '21', '53', '下月', '0', '0', 'nextmonth', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('56', '21', '0', '记事管理', '0', '0', 'guan', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('57', '21', '0', '新增记事', '0', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('58', '24', '0', '今日外出', '0', '0', 'mytoday', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('59', '24', '0', '＋新增', '2', '1', 'add', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('60', '24', '0', '所有外出', '1', '0', 'myall', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('61', '20', '52', '我分享的', '0', '0', 'shate', null, null);
INSERT INTO `xinhu_im_menu` VALUES ('62', '20', '52', '分享给我的', '0', '0', 'fxgw', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_mess
-- ----------------------------
INSERT INTO `xinhu_im_mess` VALUES ('1', '2016-09-08 23:38:17', '1', '5qyi6L!O5L2.55So77yM5pyJ5ZWl6Zeu6aKY6L!Z6YeM6K!05ZCn77yB', '8', '2', '2,5,6,7,3,4,8,9', 'group', null, '0', null);
INSERT INTO `xinhu_im_mess` VALUES ('2', '2016-09-12 19:19:46', '1', 'MTI:', '4', '4', '4,4', 'user', null, '0', null);
INSERT INTO `xinhu_im_mess` VALUES ('3', '2016-10-17 19:51:45', '1', 'W!WbvueJhyA0LjY1IEtCXQ::', '1', '1', '1,1', 'user', null, '2', null);
INSERT INTO `xinhu_im_mess` VALUES ('4', '2016-10-17 19:54:24', '1', 'W!WbvueJhyA0Ljc5IEtCXQ::', '1', '1', '1,1', 'user', null, '3', null);
INSERT INTO `xinhu_im_mess` VALUES ('5', '2016-10-17 19:57:15', '1', 'W!WbvueJhyA4Ni42MSBLQl0:', '1', '1', '1,1', 'user', null, '4', null);
INSERT INTO `xinhu_im_mess` VALUES ('6', '2016-10-17 20:24:25', '1', 'W!WbvueJhyAxMi4xMSBLQl0:', '1', '1', '1,1', 'user', null, '5', null);

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
INSERT INTO `xinhu_im_messzt` VALUES ('2', '1', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('3', '1', '3', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('5', '1', '5', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('6', '1', '6', '2');
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
  `zuozhe` varchar(30) DEFAULT NULL COMMENT '发布者',
  `indate` date DEFAULT NULL COMMENT '日期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_infor
-- ----------------------------
INSERT INTO `xinhu_infor` VALUES ('1', '欢迎使用信呼工作台', '2016-09-24 17:24:55', '通知公告', '<p>\n	欢迎使用，有任何问题可以随时联系我们，帮你解答哦。&nbsp;\n</p>\n<p>\n	信呼是一款开源免费的工作台软件，可添加应用，管理，pc上，app都可以使用，我们的代码全部开放，可自由使用。\n</p>', null, null, null, '1', '管理员', null, null, '信呼开发团队', '2016-08-01');
INSERT INTO `xinhu_infor` VALUES ('2', '关于写日报制度说明', '2016-09-24 17:25:15', '规则制度', '<p>\n	1、每个人工作日在下班后必须写工作日报，全天请假可不用写，只要有上班就需要写，即使你上班1分钟。\n</p>\n<p>\n	2、也可以隔天写。\n</p>\n<p>\n	<strong>未写处罚</strong> \n</p>\n<p>\n	1、未写一次扣五块，累计加倍。\n</p>', null, null, null, '1', '管理员', null, null, '人力行政部', '2016-08-01');
INSERT INTO `xinhu_infor` VALUES ('5', '关于管理员的奖励公告', '2016-09-28 21:17:37', '奖惩', '<p>\n	管理员是一个开发的人，配合开发信呼系统功能，积极做到一下几点：\n</p>\n<p>\n	1、不怕辛苦，不畏艰险，天天加班到凌晨。\n</p>\n<p>\n	2、做好每个功能的使用。\n</p>\n<p>\n	3、积极配合。\n</p>\n<p>\n	根据以上几点给管理员作出一下奖励：\n</p>\n<p>\n	1、人民币：50W元。\n</p>\n<p>\n	2、兰博基尼大牛一辆。\n</p>\n<p>\n	3、南海别墅一栋。\n</p>', null, null, null, '1', '管理员', null, null, '信呼开发团队', '2016-09-24');
INSERT INTO `xinhu_infor` VALUES ('6', '信呼更新发布V1.1.7版本', '2016-10-20 22:27:51', '通知公告', '<p>\n	版本添加了发布如下功能。\n</p>\n<p>\n	1、添加人事薪资管理。\n</p>\n<p>\n	2、完善CRM客户管理模块功能。\n</p>', null, null, null, '1', '管理员', null, null, '开发部', '2016-10-30');
INSERT INTO `xinhu_infor` VALUES ('7', '恭喜[信呼]获得天使投资', '2016-09-28 21:20:43', '通知公告', '<p>\n	恭喜【信呼】开源办公系统获得天使投资。\n</p>\n<p>\n	投资方：信呼开发团队。\n</p>\n<p>\n	投资金额：2100元。\n</p>\n<p>\n	感谢对我们的支持和投资，我们会做得更好！\n</p>', null, null, null, '1', '管理员', null, null, '开发部', '2016-09-28');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_kqdkjl` VALUES ('42', '1', '2016-09-11 14:15:14', '2016-09-11 14:15:14', '0', null, null, null, '0', '192.168.1.105', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('43', '1', '2016-09-26 20:37:17', '2016-09-26 20:37:17', '0', null, null, null, '0', '192.168.1.101', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('44', '1', '2016-10-01 18:09:18', '2016-10-01 18:09:18', '0', null, null, null, '0', '192.168.1.101', null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('45', '1', '2016-10-08 07:12:26', '2016-10-08 23:12:31', '3', null, null, null, '0', null, null, null);
INSERT INTO `xinhu_kqdkjl` VALUES ('46', '1', '2016-10-08 17:12:48', '2016-10-08 23:12:55', '3', null, null, null, '0', null, null, null);

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
  `kind` varchar(10) DEFAULT NULL COMMENT '类型',
  `qjkind` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `explain` varchar(200) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `totals` decimal(6,1) DEFAULT '0.0' COMMENT '时间',
  `optdt` datetime DEFAULT NULL,
  `isturn` tinyint(1) DEFAULT '0' COMMENT '是否提交',
  `optname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_kqinfo
-- ----------------------------
INSERT INTO `xinhu_kqinfo` VALUES ('1', '1', null, '2016-07-29 10:52:51', '2016-07-29 18:52:54', '请假', '事假', '下午请假去骑车兜风啊！', '1', '6.0', '2016-07-29 10:53:11', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('2', '1', null, '2016-07-27 19:00:00', '2016-07-27 23:00:00', '加班', null, '老板说我能做事就多加班，呵呵呵！', '1', '4.0', '2016-07-29 10:56:58', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('3', '6', null, '2016-08-08 09:00:00', '2016-08-08 18:36:40', '请假', '年假', '辛辛苦苦一年终于有一天年假啦，请一下吧！', '1', '8.0', '2016-08-07 18:37:02', '1', '张飞');
INSERT INTO `xinhu_kqinfo` VALUES ('4', '1', null, '2016-08-30 09:00:00', '2016-08-31 18:00:00', '请假', '事假', '年底年假休息！', '0', '16.0', '2016-09-13 16:05:38', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('5', '1', null, '2016-08-25 08:00:00', '2016-08-25 18:01:35', '请假', '事假', '请假1条', '1', '8.0', '2016-08-25 16:01:52', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('6', '8', null, '2016-08-01 08:44:45', '2016-08-02 22:44:54', '请假', '事假', '请假2天去玩喽', '1', '24.0', '2016-08-26 22:45:35', '1', '信呼客服');
INSERT INTO `xinhu_kqinfo` VALUES ('7', '1', null, '2016-08-28 14:06:25', '2016-08-28 16:06:33', '加班', null, '人傻要多加班！', '1', '2.0', '2016-08-27 14:06:56', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('8', '6', null, '2016-08-02 08:02:21', '2016-08-02 20:02:23', '请假', '事假', '请假啦', '1', '8.0', '2016-08-30 20:12:33', '1', '张飞');
INSERT INTO `xinhu_kqinfo` VALUES ('9', '1', null, '2016-09-08 17:45:57', '2016-09-09 17:46:00', '请假', '事假', '嗯嗯嗯。', '0', '9.0', '2016-09-08 21:14:14', '1', '管理员');
INSERT INTO `xinhu_kqinfo` VALUES ('10', '8', '信呼客服', '2016-09-01 00:02:42', '2016-09-30 14:02:46', '增加年假', null, '入职一年年假', '1', '5.0', '2016-09-13 14:03:37', '0', '信呼客服');
INSERT INTO `xinhu_kqinfo` VALUES ('11', '6', null, '2016-09-27 08:36:19', '2016-09-30 23:36:27', '请假', '事假', '国庆请假啦', '0', '32.0', '2016-09-25 16:04:13', '1', '张飞');

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
INSERT INTO `xinhu_kqout` VALUES ('1', '1', '2016-09-27 08:00:00', '2016-09-27 15:22:42', '火车站', '接人啊', '外出', null, '2016-08-27 15:22:51', '1', '1', '1', '管理员', '2016-08-27', '0', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_kqxxsj` VALUES ('22', null, '2016-10-01', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('23', null, '2016-10-02', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('33', null, '2016-10-04', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('32', null, '2016-10-03', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('26', null, '2016-10-15', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('27', null, '2016-10-16', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('28', null, '2016-10-22', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('29', null, '2016-10-23', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('30', null, '2016-10-29', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('37', null, '2016-10-30', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('34', null, '2016-10-05', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('35', null, '2016-10-06', '1');
INSERT INTO `xinhu_kqxxsj` VALUES ('36', null, '2016-10-07', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_meet
-- ----------------------------
INSERT INTO `xinhu_meet` VALUES ('1', '会客室', '聊人生开会', '2016-10-20 09:00:00', '2016-10-20 10:00:00', '2', '1', '0', 'd1', '信呼开发团队', '0', '管理员', null, '1', '2016-10-19 21:06:14', '1', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_menu` VALUES ('14', '信呼', '0', '3', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('15', '应用管理', '14', '4', 'main,yingyong', 'th-large', null, 'yingyong', '1', '1', '#1ABC9C', '0');
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
INSERT INTO `xinhu_menu` VALUES ('27', '人事行政', '0', '5', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('28', '物品产品', '27', '5', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('29', '分类选项管理', '28', '0', 'system,option,num=goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('30', '物品产品列表', '28', '0', 'main,goods', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('31', '物品出入库详情', '28', '0', 'main,goods,xiang', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('32', '考勤设置', '27', '10', null, 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('33', '打卡记录', '57', '0', 'main,kaoqin,dkjl,atype=all', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('34', '单据操作菜单', '7', '7', 'main,flow,menu', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('36', '考勤信息', '57', '1', 'main,kaoqin,info', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('37', '报表', '0', '9', null, 'bar-chart', null, null, '1', '0', null, '0');
INSERT INTO `xinhu_menu` VALUES ('38', '个人办公', '0', '0', null, 'desktop', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('39', '个人中心', '38', '0', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('40', '工作流程', '38', '5', null, 'book', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('41', '我的申请', '40', '2', 'main,fwork,bill,atype=my', 'align-left', null, 'applymy', '0', '1', null, '0');
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
INSERT INTO `xinhu_menu` VALUES ('57', '考勤信息', '27', '11', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('58', '考勤分析', '57', '2', 'main,kaoqin,anay', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('59', '我的考勤', '38', '3', null, 'time', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('60', '考勤统计', '57', '3', 'main,kaoqin,total,atype=all', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('61', '人员考勤设置', '32', '0', 'main,kaoqin,kqcog', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('62', '经我处理', '40', '4', 'main,fwork,bill,atype=jmy', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('63', '客户', '0', '2', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('64', '客户', '63', '0', 'main,customer,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('65', '我的任务', '80', '0', 'main,work,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('66', '任务', '0', '1', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('67', '我未完成任务', '80', '0', 'main,work,list,atype=wwc', 'book', null, 'workwwc', '0', '1', '#BFC462', '1');
INSERT INTO `xinhu_menu` VALUES ('68', '我创建任务', '80', '0', 'main,work,list,atype=wcj', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('69', '我执行的项目', '79', '2', 'main,work,project,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('70', '我未完成项目', '79', '2', 'main,work,project,atype=wwc', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('71', '我创建的项目', '79', '3', 'main,work,project,atype=mycj', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('72', '我负责的项目', '79', '2', 'main,work,project,atype=myfz', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('73', '销售机会', '63', '1', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('74', '我申请未通过', '40', '2', 'main,fwork,bill,atype=mywtg', 'info-sign', null, 'applywtg', '0', '1', '#B67FF4', '1');
INSERT INTO `xinhu_menu` VALUES ('75', '共享给我的', '64', '1', 'main,customer,list,atype=shatemy', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('76', '工作日报', '38', '4', null, 'edit', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('77', '我的日报', '76', '0', 'main,daily,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('78', '我下属日报', '76', '0', 'main,daily,list,atype=undall', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('79', '项目', '66', '0', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('80', '任务', '66', '0', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('81', '所有任务一览', '80', '10', 'main,work,list,atype=all', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('82', '所有项目一览', '79', '10', 'main,work,project,atype=all', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('83', '我下属任务', '80', '0', 'main,work,list,atype=down', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('84', '人事管理', '27', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('85', '人员档案', '84', '0', 'main,userinfo,list', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('86', '我的考勤表', '59', '0', 'main,kaoqin,geren', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('87', '我的考勤信息', '59', '2', 'main,kaoqin,kqinfo,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('88', '我的考勤统计', '59', '3', 'main,kaoqin,total,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('89', '会议', '38', '0', 'main,fwork,meet,atype=my', 'flag', null, 'meet', '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('90', '通知公告', '38', '0', 'system,infor,geren', 'volume-up', null, 'gong', '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('91', '流程模块条件', '7', '8', 'main,flow,where', 'asterisk', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('92', '我的打卡记录', '59', '1', 'main,kaoqin,dkjl,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('93', '我的定位打卡', '59', '5', 'main,kaoqin,location,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('94', '外勤定位', '57', '0', 'main,kaoqin,location,atype=all', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('95', '员工合同', '84', '0', 'main,userinfo,hetong', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('96', '转正申请', '84', '0', 'main,userinfo,zhuan', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('97', '离职申请', '84', '0', 'main,userinfo,lizhi', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('98', '薪资管理', '27', '0', null, 'money', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('99', '薪资核算', '98', '0', 'main,salary,list', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('100', '提醒信息', '39', '0', 'system,geren,todo', 'bell', null, 'todo', '0', '1', '#EFBB62', '1');
INSERT INTO `xinhu_menu` VALUES ('101', '个人资料', '39', '0', 'main,userinfo,geren', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('102', '薪资发放', '98', '0', 'main,salary,fafang', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('103', '系统信息', '46', '0', 'system,cog,sysinfo', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('104', '合同', '63', '2', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('105', '收款单', '63', '3', null, 'money', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('106', '我的收款单', '105', '0', 'main,customer,fina,atype=myskd', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('107', '我的付款单', '118', '0', 'main,customer,fina,atype=myfkd', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('108', '我的合同', '104', '0', 'main,customer,ract,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('109', '我下属的合同', '104', '0', 'main,customer,ract,atype=down', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('110', '我销售机会', '73', '0', 'main,customer,sale,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('111', '我下属销售机会', '73', '0', 'main,customer,sale,atype=down', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('112', '我的客户', '64', '0', 'main,customer,list,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('113', '我下属客户', '64', '2', 'main,customer,list,atype=down', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('114', '统计', '63', '5', null, 'bar-chart', null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('115', '我的财务统计', '114', '0', 'main,customer,total,atype=my', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('116', '我下属财务统计', '114', '0', 'main,customer,total,atype=down', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('117', '我年度统计', '114', '0', 'main,customer,totalge', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('118', '付款单', '63', '4', null, null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('119', '我下属收款单', '105', '0', 'main,customer,fina,atype=downskd', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('120', '我下属付款单', '118', '0', 'main,customer,fina,atype=downfkd', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('121', '所有收款单', '105', '0', 'main,customer,fina,atype=allskd', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('122', '所有付款单', '118', '0', 'main,customer,fina,atype=allfkd', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('123', '客户分配', '64', '6', 'main,customer,dist', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('19', '文档', '0', '0', null, null, null, 'word', '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('124', '文档管理', '19', '0', 'system,word,guan', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('125', '共享的文档', '19', '0', 'system,word,shate', null, null, null, '0', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('126', '知识管理', '19', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('127', '知识列表', '126', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('128', '人事调动', '84', '0', 'main,userinfo,diao', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('129', '调薪申请', '84', '0', 'main,userinfo,dxin', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('130', '奖惩处罚', '84', '0', 'main,userinfo,reward', null, null, null, '1', '1', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_option
-- ----------------------------
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
INSERT INTO `xinhu_option` VALUES ('14', '自定义', '6', null, 'auto', '19', null, '1', null, '0');
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
INSERT INTO `xinhu_option` VALUES ('32', '任务类型', '151', 'worktype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('33', '任务等级', '151', 'workgrade', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('34', 'bug', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('35', '改进', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('36', '设计', '32', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('37', '低', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('38', '中', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('39', '高', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('40', '紧急', '33', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('41', '任务状态', '151', 'workstate', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('42', '待执行', '41', null, '0', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('43', '执行中', '41', null, '2', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('44', '已完成', '41', null, '1', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('45', '中止', '41', null, '3', '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('46', '请假类型', '144', 'kqqjkind', null, '0', null, '1', null, '0');
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
INSERT INTO `xinhu_option` VALUES ('86', '文件夹目录', null, 'folder1', null, '0', null, '1', '2016-10-21 09:02:22', '1');
INSERT INTO `xinhu_option` VALUES ('87', '技术文档', '86', null, null, '0', null, '1', '2016-08-08 22:07:41', '1');
INSERT INTO `xinhu_option` VALUES ('88', '需求文档', '86', null, null, '0', null, '1', '2016-08-08 22:08:27', '1');
INSERT INTO `xinhu_option` VALUES ('89', '图片', '86', null, null, '0', null, '1', '2016-08-08 22:44:10', '1');
INSERT INTO `xinhu_option` VALUES ('92', '文件夹目录', null, 'folder3', null, '0', null, '1', '2016-10-19 19:30:59', '3');
INSERT INTO `xinhu_option` VALUES ('93', '个人文件', '92', null, null, '0', null, '1', '2016-08-09 13:57:06', '3');
INSERT INTO `xinhu_option` VALUES ('95', 'js文档', '87', null, null, '0', null, '1', '2016-08-09 22:20:23', '1');
INSERT INTO `xinhu_option` VALUES ('94', 'php文档', '87', null, null, '0', null, '1', '2016-08-09 22:20:17', '1');
INSERT INTO `xinhu_option` VALUES ('98', '文件夹目录', null, 'folder4', null, '0', null, '1', '2016-10-19 19:31:27', '4');
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
INSERT INTO `xinhu_option` VALUES ('128', '文件夹目录', null, 'folder8', null, '0', null, '1', '2016-10-01 17:57:12', '8');
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
INSERT INTO `xinhu_option` VALUES ('143', '服务文档', '128', null, null, '0', null, '1', '2016-09-13 11:32:22', '8');
INSERT INTO `xinhu_option` VALUES ('144', '考勤选项', '1', 'kaoqin', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('145', '人事考勤类型', '144', 'kqkind', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('146', '增加年假', '145', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('147', '增加哺乳假', '145', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('148', '增加陪产假', '145', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('149', '奖惩', '26', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('150', '文件夹目录', null, 'folder9', null, '0', null, '1', '2016-10-01 18:38:06', '9');
INSERT INTO `xinhu_option` VALUES ('151', '任务选项', '1', 'work', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('152', '单位列表', '1', 'unitlist', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('153', '信呼开发团队', '152', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('154', '人事选项', '1', 'usertype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('155', '学历', '154', 'xueli', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('156', '小学', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('157', '初中', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('158', '高中', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('159', '中专', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('160', '大专', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('161', '本科', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('162', '自考本科', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('163', '研究生', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('164', '博士', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('165', '其它', '155', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('166', '合同类型', '154', 'userhttype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('167', '劳动合同', '166', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('168', '离职类型', '154', 'redundtype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('169', '自动离职', '168', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('170', '退休', '168', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('171', '病辞', '168', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('172', '辞退', '168', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('173', '辞职', '168', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('174', '月份', '6', null, 'month', '17', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('175', '编号', '6', null, 'num', '18', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('176', '客户类型', '50', 'crmtype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('177', '互联网', '176', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('178', '软件', '176', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('179', '个体经营', '176', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('180', '个人', '176', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('181', '其它', '176', null, null, '20', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('182', '政府机构', '176', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('183', '人事调动类型', '154', 'transfertype', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('184', '平调', '183', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('185', '晋升', '183', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('186', '降职', '183', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('190', '奖惩结果', '154', 'rewardresult', null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('191', '奖励', '190', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('192', '警告', '190', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('193', '辞退', '190', null, null, '0', null, '1', null, '0');
INSERT INTO `xinhu_option` VALUES ('194', '降职', '190', null, null, '0', null, '1', null, '0');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_reads
-- ----------------------------

-- ----------------------------
-- Table structure for `xinhu_reward`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_reward`;
CREATE TABLE `xinhu_reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作时间',
  `optid` smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申请日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  `object` varchar(30) DEFAULT NULL COMMENT '奖惩对象',
  `objectid` smallint(6) DEFAULT '0',
  `type` tinyint(1) DEFAULT '0' COMMENT '奖惩类型0奖励,1处罚',
  `result` varchar(50) DEFAULT NULL COMMENT '奖惩结果',
  `money` mediumint(6) DEFAULT NULL COMMENT '奖惩金额',
  `happendt` datetime DEFAULT NULL COMMENT '发生时间',
  `hapaddress` varchar(50) DEFAULT NULL COMMENT '发生地点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_reward
-- ----------------------------
INSERT INTO `xinhu_reward` VALUES ('1', '1', '2016-10-20 21:01:10', '1', '管理员', '2016-10-20', '积极做好工作，特此奖励！', '1', '1', '管理员', '1', '0', '奖励', '200', '2016-10-01 20:59:14', '公司');
INSERT INTO `xinhu_reward` VALUES ('2', '1', '2016-10-20 21:16:24', '1', '管理员', '2016-10-20', '对客户言语不确当被投诉了，哈哈。', '0', '1', '信呼客服', '8', '1', '警告', '20', '2016-10-06 21:15:27', '公司');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_schedule
-- ----------------------------
INSERT INTO `xinhu_schedule` VALUES ('1', '每月初提醒考勤是否正常', '2016-08-01 08:00:00', null, '1', '2016-08-30 22:39:13', '管理员', '0', null, null, 'm', '1', '1', '1');
INSERT INTO `xinhu_schedule` VALUES ('2', '每周五下班前提交这周报告给主管', '2016-08-01 17:00:00', null, '1', '2016-08-30 22:38:48', '管理员', '0', null, null, 'w', '5', '1', '1');
INSERT INTO `xinhu_schedule` VALUES ('3', '吃饭了嘛？', '2016-09-12 12:00:00', null, '1', '2016-09-12 11:43:53', '管理员', '0', null, null, 'd', null, '1', '1');

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
  `fenlei` varchar(10) DEFAULT NULL,
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
  `explain` varchar(200) DEFAULT NULL COMMENT '说明',
  `todoid` varchar(200) DEFAULT NULL,
  `todoname` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_task
-- ----------------------------
INSERT INTO `xinhu_task` VALUES ('1', '流程从新匹配', '系统', 'flow,pipei', 'd,d', '00:10:00,12:10:00', '每天0,12点', '1', '1', '2016-10-16 12:09:59', null, '0', null, 'success', null, null, null);
INSERT INTO `xinhu_task` VALUES ('2', '数据备份', '系统', 'sys,beifen', 'd', '00:20:00', '每天凌晨00:20', '1', '1', '2016-10-16 00:19:57', null, '0', null, 'success', null, null, null);
INSERT INTO `xinhu_task` VALUES ('3', '系统升级提醒', '系统', 'sys,upgtx', 'd', '00:25:00', '每天凌晨00:25', '1', '1', '2016-10-16 00:24:56', null, '0', null, 'success', null, '1,8', '管理员,信呼客服');
INSERT INTO `xinhu_task` VALUES ('4', '5分钟运行1次', '系统', 'minute5,run', 'i5', '00', '每5分钟运行一次', '1', '1', '2016-10-20 19:35:00', null, '0', null, 'success', null, null, null);
INSERT INTO `xinhu_task` VALUES ('5', '考勤信息提醒', '考勤', 'kaoqin,todo', 'd', '09:29:00', '每天9点', '1', '1', '2016-10-16 09:28:56', null, '20', null, 'success', '在模块【考勤信息】下设置提醒到哪些平台。', null, null);
INSERT INTO `xinhu_task` VALUES ('6', '用户数据更新', '用户', 'sys,dataup', 'd', '00:10:00', '每天', '1', '1', '2016-10-16 00:10:02', null, '0', null, 'success', null, null, null);
INSERT INTO `xinhu_task` VALUES ('7', '考勤分析', '考勤', 'kaoqin,anay', 'd', '02:12:00', '每天2点', '1', '1', '2016-10-16 02:11:58', null, '21', null, 'success', '分析全体人员昨天的考勤', null, null);
INSERT INTO `xinhu_task` VALUES ('8', '员工合同到期提醒', '人事', 'hr,httodo', 'd', '00:05:00', null, '1', '1', '2016-10-19 22:08:30', null, '30', null, 'success', null, '4', '大乔');

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
  `modenum` varchar(20) DEFAULT NULL COMMENT '对应模块编号',
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
  `state` tinyint(1) DEFAULT '0' COMMENT '0试用期,1正式,2实习生,3兼职,4临时工,5离职',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `tel` varchar(50) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `workdate` date DEFAULT NULL COMMENT '入职时间',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `quitdt` date DEFAULT NULL COMMENT '离职日期',
  `iskq` tinyint(1) DEFAULT '1' COMMENT '是否考勤',
  `isdwdk` tinyint(1) DEFAULT '0' COMMENT '是否定位打卡',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `xueli` varchar(20) DEFAULT NULL,
  `birtype` tinyint(1) DEFAULT '0' COMMENT '0阳历1农历',
  `minzu` varchar(20) DEFAULT NULL COMMENT '民族',
  `hunyin` varchar(10) DEFAULT NULL COMMENT '婚姻',
  `jiguan` varchar(20) DEFAULT NULL COMMENT '籍贯',
  `nowdizhi` varchar(50) DEFAULT NULL COMMENT '现住址',
  `housedizhi` varchar(50) DEFAULT NULL COMMENT '家庭地址',
  `syenddt` date DEFAULT NULL COMMENT '试用期到',
  `positivedt` date DEFAULT NULL COMMENT '转正日期',
  `bankname` varchar(50) DEFAULT NULL COMMENT '开户行',
  `banknum` varchar(30) DEFAULT NULL COMMENT '工资卡帐号',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_userinfo
-- ----------------------------
INSERT INTO `xinhu_userinfo` VALUES ('1', '管理员', '开发部', '项目主管', '192.168.1.101', null, '1', '男', '0592-123456', '15800000123', '2016-07-01', 'admin@rockoa.com', null, '1', '0', '1996-10-01', '博士后', '1', '汉', '未婚', '福建', '厦门', '厦门', '2016-10-01', '2016-10-02', '厦门银行', '6225****');
INSERT INTO `xinhu_userinfo` VALUES ('2', '貂蝉', '财务部', '财务总监', null, null, '1', '女', null, '15800000007', '2016-08-08', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('3', '小乔', '财务部', '出纳', null, null, '1', '女', null, '15800000001', null, null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('4', '大乔', '行政人事部', '人事主管', null, null, '1', '女', null, '15800000002', null, null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('5', '磐石', '财务部', 'CEO', null, null, '1', '男', null, '15800000003', null, null, null, '0', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('6', '张飞', '开发部', '程序员', null, null, '1', '男', null, '15800000004', null, null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('7', '赵子龙', '开发部', '高级程序员', null, null, '1', '男', null, '15800000005', null, null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('8', '信呼客服', '开发部', '客服', '192.168.1.63', '64:00:6a:49:20:4b', '0', '男', null, '15800000006', '2016-07-01', null, null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('9', '李四', '开发部', '程序员', null, null, '0', '男', null, null, '2016-09-06', '505581617@qq.com', null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('10', '用户12', '开发部', '项目经理', null, null, '0', '男', '0592-123465', '15812345678', '2016-10-15', 'admin@rockoa.com', null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `xinhu_userinfo` VALUES ('11', '用户1', '开发部', '项目经理', null, null, '0', '男', '0592-123465', '15812345678', '2016-10-15', 'admin@rockoa.com', null, '1', '0', null, null, '0', null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `xinhu_userract`
-- ----------------------------
DROP TABLE IF EXISTS `xinhu_userract`;
CREATE TABLE `xinhu_userract` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `startdt` date DEFAULT NULL COMMENT '开始日期',
  `enddt` date DEFAULT NULL COMMENT '截止日期',
  `uid` smallint(6) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL,
  `explain` varchar(500) DEFAULT NULL,
  `httype` varchar(30) DEFAULT NULL COMMENT '合同类型',
  `state` tinyint(1) DEFAULT '0' COMMENT '0|待执行,1|生效中,2|已终止,3|已过期',
  `tqenddt` date DEFAULT NULL COMMENT '提前终止',
  `company` varchar(50) DEFAULT NULL COMMENT '签署公司',
  `uname` varchar(20) DEFAULT NULL COMMENT '签署人',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_userract
-- ----------------------------
INSERT INTO `xinhu_userract` VALUES ('1', '第一次签劳动合同', '2015-10-01', '2016-11-05', '1', '0', '2016-10-06 15:55:18', null, '劳动合同', '1', null, '信呼开发团队', '管理员');
INSERT INTO `xinhu_userract` VALUES ('2', '合同', '2015-10-01', '2016-09-30', '6', '0', '2016-10-06 10:42:35', '嗯嗯嗯', '劳动合同', '3', null, '信呼开发团队', '张飞');
INSERT INTO `xinhu_userract` VALUES ('3', '合同', '2015-10-01', '2017-10-31', '3', '0', '2016-10-06 11:20:29', '谔谔', '劳动合同', '2', '2016-10-06', '信呼开发团队', '小乔');

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
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_word
-- ----------------------------
INSERT INTO `xinhu_word` VALUES ('5', '4', '大乔', '5', 'd1', '信呼开发团队', '2016-10-19 19:31:21', '98');
INSERT INTO `xinhu_word` VALUES ('13', '1', '管理员', '12', 'd1', '信呼开发团队', '2016-10-20 20:10:09', '86');
INSERT INTO `xinhu_word` VALUES ('8', '1', '管理员', '8', 'd1', '信呼开发团队', '2016-10-20 11:58:50', '0');
INSERT INTO `xinhu_word` VALUES ('10', '1', '管理员', '0', null, null, null, '0');

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
  `projectid` smallint(6) DEFAULT '0' COMMENT '对应项目Id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('2', null, '设计一个信呼的logo出来哦', '设计', '中', '1', '管理员', '1、要求简单美观。\n2、高大上的，能代表出系统的。\n3、先来几个版本看看。', '2016-06-29 09:15:25', '5', '磐石', null, null, '2', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('3', null, '严重的bug修复吧', 'bug', '紧急', '1', '管理员', '页面漂亮需要改进。数据库上表不合理。', '2016-06-29 09:26:57', '5', '磐石', null, null, '0', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('4', null, '官网设计并给预算', '设计', '高', '6', '张飞', '1、美观大气啊。\n2、财务给奖励预算。\n3、1给礼拜完成哦。', '2016-06-29 11:16:40', '1', '管理员', '2016-06-29 11:14:19', '2016-07-06 11:16:00', '1', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('5', null, '系统用户更新。', '改进', '中', '8', '信呼客服', '1、用户问题解答。\n2、问题反馈。', '2016-07-06 21:41:08', '8', '信呼客服', '2016-07-06 21:40:16', null, '2', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('6', null, '赶紧弄啊', 'bug', '低', '4', '大乔', null, '2016-07-18 19:49:45', '1', '管理员', '2016-07-18 19:49:19', null, '1', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('7', null, '漏洞啦，快去改啊。', 'bug', '高', '5', '磐石', '嗯嗯嗯', '2016-07-20 12:59:13', '1', '管理员', '2016-07-20 12:51:17', null, '1', null, '0', '1', '0');
INSERT INTO `xinhu_work` VALUES ('8', null, '人事模块开发设计', '设计', '中', '1,6', '管理员,张飞', null, '2016-09-10 22:05:52', '1', '管理员', '2016-09-10 22:05:14', null, '0', null, '0', '1', '2');
