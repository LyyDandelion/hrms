/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50559
Source Host           : localhost:3306
Source Database       : hrms

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2019-05-23 18:13:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_approve_option`
-- ----------------------------
DROP TABLE IF EXISTS `t_approve_option`;
CREATE TABLE `t_approve_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `option_code` varchar(255) NOT NULL COMMENT '审批意见code',
  `option_name` varchar(255) NOT NULL COMMENT '审批意见名称',
  `option_user` varchar(20) NOT NULL COMMENT '收藏意见dah',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='默认审批意见表';

-- ----------------------------
-- Records of t_approve_option
-- ----------------------------
INSERT INTO `t_approve_option` VALUES ('1', '', '请领导阅示', 'admin');
INSERT INTO `t_approve_option` VALUES ('2', '', '同意', 'admin');

-- ----------------------------
-- Table structure for `t_constant`
-- ----------------------------
DROP TABLE IF EXISTS `t_constant`;
CREATE TABLE `t_constant` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL COMMENT '常量类型',
  `en_key` varchar(100) DEFAULT NULL COMMENT '英文key',
  `name` varchar(200) NOT NULL COMMENT '常量名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8 COMMENT='常量表';

-- ----------------------------
-- Records of t_constant
-- ----------------------------
INSERT INTO `t_constant` VALUES ('1', 'position', '1', '讲师');
INSERT INTO `t_constant` VALUES ('2', 'position', '2', '副教授');
INSERT INTO `t_constant` VALUES ('3', 'id', 'index2', '121');
INSERT INTO `t_constant` VALUES ('4', 'id', 'index1', '10');
INSERT INTO `t_constant` VALUES ('11', 'position', '3', '教授');
INSERT INTO `t_constant` VALUES ('336', 'suggestBh', 'suggestBh', '201811050');
INSERT INTO `t_constant` VALUES ('342', 'suggestStatus', 'departmentHandle', 'handleMember');
INSERT INTO `t_constant` VALUES ('343', 'suggestStatus', 'managerReview', 'manager');
INSERT INTO `t_constant` VALUES ('344', 'suggestStatus', 'processEnd', 'user');

-- ----------------------------
-- Table structure for `t_data_authority`
-- ----------------------------
DROP TABLE IF EXISTS `t_data_authority`;
CREATE TABLE `t_data_authority` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) NOT NULL COMMENT '档案号',
  `jgh` varchar(50) NOT NULL COMMENT '机构号',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `dah` (`dah`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='数据权限表';

-- ----------------------------
-- Records of t_data_authority
-- ----------------------------
INSERT INTO `t_data_authority` VALUES ('12', '95555', '800', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('13', '95555', '801', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('14', '95555', '802', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('15', '95555', '888', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('16', '95555', '900', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('17', '95555', '901', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES ('22', '567', '888', '2019-04-24 23:20:24');
INSERT INTO `t_data_authority` VALUES ('28', '01065', '001', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('29', '01065', '800', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('30', '01065', '801', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('31', '01065', '802', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('32', '01065', '888', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('33', '01065', '900', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('34', '01065', '901', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES ('40', '01070', '001', '2019-05-19 22:44:10');
INSERT INTO `t_data_authority` VALUES ('41', '1314', '888', '2019-05-19 22:44:25');
INSERT INTO `t_data_authority` VALUES ('42', '00987', '900', '2019-05-22 00:21:19');
INSERT INTO `t_data_authority` VALUES ('43', '00987', '901', '2019-05-22 00:21:19');
INSERT INTO `t_data_authority` VALUES ('44', '1501', '802', '2019-05-22 00:26:19');

-- ----------------------------
-- Table structure for `t_dept_info`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_info`;
CREATE TABLE `t_dept_info` (
  `jgh` varchar(50) NOT NULL COMMENT '机构号',
  `jgmc` varchar(255) NOT NULL COMMENT '机构名称',
  `sjjg` varchar(50) DEFAULT NULL COMMENT '上级机构',
  `sfydzh` varchar(20) DEFAULT NULL COMMENT '预留位',
  `flag` varchar(1) NOT NULL DEFAULT '0' COMMENT '0：正常状态 1：删除',
  `num` int(4) DEFAULT NULL COMMENT '排序',
  `jgjp` varchar(50) DEFAULT NULL COMMENT '机构简拼',
  PRIMARY KEY (`jgh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of t_dept_info
-- ----------------------------
INSERT INTO `t_dept_info` VALUES ('001', '广东石油化工学院', '000', null, '0', '0', null);
INSERT INTO `t_dept_info` VALUES ('800', '教辅机构', '000', null, '0', '1', null);
INSERT INTO `t_dept_info` VALUES ('801', '教务处', '800', null, '0', '2', null);
INSERT INTO `t_dept_info` VALUES ('802', '图书馆', '800', null, '0', '3', null);
INSERT INTO `t_dept_info` VALUES ('888', '网络中心', '800', '', '0', '4', null);
INSERT INTO `t_dept_info` VALUES ('900', '管理机构', '000', null, '0', '5', null);
INSERT INTO `t_dept_info` VALUES ('901', '实验楼', '900', null, '0', '6', null);

-- ----------------------------
-- Table structure for `t_dept_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_user`;
CREATE TABLE `t_dept_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) NOT NULL COMMENT '工号',
  `jgh` varchar(50) NOT NULL COMMENT '机构号',
  PRIMARY KEY (`id`),
  KEY `dah` (`dah`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='用户机构关联表';

-- ----------------------------
-- Records of t_dept_user
-- ----------------------------
INSERT INTO `t_dept_user` VALUES ('11', '95555', '888');
INSERT INTO `t_dept_user` VALUES ('12', '91821', '888');
INSERT INTO `t_dept_user` VALUES ('13', 'admin', '888');
INSERT INTO `t_dept_user` VALUES ('15', 'PC001', '001');
INSERT INTO `t_dept_user` VALUES ('16', 'PC002', '001');
INSERT INTO `t_dept_user` VALUES ('17', 'PC003', '001');
INSERT INTO `t_dept_user` VALUES ('18', 'PC004', '001');
INSERT INTO `t_dept_user` VALUES ('19', 'PC005', '001');
INSERT INTO `t_dept_user` VALUES ('20', 'PC006', '001');
INSERT INTO `t_dept_user` VALUES ('21', 'PC007', '001');
INSERT INTO `t_dept_user` VALUES ('22', 'PC008', '001');
INSERT INTO `t_dept_user` VALUES ('23', 'PC009', '001');
INSERT INTO `t_dept_user` VALUES ('24', 'PC10', '001');
INSERT INTO `t_dept_user` VALUES ('25', 'PC011', '001');
INSERT INTO `t_dept_user` VALUES ('26', 'PC012', '001');
INSERT INTO `t_dept_user` VALUES ('27', 'PC013', '001');
INSERT INTO `t_dept_user` VALUES ('28', 'PC014', '001');
INSERT INTO `t_dept_user` VALUES ('29', 'PC015', '001');
INSERT INTO `t_dept_user` VALUES ('30', 'PC016', '001');
INSERT INTO `t_dept_user` VALUES ('31', 'PC017', '001');
INSERT INTO `t_dept_user` VALUES ('32', 'PC018', '001');
INSERT INTO `t_dept_user` VALUES ('33', 'PC019', '001');
INSERT INTO `t_dept_user` VALUES ('34', 'PC020', '001');
INSERT INTO `t_dept_user` VALUES ('35', 'PC021', '001');
INSERT INTO `t_dept_user` VALUES ('36', 'PC022', '001');
INSERT INTO `t_dept_user` VALUES ('37', 'PC023', '001');
INSERT INTO `t_dept_user` VALUES ('38', 'PC024', '001');
INSERT INTO `t_dept_user` VALUES ('39', 'PC025', '001');
INSERT INTO `t_dept_user` VALUES ('40', 'TST001', '001');
INSERT INTO `t_dept_user` VALUES ('41', 'TST002', '001');
INSERT INTO `t_dept_user` VALUES ('42', 'TST003', '001');
INSERT INTO `t_dept_user` VALUES ('43', 'TST004', '001');
INSERT INTO `t_dept_user` VALUES ('44', 'TST005', '001');
INSERT INTO `t_dept_user` VALUES ('45', '15034403', '001');
INSERT INTO `t_dept_user` VALUES ('46', '567', '888');
INSERT INTO `t_dept_user` VALUES ('48', '1314', '901');
INSERT INTO `t_dept_user` VALUES ('49', '00987', '901');
INSERT INTO `t_dept_user` VALUES ('50', '2234', '801');
INSERT INTO `t_dept_user` VALUES ('51', '2288', '001');
INSERT INTO `t_dept_user` VALUES ('52', '201901', '802');
INSERT INTO `t_dept_user` VALUES ('53', '201902', '888');

-- ----------------------------
-- Table structure for `t_hrms_salary`
-- ----------------------------
DROP TABLE IF EXISTS `t_hrms_salary`;
CREATE TABLE `t_hrms_salary` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(10) DEFAULT NULL COMMENT '员工编码',
  `post_salary` double DEFAULT NULL COMMENT '岗位工资',
  `year_salary` double DEFAULT NULL COMMENT '工龄工资',
  `float_salary` double DEFAULT NULL COMMENT '浮动工资（绩效工资等）',
  `award` double DEFAULT NULL COMMENT '奖金',
  `tel_allowrance` double DEFAULT NULL COMMENT '通讯补贴',
  `traffic_allowrance` double DEFAULT NULL COMMENT '交通补贴',
  `lunch_allowrance` double DEFAULT NULL COMMENT '用餐补贴',
  `insurance` double DEFAULT NULL COMMENT '社保',
  `endowment_insurance` double DEFAULT NULL COMMENT '养老金',
  `medical_insurance` double DEFAULT NULL COMMENT '医保',
  `work_year` double DEFAULT NULL COMMENT '工龄',
  `post_level` double DEFAULT NULL COMMENT '岗位等级',
  `flag` varchar(1) NOT NULL COMMENT '标志',
  `note1` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `dah` (`dah`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='薪酬表';

-- ----------------------------
-- Records of t_hrms_salary
-- ----------------------------
INSERT INTO `t_hrms_salary` VALUES ('14', '201901', '2200', '575', '123', '3000', '200', '400', '60', '4600', '7360', '2300', '23', '2', '1', null, null);

-- ----------------------------
-- Table structure for `t_log`
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `DATETIME` datetime NOT NULL COMMENT '时间',
  `dah` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `jgh` varchar(50) DEFAULT NULL COMMENT '机构号',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `type` varchar(5000) DEFAULT NULL COMMENT '操作类型：登录、登出、添加、删除、修改、查询。',
  `object` varchar(5000) DEFAULT NULL COMMENT '操作对象：项目、文档名称，其他',
  `flag` int(1) NOT NULL COMMENT '标志：0正常1异常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('304', '2019-03-28 18:42:18', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('305', '2019-03-28 21:32:44', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('306', '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('307', '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('308', '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('309', '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('310', '2019-03-28 22:00:54', 'admin', '888', '192.168.65.1', '密码重置', 'dah=9100', '0');
INSERT INTO `t_log` VALUES ('311', '2019-03-28 22:02:06', '9100', '888', '192.168.65.1', '更新/启用员工信息', 'dah=9100, action=edit, jgh=888, gwdj=spy, sex=F, email=skljoljk@gmai.com, mobile=13862222222, sfzh=320525198877731231, bz=123', '0');
INSERT INTO `t_log` VALUES ('312', '2019-03-29 15:10:33', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('313', '2019-03-29 20:04:07', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('314', '2019-03-29 20:04:15', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('315', '2019-03-29 20:13:26', 'admin', '888', '192.168.65.1', '停用员工', 'dah=PC015', '0');
INSERT INTO `t_log` VALUES ('316', '2019-03-29 21:02:31', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('317', '2019-03-29 21:02:25', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('318', '2019-03-29 21:02:31', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('319', '2019-03-30 14:56:59', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('320', '2019-04-24 23:05:52', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('321', '2019-04-24 23:07:23', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', '1');
INSERT INTO `t_log` VALUES ('322', '2019-04-24 23:07:28', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', '1');
INSERT INTO `t_log` VALUES ('323', '2019-04-24 23:07:41', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', '1');
INSERT INTO `t_log` VALUES ('324', '2019-04-24 23:07:53', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', '1');
INSERT INTO `t_log` VALUES ('325', '2019-04-24 23:10:09', 'admin', '888', '192.168.65.1', '创建员工', 'dah=15034403, action=, ygxm=123, mjkkh=1234, jgh=001, gwdj=1, sex=F, email=118287389@qq.com, mobile=18475130601, sfzh=444245436554778950, bz=', '0');
INSERT INTO `t_log` VALUES ('326', '2019-04-24 23:15:27', 'admin', '888', '192.168.65.1', '创建员工', 'dah=567, action=, ygxm=444, mjkkh=5677, jgh=888, gwdj=1, sex=F, email=555555555555555@qq.com, mobile=18127342158, sfzh=441424177897978878, bz=', '0');
INSERT INTO `t_log` VALUES ('327', '2019-04-28 15:23:46', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=2, postSalary=2200, workYear=2, yearSalary=30, floatSalary=2220, award=1000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', '0');
INSERT INTO `t_log` VALUES ('328', '2019-04-28 15:25:42', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=15034403, action=, postLevel=1, postSalary=1100, workYear=30, yearSalary=750, floatSalary=300, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=6000, endowmentInsurance=9600, medicalInsurance=3000, bz=', '0');
INSERT INTO `t_log` VALUES ('329', '2019-04-28 15:28:30', 'admin', '888', '192.168.65.1', '创建员工', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('330', '2019-04-28 15:46:13', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=801, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('331', '2019-04-28 15:46:40', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=2, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('332', '2019-04-28 15:47:13', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=admin, action=edit, jgh=888, gwdj=1, sex=M, email=jsssss@qq.com, mobile=13955558887, sfzh=320525190012310551, bz=测试日志', '0');
INSERT INTO `t_log` VALUES ('333', '2019-04-28 15:51:55', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('334', '2019-04-28 15:52:23', 'admin', '888', '192.168.65.1', '停用员工', 'dah=PC001', '0');
INSERT INTO `t_log` VALUES ('335', '2019-04-28 15:53:49', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=PC001, action=, ygxm=姚莉, mjkkh=0, jgh=001, gwdj=eva, sex=M, email=111@qq.com, mobile=18127342158, sfzh=441424199601024456, bz=0', '0');
INSERT INTO `t_log` VALUES ('336', '2019-04-28 15:57:30', '1501', '802', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, postLevel=2, postSalary=2200, workYear=23, yearSalary=575, floatSalary=500, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', '0');
INSERT INTO `t_log` VALUES ('337', '2019-05-16 14:39:51', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('338', '2019-05-16 14:40:07', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('339', '2019-05-16 15:38:47', 'admin', '888', '0:0:0:0:0:0:0:1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 127 milliseconds ago.  The last packet sent successfully to the server was 8 milliseconds ago.\r\n### The error may exist in file [C:\\User', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 127 milliseconds ago.  The last packet sent successfully to the server was 8 milliseconds ago', '1');
INSERT INTO `t_log` VALUES ('340', '2019-05-16 15:40:28', 'admin', '888', '192.168.65.1', '创建员工', 'dah=1314, action=, ygxm=1314, mjkkh=4c503, jgh=901, gwdj=3, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', '0');
INSERT INTO `t_log` VALUES ('341', '2019-05-16 16:51:19', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('342', '2019-05-16 22:18:54', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('343', '2019-05-17 00:03:01', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('344', '2019-05-17 00:09:32', 'admin', '888', '0:0:0:0:0:0:0:1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 1,105 milliseconds ago.  The last packet sent successfully to the server was 1,105 milliseconds ago.\r\n### The error may exist in file [C', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 1,105 milliseconds ago.  The last packet sent successfully to the server was 1,105 millisecon', '1');
INSERT INTO `t_log` VALUES ('345', '2019-05-17 00:26:51', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=1, postSalary=1100, workYear=2, yearSalary=50, floatSalary=2222, award=150, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', '0');
INSERT INTO `t_log` VALUES ('346', '2019-05-17 00:28:04', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=1, postSalary=1100, workYear=2, yearSalary=10, floatSalary=2222, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', '0');
INSERT INTO `t_log` VALUES ('347', '2019-05-19 20:25:04', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=3, postSalary=3300, workYear=2, yearSalary=50, floatSalary=2222, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', '0');
INSERT INTO `t_log` VALUES ('348', '2019-05-19 20:25:45', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1314, action=, ygxm=1314, mjkkh=4c503, jgh=901, gwdj=1, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', '0');
INSERT INTO `t_log` VALUES ('349', '2019-05-19 20:26:19', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=1, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('350', '2019-05-19 20:26:44', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, postLevel=1, postSalary=1100, workYear=22, yearSalary=550, floatSalary=500, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=4400, endowmentInsurance=7040, medicalInsurance=2200, bz=', '0');
INSERT INTO `t_log` VALUES ('351', '2019-05-19 22:18:06', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=admin, action=edit, jgh=888, gwdj=1, sex=M, email=jssssa@qq.com, mobile=13955558886, sfzh=320525190012310550, bz=测试日志1', '0');
INSERT INTO `t_log` VALUES ('352', '2019-05-19 22:40:52', 'admin', '888', '192.168.65.1', '停用员工', 'dah=9100', '0');
INSERT INTO `t_log` VALUES ('353', '2019-05-19 22:42:02', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=9100, action=, ygxm=审批人员A, mjkkh=11, jgh=888, gwdj=spy, sex=F, email=skljoljk@gmai.com, mobile=13862222222, sfzh=320525198877731231, bz=123', '0');
INSERT INTO `t_log` VALUES ('354', '2019-05-20 00:15:36', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', '1');
INSERT INTO `t_log` VALUES ('355', '2019-05-22 00:14:16', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=567, action=, postLevel=2, postSalary=2200, workYear=56, yearSalary=1400, floatSalary=888, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=11200, endowmentInsurance=17920, medicalInsurance=5600, bz=', '0');
INSERT INTO `t_log` VALUES ('356', '2019-05-22 00:14:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=567, action=, postLevel=3, postSalary=3300, workYear=56, yearSalary=1400, floatSalary=888, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=11200, endowmentInsurance=17920, medicalInsurance=5600, bz=', '0');
INSERT INTO `t_log` VALUES ('357', '2019-05-22 00:14:59', 'admin', '888', '192.168.65.1', '密码重置', 'dah=1501', '0');
INSERT INTO `t_log` VALUES ('358', '2019-05-22 00:15:11', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=122, jgh=802, gwdj=1, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', '0');
INSERT INTO `t_log` VALUES ('359', '2019-05-22 00:20:30', 'admin', '888', '192.168.65.1', '创建员工', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=901, gwdj=1, sex=F, email=1@163.com, mobile=12345678901, sfzh=123456789012345, bz=新员工', '0');
INSERT INTO `t_log` VALUES ('360', '2019-05-22 00:22:08', '00987', '901', '192.168.65.1', '更新/启用员工信息', 'dah=00987, action=edit, jgh=901, gwdj=1, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', '0');
INSERT INTO `t_log` VALUES ('361', '2019-05-22 00:27:46', 'admin', '888', '192.168.65.1', '停用员工', 'dah=9100', '0');
INSERT INTO `t_log` VALUES ('362', '2019-05-22 12:59:24', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', '1');
INSERT INTO `t_log` VALUES ('363', '2019-05-22 13:07:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('364', '2019-05-22 13:07:24', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('365', '2019-05-22 13:07:44', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('366', '2019-05-22 13:08:31', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('367', '2019-05-22 13:09:10', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=95555, action=, ygxm=平台管理员, mjkkh=11, jgh=888, gwdj=3, sex=M, email=skljoljk@gmai.com, mobile=13861116666, sfzh=320525198877731231, bz=0', '0');
INSERT INTO `t_log` VALUES ('368', '2019-05-22 13:09:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('369', '2019-05-22 13:10:56', 'admin', '888', '192.168.65.1', '创建员工', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=3, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', '0');
INSERT INTO `t_log` VALUES ('370', '2019-05-22 13:11:32', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('371', '2019-05-22 13:12:00', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('372', '2019-05-22 13:15:09', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('373', '2019-05-22 13:16:24', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=PC015, action=, ygxm=张成, mjkkh=0, jgh=001, gwdj=eva, sex=M, email=111@qq.com, mobile=12345678901, sfzh=111234454656788881, bz=0', '0');
INSERT INTO `t_log` VALUES ('374', '2019-05-22 13:19:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('375', '2019-05-22 13:20:56', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('376', '2019-05-22 13:21:09', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('377', '2019-05-22 13:21:31', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('378', '2019-05-22 13:23:08', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('379', '2019-05-22 13:23:22', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('380', '2019-05-22 13:23:38', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('381', '2019-05-22 13:25:23', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', '1');
INSERT INTO `t_log` VALUES ('382', '2019-05-22 13:28:54', 'admin', '888', '192.168.65.1', '创建员工', 'dah=2288, action=, ygxm=小河, mjkkh=34, jgh=001, gwdj=1, sex=M, email=23@qq.com, mobile=12345678909, sfzh=123456789012348, bz=', '0');
INSERT INTO `t_log` VALUES ('383', '2019-05-22 13:30:08', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=1, postSalary=1100, workYear=23, yearSalary=575, floatSalary=345, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', '0');
INSERT INTO `t_log` VALUES ('384', '2019-05-22 13:31:57', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, ygxm=小河, mjkkh=34, jgh=001, gwdj=2, sex=M, email=23@qq.com, mobile=12345678909, sfzh=123456789012348, bz=', '0');
INSERT INTO `t_log` VALUES ('385', '2019-05-22 13:39:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=2, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', '0');
INSERT INTO `t_log` VALUES ('386', '2019-05-22 13:40:40', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=1, postSalary=1100, workYear=35, yearSalary=875, floatSalary=1234, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=7000, endowmentInsurance=11200, medicalInsurance=3500, bz=', '0');
INSERT INTO `t_log` VALUES ('387', '2019-05-22 13:41:18', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=2, postSalary=2200, workYear=23, yearSalary=575, floatSalary=345, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', '0');
INSERT INTO `t_log` VALUES ('388', '2019-05-22 13:41:46', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=3, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', '0');
INSERT INTO `t_log` VALUES ('389', '2019-05-22 13:46:28', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=2, postSalary=2200, workYear=34, yearSalary=850, floatSalary=1234, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=6800, endowmentInsurance=10880, medicalInsurance=3400, bz=', '0');
INSERT INTO `t_log` VALUES ('390', '2019-05-22 13:48:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=1, postSalary=1100, workYear=30, yearSalary=750, floatSalary=345, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=6000, endowmentInsurance=9600, medicalInsurance=3000, bz=', '0');
INSERT INTO `t_log` VALUES ('391', '2019-05-22 13:59:28', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=3, postSalary=3300, workYear=35, yearSalary=875, floatSalary=1234, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=7000, endowmentInsurance=11200, medicalInsurance=3500, bz=', '0');
INSERT INTO `t_log` VALUES ('392', '2019-05-22 16:28:34', 'admin', '888', '192.168.65.1', '创建员工', 'dah=201901, action=, ygxm=李丽, mjkkh=4c201, jgh=802, gwdj=2, sex=F, email=1920482109@qq.com, mobile=18475130602, sfzh=441424199703043309, bz=', '0');
INSERT INTO `t_log` VALUES ('393', '2019-05-22 16:37:45', 'admin', '888', '192.168.65.1', '创建员工', 'dah=201902, action=, ygxm=lili, mjkkh=, jgh=888, gwdj=1, sex=F, email=1@qq.com, mobile=12345678901, sfzh=441424199702053307, bz=', '0');
INSERT INTO `t_log` VALUES ('394', '2019-05-22 16:51:35', 'admin', '888', '0:0:0:0:0:0:0:1', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.lunchAllowrance\' in \'order clause\'\r\n### The error may exist in file [C:\\Users\\Lenovo\\Desktop\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a             order by a.lunchAll', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.lunchAllowrance\' in \'order clause\'\r\n### The error may exist in file [C:\\Users\\Lenovo\\Desktop\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fro', '1');

-- ----------------------------
-- Table structure for `t_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` varchar(10) NOT NULL COMMENT 'ID',
  `sort` int(10) NOT NULL COMMENT '菜单排序',
  `level` int(10) NOT NULL COMMENT '菜单级别',
  `p_id` varchar(10) NOT NULL COMMENT '父级菜单id',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `url` varchar(50) NOT NULL COMMENT 'jsp页面',
  `action` varchar(50) NOT NULL COMMENT 'Action动作',
  `icon` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('menu001000', '100000', '1', '-1', '基础管理', '#', '#', 'fa fa-desktop');
INSERT INTO `t_menu` VALUES ('menu001100', '10100', '2', 'menu001000', '用户', '#', '#', 'fa fa-user');
INSERT INTO `t_menu` VALUES ('menu001101', '10101', '3', 'menu001100', '员工管理', 'showUserList.do', 'showUserList', 'fa fa-address-card');
INSERT INTO `t_menu` VALUES ('menu001102', '10102', '3', 'menu001100', '信息修改', 'showUserUpd.do', 'showUserUpd', 'fa fa-pencil-square-o');
INSERT INTO `t_menu` VALUES ('menu001103', '10103', '3', 'menu001100', '密码修改', 'showPwdUpd.do', 'showPwdUpd', 'fa fa-key');
INSERT INTO `t_menu` VALUES ('menu001200', '10200', '2', 'menu001000', '部门', '#', '#', 'fa fa-sitemap');
INSERT INTO `t_menu` VALUES ('menu001201', '10201', '3', 'menu001200', '部门管理', 'showJgList.do', 'showJgList', 'fa fa-sitemap');
INSERT INTO `t_menu` VALUES ('menu001300', '10300', '2', 'menu001000', '角色', '#', '#', 'fa fa-user-circle');
INSERT INTO `t_menu` VALUES ('menu001301', '10301', '3', 'menu001300', '角色查看', 'showRoleList.do', 'showRoleList', 'fa fa-search');
INSERT INTO `t_menu` VALUES ('menu001302', '10302', '3', 'menu001300', '员工角色管理', 'showUserRoleList.do', 'showUserRoleList', 'fa fa-user-circle');
INSERT INTO `t_menu` VALUES ('menu008000', '10800', '1', '-1', '工资管理', '#', '#', 'fa fa-usd');
INSERT INTO `t_menu` VALUES ('menu008001', '10801', '2', 'menu008000', '工资基金', 'showSalaryList.do', 'showSalaryList', 'fa fa-money');
INSERT INTO `t_menu` VALUES ('menu009000', '9000', '1', '-1', '日志管理', '#', '#', 'fa fa-comments');
INSERT INTO `t_menu` VALUES ('menu009101', '9101', '3', 'menu009000', '日志管理', 'showLogList.do', 'showLogList', 'fa fa-comment');

-- ----------------------------
-- Table structure for `t_menu_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_function`;
CREATE TABLE `t_menu_function` (
  `id` varchar(10) NOT NULL COMMENT 'ID',
  `menu_id` varchar(10) NOT NULL COMMENT '菜单ID',
  `function_name` varchar(100) NOT NULL COMMENT '功能名',
  `function_action` varchar(100) NOT NULL COMMENT '功能地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单功能表';

-- ----------------------------
-- Records of t_menu_function
-- ----------------------------
INSERT INTO `t_menu_function` VALUES ('func000001', 'menu001101', '创建员工', 'user_addUser');
INSERT INTO `t_menu_function` VALUES ('func000002', 'menu001101', '更新/启用员工', 'user_updateUser');
INSERT INTO `t_menu_function` VALUES ('func000003', 'menu001101', '停用员工', 'user_deleteUser');
INSERT INTO `t_menu_function` VALUES ('func000004', 'menu001101', '密码重置', 'user_resetPwd');
INSERT INTO `t_menu_function` VALUES ('func000005', 'menu001102', '信息修改', 'user_updateUser');
INSERT INTO `t_menu_function` VALUES ('func000006', 'menu001103', '密码修改', 'user_updatePwd');
INSERT INTO `t_menu_function` VALUES ('func000007', 'menu001201', '创建/修改/删除机构', 'jg_saveJgData');
INSERT INTO `t_menu_function` VALUES ('func000008', 'menu001301', '创建/修改角色和菜单功能权限', 'role_saveRole');
INSERT INTO `t_menu_function` VALUES ('func000009', 'menu001301', '删除角色', 'role_deleteRole');
INSERT INTO `t_menu_function` VALUES ('func000010', 'menu001302', '员工角色分配', 'role_saveUserRole');
INSERT INTO `t_menu_function` VALUES ('func000011', 'menu001302', '数据权限分配', 'role_saveDataAuthority');
INSERT INTO `t_menu_function` VALUES ('func000012', 'menu001101', '查询员工', 'user_getUsers');
INSERT INTO `t_menu_function` VALUES ('func000016', 'menu002101', '查询', 'wpType_getWpTypeListNew');
INSERT INTO `t_menu_function` VALUES ('func007100', 'menu007100', '诚信指标管理', 'showCreditIndex');
INSERT INTO `t_menu_function` VALUES ('func007200', 'menu007200', '失信流程代办', 'showCreditIndex');
INSERT INTO `t_menu_function` VALUES ('func007300', 'menu007300', '诚信事件提交', 'showCreditIndex');
INSERT INTO `t_menu_function` VALUES ('func007401', 'func007401', '失信人员报表', 'showCreditIndex');
INSERT INTO `t_menu_function` VALUES ('func007402', 'func007402', '总体概况报表', 'showCreditIndex');
INSERT INTO `t_menu_function` VALUES ('func008001', 'menu008000', '工资管理', '#');
INSERT INTO `t_menu_function` VALUES ('func008002', 'menu008001', '工资基金管理', '#');
INSERT INTO `t_menu_function` VALUES ('func008003', 'menu008002', '中层干部评测', '#');
INSERT INTO `t_menu_function` VALUES ('func008004', 'menu008003', '中层干部评测', '#');
INSERT INTO `t_menu_function` VALUES ('func009000', 'menu009101', '日志查询', 'log_listLog');
INSERT INTO `t_menu_function` VALUES ('func009008', 'menu005200', '待办查询', 'cg_undoneServiceList.do');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(255) NOT NULL COMMENT '角色名称',
  `role_description` varchar(255) NOT NULL COMMENT '角色描述',
  `sso_role_id` int(10) DEFAULT NULL COMMENT '统一用户id',
  `flag` int(1) NOT NULL COMMENT '状态 0 允许删除 1 不允许删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('2', '测试角色', '', null, '0', '2018-10-12 16:50:30', '2018-12-27 14:27:32');
INSERT INTO `t_role` VALUES ('83', '管理员权限', '具备所有操作权限', null, '0', '2018-10-27 12:55:01', '2018-10-27 12:55:01');
INSERT INTO `t_role` VALUES ('86', '事件管理员', '事件管理员', null, '0', '2018-10-23 16:50:30', '2018-11-27 10:20:31');
INSERT INTO `t_role` VALUES ('88', '普通用户', '普通用户', null, '0', '2019-05-22 00:17:53', '2019-05-22 00:17:53');

-- ----------------------------
-- Table structure for `t_role_function`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_function`;
CREATE TABLE `t_role_function` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `function_id` varchar(10) NOT NULL COMMENT '功能ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='角色功能表';

-- ----------------------------
-- Records of t_role_function
-- ----------------------------
INSERT INTO `t_role_function` VALUES ('26', '83', 'func009000');
INSERT INTO `t_role_function` VALUES ('27', '83', 'func000001');
INSERT INTO `t_role_function` VALUES ('28', '83', 'func000002');
INSERT INTO `t_role_function` VALUES ('29', '83', 'func000003');
INSERT INTO `t_role_function` VALUES ('30', '83', 'func000004');
INSERT INTO `t_role_function` VALUES ('31', '83', 'func000012');
INSERT INTO `t_role_function` VALUES ('32', '83', 'func000005');
INSERT INTO `t_role_function` VALUES ('33', '83', 'func000006');
INSERT INTO `t_role_function` VALUES ('34', '83', 'func000007');
INSERT INTO `t_role_function` VALUES ('35', '83', 'func000008');
INSERT INTO `t_role_function` VALUES ('36', '83', 'func000009');
INSERT INTO `t_role_function` VALUES ('37', '83', 'func000010');
INSERT INTO `t_role_function` VALUES ('38', '83', 'func000011');
INSERT INTO `t_role_function` VALUES ('78', '86', 'func007100');
INSERT INTO `t_role_function` VALUES ('79', '86', 'func007200');
INSERT INTO `t_role_function` VALUES ('80', '86', 'func009000');
INSERT INTO `t_role_function` VALUES ('81', '86', 'func000001');
INSERT INTO `t_role_function` VALUES ('82', '86', 'func000002');
INSERT INTO `t_role_function` VALUES ('83', '86', 'func000003');
INSERT INTO `t_role_function` VALUES ('84', '86', 'func000004');
INSERT INTO `t_role_function` VALUES ('85', '86', 'func000012');
INSERT INTO `t_role_function` VALUES ('86', '86', 'func000005');
INSERT INTO `t_role_function` VALUES ('87', '86', 'func000006');
INSERT INTO `t_role_function` VALUES ('91', '2', 'func008002');
INSERT INTO `t_role_function` VALUES ('92', '2', 'func008001');
INSERT INTO `t_role_function` VALUES ('108', '88', 'func000005');
INSERT INTO `t_role_function` VALUES ('109', '88', 'func000006');

-- ----------------------------
-- Table structure for `t_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(10) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('25', '83', 'menu007000');
INSERT INTO `t_role_menu` VALUES ('26', '83', 'menu007100');
INSERT INTO `t_role_menu` VALUES ('27', '83', 'menu007200');
INSERT INTO `t_role_menu` VALUES ('28', '83', 'menu007300');
INSERT INTO `t_role_menu` VALUES ('29', '83', 'menu007400');
INSERT INTO `t_role_menu` VALUES ('30', '83', 'menu009000');
INSERT INTO `t_role_menu` VALUES ('31', '83', 'menu009101');
INSERT INTO `t_role_menu` VALUES ('32', '83', 'menu001000');
INSERT INTO `t_role_menu` VALUES ('33', '83', 'menu001100');
INSERT INTO `t_role_menu` VALUES ('34', '83', 'menu001101');
INSERT INTO `t_role_menu` VALUES ('35', '83', 'menu001102');
INSERT INTO `t_role_menu` VALUES ('36', '83', 'menu001103');
INSERT INTO `t_role_menu` VALUES ('37', '83', 'menu001200');
INSERT INTO `t_role_menu` VALUES ('38', '83', 'menu001201');
INSERT INTO `t_role_menu` VALUES ('39', '83', 'menu001300');
INSERT INTO `t_role_menu` VALUES ('40', '83', 'menu001301');
INSERT INTO `t_role_menu` VALUES ('41', '83', 'menu001302');
INSERT INTO `t_role_menu` VALUES ('109', '86', 'menu007100');
INSERT INTO `t_role_menu` VALUES ('110', '86', 'menu007000');
INSERT INTO `t_role_menu` VALUES ('111', '86', 'menu007200');
INSERT INTO `t_role_menu` VALUES ('112', '86', 'menu007401');
INSERT INTO `t_role_menu` VALUES ('113', '86', 'menu007400');
INSERT INTO `t_role_menu` VALUES ('114', '86', 'menu007402');
INSERT INTO `t_role_menu` VALUES ('115', '86', 'menu009000');
INSERT INTO `t_role_menu` VALUES ('116', '86', 'menu009101');
INSERT INTO `t_role_menu` VALUES ('117', '86', 'menu001100');
INSERT INTO `t_role_menu` VALUES ('118', '86', 'menu001000');
INSERT INTO `t_role_menu` VALUES ('119', '86', 'menu001101');
INSERT INTO `t_role_menu` VALUES ('120', '86', 'menu001102');
INSERT INTO `t_role_menu` VALUES ('121', '86', 'menu001103');
INSERT INTO `t_role_menu` VALUES ('133', '2', 'menu008000');
INSERT INTO `t_role_menu` VALUES ('134', '2', 'menu008001');
INSERT INTO `t_role_menu` VALUES ('147', '88', 'menu001102');
INSERT INTO `t_role_menu` VALUES ('148', '88', 'menu001000');
INSERT INTO `t_role_menu` VALUES ('149', '88', 'menu001100');
INSERT INTO `t_role_menu` VALUES ('150', '88', 'menu001103');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `dah` varchar(10) NOT NULL COMMENT '员工编码或者档案号',
  `ygxm` varchar(255) NOT NULL,
  `mjkkh` varchar(20) NOT NULL COMMENT '门禁卡卡号',
  `sex` varchar(10) NOT NULL COMMENT '性别：F女M男',
  `mobile` varchar(20) NOT NULL COMMENT '电话',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `sfzh` varchar(50) NOT NULL COMMENT '身份证号',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `gwdj` varchar(10) DEFAULT NULL COMMENT '岗位等级',
  `flag` varchar(1) NOT NULL COMMENT '标志',
  `bz` varchar(255) DEFAULT NULL COMMENT '备注',
  `pysx` varchar(255) DEFAULT NULL,
  `pyqp` varchar(255) DEFAULT NULL,
  `px` varchar(10) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`dah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('00987', '小欧', '123', 'F', '12345678900', '12@163.com', '123456789012349', 'fcea920f7412b5da7be0cf42b8c93759', '1', '0', '新员工1', '1', '1', '1');
INSERT INTO `t_user` VALUES ('01065', '徐伟', '01065', 'M', '136****1231', 'xwei@jssvc.edu.cn', '320586197902035813', '1b23025b65cf18d10c9dfbb1ce65ce93', 'js', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('01070', '金霁', '01070', 'F', '137****3288', 'jinji@jssvc.edu.cn', '320504197801273025', '0aed5c0f4387b7432a813e9c8f6c1c64', 'js', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('1314', '1314', '4c503', 'M', '18127342158', '11232435@qq.com', '441424199702053307', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '123', '1', '1', '1');
INSERT INTO `t_user` VALUES ('15034403', '123', '1234', 'F', '18475130601', '118287389@qq.com', '444245436554778950', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('201901', '李丽', '4c201', 'F', '18475130602', '1920482109@qq.com', '441424199703043309', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('201902', 'lili', '', 'F', '12345678901', '1@qq.com', '441424199702053307', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('2234', 'ask', '', 'M', '12345678902', '123@163.com', '123456789012345', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('2288', '小河', '34', 'M', '12345678909', '23@qq.com', '123456789012348', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('567', '444', '5677', 'F', '18127342158', '555555555555555@qq.com', '441424177897978878', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('91821', 'W老师', '1', 'M', '13955558888', 'jsssss@qq.com', '320525190012310551', 'e10adc3949ba59abbe56e057f20f883e', 'js', '0', '中心测试', '1', '1', '1');
INSERT INTO `t_user` VALUES ('95555', '平台管理员', '11', 'M', '13861116666', 'skljoljk@gmai.com', '320525198877731231', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('admin', '超级管理员', '1', 'M', '13955558886', 'jssssa@qq.com', '320525190012310550', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '测试日志1', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC001', '姚莉', '0', 'M', '18127342158', '111@qq.com', '441424199601024456', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC002', '丁虎', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC003', '张军', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC004', '王俪燕', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC005', '徐伟', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC006', '金霁', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC007', '张成', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC008', '姚莉', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC009', '丁虎', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC011', '张军', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC012', '王俪燕', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC013', '徐伟', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC014', '金霁', '0', 'M', '111', '111', '111', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('PC015', '张成', '0', 'M', '12345678901', '111@qq.com', '111234454656788881', 'e10adc3949ba59abbe56e057f20f883e', 'eva', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) NOT NULL COMMENT '员工号',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COMMENT='用户角色关联表';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('1', '95555', '86');
INSERT INTO `t_user_role` VALUES ('2', 'admin', '82');
INSERT INTO `t_user_role` VALUES ('4', '00997', '2');
INSERT INTO `t_user_role` VALUES ('8', 'PC001', '2');
INSERT INTO `t_user_role` VALUES ('9', 'PC002', '2');
INSERT INTO `t_user_role` VALUES ('10', 'PC003', '2');
INSERT INTO `t_user_role` VALUES ('11', 'PC004', '2');
INSERT INTO `t_user_role` VALUES ('12', 'PC005', '2');
INSERT INTO `t_user_role` VALUES ('13', 'PC006', '2');
INSERT INTO `t_user_role` VALUES ('14', 'PC007', '2');
INSERT INTO `t_user_role` VALUES ('15', 'PC008', '2');
INSERT INTO `t_user_role` VALUES ('16', 'PC009', '2');
INSERT INTO `t_user_role` VALUES ('17', 'PC10', '2');
INSERT INTO `t_user_role` VALUES ('18', 'PC011', '2');
INSERT INTO `t_user_role` VALUES ('19', 'PC012', '2');
INSERT INTO `t_user_role` VALUES ('20', 'PC013', '2');
INSERT INTO `t_user_role` VALUES ('21', 'PC014', '2');
INSERT INTO `t_user_role` VALUES ('22', 'PC015', '2');
INSERT INTO `t_user_role` VALUES ('23', 'PC016', '2');
INSERT INTO `t_user_role` VALUES ('24', 'PC017', '2');
INSERT INTO `t_user_role` VALUES ('25', 'PC018', '2');
INSERT INTO `t_user_role` VALUES ('26', 'PC019', '2');
INSERT INTO `t_user_role` VALUES ('27', 'PC020', '2');
INSERT INTO `t_user_role` VALUES ('28', 'PC021', '2');
INSERT INTO `t_user_role` VALUES ('29', 'PC022', '2');
INSERT INTO `t_user_role` VALUES ('30', 'PC023', '2');
INSERT INTO `t_user_role` VALUES ('31', 'PC024', '2');
INSERT INTO `t_user_role` VALUES ('32', 'PC025', '2');
INSERT INTO `t_user_role` VALUES ('33', 'TST001', '2');
INSERT INTO `t_user_role` VALUES ('34', 'TST002', '2');
INSERT INTO `t_user_role` VALUES ('35', 'TST003', '2');
INSERT INTO `t_user_role` VALUES ('36', 'TST004', '2');
INSERT INTO `t_user_role` VALUES ('37', 'TST005', '2');
INSERT INTO `t_user_role` VALUES ('38', '01065', '2');
INSERT INTO `t_user_role` VALUES ('39', '567', '83');
INSERT INTO `t_user_role` VALUES ('40', '91821', '2');
INSERT INTO `t_user_role` VALUES ('43', '1314', '83');
INSERT INTO `t_user_role` VALUES ('47', '01070', '2');
INSERT INTO `t_user_role` VALUES ('48', '00987', '88');
INSERT INTO `t_user_role` VALUES ('52', '2234', '88');
INSERT INTO `t_user_role` VALUES ('53', '2288', '88');
INSERT INTO `t_user_role` VALUES ('54', '201901', '88');
