/*
 Navicat Premium Dump SQL

 Source Server         : 【新加坡】-MySQL8
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : 101.32.244.148:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 24/10/2024 21:30:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'query_user', 'housdata用户信息查询', NULL, NULL, 'QueryUser', 'crud', 'element-plus', 'com.ruoyi.huosdata', 'housdata', 'users', '信息查询', 'camellia', '0', '/', '{\"parentMenuId\":2000}', 'admin', '2024-10-23 01:38:45', '', '2024-10-24 02:55:17', NULL);
INSERT INTO `gen_table` VALUES (2, 'housdata_identity', '用户信息二级页面，用户身份标识。', NULL, NULL, 'HousdataIdentity', 'crud', 'element-plus', 'com.ruoyi.housdata', 'housdata', 'datas', '用户身份标识', 'ruoyi', '0', '/', '{\"parentMenuId\":2001}', 'admin', '2024-10-24 03:05:12', '', '2024-10-24 06:00:43', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', '主键', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-10-23 01:38:45', '', '2024-10-24 02:55:17');
INSERT INTO `gen_table_column` VALUES (2, 1, 'name', '姓名', 'varchar(255)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-10-23 01:38:46', '', '2024-10-24 02:55:17');
INSERT INTO `gen_table_column` VALUES (3, 1, 'age', '年龄', 'int', 'Long', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-10-23 01:38:46', '', '2024-10-24 02:55:17');
INSERT INTO `gen_table_column` VALUES (4, 1, 'birthday', '生日', 'date', 'Date', 'birthday', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-10-23 01:38:47', '', '2024-10-24 02:55:18');
INSERT INTO `gen_table_column` VALUES (5, 1, 'sex', '性别', 'varchar(255)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 5, 'admin', '2024-10-23 01:38:48', '', '2024-10-24 02:55:18');
INSERT INTO `gen_table_column` VALUES (6, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-10-23 01:38:48', '', '2024-10-24 02:55:18');
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2024-10-23 01:38:49', '', '2024-10-24 02:55:18');
INSERT INTO `gen_table_column` VALUES (8, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2024-10-23 01:38:49', '', '2024-10-24 02:55:19');
INSERT INTO `gen_table_column` VALUES (9, 1, 'update_time', '更新时间', 'varchar(255)', 'String', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-10-23 01:38:50', '', '2024-10-24 02:55:19');
INSERT INTO `gen_table_column` VALUES (10, 1, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2024-10-23 01:38:50', '', '2024-10-24 02:55:19');
INSERT INTO `gen_table_column` VALUES (12, 1, 'identity_id', '身份标识id', 'bigint', 'Long', 'identityId', '0', '0', '0', '1', '0', '1', '1', 'EQ', 'input', '', 11, '', '2024-10-24 02:29:28', '', '2024-10-24 02:55:19');
INSERT INTO `gen_table_column` VALUES (13, 2, 'identity_id', '身份主键', 'bigint', 'Long', 'identityId', '1', '1', '0', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2024-10-24 03:05:13', '', '2024-10-24 07:48:29');
INSERT INTO `gen_table_column` VALUES (14, 2, 'identity_name', '身份名称', 'varchar(255)', 'String', 'identityName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-10-24 03:05:13', '', '2024-10-24 07:48:30');
INSERT INTO `gen_table_column` VALUES (15, 2, 'identity_type', '身份标识', 'varchar(255)', 'String', 'identityType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-10-24 03:05:13', '', '2024-10-24 07:48:30');
INSERT INTO `gen_table_column` VALUES (16, 2, 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2024-10-24 03:05:13', '', '2024-10-24 07:48:30');
INSERT INTO `gen_table_column` VALUES (17, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-10-24 03:05:14', '', '2024-10-24 07:48:30');
INSERT INTO `gen_table_column` VALUES (18, 2, 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-10-24 03:05:14', '', '2024-10-24 07:48:31');
INSERT INTO `gen_table_column` VALUES (19, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2024-10-24 03:05:14', '', '2024-10-24 07:48:31');
INSERT INTO `gen_table_column` VALUES (20, 2, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2024-10-24 03:05:14', '', '2024-10-24 07:48:31');
INSERT INTO `gen_table_column` VALUES (21, 2, 'id', '主键', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, '', '2024-10-24 06:27:34', '', '2024-10-24 07:48:30');

-- ----------------------------
-- Table structure for housdata_identity
-- ----------------------------
DROP TABLE IF EXISTS `housdata_identity`;
CREATE TABLE `housdata_identity`  (
  `identity_id` bigint NULL DEFAULT NULL COMMENT '身份主键',
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `identity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份名称',
  `identity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份标识',
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of housdata_identity
-- ----------------------------
INSERT INTO `housdata_identity` VALUES (NULL, 11, 'aa', 'aa', NULL, '2024-10-24 15:52:22', NULL, NULL, 'aa');
INSERT INTO `housdata_identity` VALUES (NULL, 12, '11', '11', NULL, '2024-10-24 15:56:34', NULL, NULL, '11');
INSERT INTO `housdata_identity` VALUES (9, 13, '二级用户', 'leve_2', NULL, '2024-10-24 15:57:59', NULL, '2024-10-24 16:18:11', '二级用户标签');
INSERT INTO `housdata_identity` VALUES (12, 16, '88', '88', NULL, '2024-10-24 16:57:17', NULL, '2024-10-24 21:12:51', '88');
INSERT INTO `housdata_identity` VALUES (12, 17, '11', '11', NULL, '2024-10-24 16:57:53', NULL, NULL, '11');
INSERT INTO `housdata_identity` VALUES (12, 18, '55', '55', NULL, '2024-10-24 16:58:01', NULL, NULL, '55');
INSERT INTO `housdata_identity` VALUES (13, 19, '科员', 'level_12', NULL, '2024-10-24 17:02:20', NULL, '2024-10-24 21:24:58', '一级科员');

-- ----------------------------
-- Table structure for query_user
-- ----------------------------
DROP TABLE IF EXISTS `query_user`;
CREATE TABLE `query_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `identity_id` bigint NOT NULL COMMENT '身份标识id',
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_user
-- ----------------------------
INSERT INTO `query_user` VALUES (13, '曹正', 32, '1998-10-05', '0', NULL, '2024-10-24 17:02:09', NULL, '2024-10-24 21:25:16.855', '科员', 11);
INSERT INTO `query_user` VALUES (12, '小蕊', 22, '2011-10-03', '1', NULL, '2024-10-24 16:56:51', NULL, '2024-10-24 21:09:37.554', '22', 11);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-purple', 'Y', 'admin', '2024-10-23 01:36:47', 'ry', '2024-10-23 02:52:32', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-10-23 01:36:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-10-23 01:36:47', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-10-23 01:36:47', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-10-23 01:36:47', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-10-23 01:36:47', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '一级用户', '0', 'housdata_identity_type', NULL, 'default', 'N', '0', 'admin', '2024-10-24 01:48:04', '', NULL, '一级用户');
INSERT INTO `sys_dict_data` VALUES (101, 2, '二级用户', '1', 'housdata_identity_type', NULL, 'default', 'N', '0', 'admin', '2024-10-24 01:48:46', 'admin', '2024-10-24 01:55:18', '二级用户');
INSERT INTO `sys_dict_data` VALUES (102, 3, '三级用户', '2', 'housdata_identity_type', NULL, 'default', 'N', '0', 'admin', '2024-10-24 01:49:25', '', NULL, '三级用户');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-10-23 01:36:47', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '用户身份标识', 'housdata_identity_type', '0', 'admin', '2024-10-24 01:44:18', '', NULL, '用户身份标识');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 01:36:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 01:36:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-10-23 01:36:47', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:15:48');
INSERT INTO `sys_logininfor` VALUES (101, 'camellia', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:15:58');
INSERT INTO `sys_logininfor` VALUES (102, 'camellia', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:19:50');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:19:55');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:22:22');
INSERT INTO `sys_logininfor` VALUES (105, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:22:32');
INSERT INTO `sys_logininfor` VALUES (106, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:22:47');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:22:50');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:23:24');
INSERT INTO `sys_logininfor` VALUES (109, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:23:33');
INSERT INTO `sys_logininfor` VALUES (110, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:27:07');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:27:12');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:27:34');
INSERT INTO `sys_logininfor` VALUES (113, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:27:42');
INSERT INTO `sys_logininfor` VALUES (114, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:28:13');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:28:17');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 02:29:13');
INSERT INTO `sys_logininfor` VALUES (117, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 02:29:23');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 03:08:06');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 03:08:06');
INSERT INTO `sys_logininfor` VALUES (120, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-23 03:08:07');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 03:08:22');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-23 08:59:51');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 00:42:52');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 00:45:51');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 04:50:33');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 05:14:57');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-10-24 06:50:55');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 06:51:00');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 12:41:54');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-10-24 12:52:52');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2019 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-10-23 01:36:46', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-10-23 01:36:46', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-10-23 01:36:46', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-10-23 01:36:46', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-10-23 01:36:46', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-10-23 01:36:46', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-10-23 01:36:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-10-23 01:36:46', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-10-23 01:36:46', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-10-23 01:36:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-10-23 01:36:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-10-23 01:36:46', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-10-23 01:36:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-10-23 01:36:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-10-23 01:36:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-10-23 01:36:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-10-23 01:36:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-10-23 01:36:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-10-23 01:36:46', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-10-23 01:36:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-10-23 01:36:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-10-23 01:36:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-10-23 01:36:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-10-23 01:36:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'housdata', 0, 3, 'housdata', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'star', 'admin', '2024-10-23 01:38:03', 'admin', '2024-10-23 01:38:16', '');
INSERT INTO `sys_menu` VALUES (2001, '信息查询', 2000, 1, 'users', 'housdata/users/index', NULL, '', 1, 0, 'C', '0', '0', 'housdata:users:list', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '信息查询菜单');
INSERT INTO `sys_menu` VALUES (2002, '信息查询查询', 2001, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:users:query', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '信息查询新增', 2001, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:users:add', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '信息查询修改', 2001, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:users:edit', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '信息查询删除', 2001, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:users:remove', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '信息查询导出', 2001, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:users:export', '#', 'admin', '2024-10-23 01:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '用户身份标识', 2001, 1, 'datas', 'housdata/datas/index', NULL, '', 1, 0, 'C', '0', '0', 'housdata:datas:list', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '用户身份标识菜单');
INSERT INTO `sys_menu` VALUES (2014, '用户身份标识查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:datas:query', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '用户身份标识新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:datas:add', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '用户身份标识修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:datas:edit', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '用户身份标识删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:datas:remove', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '用户身份标识导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'housdata:datas:export', '#', 'admin', '2024-10-24 06:47:42', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-10-23 01:36:47', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-10-23 01:36:47', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 295 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"housdata\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"housdata\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 01:38:04', 999);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-10-23 01:38:03\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"housdata\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"housdata\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 01:38:17', 711);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 01:38:51', 7044);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"birthday\",\"javaType\":\"Date\",\"list\":true,\"params\":{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 01:41:35', 2508);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-23 01:41:58', 247);
INSERT INTO `sys_oper_log` VALUES (105, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":23,\"birthday\":\"2008-06-03\",\"createTime\":\"2024-10-22 14:32:01\",\"id\":5,\"name\":\"111\",\"params\":{},\"remark\":\"哈哈\",\"sex\":\"1\",\"updateTime\":\"2024-10-23 09:47:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 01:47:00', 224);
INSERT INTO `sys_oper_log` VALUES (106, '信息查询', 5, 'com.ruoyi.web.controller.housdata.QueryUserController.export()', 'POST', 1, 'admin', '研发部门', '/housdata/users/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 01:53:42', 962);
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2002,2003,2004,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"housdata:level\",\"roleName\":\"level_1\",\"roleSort\":0,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:12:22', 1137);
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-23 02:12:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2002,2003,2004,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"housdata:level1\",\"roleName\":\"level_1\",\"roleSort\":0,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:12:50', 1105);
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-23 02:12:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2002,2003,2004,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"housdata:level1\",\"roleName\":\"level_1\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:12:59', 1150);
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,2000,2001,2002,2003,2004,2005,2006],\"params\":{},\"roleId\":101,\"roleKey\":\"housdata:level2\",\"roleName\":\"level_2\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:14:13', 1001);
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"111@gmail.com\",\"nickName\":\"camellia\",\"params\":{},\"phonenumber\":\"17375256526\",\"postIds\":[4],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"camellia\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:15:26', 1344);
INSERT INTO `sys_oper_log` VALUES (112, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:22:17', 289);
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-23 01:36:46\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001,2002,2003,2004,2005,2006],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:23:20', 1084);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-23 01:36:46\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:27:30', 1046);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-10-23 01:36:46\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,2000,2001],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:29:07', 2280);
INSERT INTO `sys_oper_log` VALUES (116, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'ry', '测试部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-purple\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:36:47\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 02:52:32', 423);
INSERT INTO `sys_oper_log` VALUES (117, '参数管理', 5, 'com.ruoyi.web.controller.system.SysConfigController.export()', 'POST', 1, 'ry', '测试部门', '/system/config/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 02:55:34', 23604);
INSERT INTO `sys_oper_log` VALUES (118, '参数管理', 5, 'com.ruoyi.web.controller.system.SysConfigController.export()', 'POST', 1, 'ry', '测试部门', '/system/config/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 02:56:14', 184);
INSERT INTO `sys_oper_log` VALUES (119, '参数管理', 5, 'com.ruoyi.web.controller.system.SysConfigController.export()', 'POST', 1, 'ry', '测试部门', '/system/config/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 03:08:08', 674439);
INSERT INTO `sys_oper_log` VALUES (120, '参数管理', 5, 'com.ruoyi.web.controller.system.SysConfigController.export()', 'POST', 1, 'admin', '研发部门', '/system/config/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-10-23 03:08:35', 151);
INSERT INTO `sys_oper_log` VALUES (121, '参数管理', 1, 'com.ruoyi.web.controller.system.SysConfigController.add()', 'POST', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configKey\":\"11\",\"configName\":\"11\",\"configType\":\"Y\",\"configValue\":\"11\",\"createBy\":\"admin\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:25:31', 12844);
INSERT INTO `sys_oper_log` VALUES (122, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:26:33', 130);
INSERT INTO `sys_oper_log` VALUES (123, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:35:35', 112);
INSERT INTO `sys_oper_log` VALUES (124, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:35:36', 111);
INSERT INTO `sys_oper_log` VALUES (125, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:35:37', 103);
INSERT INTO `sys_oper_log` VALUES (126, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:35:37', 100);
INSERT INTO `sys_oper_log` VALUES (127, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:36:01', 99);
INSERT INTO `sys_oper_log` VALUES (128, '参数管理', 9, 'com.ruoyi.web.controller.system.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/config/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:36:11', 111);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 02:15:26\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"若依科技\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"status\":\"0\"},\"deptId\":100,\"email\":\"111@gmail.com\",\"loginDate\":\"2024-10-23 10:15:58\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"camellia\",\"params\":{},\"phonenumber\":\"17375256526\",\"postIds\":[4],\"roleIds\":[100,2,101],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"housdata:level1\",\"roleName\":\"level_1\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"camellia\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:42:53', 1478);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 03:42:57', 846);
INSERT INTO `sys_oper_log` VALUES (131, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":23,\"birthday\":\"2008-06-03\",\"createTime\":\"2024-10-22 14:32:01\",\"id\":5,\"name\":\"111\",\"params\":{},\"remark\":\"哈哈\",\"sex\":\"1\",\"updateTime\":\"2024-10-23 17:09:42\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-23 09:09:43', 10820);
INSERT INTO `sys_oper_log` VALUES (132, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 09:23:58\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'身份标识\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 01:24:53', 10);
INSERT INTO `sys_oper_log` VALUES (133, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 09:23:58\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'身份标识\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 01:25:55', 4);
INSERT INTO `sys_oper_log` VALUES (134, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 09:23:58\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'身份标识\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 01:25:56', 3);
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/query_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:26:28', 2766);
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:26:26\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:26:26\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:26:26\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:28:41', 2640);
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 01:28:48', 266);
INSERT INTO `sys_oper_log` VALUES (138, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"用户身份标识\",\"dictType\":\"housdata_identity_type\",\"params\":{},\"remark\":\"用户身份标识\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:44:18', 450);
INSERT INTO `sys_oper_log` VALUES (139, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"一级用户\",\"dictSort\":1,\"dictType\":\"housdata_identity_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"一级用户\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:48:04', 430);
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"二级用户\",\"dictSort\":2,\"dictType\":\"housdata_identity_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"二级用户\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:48:47', 319);
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"三级用户\",\"dictSort\":3,\"dictType\":\"housdata_identity_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"三级用户\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:49:26', 306);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:28:39\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:28:39\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:28:39\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:49:54', 3179);
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 01:50:40', 279);
INSERT INTO `sys_oper_log` VALUES (144, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":23,\"birthday\":\"2008-06-03\",\"createTime\":\"2024-10-22 14:32:01\",\"id\":5,\"identityType\":\"2\",\"name\":\"111\",\"params\":{},\"remark\":\"哈哈\",\"sex\":\"1\",\"updateTime\":\"2024-10-24 09:51:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:51:35', 211);
INSERT INTO `sys_oper_log` VALUES (145, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-22\",\"createTime\":\"2024-10-22 14:28:36\",\"id\":4,\"identityType\":\"0\",\"name\":\"小花\",\"params\":{},\"remark\":\"呼呼\",\"sex\":\"0\",\"updateTime\":\"2024-10-24 09:52:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:52:07', 236);
INSERT INTO `sys_oper_log` VALUES (146, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2024-10-22\",\"createTime\":\"2024-10-22 12:59:02\",\"id\":3,\"identityType\":\"2\",\"name\":\"camellia\",\"params\":{},\"remark\":\"无误\",\"sex\":\"1\",\"updateTime\":\"2024-10-24 09:52:14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:52:13', 249);
INSERT INTO `sys_oper_log` VALUES (147, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2002-10-22\",\"id\":1,\"identityType\":\"0\",\"name\":\"哈哈\",\"params\":{},\"remark\":\"11111\",\"sex\":\"1\",\"updateBy\":\"level_1\",\"updateTime\":\"2024-10-24 09:52:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:52:25', 279);
INSERT INTO `sys_oper_log` VALUES (148, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2002-10-22\",\"id\":1,\"identityType\":\"2\",\"name\":\"哈哈\",\"params\":{},\"remark\":\"11111\",\"sex\":\"1\",\"updateBy\":\"level_1\",\"updateTime\":\"2024-10-24 09:52:29\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:52:29', 256);
INSERT INTO `sys_oper_log` VALUES (149, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2002-10-22\",\"id\":1,\"identityType\":\"0\",\"name\":\"哈哈\",\"params\":{},\"remark\":\"11111\",\"sex\":\"1\",\"updateBy\":\"level_1\",\"updateTime\":\"2024-10-24 09:52:34\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:52:33', 246);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:49:52\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:49:52\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:49:52\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:53:22', 2494);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 01:54:11', 174);
INSERT INTO `sys_oper_log` VALUES (152, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-22\",\"createTime\":\"2024-10-22 14:28:36\",\"id\":4,\"identityType\":\"2\",\"name\":\"小花\",\"params\":{},\"remark\":\"呼呼\",\"sex\":\"0\",\"updateTime\":\"2024-10-24 09:54:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:54:52', 197);
INSERT INTO `sys_oper_log` VALUES (153, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-10-24 01:48:46\",\"default\":false,\"dictCode\":101,\"dictLabel\":\"二级用户\",\"dictSort\":2,\"dictType\":\"housdata_identity_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"二级用户\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:55:19', 291);
INSERT INTO `sys_oper_log` VALUES (154, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":23,\"birthday\":\"2008-06-03\",\"createTime\":\"2024-10-22 14:32:01\",\"id\":5,\"identityType\":\"2,1\",\"name\":\"111\",\"params\":{},\"remark\":\"哈哈\",\"sex\":\"1\",\"updateTime\":\"2024-10-24 09:55:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:55:31', 209);
INSERT INTO `sys_oper_log` VALUES (155, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-22\",\"createTime\":\"2024-10-22 14:28:36\",\"id\":4,\"identityType\":\"2,0\",\"name\":\"小花\",\"params\":{},\"remark\":\"呼呼\",\"sex\":\"0\",\"updateTime\":\"2024-10-24 09:55:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:55:35', 202);
INSERT INTO `sys_oper_log` VALUES (156, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2002-10-22\",\"id\":1,\"identityType\":\"0,1\",\"name\":\"哈哈\",\"params\":{},\"remark\":\"11111\",\"sex\":\"1\",\"updateBy\":\"level_1\",\"updateTime\":\"2024-10-24 09:55:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:55:39', 204);
INSERT INTO `sys_oper_log` VALUES (157, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2024-10-22\",\"createTime\":\"2024-10-22 12:59:02\",\"id\":3,\"identityType\":\"\",\"name\":\"camellia\",\"params\":{},\"remark\":\"无误\",\"sex\":\"1\",\"updateTime\":\"2024-10-24 09:59:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 01:59:50', 266);
INSERT INTO `sys_oper_log` VALUES (158, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:00:00', 236);
INSERT INTO `sys_oper_log` VALUES (159, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:00:47', 302);
INSERT INTO `sys_oper_log` VALUES (160, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:01:29', 287);
INSERT INTO `sys_oper_log` VALUES (161, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:01:34', 283);
INSERT INTO `sys_oper_log` VALUES (162, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2013-10-06\",\"createTime\":\"2024-10-24 10:01:47\",\"id\":6,\"identityType\":\"0\",\"name\":\"111\",\"params\":{},\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:01:47', 259);
INSERT INTO `sys_oper_log` VALUES (163, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2011-10-11\",\"createTime\":\"2024-10-24 10:02:12\",\"id\":7,\"identityType\":\"1\",\"name\":\"22\",\"params\":{},\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:02:12', 255);
INSERT INTO `sys_oper_log` VALUES (164, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:03:24', 10637);
INSERT INTO `sys_oper_log` VALUES (165, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/6', '127.0.0.1', '内网IP', '{}', NULL, 1, 'com.baomidou.mybatisplus.core.conditions.query.QueryWrapper cannot be cast to com.ruoyi.housdata.domain.QueryUser', '2024-10-24 02:04:30', 24);
INSERT INTO `sys_oper_log` VALUES (166, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/6', '127.0.0.1', '内网IP', '{}', NULL, 1, 'com.baomidou.mybatisplus.core.conditions.query.QueryWrapper cannot be cast to com.ruoyi.housdata.domain.QueryUser', '2024-10-24 02:04:35', 0);
INSERT INTO `sys_oper_log` VALUES (167, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2013-10-06\",\"createTime\":\"2024-10-24 10:01:48\",\"id\":6,\"identityType\":\"0,1\",\"name\":\"111\",\"params\":{},\"sex\":\"0\",\"updateTime\":\"2024-10-24 10:05:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:05:32', 241);
INSERT INTO `sys_oper_log` VALUES (168, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/6', '127.0.0.1', '内网IP', '{}', NULL, 1, 'com.baomidou.mybatisplus.core.conditions.query.QueryWrapper cannot be cast to com.ruoyi.housdata.domain.QueryUser', '2024-10-24 02:05:35', 0);
INSERT INTO `sys_oper_log` VALUES (169, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2013-10-06\",\"createTime\":\"2024-10-24 10:01:48\",\"id\":6,\"identityType\":\"\",\"name\":\"111\",\"params\":{},\"sex\":\"0\",\"updateTime\":\"2024-10-24 10:05:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:05:41', 220);
INSERT INTO `sys_oper_log` VALUES (170, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/6', '127.0.0.1', '内网IP', '{}', NULL, 1, 'com.baomidou.mybatisplus.core.conditions.query.QueryWrapper cannot be cast to com.ruoyi.housdata.domain.QueryUser', '2024-10-24 02:05:43', 0);
INSERT INTO `sys_oper_log` VALUES (171, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2013-10-06\",\"createTime\":\"2024-10-24 10:01:48\",\"id\":6,\"identityType\":\",0,1,2\",\"name\":\"111\",\"params\":{},\"sex\":\"0\",\"updateTime\":\"2024-10-24 10:07:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:07:10', 312);
INSERT INTO `sys_oper_log` VALUES (172, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/6', '127.0.0.1', '内网IP', '{}', NULL, 1, 'com.baomidou.mybatisplus.core.conditions.query.QueryWrapper cannot be cast to com.ruoyi.housdata.domain.QueryUser', '2024-10-24 02:07:14', 12);
INSERT INTO `sys_oper_log` VALUES (173, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2013-10-06\",\"createTime\":\"2024-10-24 10:01:48\",\"id\":6,\"identityType\":\",0\",\"name\":\"111\",\"params\":{},\"sex\":\"0\",\"updateTime\":\"2024-10-24 10:07:26\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:07:26', 310);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:53:20\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:53:20\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 01:53:20\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:26:33', 2931);
INSERT INTO `sys_oper_log` VALUES (175, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 10:28:36\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_id` bigint NULL DEFAULT NULL COMMENT \'身份标识id\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 02:29:17', 6);
INSERT INTO `sys_oper_log` VALUES (176, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 10:28:36\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_id` bigint NULL DEFAULT NULL COMMENT \'身份标识id\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 02:29:19', 5);
INSERT INTO `sys_oper_log` VALUES (177, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 10:28:36\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_id` bigint NULL DEFAULT NULL COMMENT \'身份标识id\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 02:29:20', 4);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/query_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:29:28', 3141);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/query_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:29:39', 3162);
INSERT INTO `sys_oper_log` VALUES (180, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 10:28:36\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_id` bigint NULL DEFAULT NULL COMMENT \'身份标识id\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 02:29:43', 4);
INSERT INTO `sys_oper_log` VALUES (181, '创建表', 0, 'com.ruoyi.generator.controller.GenController.createTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/createTable', '127.0.0.1', '内网IP', '{\"sql\":\"/*\\n Navicat Premium Dump SQL\\n\\n Source Server         : 【新加坡】-MySQL8\\n Source Server Type    : MySQL\\n Source Server Version : 80403 (8.4.3)\\n Source Host           : 101.32.244.148:3306\\n Source Schema         : ry-vue\\n\\n Target Server Type    : MySQL\\n Target Server Version : 80403 (8.4.3)\\n File Encoding         : 65001\\n\\n Date: 24/10/2024 10:28:36\\n*/\\n\\nSET NAMES utf8mb4;\\nSET FOREIGN_KEY_CHECKS = 0;\\n\\n-- ----------------------------\\n-- Table structure for query_user\\n-- ----------------------------\\nDROP TABLE IF EXISTS `query_user`;\\nCREATE TABLE `query_user`  (\\n  `id` int NOT NULL AUTO_INCREMENT COMMENT \'主键\',\\n  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'姓名\',\\n  `age` int NULL DEFAULT NULL COMMENT \'年龄\',\\n  `birthday` date NULL DEFAULT NULL COMMENT \'生日\',\\n  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'性别\',\\n  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'创建者\',\\n  `create_time` datetime NULL DEFAULT NULL COMMENT \'创建时间\',\\n  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新者\',\\n  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'更新时间\',\\n  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT \'备注\',\\n  `identity_id` bigint NULL DEFAULT NULL COMMENT \'身份标识id\',\\n  PRIMARY KEY (`id` DESC) USING BTREE\\n) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;\\n\\nSET FOREIGN_KEY_CHECKS = 1;\\n\"}', '{\"msg\":\"创建表结构异常\",\"code\":500}', 0, NULL, '2024-10-24 02:29:44', 2);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/query_user', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:29:50', 2888);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:29:47\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:29:47\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:29:47\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:30:25', 2912);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:30:29', 356);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:30:42', 216);
INSERT INTO `sys_oper_log` VALUES (186, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2024-10-06\",\"createTime\":\"2024-10-24 10:34:13\",\"name\":\"11\",\"params\":{},\"remark\":\"11\",\"sex\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\QueryUserMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.QueryUserMapper.insertQueryUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into query_user          ( name,             age,             birthday,             sex,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 02:34:13', 307);
INSERT INTO `sys_oper_log` VALUES (187, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":21,\"birthday\":\"2024-10-07\",\"createTime\":\"2024-10-24 10:43:32\",\"name\":\"11\",\"params\":{},\"remark\":\"。。。。。\",\"sex\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\QueryUserMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.QueryUserMapper.insertQueryUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into query_user          ( name,             age,             birthday,             sex,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 02:43:32', 235);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:44:30', 216);
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:44:43', 213);
INSERT INTO `sys_oper_log` VALUES (190, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:44:51', 194);
INSERT INTO `sys_oper_log` VALUES (191, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2024-09-29\",\"createTime\":\"2024-10-24 10:51:11\",\"name\":\"11\",\"params\":{},\"remark\":\"11\",\"sex\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\QueryUserMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.QueryUserMapper.insertQueryUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into query_user          ( name,             age,             birthday,             sex,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 02:51:11', 300);
INSERT INTO `sys_oper_log` VALUES (192, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":11,\"birthday\":\"2024-09-29\",\"createTime\":\"2024-10-24 10:51:15\",\"id\":8,\"identityId\":11,\"name\":\"11\",\"params\":{},\"remark\":\"11\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:51:15', 240);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"QueryUser\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:45\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:30:22\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"姓名\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:30:23\",\"usableColumn\":false},{\"capJavaField\":\"Age\",\"columnComment\":\"年龄\",\"columnId\":3,\"columnName\":\"age\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"age\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 02:30:23\",\"usableColumn\":false},{\"capJavaField\":\"Birthday\",\"columnComment\":\"生日\",\"columnId\":4,\"columnName\":\"birthday\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2024-10-23 01:38:47\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 02:55:20', 2928);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 02:55:56', 369);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 03:05:15', 2747);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"identity\",\"className\":\"HousdataIdentity\",\"columns\":[{\"capJavaField\":\"IdentityId\",\"columnComment\":\"身份主键\",\"columnId\":13,\"columnName\":\"identity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdentityName\",\"columnComment\":\"身份名称\",\"columnId\":14,\"columnName\":\"identity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"IdentityType\",\"columnComment\":\"身份标识\",\"columnId\":15,\"columnName\":\"identity_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":16,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 03:07:15', 2454);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 03:07:20', 220);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"users\",\"className\":\"HousdataIdentity\",\"columns\":[{\"capJavaField\":\"IdentityId\",\"columnComment\":\"身份主键\",\"columnId\":13,\"columnName\":\"identity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:07:13\",\"usableColumn\":false},{\"capJavaField\":\"IdentityName\",\"columnComment\":\"身份名称\",\"columnId\":14,\"columnName\":\"identity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:07:13\",\"usableColumn\":false},{\"capJavaField\":\"IdentityType\",\"columnComment\":\"身份标识\",\"columnId\":15,\"columnName\":\"identity_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:07:14\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":16,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 03:19:32', 2647);
INSERT INTO `sys_oper_log` VALUES (199, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 03:20:27', 277);
INSERT INTO `sys_oper_log` VALUES (200, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"type\",\"className\":\"HousdataIdentity\",\"columns\":[{\"capJavaField\":\"IdentityId\",\"columnComment\":\"身份主键\",\"columnId\":13,\"columnName\":\"identity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:19:29\",\"usableColumn\":false},{\"capJavaField\":\"IdentityName\",\"columnComment\":\"身份名称\",\"columnId\":14,\"columnName\":\"identity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:19:30\",\"usableColumn\":false},{\"capJavaField\":\"IdentityType\",\"columnComment\":\"身份标识\",\"columnId\":15,\"columnName\":\"identity_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:19:30\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":16,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 03:22:20', 2261);
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 03:22:32', 210);
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 03:24:27', 207);
INSERT INTO `sys_oper_log` VALUES (203, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 05:49:19', 411);
INSERT INTO `sys_oper_log` VALUES (204, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":12,\"birthday\":\"2024-10-06\",\"createTime\":\"2024-10-24 13:54:43\",\"name\":\"12\",\"params\":{},\"remark\":\"22\",\"sex\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\QueryUserMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.QueryUserMapper.insertQueryUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into query_user          ( name,             age,             birthday,             sex,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 05:54:42', 292);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"datas\",\"className\":\"HousdataIdentity\",\"columns\":[{\"capJavaField\":\"IdentityId\",\"columnComment\":\"身份主键\",\"columnId\":13,\"columnName\":\"identity_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:22:18\",\"usableColumn\":false},{\"capJavaField\":\"IdentityName\",\"columnComment\":\"身份名称\",\"columnId\":14,\"columnName\":\"identity_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:22:18\",\"usableColumn\":false},{\"capJavaField\":\"IdentityType\",\"columnComment\":\"身份标识\",\"columnId\":15,\"columnName\":\"identity_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"identityType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-10-24 03:22:19\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":16,\"columnName\":\"create_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-10-24 03:05:13\",\"dictType\":\"\",\"edit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:00:45', 2202);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 06:01:15', 187);
INSERT INTO `sys_oper_log` VALUES (207, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/housdata_identity', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:01:15', 2112);
INSERT INTO `sys_oper_log` VALUES (208, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:04:55', 225);
INSERT INTO `sys_oper_log` VALUES (209, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:04:57', 213);
INSERT INTO `sys_oper_log` VALUES (210, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:04:59', 218);
INSERT INTO `sys_oper_log` VALUES (211, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"hahha\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:05:34', 217);
INSERT INTO `sys_oper_log` VALUES (212, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-08\",\"createTime\":\"2024-10-24 14:06:05\",\"id\":9,\"identityId\":22,\"name\":\"22\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:06:09', 2837);
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"query_user\"}', NULL, 0, NULL, '2024-10-24 06:24:31', 233);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/housdata_identity', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 06:27:35', 2270);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 06:27:47', 192);
INSERT INTO `sys_oper_log` VALUES (216, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:30:03\",\"identityName\":\"二级用户\",\"identityType\":\"level_2\",\"params\":{},\"remark\":\"haha\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:30:03', 483);
INSERT INTO `sys_oper_log` VALUES (217, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:33:13\",\"identityName\":\"二级用户\",\"identityType\":\"level_2\",\"params\":{},\"remark\":\"haha\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:33:14', 151102);
INSERT INTO `sys_oper_log` VALUES (218, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"identityId\":9,\"identityName\":\"eee\",\"identityType\":\"www\",\"params\":{},\"remark\":\"ss\",\"updateTime\":\"2024-10-24 15:33:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:33:39', 453);
INSERT INTO `sys_oper_log` VALUES (219, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"identityId\":9,\"identityName\":\"qq\",\"identityType\":\"qq\",\"params\":{},\"remark\":\"qq\",\"updateTime\":\"2024-10-24 15:33:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:33:51', 648);
INSERT INTO `sys_oper_log` VALUES (220, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"identityId\":9,\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\",\"updateTime\":\"2024-10-24 15:34:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:34:00', 488);
INSERT INTO `sys_oper_log` VALUES (221, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:35:23\",\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:35:23', 65676);
INSERT INTO `sys_oper_log` VALUES (222, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"identityId\":9,\"identityName\":\"qq\",\"identityType\":\"qq\",\"params\":{},\"remark\":\"qq\",\"updateTime\":\"2024-10-24 15:38:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:38:02', 540);
INSERT INTO `sys_oper_log` VALUES (223, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:39:48\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:39:48', 10392);
INSERT INTO `sys_oper_log` VALUES (224, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:40:06\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:40:06', 4888);
INSERT INTO `sys_oper_log` VALUES (225, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:40:23\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:40:23', 13322);
INSERT INTO `sys_oper_log` VALUES (226, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:40:29\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:40:29', 467);
INSERT INTO `sys_oper_log` VALUES (227, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:41:05\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:41:05', 623);
INSERT INTO `sys_oper_log` VALUES (228, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:42:33\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:42:33', 39245);
INSERT INTO `sys_oper_log` VALUES (229, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:43:21\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:43:45', 31225);
INSERT INTO `sys_oper_log` VALUES (230, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:48:10\",\"identityId\":9,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.insertHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into housdata_identity          ( identity_name,             identity_type,                          create_time,                                       remark )           values ( ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 07:48:11', 213785);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/housdata_identity', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:48:28', 2164);
INSERT INTO `sys_oper_log` VALUES (232, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/housdata_identity', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:48:31', 2157);
INSERT INTO `sys_oper_log` VALUES (233, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"housdata_identity\"}', NULL, 0, NULL, '2024-10-24 07:48:33', 329);
INSERT INTO `sys_oper_log` VALUES (234, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:52:22\",\"identityId\":11,\"identityName\":\"aa\",\"identityType\":\"aa\",\"params\":{},\"remark\":\"aa\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:52:22', 3231);
INSERT INTO `sys_oper_log` VALUES (235, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:56:34\",\"identityId\":12,\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:56:34', 5962);
INSERT INTO `sys_oper_log` VALUES (236, '用户身份标识', 1, 'com.ruoyi.housdata.controller.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:57:59\",\"identityId\":13,\"identityName\":\"111\",\"identityType\":\"111\",\"params\":{},\"remark\":\"111\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 07:57:58', 237);
INSERT INTO `sys_oper_log` VALUES (237, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:12:25\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.updateHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update housdata_identity          SET id = ?,             identity_name = ?,             identity_type = ?,                          create_time = ?,                          update_time = ?,             remark = ?          where identity_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\n; Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'', '2024-10-24 08:12:25', 320);
INSERT INTO `sys_oper_log` VALUES (238, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:12:25\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.updateHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update housdata_identity          SET id = ?,             identity_name = ?,             identity_type = ?,                          create_time = ?,                          update_time = ?,             remark = ?          where identity_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\n; Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'', '2024-10-24 08:12:25', 21853);
INSERT INTO `sys_oper_log` VALUES (239, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:12:28\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.updateHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update housdata_identity          SET id = ?,             identity_name = ?,             identity_type = ?,                          create_time = ?,                          update_time = ?,             remark = ?          where identity_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\n; Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'', '2024-10-24 08:12:28', 231);
INSERT INTO `sys_oper_log` VALUES (240, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:12:54\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.updateHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update housdata_identity          SET id = ?,             identity_name = ?,             identity_type = ?,                          create_time = ?,                          update_time = ?,             remark = ?          where identity_id = ?\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'\n; Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'10\' for key \'housdata_identity.PRIMARY\'', '2024-10-24 08:13:34', 58422);
INSERT INTO `sys_oper_log` VALUES (241, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:14:10\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'Id\' in \'class com.ruoyi.housdata.domain.HousdataIdentity\'', '2024-10-24 08:14:09', 5552);
INSERT INTO `sys_oper_log` VALUES (242, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:14:14\"}', NULL, 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'Id\' in \'class com.ruoyi.housdata.domain.HousdataIdentity\'', '2024-10-24 08:14:14', 2);
INSERT INTO `sys_oper_log` VALUES (243, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:16:43\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'9,\n            identity_name = \'一级用户\',\n            identity_type = \'leve\' at line 2\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\HousdataIdentityMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.HousdataIdentityMapper.updateHousdataIdentity-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update housdata_identity          SET ?,             identity_name = ?,             identity_type = ?,                          create_time = ?,                          update_time = ?,             remark = ?          where id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'9,\n            identity_name = \'一级用户\',\n            identity_type = \'leve\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'9,\n            identity_name = \'一级用户\',\n            identity_type = \'leve\' at line 2', '2024-10-24 08:16:43', 301);
INSERT INTO `sys_oper_log` VALUES (244, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 14:05:34\",\"id\":10,\"identityId\":9,\"identityName\":\"一级用户\",\"identityType\":\"leve_1\",\"params\":{},\"remark\":\"一级用户标签\",\"updateTime\":\"2024-10-24 16:17:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:17:42', 264);
INSERT INTO `sys_oper_log` VALUES (245, '用户身份标识', 2, 'com.ruoyi.housdata.controller.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 15:57:59\",\"id\":13,\"identityId\":9,\"identityName\":\"二级用户\",\"identityType\":\"leve_2\",\"params\":{},\"remark\":\"二级用户标签\",\"updateTime\":\"2024-10-24 16:18:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:18:10', 202);
INSERT INTO `sys_oper_log` VALUES (246, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-10-24 08:25:35', 21447);
INSERT INTO `sys_oper_log` VALUES (247, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-10-24 08:25:47', 210);
INSERT INTO `sys_oper_log` VALUES (248, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-10-24 08:28:37', 151305);
INSERT INTO `sys_oper_log` VALUES (249, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.housdata.mapper.HousdataIdentityMapper.deleteHousdataIdentityByIdentityIds', '2024-10-24 08:29:11', 3901);
INSERT INTO `sys_oper_log` VALUES (250, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.housdata.mapper.HousdataIdentityMapper.deleteHousdataIdentityByIdentityIds', '2024-10-24 08:29:25', 4440);
INSERT INTO `sys_oper_log` VALUES (251, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.housdata.mapper.HousdataIdentityMapper.deleteHousdataIdentityByIdentityIds', '2024-10-24 08:31:32', 8);
INSERT INTO `sys_oper_log` VALUES (252, '用户身份标识', 3, 'com.ruoyi.housdata.controller.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.housdata.mapper.HousdataIdentityMapper.deleteHousdataIdentityByIdentityIds', '2024-10-24 08:31:45', 1);
INSERT INTO `sys_oper_log` VALUES (253, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:34:12', 233);
INSERT INTO `sys_oper_log` VALUES (254, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:40:54', 360106);
INSERT INTO `sys_oper_log` VALUES (255, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2024-10-24 08:43:36', 121376);
INSERT INTO `sys_oper_log` VALUES (256, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-14\",\"createTime\":\"2024-10-24 16:44:25\",\"name\":\"22\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\r\n### The error may exist in file [E:\\workspace\\camellia\\RuoYi-Vue\\ruoyi-housdata\\target\\classes\\mapper\\housdata\\QueryUserMapper.xml]\r\n### The error may involve com.ruoyi.housdata.mapper.QueryUserMapper.insertQueryUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into query_user          ( name,             age,             birthday,             sex,                          create_time,                                       remark )           values ( ?,             ?,             ?,             ?,                          ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value\n; Field \'identity_id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'identity_id\' doesn\'t have a default value', '2024-10-24 08:44:25', 278);
INSERT INTO `sys_oper_log` VALUES (257, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-14\",\"createTime\":\"2024-10-24 16:44:27\",\"id\":10,\"identityId\":22,\"name\":\"22\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:44:27', 217);
INSERT INTO `sys_oper_log` VALUES (258, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:44:43\",\"identityId\":14,\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:44:43', 3439);
INSERT INTO `sys_oper_log` VALUES (259, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:44:55', 2309);
INSERT INTO `sys_oper_log` VALUES (260, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:45:02', 0);
INSERT INTO `sys_oper_log` VALUES (261, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:45:14', 320);
INSERT INTO `sys_oper_log` VALUES (262, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:45:18', 1);
INSERT INTO `sys_oper_log` VALUES (263, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:45:22', 1);
INSERT INTO `sys_oper_log` VALUES (264, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:45:28', 0);
INSERT INTO `sys_oper_log` VALUES (265, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:46:14', 1);
INSERT INTO `sys_oper_log` VALUES (266, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:46:42', 1);
INSERT INTO `sys_oper_log` VALUES (267, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:47:17', 24249);
INSERT INTO `sys_oper_log` VALUES (268, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:48:33', 70595);
INSERT INTO `sys_oper_log` VALUES (269, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'identityId\' not found. Available parameters are [Id, param1]', '2024-10-24 08:50:51', 130582);
INSERT INTO `sys_oper_log` VALUES (270, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'id\' not found. Available parameters are [Id, param1]', '2024-10-24 08:52:40', 3192);
INSERT INTO `sys_oper_log` VALUES (271, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'id\' not found. Available parameters are [Id, param1]', '2024-10-24 08:52:45', 1);
INSERT INTO `sys_oper_log` VALUES (272, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', NULL, 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'id\' not found. Available parameters are [Id, param1]', '2024-10-24 08:54:13', 13);
INSERT INTO `sys_oper_log` VALUES (273, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:55:39', 341);
INSERT INTO `sys_oper_log` VALUES (274, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-08\",\"createTime\":\"2024-10-24 16:55:53\",\"id\":11,\"identityId\":11,\"name\":\"came\",\"params\":{},\"remark\":\"11\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:55:53', 238);
INSERT INTO `sys_oper_log` VALUES (275, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:56:02\",\"identityId\":15,\"identityName\":\"222\",\"identityType\":\"222\",\"params\":{},\"remark\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:56:02', 228);
INSERT INTO `sys_oper_log` VALUES (276, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/11', '127.0.0.1', '内网IP', '{}', NULL, 1, '该用户已关联身份，无法删除', '2024-10-24 08:56:06', 143);
INSERT INTO `sys_oper_log` VALUES (277, '用户身份标识', 3, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/datas/15', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:56:12', 204);
INSERT INTO `sys_oper_log` VALUES (278, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:56:16', 318);
INSERT INTO `sys_oper_log` VALUES (279, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-01\",\"createTime\":\"2024-10-24 16:56:50\",\"id\":12,\"identityId\":11,\"name\":\"came\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:56:50', 282);
INSERT INTO `sys_oper_log` VALUES (280, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:57:17\",\"identityId\":16,\"identityName\":\"22\",\"identityType\":\"22\",\"params\":{},\"remark\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:57:16', 220);
INSERT INTO `sys_oper_log` VALUES (281, '用户身份标识', 2, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:57:17\",\"id\":16,\"identityId\":12,\"identityName\":\"44\",\"identityType\":\"44\",\"params\":{},\"remark\":\"44\",\"updateTime\":\"2024-10-24 16:57:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:57:39', 3545);
INSERT INTO `sys_oper_log` VALUES (282, '用户身份标识', 2, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:57:17\",\"id\":16,\"identityId\":12,\"identityName\":\"88\",\"identityType\":\"88\",\"params\":{},\"remark\":\"88\",\"updateTime\":\"2024-10-24 16:57:47\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:57:47', 239);
INSERT INTO `sys_oper_log` VALUES (283, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:57:52\",\"identityId\":17,\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:57:52', 224);
INSERT INTO `sys_oper_log` VALUES (284, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:58:00\",\"identityId\":18,\"identityName\":\"55\",\"identityType\":\"55\",\"params\":{},\"remark\":\"55\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:58:00', 221);
INSERT INTO `sys_oper_log` VALUES (285, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/12', '127.0.0.1', '内网IP', '{}', NULL, 1, '该用户已关联身份，无法删除', '2024-10-24 08:58:21', 115);
INSERT INTO `sys_oper_log` VALUES (286, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 08:58:33', 320);
INSERT INTO `sys_oper_log` VALUES (287, '信息查询', 1, 'com.ruoyi.web.controller.housdata.QueryUserController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2024-10-14\",\"createTime\":\"2024-10-24 17:02:09\",\"id\":13,\"identityId\":11,\"name\":\"qq\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 09:02:08', 232);
INSERT INTO `sys_oper_log` VALUES (288, '用户身份标识', 1, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.add()', 'POST', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 17:02:19\",\"identityId\":19,\"identityName\":\"11\",\"identityType\":\"11\",\"params\":{},\"remark\":\"11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 09:02:19', 305);
INSERT INTO `sys_oper_log` VALUES (289, '信息查询', 3, 'com.ruoyi.web.controller.housdata.QueryUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/housdata/users/13,12', '127.0.0.1', '内网IP', '{}', NULL, 1, '该用户已关联身份，无法删除', '2024-10-24 09:02:28', 116);
INSERT INTO `sys_oper_log` VALUES (290, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":32,\"birthday\":\"1998-10-05\",\"createTime\":\"2024-10-24 17:02:09\",\"id\":13,\"identityId\":11,\"name\":\"曹正\",\"params\":{},\"remark\":\"\",\"sex\":\"0\",\"updateTime\":\"2024-10-24 21:08:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:08:32', 234);
INSERT INTO `sys_oper_log` VALUES (291, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":22,\"birthday\":\"2011-10-03\",\"createTime\":\"2024-10-24 16:56:51\",\"id\":12,\"identityId\":11,\"name\":\"小蕊\",\"params\":{},\"remark\":\"22\",\"sex\":\"1\",\"updateTime\":\"2024-10-24 21:09:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:09:36', 190);
INSERT INTO `sys_oper_log` VALUES (292, '用户身份标识', 2, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 16:57:17\",\"id\":16,\"identityId\":12,\"identityName\":\"88\",\"identityType\":\"88\",\"params\":{},\"remark\":\"88\",\"updateTime\":\"2024-10-24 21:12:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:12:50', 297);
INSERT INTO `sys_oper_log` VALUES (293, '用户身份标识', 2, 'com.ruoyi.web.controller.housdata.HousdataIdentityController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/datas', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-10-24 17:02:20\",\"id\":19,\"identityId\":13,\"identityName\":\"科员\",\"identityType\":\"level_12\",\"params\":{},\"remark\":\"一级科员\",\"updateTime\":\"2024-10-24 21:24:57\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:24:57', 238);
INSERT INTO `sys_oper_log` VALUES (294, '信息查询', 2, 'com.ruoyi.web.controller.housdata.QueryUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/housdata/users', '127.0.0.1', '内网IP', '{\"age\":32,\"birthday\":\"1998-10-05\",\"createTime\":\"2024-10-24 17:02:09\",\"id\":13,\"identityId\":11,\"name\":\"曹正\",\"params\":{},\"remark\":\"科员\",\"sex\":\"0\",\"updateTime\":\"2024-10-24 21:25:16\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-10-24 13:25:16', 243);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-10-23 01:36:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-10-23 01:36:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-10-23 01:36:46', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 0, 1, '0', '0', 'admin', '2024-10-23 01:36:46', 'admin', '2024-10-23 02:29:06', '普通角色');
INSERT INTO `sys_role` VALUES (100, 'level_1', 'housdata:level1', 3, '1', 1, 1, '0', '0', 'admin', '2024-10-23 02:12:21', 'admin', '2024-10-23 02:12:58', NULL);
INSERT INTO `sys_role` VALUES (101, 'level_2', 'housdata:level2', 4, '1', 1, 1, '0', '0', 'admin', '2024-10-23 02:14:13', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 3);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 105);
INSERT INTO `sys_role_menu` VALUES (100, 106);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 108);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 111);
INSERT INTO `sys_role_menu` VALUES (100, 112);
INSERT INTO `sys_role_menu` VALUES (100, 113);
INSERT INTO `sys_role_menu` VALUES (100, 114);
INSERT INTO `sys_role_menu` VALUES (100, 115);
INSERT INTO `sys_role_menu` VALUES (100, 116);
INSERT INTO `sys_role_menu` VALUES (100, 117);
INSERT INTO `sys_role_menu` VALUES (100, 500);
INSERT INTO `sys_role_menu` VALUES (100, 501);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1025);
INSERT INTO `sys_role_menu` VALUES (100, 1026);
INSERT INTO `sys_role_menu` VALUES (100, 1027);
INSERT INTO `sys_role_menu` VALUES (100, 1028);
INSERT INTO `sys_role_menu` VALUES (100, 1029);
INSERT INTO `sys_role_menu` VALUES (100, 1030);
INSERT INTO `sys_role_menu` VALUES (100, 1031);
INSERT INTO `sys_role_menu` VALUES (100, 1032);
INSERT INTO `sys_role_menu` VALUES (100, 1033);
INSERT INTO `sys_role_menu` VALUES (100, 1034);
INSERT INTO `sys_role_menu` VALUES (100, 1035);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 1040);
INSERT INTO `sys_role_menu` VALUES (100, 1041);
INSERT INTO `sys_role_menu` VALUES (100, 1042);
INSERT INTO `sys_role_menu` VALUES (100, 1043);
INSERT INTO `sys_role_menu` VALUES (100, 1044);
INSERT INTO `sys_role_menu` VALUES (100, 1045);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 1055);
INSERT INTO `sys_role_menu` VALUES (100, 1056);
INSERT INTO `sys_role_menu` VALUES (100, 1057);
INSERT INTO `sys_role_menu` VALUES (100, 1058);
INSERT INTO `sys_role_menu` VALUES (100, 1059);
INSERT INTO `sys_role_menu` VALUES (100, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 114);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1000);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (101, 2000);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2005);
INSERT INTO `sys_role_menu` VALUES (101, 2006);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2024-10-24 20:52:53', 'admin', '2024-10-23 01:36:46', '', '2024-10-24 12:52:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$ZXGu3k349VmRQPzyEyOHYuv66tBi1hgzUEg3JaP/jBk0u1l9eI7EW', '0', '0', '127.0.0.1', '2024-10-23 10:29:23', 'admin', '2024-10-23 01:36:46', 'admin', '2024-10-23 02:29:23', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'camellia', 'camellia', '00', '111@gmail.com', '17375256526', '0', '', '$2a$10$a..NZxhZdz6DbGSaSTDJGOZHam3butC8bRgxLnDlSo/7aCZd3sWy6', '0', '2', '127.0.0.1', '2024-10-23 10:15:58', 'admin', '2024-10-23 02:15:26', 'admin', '2024-10-23 03:42:52', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
