/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : rockxinhu

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2016-07-01 18:05:35
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
  `lastdt` datetime DEFAULT NULL,
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
  `lastip` varchar(30) DEFAULT NULL,
  `deptpath` varchar(100) DEFAULT NULL,
  `superpath` varchar(100) DEFAULT NULL,
  `groupname` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `apptx` tinyint(1) DEFAULT '1' COMMENT '是否app提醒',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_admin
-- ----------------------------
INSERT INTO `xinhu_admin` VALUES ('1', null, 'admin', '管理员', 'e10adc3949ba59abbe56e057f20f883e', '241', '2016-05-08 20:25:03', '1', '1', '男', null, 'upload/face/1.jpg', '2', '开发部', '5', '磐石', '项目主管', '0', '127.0.0.1', '[1],[2]', '[5]', null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('2', null, 'diaochan', '貂蝉', 'e10adc3949ba59abbe56e057f20f883e', '34', null, '1', '0', '女', null, 'upload/face/2.jpg', '3', '财务部', '5', '磐石', '财务总监', '0', null, '[1],[3]', '[5]', null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('3', null, 'xiaoqiao', '小乔', 'e10adc3949ba59abbe56e057f20f883e', '25', null, '1', '0', '女', null, 'upload/face/3.jpg', '3', '财务部', '2', '貂蝉', '出纳', '0', null, '[1],[3]', '[5],[2]', null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('4', null, 'daqiao', '大乔', 'e10adc3949ba59abbe56e057f20f883e', '4', null, '1', '0', '女', null, 'upload/face/4.jpg', '4', '行政人事部', '5', '磐石', '人事主管', '0', null, '[1],[4]', '[5]', null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('5', null, 'rock', '磐石', 'e10adc3949ba59abbe56e057f20f883e', '33', null, '1', '0', '男', null, 'upload/face/5.jpg', '5', '管理层', null, null, '董事长', '0', null, '[1],[5]', null, null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('6', null, 'zhangfei', '张飞', 'e10adc3949ba59abbe56e057f20f883e', '5', null, '1', '0', '男', null, 'upload/face/6.jpg', '2', '开发部', '1', '管理员', '程序员', '100', null, '[1],[2]', '[5],[1]', null, null, '1');
INSERT INTO `xinhu_admin` VALUES ('7', null, 'zhaozl', '赵子龙', 'e10adc3949ba59abbe56e057f20f883e', '4', null, '1', '0', '男', null, 'upload/face/7.jpg', '2', '开发部', '1', '管理员', '高级程序员', '100', null, '[1],[2]', '[5],[1]', null, null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`id`),
  KEY `table` (`table`,`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_log
-- ----------------------------
INSERT INTO `xinhu_flow_log` VALUES ('1', 'infor', '8', '1', null, '发布', '0', '2016-05-26 10:18:10', null, '192.168.1.176', 'Chrome', '貂蝉', '2', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('2', 'infor', '9', '1', null, '发布', '0', '2016-05-26 10:21:07', null, '192.168.1.176', 'Chrome', '貂蝉', '2', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('3', 'infor', '10', '1', null, '发布', '0', '2016-05-26 10:21:30', null, '192.168.1.176', 'Chrome', '貂蝉', '2', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('4', 'infor', '13', '1', null, '发布', '0', '2016-05-26 16:00:42', null, '192.168.1.176', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('5', 'infor', '14', '1', null, '发布', '0', '2016-05-26 16:59:52', null, '192.168.1.176', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('6', 'infor', '15', '1', null, '发布', '0', '2016-05-26 19:30:41', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('7', 'infor', '16', '1', null, '发布', '0', '2016-05-26 19:37:15', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('8', 'infor', '17', '1', null, '发布', '0', '2016-05-26 19:38:40', null, '192.168.1.104', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('9', 'infor', '18', '1', null, '发布', '0', '2016-05-27 13:53:19', null, '192.168.1.176', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('10', 'meet', '6', '1', null, '预定', '0', '2016-05-30 13:58:13', null, '192.168.1.176', 'Android', '管理员', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('11', 'infor', '19', '1', null, '发布', '0', '2016-06-14 14:54:28', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('12', 'meet', '7', '1', null, '预定', '0', '2016-06-14 15:00:46', null, '192.168.1.126', 'Chrome', '管理员', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('13', 'daily', '8', '1', null, '提交', '0', '2016-06-17 20:21:14', null, '192.168.1.103', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('14', 'daily', '9', '1', null, '提交', '0', '2016-06-17 20:26:45', null, '192.168.1.103', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('15', 'daily', '10', '1', null, '提交', '0', '2016-06-17 20:29:07', null, '192.168.1.103', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('16', 'daily', '2', '1', '点评', '点评', '0', '2016-06-18 09:20:00', '不错吗？', '127.0.0.1', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('17', 'daily', '4', '1', '点评', '点评', '0', '2016-06-18 09:22:11', '哈哈哈哈，写的好啊', '192.168.1.103', 'Chrome', '貂蝉', '2', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('18', 'infor', '1', '1', null, '编辑', '0', '2016-06-22 16:14:27', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('19', 'infor', '1', '1', null, '编辑', '0', '2016-06-22 16:15:34', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('20', 'infor', '1', '1', null, '编辑', '0', '2016-06-22 16:18:17', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('21', 'infor', '1', '1', null, '编辑', '0', '2016-06-22 16:21:04', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('22', 'infor', '2', '1', null, '提交', '0', '2016-06-22 16:28:48', null, '192.168.1.126', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('23', 'meet', '8', '1', null, '提交', '0', '2016-06-22 17:44:10', null, '192.168.1.126', 'Chrome', '管理员', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('24', 'meet', '9', '1', null, '提交', '0', '2016-06-22 18:02:19', null, '192.168.1.126', 'Chrome', '管理员', '1', '2', null);
INSERT INTO `xinhu_flow_log` VALUES ('25', 'daily', '11', '1', null, '提交', '0', '2016-06-24 20:35:12', null, '192.168.1.103', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('26', 'daily', '12', '1', null, '提交', '0', '2016-06-24 20:40:30', null, '192.168.1.103', 'Chrome', '小乔', '3', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('27', 'infor', '3', '1', null, '提交', '0', '2016-06-25 10:09:15', null, '192.168.1.103', 'Safari', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('28', 'infor', '4', '1', null, '提交', '0', '2016-06-25 10:28:51', null, '192.168.1.100', 'Chrome', '管理员', '1', '1', null);
INSERT INTO `xinhu_flow_log` VALUES ('29', 'work', '1', '1', null, '提交', '0', '2016-06-28 20:30:17', null, '192.168.1.103', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('30', 'work', '1', '1', '点评', '点评', '0', '2016-06-28 21:41:17', '二二八', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('31', 'work', '1', '1', '进度报告', '进度报告', '0', '2016-06-28 22:43:21', '很好啊', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('32', 'work', '1', '1', '进度报告', '进度报告', '0', '2016-06-28 22:44:32', 'er', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('33', 'work', '1', '1', '进度报告', '进度报告', '0', '2016-06-28 22:46:14', '2332', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('34', 'work', '1', '2', '执行中', '进度报告', '0', '2016-06-28 22:49:59', '执行中。。。', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('35', 'work', '1', '2', '执行中', '进度报告', '0', '2016-06-28 22:51:36', '嗯嗯额', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('36', 'daily', '10', '1', null, '点评', '0', '2016-06-28 22:51:49', '很好啊', '127.0.0.1', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('37', 'daily', '7', '1', null, '点评', '0', '2016-06-28 22:57:46', '很好啊', '127.0.0.1', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('38', 'work', '1', '2', '执行中', '进度报告', '0', '2016-06-28 23:08:51', '嗯', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('39', 'work', '1', '1', '已完成', '进度报告', '0', '2016-06-28 23:11:00', '完成了', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('40', 'work', '2', '1', null, '提交', '0', '2016-06-29 09:15:25', null, '192.168.1.126', 'Chrome', '磐石', '5', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('41', 'work', '3', '1', null, '提交', '0', '2016-06-29 09:26:57', null, '192.168.1.126', 'Chrome', '磐石', '5', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('42', 'work', '3', '2', '执行中', '进度报告', '0', '2016-06-29 09:46:59', '正在改进，不要着急', '192.168.1.126', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('43', 'work', '4', '1', null, '提交', '0', '2016-06-29 11:16:40', null, '127.0.0.1', 'Safari', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('44', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-29 11:20:11', '预算10W', '127.0.0.1', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('45', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-29 12:27:05', '嗯嗯', '192.168.1.126', 'Chrome', '貂蝉', '2', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('46', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-29 12:27:13', '嗯嗯', '192.168.1.126', 'Chrome', '貂蝉', '2', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('47', 'daily', '11', '1', null, '点评', '0', '2016-06-30 13:47:22', '很好啊', '192.168.1.126', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('48', 'work', '4', '0', '待执行', '进度报告', '0', '2016-06-30 13:53:22', '12', '192.168.1.126', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('49', 'daily', '11', '1', null, '点评', '0', '2016-06-30 13:53:55', '很好啊', '192.168.1.126', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('50', 'daily', '11', '1', null, '点评', '0', '2016-06-30 13:58:49', '谔谔', '192.168.1.126', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('51', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-30 14:21:50', '额', '192.168.1.126', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('52', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 19:50:42', '指派给管理员。', '192.168.1.103', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('53', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 19:52:13', '额', '192.168.1.103', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('54', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 19:54:16', '23', '192.168.1.103', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('55', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 19:55:24', '45', '192.168.1.103', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('56', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-30 20:02:14', '额', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('57', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 20:04:35', '指派给:张飞;谔谔', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('58', 'work', '4', '4', '指派给', '进度报告', '0', '2016-06-30 20:05:32', '指派给:张飞;哈哈哈', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('59', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-30 20:11:52', '执行中', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('60', 'work', '4', '2', '执行中', '进度报告', '0', '2016-06-30 20:12:21', '呃呃呃', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('61', 'work', '4', '1', '已完成', '进度报告', '0', '2016-06-30 20:13:00', '好了', '192.168.1.103', 'Chrome', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('62', 'daily', '13', '1', null, '提交', '0', '2016-06-30 20:15:39', null, '192.168.1.103', 'Chrome', '张飞', '6', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('63', 'daily', '13', '1', null, '点评', '0', '2016-06-30 20:56:37', '挺好的', '192.168.1.103', 'Safari', '张飞', '6', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('64', 'daily', '13', '1', null, '点评', '0', '2016-06-30 20:56:55', '嗯嗯额', '192.168.1.103', 'Safari', '张飞', '6', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('65', 'daily', '11', '1', null, '点评', '0', '2016-06-30 20:57:06', '不错嘛', '192.168.1.100', 'Chrome', '管理员', '1', '3', null);
INSERT INTO `xinhu_flow_log` VALUES ('66', 'work', '4', '1', '已完成', '进度报告', '0', '2016-06-30 21:23:27', '好了啊', '192.168.1.103', 'Safari', '张飞', '6', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('67', 'work', '3', '4', '指派给', '进度报告', '0', '2016-06-30 21:27:47', '指派给:磐石;呵呵', '192.168.1.100', 'Chrome', '管理员', '1', '4', null);
INSERT INTO `xinhu_flow_log` VALUES ('68', 'work', '2', '2', '执行中', '进度报告', '0', '2016-07-01 10:13:31', '开始啦', '192.168.1.176', 'Chrome', '管理员', '1', '4', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_flow_set
-- ----------------------------
INSERT INTO `xinhu_flow_set` VALUES ('1', '通知公告', 'gong', '0', 'infor', null, '[{typename}]{title}', '行政', '1', '1', 'XA-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:07', '1');
INSERT INTO `xinhu_flow_set` VALUES ('2', '会议', 'meet', '0', 'meet', null, '[{hyname}]{title},{startdt}→{enddt}', '行政', '1', '1', 'XB-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:21:01', '1');
INSERT INTO `xinhu_flow_set` VALUES ('3', '工作日报', 'daily', '0', 'daily', null, '[{optname}]{content}', '行政', '1', '1', 'XC-Ymd-', '0', 'all', '全体人员', '2016-06-17 21:20:27', '1');
INSERT INTO `xinhu_flow_set` VALUES ('4', '任务', 'work', '0', 'work', null, '[{type}]{title},分配给:{dist}', '工作', '1', '1', 'WO-Ymd-', '0', 'all', '全体人员', '2016-06-28 21:42:47', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_history
-- ----------------------------
INSERT INTO `xinhu_im_history` VALUES ('28', 'user', '1', '2', '1', '2016-06-24 19:33:27', 'W!WbvueJhyA0NC45MyBLQl0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('4', 'group', '2', '2', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '8');
INSERT INTO `xinhu_im_history` VALUES ('5', 'group', '2', '5', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('6', 'group', '2', '6', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('7', 'group', '2', '7', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '14');
INSERT INTO `xinhu_im_history` VALUES ('8', 'group', '2', '3', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('9', 'group', '2', '4', '3', '2016-06-24 22:29:20', 'W!WbvueJhyAxOS4yOSBLQl0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('10', 'group', '5', '7', '1', '2016-06-24 12:58:37', 'W!WPkeWRhl1b5bC05bCsXVvlj5HmgJJd', '6');
INSERT INTO `xinhu_im_history` VALUES ('12', 'group', '5', '6', '1', '2016-06-24 12:58:37', 'W!WPkeWRhl1b5bC05bCsXVvlj5HmgJJd', '0');
INSERT INTO `xinhu_im_history` VALUES ('14', 'user', '1', '5', '1', '2016-06-22 15:17:16', 'W!WwtOWwrF0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('16', 'user', '1', '6', '1', '2016-06-22 15:18:57', 'W!Wkp!WTrV0:', '0');
INSERT INTO `xinhu_im_history` VALUES ('18', 'user', '1', '7', '1', '2016-06-22 15:17:50', 'W!iJsl0:', '2');
INSERT INTO `xinhu_im_history` VALUES ('20', 'user', '1', '3', '1', '2016-07-01 12:43:57', '5ZiO5ZiO', '1');
INSERT INTO `xinhu_im_history` VALUES ('32', 'user', '1', '4', '1', '2016-06-22 15:18:14', '6Z2W', '0');
INSERT INTO `xinhu_im_history` VALUES ('37', 'user', '3', '4', '4', '2016-06-24 22:10:11', '6YKj5piv5piv', '0');
INSERT INTO `xinhu_im_history` VALUES ('38', 'user', '4', '3', '4', '2016-06-24 22:10:11', '6YKj5piv5piv', '0');
INSERT INTO `xinhu_im_history` VALUES ('41', 'user', '3', '1', '1', '2016-07-01 12:43:57', '5ZiO5ZiO', '0');
INSERT INTO `xinhu_im_history` VALUES ('40', 'group', '14', '5', '1', '2016-07-01 11:15:29', '5Zev5Zev', '2');

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
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

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
) ENGINE=MyISAM AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

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
INSERT INTO `xinhu_im_mess` VALUES ('12', '2016-06-14 22:19:54', '1', 'MTI:', '1', '5', '1,5', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('13', '2016-06-14 22:19:57', '1', 'MTI:', '1', '6', '1,6', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('14', '2016-06-14 22:19:59', '0', 'MTI:', '1', '7', '1,7', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('15', '2016-06-14 22:20:03', '1', 'MjE:', '1', '3', '1,3', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('16', '2016-06-14 23:12:01', '1', '5om!5L2g5ZWK', '2', '1', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('17', '2016-06-15 11:13:52', '1', 'MTI:', '1', '2', '1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('18', '2016-06-15 11:14:05', '1', 'MTIxMg::', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('19', '2016-06-15 11:16:26', '1', 'MTIxMjEy', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('20', '2016-06-15 11:20:41', '1', 'W!iJsl0:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('21', '2016-06-15 18:57:43', '1', 'MjM:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('22', '2016-06-15 19:07:11', '1', '5Zyo5bmy5Zib5ZGi77yf', '1', '2', '2,5,6,7,3,4', 'group', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('23', '2016-06-16 09:00:06', '1', 'd2U:', '1', '1', '1,1', 'user', null, '0');
INSERT INTO `xinhu_im_mess` VALUES ('24', '2016-06-17 14:43:53', '1', 'W!WbvueJhywxLjkyIEtCXQ::', '1', '1', '1,1', 'user', null, '36');
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
INSERT INTO `xinhu_im_mess` VALUES ('53', '2016-06-22 15:17:16', '1', 'W!WwtOWwrF0:', '1', '5', '1,5', 'user', null, '0');
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
INSERT INTO `xinhu_im_mess` VALUES ('115', '2016-07-01 12:43:57', '0', '5ZiO5ZiO', '1', '3', '1,3', 'user', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_im_messzt
-- ----------------------------
INSERT INTO `xinhu_im_messzt` VALUES ('164', '68', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('182', '110', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('198', '112', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('180', '91', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('114', '43', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('174', '69', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('188', '111', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('194', '112', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('192', '111', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('168', '68', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('108', '41', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('156', '66', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('186', '110', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('162', '67', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('120', '44', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('126', '50', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('152', '66', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('158', '67', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('132', '51', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('176', '91', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('169', '69', '2', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('138', '52', '7', '2');
INSERT INTO `xinhu_im_messzt` VALUES ('140', '57', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('142', '59', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('144', '60', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('146', '61', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('148', '62', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('199', '113', '5', '14');
INSERT INTO `xinhu_im_messzt` VALUES ('150', '63', '7', '5');
INSERT INTO `xinhu_im_messzt` VALUES ('200', '114', '5', '14');

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
INSERT INTO `xinhu_infor` VALUES ('4', '嗯嗯', '2016-06-25 10:28:51', '通知公告', null, null, null, null, '1', '管理员');

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
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_log
-- ----------------------------
INSERT INTO `xinhu_log` VALUES ('1', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-28 21:24:57', '192.168.1.103', 'Chrome', '1466770353990');
INSERT INTO `xinhu_log` VALUES ('2', 'pc登录', '1', '管理员', '[admin]登录成功', '2016-06-28 21:28:37', '127.0.0.1', 'Chrome', '1466779305269');
INSERT INTO `xinhu_log` VALUES ('3', 'pc登录', '1', '管理员', '[admin]登录成功', '2016-06-29 09:06:00', '127.0.0.1', 'Chrome', '1465964276241');
INSERT INTO `xinhu_log` VALUES ('4', 'reim登录', '5', '磐石', '[rock]登录成功', '2016-06-29 09:07:20', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('5', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-29 09:13:16', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('6', 'reim登录', '5', '磐石', '[rock]登录成功', '2016-06-29 09:13:53', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('7', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-29 09:33:30', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('8', 'reim登录', '2', '貂蝉', '[diaochan]登录成功', '2016-06-29 12:26:46', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('9', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-06-29 12:30:19', '192.168.1.176', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('10', 'pc登录', '1', '管理员', '[admin]登录成功', '2016-06-30 12:16:25', '127.0.0.1', 'Chrome', '1465964276241');
INSERT INTO `xinhu_log` VALUES ('11', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-30 12:21:21', '192.168.1.126', 'Chrome', '1465961511150');
INSERT INTO `xinhu_log` VALUES ('12', 'appandroid登录', '1', null, '[admin]密码不对', '2016-06-30 17:12:54', '192.168.1.176', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('13', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-06-30 17:13:03', '192.168.1.176', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('14', 'pc登录', '1', '管理员', '[admin]登录成功', '2016-06-30 19:23:15', '127.0.0.1', 'Chrome', '1466779305269');
INSERT INTO `xinhu_log` VALUES ('15', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-30 19:23:23', '192.168.1.103', 'Chrome', '1466770353990');
INSERT INTO `xinhu_log` VALUES ('16', 'reim登录', '0', null, '[zhangf]用户不存在', '2016-06-30 20:01:40', '192.168.1.103', 'Chrome', '1466770353990');
INSERT INTO `xinhu_log` VALUES ('17', 'reim登录', '6', '张飞', '[zhangfei]登录成功', '2016-06-30 20:01:44', '192.168.1.103', 'Chrome', '1466770353990');
INSERT INTO `xinhu_log` VALUES ('18', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-06-30 20:11:13', '127.0.0.1', 'Firefox', '1466772091327');
INSERT INTO `xinhu_log` VALUES ('19', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-06-30 20:43:41', '192.168.1.100', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('20', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-06-30 21:32:13', '192.168.1.100', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('21', 'reim登录', '3', '小乔', '[xiaoqiao]登录成功', '2016-06-30 22:02:41', '192.168.1.103', 'Chrome', '1465732443257');
INSERT INTO `xinhu_log` VALUES ('22', 'reim登录', '1', '管理员', '[admin]登录成功', '2016-07-01 09:36:01', '192.168.1.126', 'Chrome', '1467336712627');
INSERT INTO `xinhu_log` VALUES ('23', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-07-01 09:40:10', '192.168.1.176', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('24', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-07-01 10:12:45', '192.168.1.176', 'Chrome', '867112020521204');
INSERT INTO `xinhu_log` VALUES ('25', 'appandroid登录', '1', '管理员', '[admin]登录成功', '2016-07-01 11:14:04', '192.168.1.176', 'Chrome', '867112020521204');

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_logintoken
-- ----------------------------
INSERT INTO `xinhu_logintoken` VALUES ('1', '1', '管理员', 'wap1tgul', '2016-06-28 21:24:57', '2016-06-28 23:13:40', 'reim', '1466770353990', '192.168.1.103', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('2', '1', '管理员', 'q835pxk0', '2016-06-28 21:28:37', '2016-06-28 21:28:37', 'pc', '1466779305269', '127.0.0.1', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('3', '1', '管理员', 'xcrjcigy', '2016-06-29 09:05:59', '2016-06-29 09:05:59', 'pc', '1465964276241', '127.0.0.1', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('4', '5', '磐石', 'l2gyq710', '2016-06-29 09:07:18', '2016-06-29 09:07:20', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('5', '1', '管理员', 'nomr7ide', '2016-06-29 09:13:15', '2016-06-29 09:13:17', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('6', '5', '磐石', 't8i1t8bw', '2016-06-29 09:13:52', '2016-06-29 09:23:55', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('7', '1', '管理员', 'k5br4qke', '2016-06-29 09:33:29', '2016-06-29 09:50:35', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('8', '2', '貂蝉', 'ukme0pbc', '2016-06-29 12:26:45', '2016-06-29 13:36:48', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '1');
INSERT INTO `xinhu_logintoken` VALUES ('9', '1', '管理员', '18ngf0wa', '2016-06-29 12:30:18', '2016-06-29 15:31:11', 'appandroid', '867112020521204', '192.168.1.176', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('10', '1', '管理员', 'm7nbplja', '2016-06-30 12:16:24', '2016-06-30 12:16:24', 'pc', '1465964276241', '127.0.0.1', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('11', '1', '管理员', 'kjvntsis', '2016-06-30 12:21:19', '2016-06-30 14:18:25', 'reim', '1465961511150', '192.168.1.126', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('12', '1', '管理员', '5zaad0d5', '2016-06-30 17:13:02', '2016-06-30 17:14:23', 'appandroid', '867112020521204', '192.168.1.176', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('13', '1', '管理员', 'jdwd8c7f', '2016-06-30 19:23:15', '2016-06-30 19:23:15', 'pc', '1466779305269', '127.0.0.1', 'Chrome', '1');
INSERT INTO `xinhu_logintoken` VALUES ('14', '1', '管理员', 'uic71ynu', '2016-06-30 19:23:23', '2016-06-30 19:53:23', 'reim', '1466770353990', '192.168.1.103', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('15', '6', '张飞', '2vzg8dwz', '2016-06-30 20:01:44', '2016-06-30 22:14:05', 'reim', '1466770353990', '192.168.1.103', 'Chrome', '1');
INSERT INTO `xinhu_logintoken` VALUES ('16', '1', '管理员', '2z1750sg', '2016-06-30 20:11:13', '2016-06-30 22:41:15', 'reim', '1466772091327', '127.0.0.1', 'Firefox', '0');
INSERT INTO `xinhu_logintoken` VALUES ('17', '1', '管理员', 'o70jumwe', '2016-06-30 20:43:41', '2016-06-30 21:31:25', 'appandroid', '867112020521204', '192.168.1.100', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('18', '1', '管理员', '0iqsyi2r', '2016-06-30 21:32:13', '2016-06-30 23:00:09', 'appandroid', '867112020521204', '192.168.1.100', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('19', '3', '小乔', 'k2qats0u', '2016-06-30 22:02:41', '2016-06-30 23:08:00', 'reim', '1465732443257', '192.168.1.103', 'Chrome', '1');
INSERT INTO `xinhu_logintoken` VALUES ('20', '1', '管理员', '3j4foj6s', '2016-07-01 09:36:00', '2016-07-01 09:47:30', 'reim', '1467336712627', '192.168.1.126', 'Chrome', '1');
INSERT INTO `xinhu_logintoken` VALUES ('21', '1', '管理员', 'gpm7ss1d', '2016-07-01 09:40:09', '2016-07-01 09:40:38', 'appandroid', '867112020521204', '192.168.1.176', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('22', '1', '管理员', '32qvzwb4', '2016-07-01 10:12:44', '2016-07-01 11:13:44', 'appandroid', '867112020521204', '192.168.1.176', 'Chrome', '0');
INSERT INTO `xinhu_logintoken` VALUES ('23', '1', '管理员', '3hxd300h', '2016-07-01 11:14:03', '2016-07-01 14:03:27', 'appandroid', '867112020521204', '192.168.1.176', 'Chrome', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_menu
-- ----------------------------
INSERT INTO `xinhu_menu` VALUES ('1', '管理后台', '0', '5', null, 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('2', '菜单管理', '1', '0', 'system,menu', 'th-list', null, 'menu', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('3', '用户管理', '14', '2', 'system,admin', 'user', null, 'user', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('4', '计划任务', '1', '7', 'system,task', 'time', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('5', '组管理', '1', '3', 'system,group', 'group', null, 'group', '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('6', '组织结构', '14', '1', 'system,dept', 'sitemap', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('7', '流程管理', '0', '2', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('8', '权限管理', '1', '0', null, null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('9', '人员→菜单', '8', '0', 'system,extent,type=um', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('10', '菜单→人员', '8', '0', 'system,extent,type=mu', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('11', '组→菜单', '8', '0', 'system,extent,type=gm', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('12', '菜单→组', '8', '0', 'system,extent,type=mg', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('13', '人员权限查看', '8', '0', 'system,extent,type=view', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('14', '信呼', '0', '0', null, 'comment', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('15', '应用管理', '14', '4', 'main,yingyong', 'th-large', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('16', '会话管理', '14', '3', 'main,imgroup', 'comments', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('17', '流程模块', '7', '2', 'main,flow,set', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('18', '服务器设置', '14', '0', 'main,xinhu,cog', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('19', '流程选项', '7', '0', 'system,option,num=flow', 'cog', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('20', '表单元素管理', '7', '2', 'main,flow,element', null, null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('21', '数据查看权限', '7', '5', 'main,view', 'zoom-in', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('22', '流程单据管理', '7', '6', 'main,flow,view', 'search', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('23', '系统升级', '1', '10', 'system,upgrade', 'arrow-up', null, null, '1', '1', null, '0');
INSERT INTO `xinhu_menu` VALUES ('24', '数据选项', '7', '1', 'system,option,num=xinhu', null, null, null, '1', '1', null, '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_option
-- ----------------------------
INSERT INTO `xinhu_option` VALUES ('31', null, null, 'reimrecidsystem', 'rockreim', '0', null, '1', '2016-06-14 20:45:30');
INSERT INTO `xinhu_option` VALUES ('2', null, null, 'reimhostsystem', 'ws://127.0.0.1:6552/', '0', null, '1', '2016-06-14 20:45:30');
INSERT INTO `xinhu_option` VALUES ('3', null, null, 'reimpushurlsystem', 'http://127.0.0.1:6553/', '0', null, '1', '2016-06-14 20:45:30');
INSERT INTO `xinhu_option` VALUES ('4', '流程分类', '5', 'flowfenlei', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('5', '流程选项', '1', 'flow', null, '0', null, '1', null);
INSERT INTO `xinhu_option` VALUES ('6', '表单类型', '5', 'flowinputtype', null, '1', null, '1', null);
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
) ENGINE=MyISAM AUTO_INCREMENT=425 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_reads
-- ----------------------------
INSERT INTO `xinhu_reads` VALUES ('1', 'work', '1', '1', '2016-06-28 21:25:01', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('2', 'work', '1', '1', '2016-06-28 21:25:03', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('3', 'work', '1', '1', '2016-06-28 21:27:24', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('4', 'daily', '8', '1', '2016-06-28 21:28:06', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('5', 'work', '1', '1', '2016-06-28 21:28:42', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('6', 'work', '1', '1', '2016-06-28 21:29:31', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('7', 'daily', '10', '1', '2016-06-28 21:29:44', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('8', 'daily', '10', '1', '2016-06-28 21:29:58', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('9', 'daily', '10', '1', '2016-06-28 21:29:58', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('10', 'daily', '10', '1', '2016-06-28 21:30:37', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('11', 'daily', '10', '1', '2016-06-28 21:30:47', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('12', 'daily', '10', '1', '2016-06-28 21:32:30', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('13', 'daily', '10', '1', '2016-06-28 21:32:51', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('14', 'daily', '10', '1', '2016-06-28 21:32:55', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('15', 'daily', '10', '1', '2016-06-28 21:33:20', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('16', 'daily', '10', '1', '2016-06-28 21:34:00', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('17', 'daily', '10', '1', '2016-06-28 21:34:24', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('18', 'daily', '10', '1', '2016-06-28 21:35:13', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('19', 'daily', '10', '1', '2016-06-28 21:35:16', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('20', 'work', '1', '1', '2016-06-28 21:36:13', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('21', 'work', '1', '1', '2016-06-28 21:37:07', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('22', 'work', '1', '1', '2016-06-28 21:37:10', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('23', 'work', '1', '1', '2016-06-28 21:41:02', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('24', 'work', '1', '1', '2016-06-28 21:41:07', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('25', 'work', '1', '1', '2016-06-28 21:41:17', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('26', 'work', '1', '1', '2016-06-28 21:42:24', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('27', 'work', '1', '1', '2016-06-28 21:44:46', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('28', 'work', '1', '1', '2016-06-28 22:37:51', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('29', 'work', '1', '1', '2016-06-28 22:37:53', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('30', 'work', '1', '1', '2016-06-28 22:39:46', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('31', 'work', '1', '1', '2016-06-28 22:39:48', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('32', 'work', '1', '1', '2016-06-28 22:41:28', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('33', 'work', '1', '1', '2016-06-28 22:41:28', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('34', 'work', '1', '1', '2016-06-28 22:41:29', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('35', 'work', '1', '1', '2016-06-28 22:41:29', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('36', 'work', '1', '1', '2016-06-28 22:41:31', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('37', 'work', '1', '1', '2016-06-28 22:41:31', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('38', 'work', '1', '1', '2016-06-28 22:41:31', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('39', 'work', '1', '1', '2016-06-28 22:41:32', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('40', 'work', '1', '1', '2016-06-28 22:41:32', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('41', 'work', '1', '1', '2016-06-28 22:41:32', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('42', 'work', '1', '1', '2016-06-28 22:41:58', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('43', 'work', '1', '1', '2016-06-28 22:42:00', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('44', 'work', '1', '1', '2016-06-28 22:43:14', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('45', 'work', '1', '1', '2016-06-28 22:43:16', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('46', 'work', '1', '1', '2016-06-28 22:43:22', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('47', 'work', '1', '1', '2016-06-28 22:44:30', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('48', 'work', '1', '1', '2016-06-28 22:44:33', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('49', 'work', '1', '1', '2016-06-28 22:45:26', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('50', 'work', '1', '1', '2016-06-28 22:46:12', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('51', 'work', '1', '1', '2016-06-28 22:46:15', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('52', 'work', '1', '1', '2016-06-28 22:46:16', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('53', 'work', '1', '1', '2016-06-28 22:46:16', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('54', 'work', '1', '1', '2016-06-28 22:46:26', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('55', 'work', '1', '1', '2016-06-28 22:46:29', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('56', 'work', '1', '1', '2016-06-28 22:48:41', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('57', 'work', '1', '1', '2016-06-28 22:48:50', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('58', 'work', '1', '1', '2016-06-28 22:48:59', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('59', 'work', '1', '1', '2016-06-28 22:49:02', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('60', 'work', '1', '1', '2016-06-28 22:49:50', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('61', 'work', '1', '1', '2016-06-28 22:50:00', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('62', 'work', '1', '1', '2016-06-28 22:51:31', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('63', 'work', '1', '1', '2016-06-28 22:51:36', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('64', 'daily', '10', '1', '2016-06-28 22:51:46', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('65', 'daily', '10', '1', '2016-06-28 22:51:50', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('66', 'daily', '10', '1', '2016-06-28 22:53:11', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('67', 'daily', '10', '1', '2016-06-28 22:53:35', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('68', 'daily', '10', '1', '2016-06-28 22:53:37', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('69', 'work', '1', '1', '2016-06-28 22:53:39', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('70', 'work', '1', '1', '2016-06-28 22:54:07', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('71', 'daily', '7', '1', '2016-06-28 22:57:35', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('72', 'daily', '7', '1', '2016-06-28 22:57:47', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('73', 'work', '1', '1', '2016-06-28 22:58:18', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('74', 'work', '1', '1', '2016-06-28 23:01:19', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('75', 'work', '1', '1', '2016-06-28 23:01:19', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('76', 'work', '1', '1', '2016-06-28 23:02:35', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('77', 'work', '1', '1', '2016-06-28 23:02:39', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('78', 'work', '1', '1', '2016-06-28 23:02:40', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('79', 'work', '1', '1', '2016-06-28 23:03:51', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('80', 'work', '1', '1', '2016-06-28 23:03:51', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('81', 'work', '1', '1', '2016-06-28 23:03:56', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('82', 'work', '1', '1', '2016-06-28 23:04:53', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('83', 'work', '1', '1', '2016-06-28 23:04:53', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('84', 'work', '1', '1', '2016-06-28 23:06:52', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('85', 'work', '1', '1', '2016-06-28 23:07:17', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('86', 'work', '1', '1', '2016-06-28 23:07:17', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('87', 'work', '1', '1', '2016-06-28 23:08:46', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('88', 'work', '1', '1', '2016-06-28 23:08:52', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('89', 'work', '1', '1', '2016-06-28 23:10:55', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('90', 'work', '1', '1', '2016-06-28 23:11:01', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('91', 'work', '1', '1', '2016-06-28 23:11:13', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('92', 'work', '1', '1', '2016-06-28 23:11:20', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('93', 'work', '1', '1', '2016-06-28 23:12:55', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('94', 'work', '1', '1', '2016-06-29 09:13:35', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('95', 'work', '2', '5', '2016-06-29 09:15:44', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('96', 'work', '2', '5', '2016-06-29 09:19:14', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('97', 'work', '2', '5', '2016-06-29 09:19:24', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('98', 'work', '3', '5', '2016-06-29 09:32:49', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('99', 'work', '3', '5', '2016-06-29 09:32:57', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('100', 'work', '3', '1', '2016-06-29 09:46:17', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('101', 'work', '3', '1', '2016-06-29 09:47:13', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('102', 'work', '3', '1', '2016-06-29 09:47:19', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('103', 'work', '3', '1', '2016-06-29 09:47:56', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('104', 'work', '3', '1', '2016-06-29 09:48:22', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('105', 'work', '2', '1', '2016-06-29 09:52:41', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('106', 'work', '3', '1', '2016-06-29 10:59:08', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('107', 'work', '3', '1', '2016-06-29 10:59:17', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('108', 'work', '2', '1', '2016-06-29 10:59:20', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('109', 'work', '2', '1', '2016-06-29 10:59:57', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('110', 'work', '2', '1', '2016-06-29 11:04:09', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('111', 'work', '2', '1', '2016-06-29 11:10:07', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('112', 'work', '2', '1', '2016-06-29 11:10:45', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('113', 'work', '2', '1', '2016-06-29 11:10:47', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('114', 'work', '2', '1', '2016-06-29 11:11:35', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('115', 'work', '2', '1', '2016-06-29 11:13:04', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('116', 'work', '2', '1', '2016-06-29 11:13:32', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('117', 'work', '2', '1', '2016-06-29 11:14:03', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('118', 'work', '4', '1', '2016-06-29 11:16:52', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('119', 'work', '4', '1', '2016-06-29 11:19:57', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('120', 'work', '4', '1', '2016-06-29 11:20:01', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('121', 'work', '4', '1', '2016-06-29 11:20:14', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('122', 'work', '4', '1', '2016-06-29 11:21:58', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('123', 'work', '4', '1', '2016-06-29 12:25:44', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('124', 'work', '4', '2', '2016-06-29 12:26:54', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('125', 'work', '4', '2', '2016-06-29 12:27:09', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('126', 'work', '4', '2', '2016-06-29 12:27:16', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('127', 'work', '4', '2', '2016-06-29 12:29:20', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('128', 'work', '4', '1', '2016-06-29 12:33:47', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('129', 'work', '2', '1', '2016-06-29 12:34:12', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('130', 'work', '4', '1', '2016-06-29 12:35:32', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('131', 'work', '4', '2', '2016-06-29 13:42:05', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('132', 'infor', '1', '1', '2016-06-29 15:30:28', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('133', 'work', '4', '1', '2016-06-30 12:17:55', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('134', 'work', '4', '1', '2016-06-30 12:22:48', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('135', 'work', '4', '1', '2016-06-30 12:23:00', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('136', 'work', '4', '1', '2016-06-30 13:38:40', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('137', 'work', '4', '1', '2016-06-30 13:40:13', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('138', 'work', '4', '1', '2016-06-30 13:43:54', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('139', 'daily', '11', '1', '2016-06-30 13:47:16', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('140', 'daily', '11', '1', '2016-06-30 13:47:25', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('141', 'work', '4', '1', '2016-06-30 13:47:30', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('142', 'work', '4', '1', '2016-06-30 13:47:32', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('143', 'work', '4', '1', '2016-06-30 13:48:01', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('144', 'work', '4', '1', '2016-06-30 13:49:00', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('145', 'work', '4', '1', '2016-06-30 13:49:13', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('146', 'work', '4', '1', '2016-06-30 13:49:42', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('147', 'work', '4', '1', '2016-06-30 13:49:56', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('148', 'work', '4', '1', '2016-06-30 13:50:30', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('149', 'work', '4', '1', '2016-06-30 13:50:55', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('150', 'work', '4', '1', '2016-06-30 13:53:12', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('151', 'work', '4', '1', '2016-06-30 13:53:17', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('152', 'work', '4', '1', '2016-06-30 13:53:18', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('153', 'work', '4', '1', '2016-06-30 13:53:25', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('154', 'daily', '11', '1', '2016-06-30 13:53:50', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('155', 'daily', '11', '1', '2016-06-30 13:53:58', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('156', 'daily', '11', '1', '2016-06-30 13:58:45', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('157', 'work', '4', '1', '2016-06-30 14:08:13', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('158', 'work', '4', '1', '2016-06-30 14:08:50', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('159', 'work', '4', '1', '2016-06-30 14:09:01', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('160', 'work', '4', '1', '2016-06-30 14:10:17', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('161', 'work', '4', '1', '2016-06-30 14:10:34', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('162', 'work', '4', '1', '2016-06-30 14:10:58', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('163', 'work', '4', '1', '2016-06-30 14:11:14', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('164', 'work', '4', '1', '2016-06-30 14:11:37', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('165', 'work', '4', '1', '2016-06-30 14:11:44', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('166', 'work', '4', '1', '2016-06-30 14:11:53', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('167', 'work', '4', '1', '2016-06-30 14:12:05', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('168', 'work', '4', '1', '2016-06-30 14:12:12', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('169', 'work', '4', '1', '2016-06-30 14:12:43', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('170', 'work', '4', '1', '2016-06-30 14:12:50', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('171', 'work', '4', '1', '2016-06-30 14:13:20', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('172', 'work', '4', '1', '2016-06-30 14:14:22', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('173', 'work', '4', '1', '2016-06-30 14:14:53', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('174', 'work', '4', '1', '2016-06-30 14:15:16', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('175', 'work', '4', '1', '2016-06-30 14:15:30', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('176', 'work', '4', '1', '2016-06-30 14:15:59', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('177', 'work', '4', '1', '2016-06-30 14:16:19', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('178', 'work', '4', '1', '2016-06-30 14:16:29', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('179', 'work', '4', '1', '2016-06-30 14:16:35', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('180', 'work', '4', '1', '2016-06-30 14:16:59', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('181', 'work', '4', '1', '2016-06-30 14:17:14', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('182', 'work', '4', '1', '2016-06-30 14:17:19', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('183', 'work', '4', '1', '2016-06-30 14:17:59', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('184', 'work', '4', '1', '2016-06-30 14:18:09', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('185', 'work', '4', '1', '2016-06-30 14:18:30', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('186', 'work', '4', '1', '2016-06-30 14:18:32', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('187', 'daily', '11', '1', '2016-06-30 14:18:51', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('188', 'daily', '11', '1', '2016-06-30 14:18:55', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('189', 'daily', '11', '1', '2016-06-30 14:19:51', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('190', 'work', '4', '1', '2016-06-30 14:19:58', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('191', 'work', '4', '1', '2016-06-30 14:21:53', '192.168.1.126', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('192', 'work', '4', '1', '2016-06-30 19:23:31', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('193', 'work', '4', '1', '2016-06-30 19:26:22', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('194', 'work', '4', '1', '2016-06-30 19:26:32', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('195', 'work', '4', '1', '2016-06-30 19:32:20', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('196', 'work', '4', '1', '2016-06-30 19:33:14', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('197', 'work', '4', '1', '2016-06-30 19:33:15', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('198', 'work', '4', '1', '2016-06-30 19:34:49', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('199', 'work', '4', '1', '2016-06-30 19:39:24', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('200', 'work', '4', '1', '2016-06-30 19:39:26', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('201', 'work', '4', '1', '2016-06-30 19:40:24', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('202', 'work', '4', '1', '2016-06-30 19:40:47', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('203', 'work', '4', '1', '2016-06-30 19:40:48', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('204', 'work', '4', '1', '2016-06-30 19:40:59', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('205', 'work', '4', '1', '2016-06-30 19:41:04', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('206', 'work', '4', '1', '2016-06-30 19:41:36', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('207', 'work', '4', '1', '2016-06-30 19:41:48', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('208', 'work', '4', '1', '2016-06-30 19:41:48', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('209', 'work', '4', '1', '2016-06-30 19:41:52', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('210', 'work', '4', '1', '2016-06-30 19:41:53', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('211', 'work', '4', '1', '2016-06-30 19:42:44', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('212', 'work', '4', '1', '2016-06-30 19:42:48', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('213', 'work', '4', '1', '2016-06-30 19:42:53', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('214', 'work', '4', '1', '2016-06-30 19:44:31', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('215', 'work', '4', '1', '2016-06-30 19:45:03', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('216', 'work', '4', '1', '2016-06-30 19:45:30', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('217', 'work', '4', '1', '2016-06-30 19:47:29', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('218', 'work', '4', '1', '2016-06-30 19:47:32', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('219', 'work', '4', '1', '2016-06-30 19:47:49', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('220', 'work', '4', '1', '2016-06-30 19:48:21', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('221', 'work', '4', '1', '2016-06-30 19:50:21', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('222', 'work', '4', '1', '2016-06-30 19:50:42', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('223', 'work', '4', '1', '2016-06-30 19:50:48', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('224', 'work', '4', '1', '2016-06-30 19:51:47', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('225', 'work', '4', '1', '2016-06-30 19:52:14', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('226', 'work', '4', '1', '2016-06-30 19:52:21', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('227', 'work', '4', '1', '2016-06-30 19:52:59', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('228', 'work', '4', '1', '2016-06-30 19:54:06', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('229', 'work', '4', '1', '2016-06-30 19:54:33', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('230', 'work', '4', '1', '2016-06-30 19:54:34', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('231', 'work', '4', '1', '2016-06-30 19:55:05', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('232', 'work', '4', '1', '2016-06-30 19:55:25', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('233', 'work', '4', '6', '2016-06-30 20:01:47', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('234', 'work', '4', '6', '2016-06-30 20:02:15', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('235', 'work', '4', '6', '2016-06-30 20:04:25', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('236', 'work', '4', '6', '2016-06-30 20:05:20', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('237', 'work', '4', '6', '2016-06-30 20:05:42', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('238', 'work', '4', '6', '2016-06-30 20:09:47', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('239', 'work', '4', '6', '2016-06-30 20:10:45', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('240', 'work', '4', '6', '2016-06-30 20:10:46', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('241', 'work', '4', '6', '2016-06-30 20:11:33', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('242', 'work', '4', '6', '2016-06-30 20:12:17', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('243', 'work', '4', '6', '2016-06-30 20:12:18', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('244', 'work', '4', '6', '2016-06-30 20:12:50', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('245', 'work', '3', '1', '2016-06-30 20:13:18', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('246', 'work', '2', '1', '2016-06-30 20:13:20', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('247', 'work', '2', '1', '2016-06-30 20:13:32', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('248', 'work', '4', '6', '2016-06-30 20:15:02', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('249', 'infor', '4', '1', '2016-06-30 20:16:10', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('250', 'infor', '1', '1', '2016-06-30 20:16:56', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('251', 'work', '3', '1', '2016-06-30 20:17:18', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('252', 'work', '3', '1', '2016-06-30 20:17:46', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('253', 'work', '3', '1', '2016-06-30 20:17:55', '127.0.0.1', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('254', 'work', '3', '1', '2016-06-30 20:18:00', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('255', 'work', '3', '1', '2016-06-30 20:23:19', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('256', 'work', '3', '1', '2016-06-30 20:25:04', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('257', 'work', '3', '1', '2016-06-30 20:25:10', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('258', 'work', '3', '1', '2016-06-30 20:26:26', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('259', 'work', '4', '1', '2016-06-30 20:26:41', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('260', 'work', '4', '1', '2016-06-30 20:26:46', '127.0.0.1', 'Firefox');
INSERT INTO `xinhu_reads` VALUES ('261', 'work', '4', '1', '2016-06-30 20:26:53', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('262', 'work', '4', '1', '2016-06-30 20:28:51', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('263', 'work', '4', '1', '2016-06-30 20:29:04', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('264', 'work', '4', '1', '2016-06-30 20:29:15', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('265', 'work', '4', '1', '2016-06-30 20:37:13', '127.0.0.1', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('266', 'daily', '13', '6', '2016-06-30 20:37:21', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('267', 'daily', '13', '6', '2016-06-30 20:37:27', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('268', 'daily', '13', '6', '2016-06-30 20:37:30', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('269', 'daily', '13', '6', '2016-06-30 20:37:33', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('270', 'daily', '13', '6', '2016-06-30 20:38:27', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('271', 'daily', '13', '6', '2016-06-30 20:39:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('272', 'daily', '13', '6', '2016-06-30 20:40:13', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('273', 'daily', '13', '6', '2016-06-30 20:40:36', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('274', 'daily', '13', '6', '2016-06-30 20:40:38', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('275', 'daily', '13', '6', '2016-06-30 20:40:46', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('276', 'daily', '13', '6', '2016-06-30 20:41:01', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('277', 'daily', '13', '6', '2016-06-30 20:41:01', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('278', 'daily', '13', '6', '2016-06-30 20:41:02', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('279', 'daily', '13', '6', '2016-06-30 20:41:02', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('280', 'daily', '13', '6', '2016-06-30 20:41:02', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('281', 'daily', '13', '6', '2016-06-30 20:41:03', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('282', 'daily', '13', '6', '2016-06-30 20:41:04', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('283', 'daily', '13', '6', '2016-06-30 20:41:35', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('284', 'daily', '13', '6', '2016-06-30 20:41:52', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('285', 'daily', '13', '6', '2016-06-30 20:42:12', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('286', 'daily', '13', '6', '2016-06-30 20:42:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('287', 'daily', '13', '6', '2016-06-30 20:42:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('288', 'daily', '13', '6', '2016-06-30 20:42:33', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('289', 'daily', '13', '6', '2016-06-30 20:42:36', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('290', 'daily', '11', '1', '2016-06-30 20:43:52', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('291', 'daily', '11', '1', '2016-06-30 20:44:23', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('292', 'daily', '11', '1', '2016-06-30 20:44:52', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('293', 'daily', '11', '1', '2016-06-30 20:45:13', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('294', 'daily', '11', '1', '2016-06-30 20:45:42', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('295', 'daily', '11', '1', '2016-06-30 20:46:26', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('296', 'daily', '11', '1', '2016-06-30 20:46:28', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('297', 'daily', '11', '1', '2016-06-30 20:46:44', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('298', 'daily', '11', '1', '2016-06-30 20:46:58', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('299', 'daily', '11', '1', '2016-06-30 20:47:52', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('300', 'daily', '13', '6', '2016-06-30 20:48:47', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('301', 'daily', '13', '6', '2016-06-30 20:49:00', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('302', 'daily', '13', '6', '2016-06-30 20:49:13', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('303', 'daily', '13', '6', '2016-06-30 20:49:15', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('304', 'daily', '13', '6', '2016-06-30 20:49:18', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('305', 'daily', '13', '6', '2016-06-30 20:49:19', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('306', 'daily', '13', '6', '2016-06-30 20:49:20', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('307', 'daily', '13', '6', '2016-06-30 20:49:21', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('308', 'daily', '11', '1', '2016-06-30 20:49:24', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('309', 'daily', '11', '1', '2016-06-30 20:49:44', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('310', 'daily', '11', '1', '2016-06-30 20:49:53', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('311', 'daily', '13', '6', '2016-06-30 20:50:59', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('312', 'daily', '13', '6', '2016-06-30 20:51:12', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('313', 'daily', '13', '6', '2016-06-30 20:51:23', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('314', 'daily', '13', '6', '2016-06-30 20:52:14', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('315', 'daily', '13', '6', '2016-06-30 20:52:14', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('316', 'daily', '13', '6', '2016-06-30 20:52:15', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('317', 'daily', '13', '6', '2016-06-30 20:52:16', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('318', 'daily', '13', '6', '2016-06-30 20:52:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('319', 'daily', '13', '6', '2016-06-30 20:52:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('320', 'daily', '13', '6', '2016-06-30 20:52:19', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('321', 'daily', '13', '6', '2016-06-30 20:52:19', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('322', 'daily', '13', '6', '2016-06-30 20:52:37', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('323', 'daily', '13', '6', '2016-06-30 20:52:58', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('324', 'daily', '13', '6', '2016-06-30 20:53:03', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('325', 'daily', '11', '1', '2016-06-30 20:53:10', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('326', 'daily', '11', '1', '2016-06-30 20:53:31', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('327', 'daily', '11', '1', '2016-06-30 20:54:28', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('328', 'daily', '13', '6', '2016-06-30 20:55:40', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('329', 'daily', '13', '6', '2016-06-30 20:55:43', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('330', 'daily', '11', '1', '2016-06-30 20:55:47', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('331', 'daily', '11', '1', '2016-06-30 20:55:53', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('332', 'daily', '13', '6', '2016-06-30 20:56:06', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('333', 'daily', '13', '6', '2016-06-30 20:56:34', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('334', 'daily', '13', '6', '2016-06-30 20:56:38', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('335', 'daily', '13', '6', '2016-06-30 20:56:51', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('336', 'daily', '13', '6', '2016-06-30 20:56:56', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('337', 'daily', '11', '1', '2016-06-30 20:56:59', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('338', 'daily', '13', '6', '2016-06-30 20:57:28', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('339', 'daily', '13', '6', '2016-06-30 20:57:29', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('340', 'daily', '13', '6', '2016-06-30 20:57:33', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('341', 'daily', '11', '1', '2016-06-30 20:57:36', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('342', 'daily', '11', '1', '2016-06-30 20:58:06', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('343', 'daily', '11', '1', '2016-06-30 20:58:08', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('344', 'daily', '11', '1', '2016-06-30 20:58:12', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('345', 'work', '3', '1', '2016-06-30 20:58:20', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('346', 'work', '3', '1', '2016-06-30 20:58:23', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('347', 'work', '3', '1', '2016-06-30 20:58:33', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('348', 'work', '3', '1', '2016-06-30 20:58:34', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('349', 'work', '4', '6', '2016-06-30 21:00:22', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('350', 'work', '4', '6', '2016-06-30 21:00:29', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('351', 'work', '4', '6', '2016-06-30 21:00:35', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('352', 'work', '4', '6', '2016-06-30 21:01:33', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('353', 'work', '4', '6', '2016-06-30 21:01:44', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('354', 'work', '4', '6', '2016-06-30 21:02:27', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('355', 'work', '4', '6', '2016-06-30 21:02:46', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('356', 'work', '4', '6', '2016-06-30 21:03:06', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('357', 'work', '4', '6', '2016-06-30 21:03:14', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('358', 'work', '4', '6', '2016-06-30 21:03:24', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('359', 'work', '4', '6', '2016-06-30 21:03:36', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('360', 'work', '4', '6', '2016-06-30 21:03:47', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('361', 'work', '4', '6', '2016-06-30 21:04:28', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('362', 'work', '4', '6', '2016-06-30 21:04:59', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('363', 'work', '4', '6', '2016-06-30 21:05:08', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('364', 'work', '4', '6', '2016-06-30 21:06:46', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('365', 'work', '4', '6', '2016-06-30 21:07:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('366', 'work', '4', '6', '2016-06-30 21:08:27', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('367', 'work', '4', '6', '2016-06-30 21:09:16', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('368', 'work', '4', '6', '2016-06-30 21:09:31', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('369', 'work', '4', '6', '2016-06-30 21:11:12', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('370', 'work', '4', '6', '2016-06-30 21:11:24', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('371', 'work', '4', '6', '2016-06-30 21:11:35', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('372', 'work', '4', '6', '2016-06-30 21:11:43', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('373', 'work', '4', '6', '2016-06-30 21:12:00', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('374', 'work', '4', '6', '2016-06-30 21:12:54', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('375', 'work', '4', '6', '2016-06-30 21:13:11', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('376', 'work', '4', '6', '2016-06-30 21:13:15', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('377', 'work', '3', '1', '2016-06-30 21:13:24', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('378', 'work', '3', '1', '2016-06-30 21:13:25', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('379', 'work', '3', '1', '2016-06-30 21:13:36', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('380', 'work', '4', '6', '2016-06-30 21:14:29', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('381', 'work', '4', '6', '2016-06-30 21:14:42', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('382', 'work', '4', '6', '2016-06-30 21:14:50', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('383', 'work', '4', '6', '2016-06-30 21:14:52', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('384', 'work', '4', '6', '2016-06-30 21:15:11', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('385', 'work', '4', '6', '2016-06-30 21:15:34', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('386', 'work', '4', '6', '2016-06-30 21:15:37', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('387', 'work', '4', '6', '2016-06-30 21:15:40', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('388', 'work', '4', '6', '2016-06-30 21:15:45', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('389', 'work', '3', '1', '2016-06-30 21:15:56', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('390', 'work', '4', '6', '2016-06-30 21:17:47', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('391', 'work', '4', '6', '2016-06-30 21:17:48', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('392', 'work', '4', '6', '2016-06-30 21:17:49', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('393', 'work', '4', '6', '2016-06-30 21:17:49', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('394', 'work', '4', '6', '2016-06-30 21:17:50', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('395', 'work', '4', '6', '2016-06-30 21:22:46', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('396', 'work', '4', '6', '2016-06-30 21:22:53', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('397', 'work', '4', '6', '2016-06-30 21:22:53', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('398', 'work', '4', '6', '2016-06-30 21:23:17', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('399', 'work', '4', '6', '2016-06-30 21:23:21', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('400', 'work', '4', '6', '2016-06-30 21:23:21', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('401', 'work', '4', '6', '2016-06-30 21:23:29', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('402', 'work', '4', '6', '2016-06-30 21:23:47', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('403', 'work', '3', '1', '2016-06-30 21:23:51', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('404', 'work', '3', '1', '2016-06-30 21:23:58', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('405', 'work', '3', '1', '2016-06-30 21:24:19', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('406', 'work', '3', '1', '2016-06-30 21:24:30', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('407', 'work', '3', '1', '2016-06-30 21:25:30', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('408', 'work', '3', '1', '2016-06-30 21:26:04', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('409', 'work', '3', '1', '2016-06-30 21:27:51', '192.168.1.100', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('410', 'work', '4', '6', '2016-06-30 21:30:44', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('411', 'work', '4', '6', '2016-06-30 21:32:49', '192.168.1.103', 'Safari');
INSERT INTO `xinhu_reads` VALUES ('412', 'daily', '13', '6', '2016-06-30 21:47:50', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('413', 'daily', '13', '6', '2016-06-30 21:57:42', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('414', 'daily', '13', '6', '2016-06-30 21:57:46', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('415', 'daily', '13', '6', '2016-06-30 21:57:47', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('416', 'infor', '4', '6', '2016-06-30 21:57:55', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('417', 'infor', '3', '6', '2016-06-30 21:58:18', '192.168.1.103', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('418', 'work', '2', '1', '2016-07-01 10:13:16', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('419', 'work', '2', '1', '2016-07-01 10:13:41', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('420', 'daily', '13', '1', '2016-07-01 10:14:25', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('421', 'daily', '6', '1', '2016-07-01 10:14:30', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('422', 'work', '2', '1', '2016-07-01 10:57:22', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('423', 'work', '2', '1', '2016-07-01 11:01:32', '192.168.1.176', 'Chrome');
INSERT INTO `xinhu_reads` VALUES ('424', 'infor', '2', '1', '2016-07-01 11:12:23', '192.168.1.176', 'Chrome');

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
INSERT INTO `xinhu_task` VALUES ('1', '任务提醒', 'work,todo', 'd', '01:20:00', '每天凌晨1.20', '1', '2', '2016-03-12 01:20:00', null, '0', null, '﻿success');
INSERT INTO `xinhu_task` VALUES ('2', '流程匹配', 'flow,pipei', 'd,d', '01:00:00,12:00:00', '每天凌晨1点,12点', '1', '2', '2016-03-12 01:00:00', null, '0', null, '﻿success');

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_todo
-- ----------------------------
INSERT INTO `xinhu_todo` VALUES ('26', '2', '立项任务', 'hehehe(待执行)，将在2天后到期', '1', '2016-03-10 13:26:15', 'work', '11', '2016-03-10 13:28:17', '2016-03-10 08:00:00');
INSERT INTO `xinhu_todo` VALUES ('24', '1', '绩效任务', '[管理员]修改[绩效任务]任务:请尽快提交相关资料', '1', '2016-03-10 12:00:38', 'work', '8', '2016-03-10 12:36:35', '2016-03-10 12:00:38');
INSERT INTO `xinhu_todo` VALUES ('29', '2', '立项任务', 'hehehe(待执行)，今日到期', '0', '2016-03-12 01:20:00', 'work', '11', null, '2016-03-12 19:49:50');
INSERT INTO `xinhu_todo` VALUES ('28', '1', '立项任务', '[管理员]新增[立项任务]任务:hehehehee', '1', '2016-03-11 22:20:45', 'work', '12', '2016-03-12 08:43:42', '2016-03-11 22:20:45');
INSERT INTO `xinhu_todo` VALUES ('30', '1', '绩效任务', '[管理员]新增[绩效任务]任务:哈哈哈哈哈啊', '1', '2016-03-12 19:15:56', 'work', '13', '2016-03-13 13:37:02', '2016-03-12 19:15:56');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xinhu_work
-- ----------------------------
INSERT INTO `xinhu_work` VALUES ('1', null, '有bug哦', 'bug', '低', '1', '管理员', null, '2016-06-28 20:30:17', '1', '管理员', null, null, '1', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('2', null, '设计一个信呼的logo出来哦', '设计', '中', '1', '管理员', '1、要求简单美观。\n2、高大上的，能代表出系统的。\n3、先来几个版本看看。', '2016-06-29 09:15:25', '5', '磐石', null, null, '2', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('3', null, '严重的bug修复吧', 'bug', '紧急', '5', '磐石', '页面漂亮需要改进。数据库上表不合理。', '2016-06-29 09:26:57', '5', '磐石', null, null, '0', null, '0', '1');
INSERT INTO `xinhu_work` VALUES ('4', null, '官网设计并给预算', '设计', '高', '6', '张飞', '1、美观大气啊。\n2、财务给奖励预算。\n3、1给礼拜完成哦。', '2016-06-29 11:16:40', '1', '管理员', '2016-06-29 11:14:19', '2016-07-06 11:16:00', '1', null, '0', '1');

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
