DROP TABLE IF EXISTS `storage_tbl`;
CREATE TABLE `storage_tbl` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `commodity_code` varchar(255) DEFAULT NULL,
                               `count` int(11) DEFAULT 0,
                               PRIMARY KEY (`id`),
                               UNIQUE KEY (`commodity_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `order_tbl`;
CREATE TABLE `order_tbl` (
                             `id` int(11) NOT NULL AUTO_INCREMENT,
                             `user_id` varchar(255) DEFAULT NULL,
                             `commodity_code` varchar(255) DEFAULT NULL,
                             `count` int(11) DEFAULT 0,
                             `money` int(11) DEFAULT 0,
                             PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `account_tbl`;
CREATE TABLE `account_tbl` (
                               `id` int(11) NOT NULL AUTO_INCREMENT,
                               `user_id` varchar(255) DEFAULT NULL,
                               `money` int(11) DEFAULT 0,
                               PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `branch_table`;
CREATE TABLE `branch_table` (
                                `branch_id` bigint(20) NOT NULL,
                                `xid` varchar(128) NOT NULL,
                                `transaction_id` bigint(20) DEFAULT NULL,
                                `resource_group_id` varchar(32) DEFAULT NULL,
                                `resource_id` varchar(256) DEFAULT NULL,
                                `branch_type` varchar(8) DEFAULT NULL,
                                `status` tinyint(4) DEFAULT NULL,
                                `client_id` varchar(64) DEFAULT NULL,
                                `application_data` varchar(2000) DEFAULT NULL,
                                `gmt_create` datetime(6) DEFAULT NULL,
                                `gmt_modified` datetime(6) DEFAULT NULL,
                                PRIMARY KEY (`branch_id`),
                                KEY `idx_xid` (`xid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `global_table`;
CREATE TABLE `global_table` (
                                `xid` varchar(128) NOT NULL,
                                `transaction_id` bigint(20) DEFAULT NULL,
                                `status` tinyint(4) NOT NULL,
                                `application_id` varchar(32) DEFAULT NULL,
                                `transaction_service_group` varchar(32) DEFAULT NULL,
                                `transaction_name` varchar(128) DEFAULT NULL,
                                `timeout` int(11) DEFAULT NULL,
                                `begin_time` bigint(20) DEFAULT NULL,
                                `application_data` varchar(2000) DEFAULT NULL,
                                `gmt_create` datetime DEFAULT NULL,
                                `gmt_modified` datetime DEFAULT NULL,
                                PRIMARY KEY (`xid`),
                                KEY `idx_gmt_modified_status` (`gmt_modified`,`status`),
                                KEY `idx_transaction_id` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `lock_table`;
CREATE TABLE `lock_table` (
                              `row_key` varchar(128) NOT NULL,
                              `xid` varchar(96) DEFAULT NULL,
                              `transaction_id` bigint(20) DEFAULT NULL,
                              `branch_id` bigint(20) NOT NULL,
                              `resource_id` varchar(256) DEFAULT NULL,
                              `table_name` varchar(32) DEFAULT NULL,
                              `pk` varchar(36) DEFAULT NULL,
                              `gmt_create` datetime DEFAULT NULL,
                              `gmt_modified` datetime DEFAULT NULL,
                              PRIMARY KEY (`row_key`),
                              KEY `idx_branch_id` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;