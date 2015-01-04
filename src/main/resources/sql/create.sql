DROP TABLE
blog;
CREATE TABLE
  blog
(
  id          INT                 NOT NULL AUTO_INCREMENT,
  ctime       DATETIME            NOT NULL,
  title       VARCHAR(45)         NOT NULL,
  status      TINYINT DEFAULT '0' NOT NULL,
  level       INT DEFAULT '1'     NOT NULL,
  article     TEXT,
  permissions TINYINT DEFAULT '1' NOT NULL
  COMMENT '权限:1.公开 2.私有',
  tags        VARCHAR(200) COMMENT '标签:多个用逗号隔开',
  PRIMARY KEY (id)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
DROP TABLE
sys_menu;
CREATE TABLE
  sys_menu
(
  id      INT             NOT NULL AUTO_INCREMENT,
  name    VARCHAR(50)     NOT NULL,
  url     VARCHAR(200),
  level   INT             NOT NULL,
  parent  INT DEFAULT '0' NOT NULL,
  icon    VARCHAR(50),
  remarks VARCHAR(200),
  c_time  DATETIME        NOT NULL,
  c_user  INT             NOT NULL,
  seq     INT DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
DROP TABLE
sys_role;
CREATE TABLE
  sys_role
(
  id          INT                 NOT NULL AUTO_INCREMENT,
  name        VARCHAR(100)        NOT NULL,
  description VARCHAR(200),
  status      TINYINT DEFAULT '1' NOT NULL,
  c_time      DATETIME            NOT NULL,
  c_user      INT                 NOT NULL,
  type        TINYINT DEFAULT '1' NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
DROP TABLE
sys_role_menu;
CREATE TABLE
  sys_role_menu
(
  id      INT      NOT NULL AUTO_INCREMENT,
  role_id INT      NOT NULL,
  menu_id INT      NOT NULL,
  c_time  DATETIME NOT NULL,
  c_user  INT      NOT NULL,
  PRIMARY KEY (id)
)
  ENGINE =InnoDB
  DEFAULT CHARSET =utf8;
DROP TABLE
sys_user_account;
CREATE TABLE
  sys_user_account
(
  id        INT         NOT NULL AUTO_INCREMENT,
  role_id   VARCHAR(1000),
  loginname VARCHAR(50) NOT NULL,
  name      VARCHAR(50)
            COLLATE utf8_unicode_ci,
  password  VARCHAR(255),
  info      VARCHAR(1000)
            COLLATE utf8_unicode_ci,
  status    INT                  DEFAULT '1',
  mobile    VARCHAR(32),
  error_num INT,
  c_time    DATETIME,
  c_user    INT,
  PRIMARY KEY (id)
)
  ENGINE =MyISAM
  DEFAULT CHARSET =utf8;

##insert sys_role
INSERT INTO sys_role (name, description, status, c_time, c_user, type)
VALUES ('系统管理员', '最高权限[所有菜单/所有数据]', 1, NOW(), 1, -1);
INSERT INTO sys_role (name, description, status, c_time, c_user, type) VALUES ('程序员', '操作表格/表单/排版', 1, NOW(), 1, 1);
##sys_menu
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('代码生成', '/jsp/generateCode.jsp', 2, 2, 'glyphicon glyphicon-leaf', '上线删', NOW(), 1, 1);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('系统管理', '', 1, 0, 'glyphicon glyphicon-wrench', '', NOW(), 1, 1);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('菜单管理', '/jsp/sys/sys_menu.jsp', 2, 2, 'glyphicon glyphicon-list-alt', '', NOW(), 1, 2);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('仪表盘', '/jsp/dashboard.jsp', 1, 0, 'glyphicon glyphicon-home', '', NOW(), 1, 4);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('UI特性', '/jsp/ui.jsp', 1, 0, 'glyphicon glyphicon-eye-open', '', NOW(), 1, 5);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('表单', '/jsp/form.jsp', 1, 0, 'glyphicon glyphicon-edit', '', NOW(), 1, 6);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('排版', '/jsp/typography.jsp', 1, 0, 'glyphicon glyphicon-font', '', NOW(), 1, 7);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('照片墙', '/jsp/gallery.jsp', 1, 0, 'glyphicon glyphicon-picture', '', NOW(), 1, 8);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('表格', '', 1, 0, 'glyphicon glyphicon-align-justify', '', NOW(), 1, 3);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('基本功能', '/jsp/table.jsp', 2, 9, 'glyphicon glyphicon-', '', NOW(), 1, 1);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('进阶功能', '/jsp/table_advance.jsp', 2, 9, 'glyphicon glyphicon-', '', NOW(), 1, 2);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('日历', '/jsp/calendar.jsp', 1, 0, 'glyphicon glyphicon-calendar', '', NOW(), 1, 9);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('网格', '/jsp/grid.jsp', 1, 0, 'glyphicon glyphicon-th', '', NOW(), 1, 10);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('指引', '/jsp/tour.jsp', 1, 0, 'glyphicon glyphicon-globe', '', NOW(), 1, 11);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('用户管理', '/jsp/sys/sys_user_account.jsp', 2, 2, 'glyphicon glyphicon-user', '', NOW(), 1, 4);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('Icon', '/jsp/icon.jsp', 1, 0, 'glyphicon glyphicon-star', '', NOW(), 1, 8);
INSERT INTO sys_menu (name, url, level, parent, icon, remarks, c_time, c_user, seq)
VALUES ('角色管理', '/jsp/sys/sys_role.jsp', 2, 2, 'glyphicon glyphicon-user', '', NOW(), 1, 4);
##sys_user_account
INSERT INTO sys_user_account (role_id, loginname, name, password, info, status, mobile, error_num, c_time, c_user)
VALUES ('1', 'admin', '管理员', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', 1, NULL, 0, NOW(), 1);
INSERT INTO sys_user_account (role_id, loginname, name, password, info, status, mobile, error_num, c_time, c_user)
VALUES ('2', 'manong', 'Java程序员', '7cd22dac40674205180b9be5cc2437df', '测试权限', 1, '13333333333', 0, NOW(), 1);
INSERT INTO sys_user_account (role_id, loginname, name, password, info, status, mobile, error_num, c_time, c_user)
VALUES ('2', 'html', 'HTML程序员', 'fc35fdc70d5fc69d269883a822c7a53e', '测试权限', 1, '14444444444', 0, NOW(), 1);
##blog
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), 'aa劳力士创始人为汉斯.威尔斯多夫，1908年他在瑞士将劳力士注册为商标。', 0, 7, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '在实验室与国民党走,加油!', 1, 1, '&lt;script&gt;alert(1)&lt;/script&gt;', 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '马上新增2', 1, 1, '&lt;script&gt;alert(1);&lt;/script&gt;', 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), ' 因为最美的一颗不在天上。', 0, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '是世界上历史最悠久、延续时间最长的名表之一。', 3, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '创立于1868年的万国表有“机械表专家”之称。', 2, 1, '', 2, '2,3');
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '卡地亚拥有150多年历史，是法国珠宝金银首饰的制造名家。', 1, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), 'inavigate the DOM each time you access an ele', 3, 3, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '一种风，只流浪在一座山谷；    ', 0, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), ' 每次仰望星空，我总是闭上眼', 2, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '一道堤，只护住一湾星河。', 1, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '一定要做好这件事!!!', 0, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '如果你不喜欢写单元测试请无视这一条', 1, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), 'IDEA 快捷键和使用技巧！ - CSDN技术啦啦啦', 0, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '大发的发的发家的浪费啦多发hh', 0, 1, NULL, 1, NULL);
INSERT INTO blog (ctime, title, status, level, article, permissions, tags)
VALUES (NOW(), '手机测试', 0, 1, 'abccdd', 1, NULL);
