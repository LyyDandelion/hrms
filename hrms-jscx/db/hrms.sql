/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : hrms

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 31/05/2019 12:35:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_approve_option
-- ----------------------------
DROP TABLE IF EXISTS `t_approve_option`;
CREATE TABLE `t_approve_option`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `option_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审批意见code',
  `option_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审批意见名称',
  `option_user` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收藏意见dah',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '默认审批意见表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_approve_option
-- ----------------------------
INSERT INTO `t_approve_option` VALUES (1, '', '请领导阅示', 'admin');
INSERT INTO `t_approve_option` VALUES (2, '', '同意', 'admin');

-- ----------------------------
-- Table structure for t_constant
-- ----------------------------
DROP TABLE IF EXISTS `t_constant`;
CREATE TABLE `t_constant`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常量类型',
  `en_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文key',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '常量名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 347 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '常量表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_constant
-- ----------------------------
INSERT INTO `t_constant` VALUES (1, 'position', '1', '讲师');
INSERT INTO `t_constant` VALUES (2, 'position', '2', '副教授');
INSERT INTO `t_constant` VALUES (3, 'id', 'index2', '121');
INSERT INTO `t_constant` VALUES (4, 'id', 'index1', '10');
INSERT INTO `t_constant` VALUES (11, 'position', '3', '教授');
INSERT INTO `t_constant` VALUES (336, 'suggestBh', 'suggestBh', '201811050');
INSERT INTO `t_constant` VALUES (342, 'suggestStatus', 'departmentHandle', 'handleMember');
INSERT INTO `t_constant` VALUES (343, 'suggestStatus', 'managerReview', 'manager');
INSERT INTO `t_constant` VALUES (344, 'suggestStatus', 'processEnd', 'user');
INSERT INTO `t_constant` VALUES (345, 'position', '55', '助教');
INSERT INTO `t_constant` VALUES (346, 'position', '33', '辅导员');
INSERT INTO `t_constant` VALUES (347, 'position', '333', '系主任');

-- ----------------------------
-- Table structure for t_data_authority
-- ----------------------------
DROP TABLE IF EXISTS `t_data_authority`;
CREATE TABLE `t_data_authority`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案号',
  `jgh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dah`(`dah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_data_authority
-- ----------------------------
INSERT INTO `t_data_authority` VALUES (12, '95555', '800', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (13, '95555', '801', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (14, '95555', '802', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (15, '95555', '888', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (16, '95555', '900', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (17, '95555', '901', '2018-11-27 12:29:32');
INSERT INTO `t_data_authority` VALUES (22, '567', '888', '2019-04-24 23:20:24');
INSERT INTO `t_data_authority` VALUES (28, '01065', '001', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (29, '01065', '800', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (30, '01065', '801', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (31, '01065', '802', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (32, '01065', '888', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (33, '01065', '900', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (34, '01065', '901', '2019-05-16 15:41:12');
INSERT INTO `t_data_authority` VALUES (40, '01070', '001', '2019-05-19 22:44:10');
INSERT INTO `t_data_authority` VALUES (41, '1314', '888', '2019-05-19 22:44:25');
INSERT INTO `t_data_authority` VALUES (42, '00987', '900', '2019-05-22 00:21:19');
INSERT INTO `t_data_authority` VALUES (43, '00987', '901', '2019-05-22 00:21:19');
INSERT INTO `t_data_authority` VALUES (44, '1501', '802', '2019-05-22 00:26:19');

-- ----------------------------
-- Table structure for t_dept_info
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_info`;
CREATE TABLE `t_dept_info`  (
  `jgh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构号',
  `jgmc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构名称',
  `sjjg` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上级机构',
  `sfydzh` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预留位',
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '0：正常状态 1：删除',
  `num` int(4) NULL DEFAULT NULL COMMENT '排序',
  `jgjp` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构简拼',
  PRIMARY KEY (`jgh`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept_info
-- ----------------------------
INSERT INTO `t_dept_info` VALUES ('001', '腾讯科技', '000', NULL, '0', 0, NULL);
INSERT INTO `t_dept_info` VALUES ('800', '教辅机构', '000', NULL, '0', 1, NULL);
INSERT INTO `t_dept_info` VALUES ('801', '教务处', '800', NULL, '0', 2, NULL);
INSERT INTO `t_dept_info` VALUES ('802', '图书馆', '800', NULL, '0', 3, NULL);
INSERT INTO `t_dept_info` VALUES ('888', '网络中心', '800', '', '0', 4, NULL);
INSERT INTO `t_dept_info` VALUES ('900', '管理机构', '000', NULL, '0', 5, NULL);
INSERT INTO `t_dept_info` VALUES ('901', '实验楼', '900', NULL, '0', 6, NULL);

-- ----------------------------
-- Table structure for t_dept_user
-- ----------------------------
DROP TABLE IF EXISTS `t_dept_user`;
CREATE TABLE `t_dept_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工号',
  `jgh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '机构号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `dah`(`dah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户机构关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_dept_user
-- ----------------------------
INSERT INTO `t_dept_user` VALUES (11, '95555', '888');
INSERT INTO `t_dept_user` VALUES (12, '91821', '888');
INSERT INTO `t_dept_user` VALUES (13, 'admin', '888');
INSERT INTO `t_dept_user` VALUES (15, 'PC001', '001');
INSERT INTO `t_dept_user` VALUES (16, 'PC002', '001');
INSERT INTO `t_dept_user` VALUES (17, 'PC003', '001');
INSERT INTO `t_dept_user` VALUES (18, 'PC004', '001');
INSERT INTO `t_dept_user` VALUES (19, 'PC005', '001');
INSERT INTO `t_dept_user` VALUES (20, 'PC006', '001');
INSERT INTO `t_dept_user` VALUES (21, 'PC007', '001');
INSERT INTO `t_dept_user` VALUES (22, 'PC008', '001');
INSERT INTO `t_dept_user` VALUES (23, 'PC009', '001');
INSERT INTO `t_dept_user` VALUES (24, 'PC10', '001');
INSERT INTO `t_dept_user` VALUES (25, 'PC011', '001');
INSERT INTO `t_dept_user` VALUES (26, 'PC012', '001');
INSERT INTO `t_dept_user` VALUES (27, 'PC013', '001');
INSERT INTO `t_dept_user` VALUES (28, 'PC014', '001');
INSERT INTO `t_dept_user` VALUES (29, 'PC015', '001');
INSERT INTO `t_dept_user` VALUES (30, 'PC016', '001');
INSERT INTO `t_dept_user` VALUES (31, 'PC017', '001');
INSERT INTO `t_dept_user` VALUES (32, 'PC018', '001');
INSERT INTO `t_dept_user` VALUES (33, 'PC019', '001');
INSERT INTO `t_dept_user` VALUES (34, 'PC020', '001');
INSERT INTO `t_dept_user` VALUES (35, 'PC021', '001');
INSERT INTO `t_dept_user` VALUES (36, 'PC022', '001');
INSERT INTO `t_dept_user` VALUES (37, 'PC023', '001');
INSERT INTO `t_dept_user` VALUES (38, 'PC024', '001');
INSERT INTO `t_dept_user` VALUES (39, 'PC025', '001');
INSERT INTO `t_dept_user` VALUES (40, 'TST001', '001');
INSERT INTO `t_dept_user` VALUES (41, 'TST002', '001');
INSERT INTO `t_dept_user` VALUES (42, 'TST003', '001');
INSERT INTO `t_dept_user` VALUES (43, 'TST004', '001');
INSERT INTO `t_dept_user` VALUES (44, 'TST005', '001');
INSERT INTO `t_dept_user` VALUES (45, '15034403', '001');
INSERT INTO `t_dept_user` VALUES (46, '567', '888');
INSERT INTO `t_dept_user` VALUES (48, '1314', '901');
INSERT INTO `t_dept_user` VALUES (50, '2234', '801');
INSERT INTO `t_dept_user` VALUES (51, '2288', '001');
INSERT INTO `t_dept_user` VALUES (52, '201901', '802');
INSERT INTO `t_dept_user` VALUES (53, '201902', '888');
INSERT INTO `t_dept_user` VALUES (54, '00987', '802');

-- ----------------------------
-- Table structure for t_hrms_import_data
-- ----------------------------
DROP TABLE IF EXISTS `t_hrms_import_data`;
CREATE TABLE `t_hrms_import_data`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编码',
  `month` int(10) NULL DEFAULT NULL,
  `sick_days` int(10) NULL DEFAULT NULL COMMENT '病假天数',
  `compassionate_days` int(10) NULL DEFAULT NULL COMMENT '事假天数',
  `late_times` int(10) NULL DEFAULT NULL COMMENT '迟到次数',
  `overtime_days` int(10) NULL DEFAULT NULL COMMENT '加班天数',
  `replenishment` double NULL DEFAULT NULL COMMENT '补发',
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `note1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dah`(`dah`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '导入数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hrms_import_data
-- ----------------------------
INSERT INTO `t_hrms_import_data` VALUES (15, '201901', 5, 1, 2, 2, 2, 200, '1', '', NULL);
INSERT INTO `t_hrms_import_data` VALUES (16, '01070', 5, 4, 4, 3, 2, 111, '1', '', NULL);
INSERT INTO `t_hrms_import_data` VALUES (17, '1314', 5, 2, 2, 2, 2, 22, '1', '', NULL);
INSERT INTO `t_hrms_import_data` VALUES (18, '01070', 6, 2, 2, 2, 2, 22, '1', '', NULL);

-- ----------------------------
-- Table structure for t_hrms_salary
-- ----------------------------
DROP TABLE IF EXISTS `t_hrms_salary`;
CREATE TABLE `t_hrms_salary`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编码',
  `post_salary` double NULL DEFAULT NULL COMMENT '岗位工资',
  `year_salary` double NULL DEFAULT NULL COMMENT '工龄工资',
  `float_salary` double NULL DEFAULT NULL COMMENT '浮动工资（绩效工资等）',
  `award` double NULL DEFAULT NULL COMMENT '奖金',
  `tel_allowrance` double NULL DEFAULT NULL COMMENT '通讯补贴',
  `traffic_allowrance` double NULL DEFAULT NULL COMMENT '交通补贴',
  `lunch_allowrance` double NULL DEFAULT NULL COMMENT '用餐补贴',
  `insurance` double NULL DEFAULT NULL COMMENT '社保',
  `endowment_insurance` double NULL DEFAULT NULL COMMENT '养老金',
  `medical_insurance` double NULL DEFAULT NULL COMMENT '医保',
  `work_year` double NULL DEFAULT NULL COMMENT '工龄',
  `post_level` double NULL DEFAULT NULL COMMENT '岗位等级',
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `note1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dah`(`dah`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '薪酬表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hrms_salary
-- ----------------------------
INSERT INTO `t_hrms_salary` VALUES (14, '201901', 2200, 666, 123, 3000, 200, 400, 60, NULL, NULL, NULL, 23, 2, '1', NULL, NULL);
INSERT INTO `t_hrms_salary` VALUES (15, '01070', 1100, 825, 333, 1500, 100, 200, 30, 6600, 10560, 3300, 33, 1, '1', NULL, NULL);
INSERT INTO `t_hrms_salary` VALUES (16, '1314', 1100, 2221, 22, 1500, 100, 200, 30, NULL, NULL, NULL, 2, 1, '1', NULL, NULL);
INSERT INTO `t_hrms_salary` VALUES (17, '2288', 2200, 11, 333, 3000, 200, 400, 60, NULL, NULL, NULL, 2, 2, '1', NULL, NULL);

-- ----------------------------
-- Table structure for t_hrms_settlement
-- ----------------------------
DROP TABLE IF EXISTS `t_hrms_settlement`;
CREATE TABLE `t_hrms_settlement`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '员工编码',
  `month` int(10) NULL DEFAULT NULL,
  `sick_deduction` double NULL DEFAULT NULL COMMENT '病假扣款',
  `compassionate_deduction` int(10) NULL DEFAULT NULL COMMENT '事假扣款',
  `late_deduction` double NULL DEFAULT NULL COMMENT '迟到扣款',
  `overtime_salary` double NULL DEFAULT NULL COMMENT '加班工资',
  `owner_endowment_insurance` double NULL DEFAULT NULL COMMENT '个人支付养老保险',
  `company_endowment_insurance` double NULL DEFAULT NULL COMMENT '公司支付养老保险',
  `owner_medical_insurance` double NULL DEFAULT NULL COMMENT '个人支付医疗保险',
  `company_medical_insurance` double NULL DEFAULT NULL COMMENT '公司支付医疗保险',
  `owner_accumulation_fund` double NULL DEFAULT NULL COMMENT '个人支付公积金',
  `company_accumulation_fund` double NULL DEFAULT NULL COMMENT '公司支付公积金',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `base` double NULL DEFAULT NULL COMMENT '基本工资',
  `real_wages` double NULL DEFAULT NULL COMMENT '实发工资',
  `is_grant` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否发放: Y-是 N-否',
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `note1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sort` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `dah`(`dah`, `month`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工资结算表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_hrms_settlement
-- ----------------------------
INSERT INTO `t_hrms_settlement` VALUES (17, '201901', 5, 40, 100, 20, 200, 514.8, 514.8, 643.5, 643.5, 643.5, 643.5, '2019-05-25 09:52:13', 6435, 6000, 'Y', '1', NULL, NULL);
INSERT INTO `t_hrms_settlement` VALUES (18, '01070', 5, 80, 200, 30, 200, 300.40000000000003, 300.40000000000003, 375.5, 375.5, 375.5, 375.5, '2019-05-24 23:51:05', 3755, 2593.6, 'Y', '1', NULL, NULL);
INSERT INTO `t_hrms_settlement` VALUES (19, '1314', 6, 40, 100, 20, 200, 412.08, 412.08, 515.1, 515.1, 515.1, 515.1, '2019-05-29 23:58:58', 5151, 3748.72, 'N', '1', NULL, NULL);
INSERT INTO `t_hrms_settlement` VALUES (20, '01070', 6, 40, 100, 20, 200, 300.40000000000003, 300.40000000000003, 375.5, 375.5, 375.5, 375.5, '2019-05-30 00:10:15', 3755, 2743.6, 'N', '1', NULL, NULL);

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `DATETIME` datetime(0) NOT NULL COMMENT '时间',
  `dah` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户ID',
  `jgh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机构号',
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `type` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类型：登录、登出、添加、删除、修改、查询。',
  `object` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作对象：项目、文档名称，其他',
  `flag` int(1) NOT NULL COMMENT '标志：0正常1异常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 471 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (304, '2019-03-28 18:42:18', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (305, '2019-03-28 21:32:44', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (306, '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (307, '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (308, '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (309, '2019-03-28 21:33:57', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (310, '2019-03-28 22:00:54', 'admin', '888', '192.168.65.1', '密码重置', 'dah=9100', 0);
INSERT INTO `t_log` VALUES (311, '2019-03-28 22:02:06', '9100', '888', '192.168.65.1', '更新/启用员工信息', 'dah=9100, action=edit, jgh=888, gwdj=spy, sex=F, email=skljoljk@gmai.com, mobile=13862222222, sfzh=320525198877731231, bz=123', 0);
INSERT INTO `t_log` VALUES (312, '2019-03-29 15:10:33', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (313, '2019-03-29 20:04:07', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (314, '2019-03-29 20:04:15', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (315, '2019-03-29 20:13:26', 'admin', '888', '192.168.65.1', '停用员工', 'dah=PC015', 0);
INSERT INTO `t_log` VALUES (316, '2019-03-29 21:02:31', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (317, '2019-03-29 21:02:25', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (318, '2019-03-29 21:02:31', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (319, '2019-03-30 14:56:59', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (320, '2019-04-24 23:05:52', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (321, '2019-04-24 23:07:23', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (322, '2019-04-24 23:07:28', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (323, '2019-04-24 23:07:41', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (324, '2019-04-24 23:07:53', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (325, '2019-04-24 23:10:09', 'admin', '888', '192.168.65.1', '创建员工', 'dah=15034403, action=, ygxm=123, mjkkh=1234, jgh=001, gwdj=1, sex=F, email=118287389@qq.com, mobile=18475130601, sfzh=444245436554778950, bz=', 0);
INSERT INTO `t_log` VALUES (326, '2019-04-24 23:15:27', 'admin', '888', '192.168.65.1', '创建员工', 'dah=567, action=, ygxm=444, mjkkh=5677, jgh=888, gwdj=1, sex=F, email=555555555555555@qq.com, mobile=18127342158, sfzh=441424177897978878, bz=', 0);
INSERT INTO `t_log` VALUES (327, '2019-04-28 15:23:46', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=2, postSalary=2200, workYear=2, yearSalary=30, floatSalary=2220, award=1000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', 0);
INSERT INTO `t_log` VALUES (328, '2019-04-28 15:25:42', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=15034403, action=, postLevel=1, postSalary=1100, workYear=30, yearSalary=750, floatSalary=300, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=6000, endowmentInsurance=9600, medicalInsurance=3000, bz=', 0);
INSERT INTO `t_log` VALUES (329, '2019-04-28 15:28:30', 'admin', '888', '192.168.65.1', '创建员工', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (330, '2019-04-28 15:46:13', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=801, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (331, '2019-04-28 15:46:40', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=2, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (332, '2019-04-28 15:47:13', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=admin, action=edit, jgh=888, gwdj=1, sex=M, email=jsssss@qq.com, mobile=13955558887, sfzh=320525190012310551, bz=测试日志', 0);
INSERT INTO `t_log` VALUES (333, '2019-04-28 15:51:55', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=3, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (334, '2019-04-28 15:52:23', 'admin', '888', '192.168.65.1', '停用员工', 'dah=PC001', 0);
INSERT INTO `t_log` VALUES (335, '2019-04-28 15:53:49', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=PC001, action=, ygxm=姚莉, mjkkh=0, jgh=001, gwdj=eva, sex=M, email=111@qq.com, mobile=18127342158, sfzh=441424199601024456, bz=0', 0);
INSERT INTO `t_log` VALUES (336, '2019-04-28 15:57:30', '1501', '802', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, postLevel=2, postSalary=2200, workYear=23, yearSalary=575, floatSalary=500, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', 0);
INSERT INTO `t_log` VALUES (337, '2019-05-16 14:39:51', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (338, '2019-05-16 14:40:07', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (339, '2019-05-16 15:38:47', 'admin', '888', '0:0:0:0:0:0:0:1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 127 milliseconds ago.  The last packet sent successfully to the server was 8 milliseconds ago.\r\n### The error may exist in file [C:\\User', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 127 milliseconds ago.  The last packet sent successfully to the server was 8 milliseconds ago', 1);
INSERT INTO `t_log` VALUES (340, '2019-05-16 15:40:28', 'admin', '888', '192.168.65.1', '创建员工', 'dah=1314, action=, ygxm=1314, mjkkh=4c503, jgh=901, gwdj=3, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', 0);
INSERT INTO `t_log` VALUES (341, '2019-05-16 16:51:19', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (342, '2019-05-16 22:18:54', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (343, '2019-05-17 00:03:01', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (344, '2019-05-17 00:09:32', 'admin', '888', '0:0:0:0:0:0:0:1', 'nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 1,105 milliseconds ago.  The last packet sent successfully to the server was 1,105 milliseconds ago.\r\n### The error may exist in file [C', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: org.springframework.jdbc.CannotGetJdbcConnectionException: Could not get JDBC Connection; nested exception is com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure\n\nThe last packet successfully received from the server was 1,105 milliseconds ago.  The last packet sent successfully to the server was 1,105 millisecon', 1);
INSERT INTO `t_log` VALUES (345, '2019-05-17 00:26:51', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=1, postSalary=1100, workYear=2, yearSalary=50, floatSalary=2222, award=150, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', 0);
INSERT INTO `t_log` VALUES (346, '2019-05-17 00:28:04', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=1, postSalary=1100, workYear=2, yearSalary=10, floatSalary=2222, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', 0);
INSERT INTO `t_log` VALUES (347, '2019-05-19 20:25:04', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=01137, action=, postLevel=3, postSalary=3300, workYear=2, yearSalary=50, floatSalary=2222, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=400, endowmentInsurance=640, medicalInsurance=200, bz=', 0);
INSERT INTO `t_log` VALUES (348, '2019-05-19 20:25:45', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1314, action=, ygxm=1314, mjkkh=4c503, jgh=901, gwdj=1, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', 0);
INSERT INTO `t_log` VALUES (349, '2019-05-19 20:26:19', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=, jgh=802, gwdj=1, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (350, '2019-05-19 20:26:44', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, postLevel=1, postSalary=1100, workYear=22, yearSalary=550, floatSalary=500, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=4400, endowmentInsurance=7040, medicalInsurance=2200, bz=', 0);
INSERT INTO `t_log` VALUES (351, '2019-05-19 22:18:06', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=admin, action=edit, jgh=888, gwdj=1, sex=M, email=jssssa@qq.com, mobile=13955558886, sfzh=320525190012310550, bz=测试日志1', 0);
INSERT INTO `t_log` VALUES (352, '2019-05-19 22:40:52', 'admin', '888', '192.168.65.1', '停用员工', 'dah=9100', 0);
INSERT INTO `t_log` VALUES (353, '2019-05-19 22:42:02', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=9100, action=, ygxm=审批人员A, mjkkh=11, jgh=888, gwdj=spy, sex=F, email=skljoljk@gmai.com, mobile=13862222222, sfzh=320525198877731231, bz=123', 0);
INSERT INTO `t_log` VALUES (354, '2019-05-20 00:15:36', '', '', '0:0:0:0:0:0:0:1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (355, '2019-05-22 00:14:16', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=567, action=, postLevel=2, postSalary=2200, workYear=56, yearSalary=1400, floatSalary=888, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=11200, endowmentInsurance=17920, medicalInsurance=5600, bz=', 0);
INSERT INTO `t_log` VALUES (356, '2019-05-22 00:14:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=567, action=, postLevel=3, postSalary=3300, workYear=56, yearSalary=1400, floatSalary=888, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=11200, endowmentInsurance=17920, medicalInsurance=5600, bz=', 0);
INSERT INTO `t_log` VALUES (357, '2019-05-22 00:14:59', 'admin', '888', '192.168.65.1', '密码重置', 'dah=1501', 0);
INSERT INTO `t_log` VALUES (358, '2019-05-22 00:15:11', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=1501, action=, ygxm=小红, mjkkh=122, jgh=802, gwdj=1, sex=F, email=1897879@qq.com, mobile=15034489022, sfzh=441424199702053399, bz=', 0);
INSERT INTO `t_log` VALUES (359, '2019-05-22 00:20:30', 'admin', '888', '192.168.65.1', '创建员工', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=901, gwdj=1, sex=F, email=1@163.com, mobile=12345678901, sfzh=123456789012345, bz=新员工', 0);
INSERT INTO `t_log` VALUES (360, '2019-05-22 00:22:08', '00987', '901', '192.168.65.1', '更新/启用员工信息', 'dah=00987, action=edit, jgh=901, gwdj=1, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (361, '2019-05-22 00:27:46', 'admin', '888', '192.168.65.1', '停用员工', 'dah=9100', 0);
INSERT INTO `t_log` VALUES (362, '2019-05-22 12:59:24', 'admin', '888', '0:0:0:0:0:0:0:1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:120)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (363, '2019-05-22 13:07:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (364, '2019-05-22 13:07:24', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (365, '2019-05-22 13:07:44', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (366, '2019-05-22 13:08:31', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (367, '2019-05-22 13:09:10', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=95555, action=, ygxm=平台管理员, mjkkh=11, jgh=888, gwdj=3, sex=M, email=skljoljk@gmai.com, mobile=13861116666, sfzh=320525198877731231, bz=0', 0);
INSERT INTO `t_log` VALUES (368, '2019-05-22 13:09:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (369, '2019-05-22 13:10:56', 'admin', '888', '192.168.65.1', '创建员工', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=3, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', 0);
INSERT INTO `t_log` VALUES (370, '2019-05-22 13:11:32', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (371, '2019-05-22 13:12:00', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (372, '2019-05-22 13:15:09', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (373, '2019-05-22 13:16:24', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=PC015, action=, ygxm=张成, mjkkh=0, jgh=001, gwdj=eva, sex=M, email=111@qq.com, mobile=12345678901, sfzh=111234454656788881, bz=0', 0);
INSERT INTO `t_log` VALUES (374, '2019-05-22 13:19:13', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (375, '2019-05-22 13:20:56', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (376, '2019-05-22 13:21:09', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (377, '2019-05-22 13:21:31', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (378, '2019-05-22 13:23:08', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (379, '2019-05-22 13:23:22', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (380, '2019-05-22 13:23:38', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (381, '2019-05-22 13:25:23', 'admin', '888', '0:0:0:0:0:0:0:1', 'Index: 3, Size: 3', 'java.lang.IndexOutOfBoundsException: Index: 3, Size: 3\r\n	at java.util.ArrayList.rangeCheck(ArrayList.java:657)\r\n	at java.util.ArrayList.get(ArrayList.java:433)\r\n	at jssvc.hrms.service.impl.SalaryServiceImpl.getSalaries(SalaryServiceImpl.java:56)\r\n	at sun.reflect.GeneratedMethodAccessor213.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.support.AopUt', 1);
INSERT INTO `t_log` VALUES (382, '2019-05-22 13:28:54', 'admin', '888', '192.168.65.1', '创建员工', 'dah=2288, action=, ygxm=小河, mjkkh=34, jgh=001, gwdj=1, sex=M, email=23@qq.com, mobile=12345678909, sfzh=123456789012348, bz=', 0);
INSERT INTO `t_log` VALUES (383, '2019-05-22 13:30:08', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=1, postSalary=1100, workYear=23, yearSalary=575, floatSalary=345, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', 0);
INSERT INTO `t_log` VALUES (384, '2019-05-22 13:31:57', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, ygxm=小河, mjkkh=34, jgh=001, gwdj=2, sex=M, email=23@qq.com, mobile=12345678909, sfzh=123456789012348, bz=', 0);
INSERT INTO `t_log` VALUES (385, '2019-05-22 13:39:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=2, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', 0);
INSERT INTO `t_log` VALUES (386, '2019-05-22 13:40:40', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=1, postSalary=1100, workYear=35, yearSalary=875, floatSalary=1234, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=7000, endowmentInsurance=11200, medicalInsurance=3500, bz=', 0);
INSERT INTO `t_log` VALUES (387, '2019-05-22 13:41:18', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=2, postSalary=2200, workYear=23, yearSalary=575, floatSalary=345, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=4600, endowmentInsurance=7360, medicalInsurance=2300, bz=', 0);
INSERT INTO `t_log` VALUES (388, '2019-05-22 13:41:46', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, ygxm=ask, mjkkh=, jgh=801, gwdj=3, sex=M, email=123@163.com, mobile=12345678902, sfzh=123456789012345, bz=', 0);
INSERT INTO `t_log` VALUES (389, '2019-05-22 13:46:28', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=2, postSalary=2200, workYear=34, yearSalary=850, floatSalary=1234, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, insurance=6800, endowmentInsurance=10880, medicalInsurance=3400, bz=', 0);
INSERT INTO `t_log` VALUES (390, '2019-05-22 13:48:29', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2288, action=, postLevel=1, postSalary=1100, workYear=30, yearSalary=750, floatSalary=345, award=1500, telAllowrance=100, trafficAllowrance=200, lunchAllowrance=30, insurance=6000, endowmentInsurance=9600, medicalInsurance=3000, bz=', 0);
INSERT INTO `t_log` VALUES (391, '2019-05-22 13:59:28', 'admin', '888', '192.168.65.1', '更新/启用员工信息', 'dah=2234, action=, postLevel=3, postSalary=3300, workYear=35, yearSalary=875, floatSalary=1234, award=4500, telAllowrance=300, trafficAllowrance=600, lunchAllowrance=90, insurance=7000, endowmentInsurance=11200, medicalInsurance=3500, bz=', 0);
INSERT INTO `t_log` VALUES (392, '2019-05-22 16:28:34', 'admin', '888', '192.168.65.1', '创建员工', 'dah=201901, action=, ygxm=李丽, mjkkh=4c201, jgh=802, gwdj=2, sex=F, email=1920482109@qq.com, mobile=18475130602, sfzh=441424199703043309, bz=', 0);
INSERT INTO `t_log` VALUES (393, '2019-05-22 16:37:45', 'admin', '888', '192.168.65.1', '创建员工', 'dah=201902, action=, ygxm=lili, mjkkh=, jgh=888, gwdj=1, sex=F, email=1@qq.com, mobile=12345678901, sfzh=441424199702053307, bz=', 0);
INSERT INTO `t_log` VALUES (394, '2019-05-22 16:51:35', 'admin', '888', '0:0:0:0:0:0:0:1', '### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.lunchAllowrance\' in \'order clause\'\r\n### The error may exist in file [C:\\Users\\Lenovo\\Desktop\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a             order by a.lunchAll', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'a.lunchAllowrance\' in \'order clause\'\r\n### The error may exist in file [C:\\Users\\Lenovo\\Desktop\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fro', 1);
INSERT INTO `t_log` VALUES (395, '2019-05-24 08:14:36', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a             order by a.yearSala', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fro', 1);
INSERT INTO `t_log` VALUES (396, '2019-05-24 08:14:43', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a             order by a.yearSala', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fro', 1);
INSERT INTO `t_log` VALUES (397, '2019-05-24 12:30:25', '', '', '127.0.0.1', '您尚未登录或会话已过期！', 'jssvc.base.exception.BusinessException: ERR00001\r\n	at jssvc.base.interceptor.AllInterceptor.preHandle(AllInterceptor.java:140)\r\n	at org.springframework.web.servlet.HandlerExecutionChain.applyPreHandle(HandlerExecutionChain.java:130)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:938)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:877)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkSe', 1);
INSERT INTO `t_log` VALUES (398, '2019-05-24 12:59:46', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (399, '2019-05-24 13:03:27', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (400, '2019-05-24 13:03:40', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (401, '2019-05-24 13:03:47', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (402, '2019-05-24 13:06:17', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (403, '2019-05-24 13:07:00', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (404, '2019-05-24 13:09:52', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to java.lang.Long', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.Long\r\n	at com.sun.proxy.$Proxy42.selectImportDataCount(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataCount(ImportDataServiceImpl.java:59)\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:64)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.', 1);
INSERT INTO `t_log` VALUES (405, '2019-05-24 15:08:15', 'admin', '888', '127.0.0.1', 'Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).', 'org.apache.ibatis.binding.BindingException: Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:77)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:53)\r\n	at com.sun.proxy.$Proxy42.selectByDah(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataByDah(ImportDataServiceImpl.java:67)\r\n	at jssvc.hrms.cont', 1);
INSERT INTO `t_log` VALUES (406, '2019-05-24 15:09:05', 'admin', '888', '127.0.0.1', 'Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).', 'org.apache.ibatis.binding.BindingException: Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:77)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:53)\r\n	at com.sun.proxy.$Proxy42.selectByDah(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataByDah(ImportDataServiceImpl.java:67)\r\n	at jssvc.hrms.cont', 1);
INSERT INTO `t_log` VALUES (407, '2019-05-24 15:12:09', 'admin', '888', '127.0.0.1', 'Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).', 'org.apache.ibatis.binding.BindingException: Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:77)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:53)\r\n	at com.sun.proxy.$Proxy42.selectByDah(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataByDah(ImportDataServiceImpl.java:67)\r\n	at jssvc.hrms.cont', 1);
INSERT INTO `t_log` VALUES (408, '2019-05-24 15:14:00', 'admin', '888', '127.0.0.1', 'Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).', 'org.apache.ibatis.binding.BindingException: Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectByDah attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:77)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:53)\r\n	at com.sun.proxy.$Proxy42.selectByDah(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportDataByDah(ImportDataServiceImpl.java:67)\r\n	at jssvc.hrms.cont', 1);
INSERT INTO `t_log` VALUES (409, '2019-05-24 15:41:43', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:122)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (410, '2019-05-24 15:41:50', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:122)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (411, '2019-05-24 15:42:25', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:122)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (412, '2019-05-24 15:43:27', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:122)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (413, '2019-05-24 15:44:35', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalaries(SalaryController.java:122)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(I', 1);
INSERT INTO `t_log` VALUES (414, '2019-05-24 16:11:18', 'admin', '888', '127.0.0.1', 'java.lang.Integer cannot be cast to jssvc.hrms.model.ImportData', 'java.lang.ClassCastException: java.lang.Integer cannot be cast to jssvc.hrms.model.ImportData\r\n	at com.sun.proxy.$Proxy42.selectImportDataForDah(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getImportData(ImportDataServiceImpl.java:77)\r\n	at jssvc.hrms.controller.ImportDataController.getImport(ImportDataController.java:161)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at s', 1);
INSERT INTO `t_log` VALUES (415, '2019-05-24 16:23:34', 'admin', '888', '127.0.0.1', 'Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectPost attempted to return null from a method with a primitive return type (int).', 'org.apache.ibatis.binding.BindingException: Mapper method \'jssvc.hrms.dao.ImportDataMapper.selectPost attempted to return null from a method with a primitive return type (int).\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:77)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:53)\r\n	at com.sun.proxy.$Proxy42.selectPost(Unknown Source)\r\n	at jssvc.hrms.service.impl.ImportDataServiceImpl.getDatas(ImportDataServiceImpl.java:47)\r\n	at jssvc.hrms.controller.Impor', 1);
INSERT INTO `t_log` VALUES (416, '2019-05-24 18:50:02', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.name\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SettlementMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SettlementMapper.selectSettlement-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_settlement a                     ord', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.name\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SettlementMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SettlementMapper.selectSettlement-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*', 1);
INSERT INTO `t_log` VALUES (417, '2019-05-24 19:23:15', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.floatSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a             order by a.floatSa', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.floatSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fr', 1);
INSERT INTO `t_log` VALUES (418, '2019-05-24 20:34:10', 'admin', '888', '127.0.0.1', '### Error updating database.  Cause: java.sql.SQLException: Field \'flag\' doesn\'t have a default value\r\n### The error may involve jssvc.hrms.dao.SettlementMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_settlement      ( dah,                       month,                       sick_deduction,                       compassionate_deduction,                       late_deduction,                       overtime_salary,', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'flag\' doesn\'t have a default value\r\n### The error may involve jssvc.hrms.dao.SettlementMapper.insertSelective-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_settlement      ( dah,                       month,                       sick_deduction,                       compassionate_deduction,                       late_deduction,', 1);
INSERT INTO `t_log` VALUES (419, '2019-05-24 21:56:41', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=201901, realWages=5000', 0);
INSERT INTO `t_log` VALUES (420, '2019-05-24 21:57:32', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=201901, realWages=5000', 0);
INSERT INTO `t_log` VALUES (421, '2019-05-24 21:58:15', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=201901, realWages=33333', 0);
INSERT INTO `t_log` VALUES (422, '2019-05-24 21:59:09', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=201901, realWages=55555', 0);
INSERT INTO `t_log` VALUES (423, '2019-05-24 22:18:40', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=double}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=double}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)', 1);
INSERT INTO `t_log` VALUES (424, '2019-05-24 22:33:51', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=double}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=double}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)', 1);
INSERT INTO `t_log` VALUES (425, '2019-05-24 22:42:45', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)', 1);
INSERT INTO `t_log` VALUES (426, '2019-05-24 23:32:20', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realwages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)', 1);
INSERT INTO `t_log` VALUES (427, '2019-05-24 23:35:40', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realWages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: An invalid property \'jdbctype\' was found in mapping #{realWages,jdbctype=DOUBLE}.  Valid properties are javaType,jdbcType,mode,numericScale,resultMap,typeHandler,jdbcTypeName\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)', 1);
INSERT INTO `t_log` VALUES (428, '2019-05-25 07:41:47', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.trafficAllowrance\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a                     orde', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.trafficAllowrance\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*', 1);
INSERT INTO `t_log` VALUES (429, '2019-05-25 07:43:47', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_hrms_salary a                     order by a.', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.yearSalary\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper.selectSalaries-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     fro', 1);
INSERT INTO `t_log` VALUES (430, '2019-05-25 07:44:46', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=01070, month=5, sickDays=4, compassionateDays=4, lateTimes=3, overtimeDays=2, replenishment=111, note1=cc', 0);
INSERT INTO `t_log` VALUES (431, '2019-05-25 08:04:20', 'admin', '888', '127.0.0.1', '### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'flag\' cannot be null\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.updateByDah-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_hrms_import_data     set dah = ?,       sick_days = ?,       month = ?,       compassionate_days = ?,       late_times = ?,       overtime_days = ?,       replenishment = ?,       flag = ?,       note1 = ?,       sort = ?     where dah', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'flag\' cannot be null\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.updateByDah-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update t_hrms_import_data     set dah = ?,       sick_days = ?,       month = ?,       compassionate_days = ?,       late_times = ?,       overtime_days = ?,       replenishment = ?,', 1);
INSERT INTO `t_log` VALUES (432, '2019-05-25 08:05:56', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=201901, action=, postLevel=2, postSalary=2200, workYear=2, yearSalary=222, floatSalary=123, award=3000, telAllowrance=200, trafficAllowrance=400, lunchAllowrance=60, bz=', 0);
INSERT INTO `t_log` VALUES (433, '2019-05-25 09:24:59', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from t_user where\n    dah not in(SELECT dah from t_hrms_salary)\' at line 1\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n### The error may involve jssvc.hrms.dao.SalaryMapper', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'from t_user where\n    dah not in(SELECT dah from t_hrms_salary)\' at line 1\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\hrms\\mapping\\SalaryMapper.xml]\r\n###', 1);
INSERT INTO `t_log` VALUES (434, '2019-05-25 09:59:07', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SettlementController.addSettlement(SettlementController.java:145)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMetho', 1);
INSERT INTO `t_log` VALUES (435, '2019-05-27 15:27:55', 'admin', '888', '127.0.0.1', '8', 'java.lang.ArrayIndexOutOfBoundsException: 8\r\n	at jssvc.base.service.impl.LogServiceImpl.backups(Unknown Source)\r\n	at jssvc.base.controller.LogController.backups(LogController.java:149)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframewo', 1);
INSERT INTO `t_log` VALUES (436, '2019-05-27 15:29:58', 'admin', '888', '127.0.0.1', '8', 'java.lang.ArrayIndexOutOfBoundsException: 8\r\n	at jssvc.base.service.impl.LogServiceImpl.backups(LogServiceImpl.java:78)\r\n	at jssvc.base.controller.LogController.backups(LogController.java:149)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.sprin', 1);
INSERT INTO `t_log` VALUES (437, '2019-05-27 16:53:37', 'admin', '888', '127.0.0.1', 'IO输入输出异常处理！', 'jssvc.base.exception.BusinessException: ERR00005\r\n	at jssvc.hrms.controller.SalaryController.getSalaryStatisticsPrint(SalaryController.java:473)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMe', 1);
INSERT INTO `t_log` VALUES (438, '2019-05-27 16:54:00', 'admin', '888', '127.0.0.1', 'IO输入输出异常处理！', 'jssvc.base.exception.BusinessException: ERR00005\r\n	at jssvc.hrms.controller.SalaryController.getSalaryStatisticsPrint(SalaryController.java:473)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMe', 1);
INSERT INTO `t_log` VALUES (439, '2019-05-27 17:35:34', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order by a.dah ASC\n     \n     \n      limit 0,50\' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.base.dao.ConstantMapper.selectPosit', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'order by a.dah ASC\n     \n     \n      limit 0,50\' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may', 1);
INSERT INTO `t_log` VALUES (440, '2019-05-27 17:41:22', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'en_key\' in \'class jssvc.base.model.filter.PositionSearchFilter\'', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'en_key\' in \'class jssvc.base.model.filter.PositionSearchFilter\'\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.$Proxy16.selectList(Unknown Source)\r\n	at org.myb', 1);
INSERT INTO `t_log` VALUES (441, '2019-05-27 17:51:27', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.dah\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.base.dao.ConstantMapper.selectPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t_constant a      WHERE a.type =type', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.dah\' in \'order clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.base.dao.ConstantMapper.selectPosition-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select distinct     a.*     from t', 1);
INSERT INTO `t_log` VALUES (442, '2019-05-27 17:55:56', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.type\' in \'where clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.base.dao.ConstantMapper.selectPositionCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1)     from t_constant      WHERE a.type =?\r\n### Cause: java.sql', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'a.type\' in \'where clause\'\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.base.dao.ConstantMapper.selectPositionCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count(1)     from t_c', 1);
INSERT INTO `t_log` VALUES (443, '2019-05-27 18:07:08', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.SalaryController.getSalary(SalaryController.java:100)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invoke(Inv', 1);
INSERT INTO `t_log` VALUES (444, '2019-05-27 22:09:39', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.en_key like CONCAT(\'%\',\'2\',\'%\') \n\n     \n      order by a.en_key ASC\n     \n    \' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.ba', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.en_key like CONCAT(\'%\',\'2\',\'%\') \n\n     \n      order by a.en_key ASC\n     \n    \' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\Consta', 1);
INSERT INTO `t_log` VALUES (445, '2019-05-27 22:10:26', 'admin', '888', '127.0.0.1', '### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.en_key like CONCAT(\'%\',\'3\',\'%\') \n\n     \n      order by a.en_key ASC\n     \n    \' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\ConstantMapper.xml]\r\n### The error may involve jssvc.ba', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'a.en_key like CONCAT(\'%\',\'3\',\'%\') \n\n     \n      order by a.en_key ASC\n     \n    \' at line 7\r\n### The error may exist in file [F:\\dandelion_project\\SSM_二次开发\\0523_企业工资\\pro_hrms\\hrms\\hrms-jscx\\target\\jscx\\WEB-INF\\classes\\jssvc\\base\\mapping\\Consta', 1);
INSERT INTO `t_log` VALUES (446, '2019-05-27 22:46:23', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=15034403, action=, ygxm=123, mjkkh=1234, jgh=802, gwdj=1, sex=F, email=118287389@qq.com, mobile=18475130601, sfzh=444245436554778950, bz=', 0);
INSERT INTO `t_log` VALUES (447, '2019-05-27 22:46:49', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=15034403, action=, ygxm=123, mjkkh=1234, jgh=888, gwdj=1, sex=F, email=118287389@qq.com, mobile=18475130601, sfzh=444245436554778950, bz=', 0);
INSERT INTO `t_log` VALUES (448, '2019-05-28 10:17:04', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=901, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (449, '2019-05-28 10:17:23', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=802, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (450, '2019-05-28 10:39:19', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=91821, action=, ygxm=W老师, mjkkh=1, jgh=888, gwdj=2, sex=M, email=jsssss@qq.com, mobile=13955558888, sfzh=320525190012310551, bz=中心测试', 0);
INSERT INTO `t_log` VALUES (451, '2019-05-28 10:39:29', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=2288, action=, ygxm=小河, mjkkh=34, jgh=801, gwdj=2, sex=M, email=23@qq.com, mobile=12345678909, sfzh=123456789012348, bz=', 0);
INSERT INTO `t_log` VALUES (452, '2019-05-28 10:53:42', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=15034403, action=, ygxm=123, mjkkh=1234, jgh=801, gwdj=1, sex=F, email=118287389@qq.com, mobile=18475130601, sfzh=444245436554778950, bz=', 0);
INSERT INTO `t_log` VALUES (453, '2019-05-28 10:53:58', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=1314, action=, ygxm=1314, mjkkh=4c503, jgh=901, gwdj=333, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', 0);
INSERT INTO `t_log` VALUES (454, '2019-05-28 10:54:20', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=1314, action=, ygxm=Test, mjkkh=4c503, jgh=901, gwdj=333, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', 0);
INSERT INTO `t_log` VALUES (455, '2019-05-28 11:33:31', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=801,901, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (456, '2019-05-28 11:38:14', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=888, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (457, '2019-05-28 11:38:34', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=802, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (458, '2019-05-28 11:44:36', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=1314, action=, ygxm=Test, mjkkh=4c503, jgh=801, gwdj=333, sex=M, email=11232435@qq.com, mobile=18127342158, sfzh=441424199702053307, bz=123', 0);
INSERT INTO `t_log` VALUES (459, '2019-05-28 12:10:06', 'admin', '888', '192.168.1.106', '更新/启用员工信息', 'dah=00987, action=, ygxm=小欧, mjkkh=123, jgh=802, gwdj=55, sex=F, email=12@163.com, mobile=12345678900, sfzh=123456789012349, bz=新员工1', 0);
INSERT INTO `t_log` VALUES (460, '2019-05-29 23:05:57', 'admin', '888', '127.0.0.1', '### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?, ?,       ?, ?, ?,       ?)\r\n### Cause: java.sql.S', 'org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?, ?,', 1);
INSERT INTO `t_log` VALUES (461, '2019-05-29 23:06:06', 'admin', '888', '127.0.0.1', '### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?, ?,       ?, ?, ?,       ?)\r\n### Cause: java.sql.S', 'org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?, ?,', 1);
INSERT INTO `t_log` VALUES (462, '2019-05-29 23:08:31', 'admin', '888', '127.0.0.1', '### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070-5\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?, ?,       ?, ?, ?,       ?)\r\n### Cause: java.sql', 'org.springframework.dao.DuplicateKeyException: \r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'01070-5\' for key \'dah\'\r\n### The error may involve jssvc.hrms.dao.ImportDataMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into t_hrms_import_data (id, dah,month, sick_days,       compassionate_days, late_times, overtime_days,       replenishment, flag, note1,       sort)     values (?, ?,?,?,       ?, ?,', 1);
INSERT INTO `t_log` VALUES (463, '2019-05-29 23:28:23', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:78)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invo', 1);
INSERT INTO `t_log` VALUES (464, '2019-05-29 23:29:59', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:78)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invo', 1);
INSERT INTO `t_log` VALUES (465, '2019-05-29 23:30:03', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:78)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invo', 1);
INSERT INTO `t_log` VALUES (466, '2019-05-29 23:31:41', 'admin', '888', '127.0.0.1', '判断过程中数据存在null，请检查！', 'jssvc.base.exception.BusinessException: ERR00004\r\n	at jssvc.hrms.controller.ImportDataController.getDatas(ImportDataController.java:78)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:497)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invo', 1);
INSERT INTO `t_log` VALUES (467, '2019-05-29 23:59:27', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.$Proxy16.selectOne(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemp', 1);
INSERT INTO `t_log` VALUES (468, '2019-05-30 00:00:26', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.$Proxy16.selectOne(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemp', 1);
INSERT INTO `t_log` VALUES (469, '2019-05-30 00:02:37', 'admin', '888', '127.0.0.1', 'nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplate$SqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.$Proxy16.selectOne(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemp', 1);
INSERT INTO `t_log` VALUES (470, '2019-05-30 13:05:40', 'admin', '888', '192.168.1.106', '停用员工', 'dah=1314', 0);
INSERT INTO `t_log` VALUES (471, '2019-05-30 13:05:48', 'admin', '888', '192.168.1.106', '停用员工', 'dah=2234', 0);

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `sort` int(10) NOT NULL COMMENT '菜单排序',
  `level` int(10) NOT NULL COMMENT '菜单级别',
  `p_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级菜单id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'jsp页面',
  `action` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Action动作',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('menu001000', 100000, 1, '-1', '基础管理', '#', '#', 'fa fa-desktop');
INSERT INTO `t_menu` VALUES ('menu001100', 10100, 2, 'menu001000', '用户', '#', '#', 'fa fa-user');
INSERT INTO `t_menu` VALUES ('menu001101', 10101, 3, 'menu001100', '员工管理', 'showUserList.do', 'showUserList', 'fa fa-address-card');
INSERT INTO `t_menu` VALUES ('menu001102', 10102, 3, 'menu001100', '信息修改', 'showUserUpd.do', 'showUserUpd', 'fa fa-pencil-square-o');
INSERT INTO `t_menu` VALUES ('menu001103', 10103, 3, 'menu001100', '密码修改', 'showPwdUpd.do', 'showPwdUpd', 'fa fa-key');
INSERT INTO `t_menu` VALUES ('menu001200', 10200, 2, 'menu001000', '部门', '#', '#', 'fa fa-sitemap');
INSERT INTO `t_menu` VALUES ('menu001201', 10201, 3, 'menu001200', '部门管理', 'showJgList.do', 'showJgList', 'fa fa-sitemap');
INSERT INTO `t_menu` VALUES ('menu001250', 10250, 2, 'menu001000', '岗位', '#', '#', 'fa fa-cubes');
INSERT INTO `t_menu` VALUES ('menu001251', 10251, 3, 'menu001250', '岗位管理', 'showPositionList.do', 'showPositionList', 'fa fa-graduation-cap');
INSERT INTO `t_menu` VALUES ('menu001300', 10300, 2, 'menu001000', '角色', '#', '#', 'fa fa-user-circle');
INSERT INTO `t_menu` VALUES ('menu001301', 10301, 3, 'menu001300', '角色查看', 'showRoleList.do', 'showRoleList', 'fa fa-search');
INSERT INTO `t_menu` VALUES ('menu001302', 10302, 3, 'menu001300', '员工角色管理', 'showUserRoleList.do', 'showUserRoleList', 'fa fa-user-circle');
INSERT INTO `t_menu` VALUES ('menu008000', 10800, 1, '-1', '工资管理', '#', '#', 'fa fa-usd');
INSERT INTO `t_menu` VALUES ('menu008001', 10801, 2, 'menu008000', '固定工资管理', 'showSalaryList.do', 'showSalaryList', 'fa fa-money');
INSERT INTO `t_menu` VALUES ('menu008300', 10830, 2, 'menu008000', '导入数据录入', 'showImportDataList.do', 'showImportDataList', 'fa fa-sitemap');
INSERT INTO `t_menu` VALUES ('menu008400', 10840, 2, 'menu008000', '工资结算', 'showSettlementList.do', 'showSettlementList', 'fa fa-key');
INSERT INTO `t_menu` VALUES ('menu009000', 9000, 1, '-1', '日志管理', '#', '#', 'fa fa-comments');
INSERT INTO `t_menu` VALUES ('menu009101', 9101, 3, 'menu009000', '日志管理', 'showLogList.do', 'showLogList', 'fa fa-comment');
INSERT INTO `t_menu` VALUES ('menu010001', 10200, 1, '-1', '报表管理', '#', '#', 'fa fa-table');
INSERT INTO `t_menu` VALUES ('menu010100', 10100, 2, 'menu010001', '工资查询报表', 'salaryStatements.do', 'salaryStatements', 'fa fa-paper-plane-o');
INSERT INTO `t_menu` VALUES ('menu010200', 10200, 2, 'menu010001', '打印工资条', 'salarySheetQuery.do', 'salarySheetQuery', 'fa fa-print');
INSERT INTO `t_menu` VALUES ('menu010300', 10300, 2, 'menu010001', '工资统计报表', 'salaryStatistics.do', 'salaryStatistics', 'fa fa-balance-scale');

-- ----------------------------
-- Table structure for t_menu_function
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_function`;
CREATE TABLE `t_menu_function`  (
  `id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  `function_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能名',
  `function_action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单功能表' ROW_FORMAT = Dynamic;

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
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `sso_role_id` int(10) NULL DEFAULT NULL COMMENT '统一用户id',
  `flag` int(1) NOT NULL COMMENT '状态 0 允许删除 1 不允许删除',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (2, '测试角色', '', NULL, 0, '2018-10-12 16:50:30', '2018-12-27 14:27:32');
INSERT INTO `t_role` VALUES (83, '管理员权限', '具备所有操作权限', NULL, 0, '2018-10-27 12:55:01', '2019-05-24 08:01:35');
INSERT INTO `t_role` VALUES (86, '事件管理员', '事件管理员', NULL, 0, '2018-10-23 16:50:30', '2018-11-27 10:20:31');
INSERT INTO `t_role` VALUES (88, '普通用户', '普通用户', NULL, 0, '2019-05-22 00:17:53', '2019-05-25 11:20:16');

-- ----------------------------
-- Table structure for t_role_function
-- ----------------------------
DROP TABLE IF EXISTS `t_role_function`;
CREATE TABLE `t_role_function`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `function_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '功能ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色功能表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_function
-- ----------------------------
INSERT INTO `t_role_function` VALUES (78, 86, 'func007100');
INSERT INTO `t_role_function` VALUES (79, 86, 'func007200');
INSERT INTO `t_role_function` VALUES (80, 86, 'func009000');
INSERT INTO `t_role_function` VALUES (81, 86, 'func000001');
INSERT INTO `t_role_function` VALUES (82, 86, 'func000002');
INSERT INTO `t_role_function` VALUES (83, 86, 'func000003');
INSERT INTO `t_role_function` VALUES (84, 86, 'func000004');
INSERT INTO `t_role_function` VALUES (85, 86, 'func000012');
INSERT INTO `t_role_function` VALUES (86, 86, 'func000005');
INSERT INTO `t_role_function` VALUES (87, 86, 'func000006');
INSERT INTO `t_role_function` VALUES (91, 2, 'func008002');
INSERT INTO `t_role_function` VALUES (92, 2, 'func008001');
INSERT INTO `t_role_function` VALUES (180, 83, 'func009000');
INSERT INTO `t_role_function` VALUES (181, 83, 'func008002');
INSERT INTO `t_role_function` VALUES (182, 83, 'func008001');
INSERT INTO `t_role_function` VALUES (183, 83, 'func000001');
INSERT INTO `t_role_function` VALUES (184, 83, 'func000002');
INSERT INTO `t_role_function` VALUES (185, 83, 'func000003');
INSERT INTO `t_role_function` VALUES (186, 83, 'func000004');
INSERT INTO `t_role_function` VALUES (187, 83, 'func000012');
INSERT INTO `t_role_function` VALUES (188, 83, 'func000005');
INSERT INTO `t_role_function` VALUES (189, 83, 'func000006');
INSERT INTO `t_role_function` VALUES (190, 83, 'func000007');
INSERT INTO `t_role_function` VALUES (191, 83, 'func000008');
INSERT INTO `t_role_function` VALUES (192, 83, 'func000009');
INSERT INTO `t_role_function` VALUES (193, 83, 'func000010');
INSERT INTO `t_role_function` VALUES (194, 83, 'func000011');
INSERT INTO `t_role_function` VALUES (198, 88, 'func008002');
INSERT INTO `t_role_function` VALUES (199, 88, 'func000005');
INSERT INTO `t_role_function` VALUES (200, 88, 'func000006');

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  `menu_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 264 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (109, 86, 'menu007100');
INSERT INTO `t_role_menu` VALUES (110, 86, 'menu007000');
INSERT INTO `t_role_menu` VALUES (111, 86, 'menu007200');
INSERT INTO `t_role_menu` VALUES (112, 86, 'menu007401');
INSERT INTO `t_role_menu` VALUES (113, 86, 'menu007400');
INSERT INTO `t_role_menu` VALUES (114, 86, 'menu007402');
INSERT INTO `t_role_menu` VALUES (115, 86, 'menu009000');
INSERT INTO `t_role_menu` VALUES (116, 86, 'menu009101');
INSERT INTO `t_role_menu` VALUES (117, 86, 'menu001100');
INSERT INTO `t_role_menu` VALUES (118, 86, 'menu001000');
INSERT INTO `t_role_menu` VALUES (119, 86, 'menu001101');
INSERT INTO `t_role_menu` VALUES (120, 86, 'menu001102');
INSERT INTO `t_role_menu` VALUES (121, 86, 'menu001103');
INSERT INTO `t_role_menu` VALUES (133, 2, 'menu008000');
INSERT INTO `t_role_menu` VALUES (134, 2, 'menu008001');
INSERT INTO `t_role_menu` VALUES (237, 83, 'menu009000');
INSERT INTO `t_role_menu` VALUES (238, 83, 'menu009101');
INSERT INTO `t_role_menu` VALUES (239, 83, 'menu008001');
INSERT INTO `t_role_menu` VALUES (240, 83, 'menu008000');
INSERT INTO `t_role_menu` VALUES (241, 83, 'menu008300');
INSERT INTO `t_role_menu` VALUES (242, 83, 'menu008400');
INSERT INTO `t_role_menu` VALUES (243, 83, 'menu001000');
INSERT INTO `t_role_menu` VALUES (244, 83, 'menu001100');
INSERT INTO `t_role_menu` VALUES (245, 83, 'menu001101');
INSERT INTO `t_role_menu` VALUES (246, 83, 'menu001102');
INSERT INTO `t_role_menu` VALUES (247, 83, 'menu001103');
INSERT INTO `t_role_menu` VALUES (248, 83, 'menu001200');
INSERT INTO `t_role_menu` VALUES (249, 83, 'menu001201');
INSERT INTO `t_role_menu` VALUES (250, 83, 'menu001300');
INSERT INTO `t_role_menu` VALUES (251, 83, 'menu001301');
INSERT INTO `t_role_menu` VALUES (252, 83, 'menu001302');
INSERT INTO `t_role_menu` VALUES (258, 88, 'menu008001');
INSERT INTO `t_role_menu` VALUES (259, 88, 'menu008000');
INSERT INTO `t_role_menu` VALUES (260, 88, 'menu001102');
INSERT INTO `t_role_menu` VALUES (261, 88, 'menu001000');
INSERT INTO `t_role_menu` VALUES (262, 88, 'menu001100');
INSERT INTO `t_role_menu` VALUES (263, 88, 'menu001103');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `dah` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工编码或者档案号',
  `ygxm` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mjkkh` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '门禁卡卡号',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别：F女M男',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '邮箱',
  `sfzh` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证号',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `gwdj` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '岗位等级',
  `flag` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标志',
  `bz` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `pysx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pyqp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `px` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`dah`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('00987', '小欧', '123', 'F', '12345678900', '12@163.com', '123456789012349', 'fcea920f7412b5da7be0cf42b8c93759', '55', '0', '新员工1', '1', '1', '1');
INSERT INTO `t_user` VALUES ('01065', '徐伟', '01065', 'M', '136****1231', 'xwei@jssvc.edu.cn', '320586197902035813', '1b23025b65cf18d10c9dfbb1ce65ce93', 'js', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('01070', '金霁', '01070', 'F', '137****3288', 'jinji@jssvc.edu.cn', '320504197801273025', '0aed5c0f4387b7432a813e9c8f6c1c64', 'js', '0', '0', '1', '1', '1');
INSERT INTO `t_user` VALUES ('1314', 'Test', '4c503', 'M', '18127342158', '11232435@qq.com', '441424199702053307', 'e10adc3949ba59abbe56e057f20f883e', '333', '1', '123', '1', '1', '1');
INSERT INTO `t_user` VALUES ('15034403', '123', '1234', 'F', '18475130601', '118287389@qq.com', '444245436554778950', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('201901', '李丽', '4c201', 'F', '18475130602', '1920482109@qq.com', '441424199703043309', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('201902', 'lili', '', 'F', '12345678901', '1@qq.com', '441424199702053307', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('2234', 'ask', '', 'M', '12345678902', '123@163.com', '123456789012345', 'e10adc3949ba59abbe56e057f20f883e', '3', '1', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('2288', '小河', '34', 'M', '12345678909', '23@qq.com', '123456789012348', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('567', '444', '5677', 'F', '18127342158', '555555555555555@qq.com', '441424177897978878', 'e10adc3949ba59abbe56e057f20f883e', '1', '0', '', '1', '1', '1');
INSERT INTO `t_user` VALUES ('91821', 'W老师', '1', 'M', '13955558888', 'jsssss@qq.com', '320525190012310551', 'e10adc3949ba59abbe56e057f20f883e', '2', '0', '中心测试', '1', '1', '1');
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
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dah` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '员工号',
  `role_id` int(10) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, '95555', 86);
INSERT INTO `t_user_role` VALUES (2, 'admin', 82);
INSERT INTO `t_user_role` VALUES (4, '00997', 2);
INSERT INTO `t_user_role` VALUES (8, 'PC001', 2);
INSERT INTO `t_user_role` VALUES (9, 'PC002', 2);
INSERT INTO `t_user_role` VALUES (10, 'PC003', 2);
INSERT INTO `t_user_role` VALUES (11, 'PC004', 2);
INSERT INTO `t_user_role` VALUES (12, 'PC005', 2);
INSERT INTO `t_user_role` VALUES (13, 'PC006', 2);
INSERT INTO `t_user_role` VALUES (14, 'PC007', 2);
INSERT INTO `t_user_role` VALUES (15, 'PC008', 2);
INSERT INTO `t_user_role` VALUES (16, 'PC009', 2);
INSERT INTO `t_user_role` VALUES (17, 'PC10', 2);
INSERT INTO `t_user_role` VALUES (18, 'PC011', 2);
INSERT INTO `t_user_role` VALUES (19, 'PC012', 2);
INSERT INTO `t_user_role` VALUES (20, 'PC013', 2);
INSERT INTO `t_user_role` VALUES (21, 'PC014', 2);
INSERT INTO `t_user_role` VALUES (22, 'PC015', 2);
INSERT INTO `t_user_role` VALUES (23, 'PC016', 2);
INSERT INTO `t_user_role` VALUES (24, 'PC017', 2);
INSERT INTO `t_user_role` VALUES (25, 'PC018', 2);
INSERT INTO `t_user_role` VALUES (26, 'PC019', 2);
INSERT INTO `t_user_role` VALUES (27, 'PC020', 2);
INSERT INTO `t_user_role` VALUES (28, 'PC021', 2);
INSERT INTO `t_user_role` VALUES (29, 'PC022', 2);
INSERT INTO `t_user_role` VALUES (30, 'PC023', 2);
INSERT INTO `t_user_role` VALUES (31, 'PC024', 2);
INSERT INTO `t_user_role` VALUES (32, 'PC025', 2);
INSERT INTO `t_user_role` VALUES (33, 'TST001', 2);
INSERT INTO `t_user_role` VALUES (34, 'TST002', 2);
INSERT INTO `t_user_role` VALUES (35, 'TST003', 2);
INSERT INTO `t_user_role` VALUES (36, 'TST004', 2);
INSERT INTO `t_user_role` VALUES (37, 'TST005', 2);
INSERT INTO `t_user_role` VALUES (38, '01065', 2);
INSERT INTO `t_user_role` VALUES (39, '567', 83);
INSERT INTO `t_user_role` VALUES (40, '91821', 2);
INSERT INTO `t_user_role` VALUES (43, '1314', 83);
INSERT INTO `t_user_role` VALUES (47, '01070', 2);
INSERT INTO `t_user_role` VALUES (48, '00987', 88);
INSERT INTO `t_user_role` VALUES (52, '2234', 88);
INSERT INTO `t_user_role` VALUES (53, '2288', 88);
INSERT INTO `t_user_role` VALUES (54, '201901', 88);

SET FOREIGN_KEY_CHECKS = 1;
