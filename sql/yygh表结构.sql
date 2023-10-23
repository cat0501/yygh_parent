# Host: localhost  (Version 5.7.19-log)
# Date: 2020-07-31 12:02:29
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Database "yygh_cmn"
#

CREATE DATABASE IF NOT EXISTS `yygh_cmn` CHARACTER SET utf8;
USE `yygh_cmn`;

#
# Structure for table "dict"
#

CREATE TABLE `dict` (
  `id` bigint(20) NOT NULL DEFAULT '0' COMMENT 'id',
  `parent_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '上级id',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `value` bigint(20) DEFAULT NULL COMMENT '值',
  `dict_code` varchar(20) DEFAULT NULL COMMENT '编码',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '1' COMMENT '删除标记（0:不可用 1:可用）',
  PRIMARY KEY (`id`),
  KEY `idx_dict_code` (`dict_code`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织架构表';

#
# Database "yygh_hosp"
#

CREATE DATABASE IF NOT EXISTS `yygh_hosp` CHARACTER SET utf8mb4;
USE `yygh_hosp`;

#
# Structure for table "hospital_set"
#

CREATE TABLE `hospital_set` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `hosname` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
  `api_url` varchar(100) DEFAULT NULL COMMENT 'api基础路径',
  `sign_key` varchar(50) DEFAULT NULL COMMENT '签名秘钥',
  `contacts_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `contacts_phone` varchar(11) DEFAULT NULL COMMENT '联系人手机',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_hoscode` (`hoscode`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='医院设置表';

--
-- Dumping data for table `hospital_set`
--

LOCK TABLES `hospital_set` WRITE;
/*!40000 ALTER TABLE `hospital_set` DISABLE KEYS */;
INSERT INTO `hospital_set` VALUES (1,'北京协和医院','123456789','http://localhost:8201','ba27058f8dcbf42c1523b4b7881a1c07','不知道叫什么','15115447254',1,'2021-08-20 08:07:43','2021-08-24 07:55:08',0),(3,'陆丰市人民医院','123456222','http://localhost:8888',NULL,'不知道叫什么','15477785658',1,'2021-08-21 14:58:09','2021-08-22 07:15:08',0),(4,'上海人民医院','123456666','http://localhost:8555',NULL,'不知道叫什么','18554456484',1,'2021-08-21 14:58:46','2021-08-22 07:15:15',0),(5,'中山协和医院','123546486','http://localhost:8844',NULL,'不知道叫什么','15477785658',1,'2021-08-21 14:59:14','2021-08-22 07:15:10',0),(6,'东海高级医院','788888888','http://jiaxianniubi.com','a100b98afd6afa687c760f6f6af5ef5f','张天纯','14744684861',1,'2021-08-22 08:57:39','2021-08-22 08:57:39',0),(7,'1111','111','111','ba27058f8dcbf42c1523b4b6629a1c07','11','11',1,'2021-08-22 08:58:53','2021-08-22 08:58:53',0),(8,'11353','353','3543','42f9d93d44e46f44a8c451ca0ffb3693','5345','5435',1,'2021-08-22 08:59:49','2021-08-22 08:59:49',0),(9,'535433','53453453','543543','86077eb5c6b4963c73d4320f9d3c96ba','5435345','3453534',1,'2021-08-22 09:04:25','2021-08-22 09:04:25',0),(10,'0000','00','00','458616ff6386801c36c9e57e75061d4a','00','00',1,'2021-08-22 10:13:57','2021-08-22 10:13:57',0);
/*!40000 ALTER TABLE `hospital_set` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-08 16:00:22





#
# Database "yygh_order"
#

CREATE DATABASE IF NOT EXISTS `yygh_order` CHARACTER SET utf8;
USE `yygh_order`;

#
# Structure for table "order_info"
#

CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL,
  `out_trade_no` varchar(300) DEFAULT NULL COMMENT '订单交易号',
  `hoscode` varchar(30) DEFAULT NULL COMMENT '医院编号',
  `hosname` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `depcode` varchar(30) DEFAULT NULL COMMENT '科室编号',
  `depname` varchar(20) DEFAULT NULL COMMENT '科室名称',
  `title` varchar(20) DEFAULT NULL COMMENT '医生职称',
  `hos_schedule_id` varchar(50) DEFAULT NULL COMMENT '排班编号（医院自己的排班主键）',
  `reserve_date` date DEFAULT NULL COMMENT '安排日期',
  `reserve_time` tinyint(3) DEFAULT '0' COMMENT '安排时间（0：上午 1：下午）',
  `patient_id` bigint(20) DEFAULT NULL COMMENT '就诊人id',
  `patient_name` varchar(20) DEFAULT NULL COMMENT '就诊人名称',
  `patient_phone` varchar(11) DEFAULT NULL COMMENT '就诊人手机',
  `hos_record_id` varchar(30) DEFAULT NULL COMMENT '预约记录唯一标识（医院预约记录主键）',
  `number` int(11) DEFAULT NULL COMMENT '预约号序',
  `fetch_time` varchar(50) DEFAULT NULL COMMENT '建议取号时间',
  `fetch_address` varchar(255) DEFAULT NULL COMMENT '取号地点',
  `amount` decimal(10,0) DEFAULT NULL COMMENT '医事服务费',
  `quit_time` datetime DEFAULT NULL COMMENT '退号时间',
  `order_status` tinyint(3) DEFAULT NULL COMMENT '订单状态',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_out_trade_no` (`out_trade_no`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_hoscode` (`hoscode`),
  KEY `idx_hos_schedule_id` (`hos_schedule_id`),
  KEY `idx_hos_record_id` (`hos_record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='订单表';

#
# Structure for table "payment_info"
#

CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(30) DEFAULT NULL COMMENT '对外业务编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `payment_type` tinyint(1) DEFAULT NULL COMMENT '支付类型（微信 支付宝）',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易编号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `subject` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `payment_status` tinyint(3) DEFAULT NULL COMMENT '支付状态',
  `callback_time` datetime DEFAULT NULL COMMENT '回调时间',
  `callback_content` varchar(1000) DEFAULT NULL COMMENT '回调信息',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  KEY `idx_out_trade_no` (`out_trade_no`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='支付信息表';

#
# Structure for table "refund_info"
#

CREATE TABLE `refund_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `out_trade_no` varchar(50) DEFAULT NULL COMMENT '对外业务编号',
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单编号',
  `payment_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（微信 支付宝）',
  `trade_no` varchar(50) DEFAULT NULL COMMENT '交易编号',
  `total_amount` decimal(10,2) DEFAULT NULL COMMENT '退款金额',
  `subject` varchar(200) DEFAULT NULL COMMENT '交易内容',
  `refund_status` tinyint(3) DEFAULT NULL COMMENT '退款状态',
  `callback_content` varchar(1000) DEFAULT NULL COMMENT '回调信息',
  `callback_time` datetime DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  KEY `idx_out_trade_no` (`out_trade_no`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='退款信息表';

#
# Database "yygh_user"
#

CREATE DATABASE IF NOT EXISTS `yygh_user` CHARACTER SET utf8;
USE `yygh_user`;

#
# Structure for table "patient"
#

CREATE TABLE `patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `certificates_type` varchar(3) DEFAULT NULL COMMENT '证件类型',
  `certificates_no` varchar(30) DEFAULT NULL COMMENT '证件编号',
  `sex` tinyint(3) DEFAULT NULL COMMENT '性别',
  `birthdate` date DEFAULT NULL COMMENT '出生年月',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机',
  `is_marry` tinyint(3) DEFAULT NULL COMMENT '是否结婚',
  `province_code` varchar(20) DEFAULT NULL COMMENT '省code',
  `city_code` varchar(20) DEFAULT NULL COMMENT '市code',
  `district_code` varchar(20) DEFAULT NULL COMMENT '区code',
  `address` varchar(100) DEFAULT NULL COMMENT '详情地址',
  `contacts_name` varchar(20) DEFAULT NULL COMMENT '联系人姓名',
  `contacts_certificates_type` varchar(3) DEFAULT NULL COMMENT '联系人证件类型',
  `contacts_certificates_no` varchar(30) DEFAULT NULL COMMENT '联系人证件号',
  `contacts_phone` varchar(11) DEFAULT NULL COMMENT '联系人手机',
  `card_no` varchar(50) DEFAULT NULL COMMENT '就诊卡号',
  `is_insure` tinyint(3) DEFAULT '0' COMMENT '是否有医保',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '状态（0：默认 1：已认证）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='就诊人表';

#
# Structure for table "user_info"
#

CREATE TABLE `user_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `openid` varchar(100) DEFAULT NULL COMMENT '微信openid',
  `nick_name` varchar(20) DEFAULT NULL COMMENT '昵称',
  `phone` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号',
  `name` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `certificates_type` varchar(3) DEFAULT NULL COMMENT '证件类型',
  `certificates_no` varchar(30) DEFAULT NULL COMMENT '证件编号',
  `certificates_url` varchar(200) DEFAULT NULL COMMENT '证件路径',
  `auth_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '认证状态（0：未认证 1：认证中 2：认证成功 -1：认证失败）',
  `status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '状态（0：锁定 1：正常）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  KEY `uk_mobile` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

#
# Structure for table "user_login_record"
#

CREATE TABLE `user_login_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint(3) NOT NULL DEFAULT '0' COMMENT '逻辑删除(1:已删除，0:未删除)',
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户登录记录表';
