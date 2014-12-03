CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ctime` datetime NOT NULL,
  `text` varchar(45) NOT NULL,
  `status` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rid` varchar(1000) DEFAULT NULL,
  `gid` varchar(1000) DEFAULT NULL,
  `loginname` varchar(50) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `marker` int(11) DEFAULT NULL,
  `info` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  `storage_id` varchar(255) DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `mobile` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1330 DEFAULT CHARSET=utf8;

#insert data
INSERT INTO user_account (id, rid, gid, loginname, name, password, marker, info, did, storage_id, status, mobile) VALUES (1329, '0', '0', 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', null, null, 0, '0', 1, null);
