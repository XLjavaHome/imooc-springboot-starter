/*
Navicat MySQL Data Transfer

Source Server         : .
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : leecx

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-29 16:29:17
*/

set FOREIGN_KEY_CHECKS = 0
;

-- ----------------------------
-- Table structure for data_dict
-- ----------------------------
drop table if exists `data_dict`
;

create table `data_dict` (
  `id` int(11) not null auto_increment,
  `type_name` varchar(64) not null comment '数据字典类型名称',
  `type_code` varchar(64) default null comment '数据字典类型代码',
  `ddkey` varchar(6) not null comment '数据键',
  `ddvalue` varchar(12) not null comment '数据值',
  `is_show` int(1) not null comment '是否显示，1：显示；2：不显示',
  primary key (`id`)
)
  engine = InnoDB
  auto_increment = 19
  default charset = utf8 comment ='数据字典表'
;

-- ----------------------------
-- Records of data_dict
-- ----------------------------
insert into `data_dict` values ('1','性别','sex','0','女','1')
;

insert into `data_dict` values ('2','性别','sex','1','男','1')
;

insert into `data_dict` values ('3','性别','sex','2','保密','1')
;

insert into `data_dict` values ('4','汽车类型','carType','2','公交车','1')
;

insert into `data_dict` values ('5','汽车类型','carType','1','轿车','1')
;

insert into `data_dict` values ('6','职业','job','1','Java开发','1')
;

insert into `data_dict` values ('7','职业','job','2','前端开发','1')
;

insert into `data_dict` values ('8','职业','job','3','大数据开发','1')
;

insert into `data_dict` values ('9','职业','job','4','ios开发','1')
;

insert into `data_dict` values ('10','职业','job','5','Android开发','1')
;

insert into `data_dict` values ('11','职业','job','6','Linux系统工程师','1')
;

insert into `data_dict` values ('12','职业','job','7','PHP开发','1')
;

insert into `data_dict` values ('13','职业','job','8','.net开发','1')
;

insert into `data_dict` values ('14','职业','job','9','C/C++','1')
;

insert into `data_dict` values ('15','职业','job','10','学生','0')
;

insert into `data_dict` values ('16','职业','job','11','其它','1')
;

insert into `data_dict` values ('17','职业','job','12','全栈牛逼架构师','1')
;

insert into `data_dict` values ('18','汽车类型','carType','3','海陆两用','1')
;

-- ----------------------------
-- Table structure for demo_item
-- ----------------------------
drop table if exists `demo_item`
;

create table `demo_item` (
  `id` varchar(20) not null,
  `name` varchar(255) not null,
  `amount` int(11) not null,
  primary key (`id`)
)
  engine = InnoDB
  default charset = utf8
;

-- ----------------------------
-- Records of demo_item
-- ----------------------------
insert into `demo_item` values ('170909FRA2NB7TR4','红翼 red wing','215000')
;

insert into `demo_item` values ('170909FRB9DPXY5P','红翼 9111','210000')
;

insert into `demo_item` values ('170909FRCAT15XGC','红翼 875','215000')
;

insert into `demo_item` values ('170909FRF2P18ARP','cat','185000')
;

insert into `demo_item` values ('170909FRG6R75PZC','dog','195000')
;

insert into `demo_item` values ('170909FRHBS3K680','马丁靴','150000')
;

insert into `demo_item` values ('170909FRPWA5HCPH','天木兰 经典 船鞋','65000')
;

insert into `demo_item` values ('170909FRS6SBHH00','天木兰 踢不烂','65000')
;

insert into `demo_item` values ('170909FRX22HKCDP','其乐 袋鼠靴','70000')
;

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
drop table if exists `sys_permission`
;

create table `sys_permission` (
  `id` int(20) not null auto_increment comment '主键',
  `name` varchar(128) not null comment '资源名称',
  `type` int(2) not null comment '资源类型：\r\n0：顶级根权限\r\n1：菜单,间接代表就是 isParent=true\r\n2：普通链接（按钮，link等）',
  `url` varchar(128) default null comment '访问url地址',
  `percode` varchar(128) default null comment '权限代码字符串',
  `parentid` int(11) default null comment '父结点id\r\n为0代表根节点',
  `parentids` varchar(128) default null comment '父结点id列表串',
  `sort` int(3) default null comment '排序号',
  `available` int(1) not null comment '是否可用,1：可用，0不可用',
  `description` varchar(128) default null comment '当前资源描述',
  `create_time` datetime not null,
  `update_time` datetime not null,
  primary key (`id`),
  unique key `percode`(`percode`)
)
  engine = InnoDB
  auto_increment = 258
  default charset = utf8
;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
insert into `sys_permission`
values ('237','个人会员','1','/appuser/mng','appuser:mng','216',null,null,'1','会员管理 - 个人会员 菜单按钮','2016-10-24 14:28:31','2016-10-24 14:28:31')
;

insert into `sys_permission`
values
('238','查看','2','/appuser/getPersonal','appuser:getPersonal','237',null,null,'1','会员管理 - 个人会员 下属按钮','2016-10-24 14:36:42','2016-10-24 14:36:55')
;

insert into `sys_permission`
values
('239','审核','2','/appuser/toCheck','appuser:toCheck','237',null,null,'1','会员管理 - 个人会员 下属按钮','2016-10-24 14:37:37','2016-10-24 14:37:45')
;

insert into `sys_permission`
values
('240','提交审核','2','/appuser/check','appuser:check','237',null,null,'1','会员管理 - 个人会员 菜单按钮','2016-10-24 14:39:10','2016-10-24 14:39:10')
;

insert into `sys_permission`
values ('241','企业会员','1','/company/mng','company:mng','216',null,null,'1','会员管理 - 企业会员','2016-10-24 14:41:52','2016-10-24 14:42:11')
;

insert into `sys_permission`
values
('242','查看','2','/company/getCompany','company:getCompany','241',null,null,'1','会员管理 - 企业会员 下查看资源','2016-10-24 14:43:38','2016-10-24 14:43:43')
;

insert into `sys_permission`
values ('243','审核','2','/company/toCheck','company:toCheck','241',null,null,'1','会员管理 - 企业会员','2016-10-24 14:44:23','2016-10-24 14:44:23')
;

insert into `sys_permission`
values ('244','提交审核','2','/company/check','company:check','241',null,null,'1','会员管理 - 企业会员','2016-10-24 14:44:52','2016-10-24 14:44:59')
;

insert into `sys_permission`
values ('245','车辆管理','1','/cars/toCarsList','cars:toCarsList','216',null,null,'1','车辆管理菜单','2016-10-26 13:51:20','2016-10-26 13:51:20')
;

insert into `sys_permission`
values ('246','查看','2','/cars/queryCars','cars:queryCars','245',null,null,'1','车辆管理菜单 - 查看按钮','2016-10-26 13:52:34','2016-10-26 13:52:42')
;

insert into `sys_permission`
values
('247','审核','2','/cars/toCarsCheck','cars:toCarsCheck','245',null,null,'1','车辆管理菜单 - 审核按钮','2016-10-26 13:53:19','2016-10-26 13:53:19')
;

insert into `sys_permission`
values
('248','提交审核','2','/cars/carsCheck','cars:carsCheck','245',null,null,'1','车辆管理菜单 - 提交审核','2016-10-26 13:54:08','2016-10-26 13:54:08')
;

insert into `sys_permission`
values
('249','车源管理','1','/carsource/mng','carsource:mng','216',null,null,'1','货源/车源管理 - 车源管理','2016-10-26 13:55:28','2016-10-26 13:55:28')
;

insert into `sys_permission`
values
('250','货源管理','1','/cargosource/mng','cargosource:mng','216',null,null,'1','车源/货源管理菜单 - 货源管理','2016-10-26 13:56:52','2016-10-26 13:56:52')
;

insert into `sys_permission`
values
('252','搜索车源','2','/carsource/getAll','carsource:getAll','249',null,null,'1','货源/车源管理 - 车源管理 - 搜索','2016-10-26 13:59:19','2016-10-26 13:59:19')
;

insert into `sys_permission`
values
('254','新增车源','2','/carsource/add','carsource:add','249',null,null,'1','货源/车源管理 - 车源管理 - 新增车源','2016-10-26 14:03:36','2016-10-26 14:03:36')
;

insert into `sys_permission`
values
('255','车源详情','2','/carsource/detail','carsource:detail','249',null,null,'1','货源/车源管理 - 车源管理 - 车源详情','2016-10-26 14:04:03','2016-10-26 14:04:03')
;

insert into `sys_permission`
values
('256','删除车源','2','/carsource/del','carsource:del','249',null,null,'1','货源/车源管理 - 车源管理 - 删除车源','2016-10-26 14:05:26','2016-10-26 14:05:35')
;

insert into `sys_permission`
values
('257','保存新增的车源','2','/carsource/save','carsource:save','249',null,null,'1','货源/车源管理 - 车源管理 - 保存新增的车源','2016-10-26 14:06:52','2016-10-26 14:06:58')
;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
drop table if exists `sys_role`
;

create table `sys_role` (
  `id` int(20) not null auto_increment,
  `name` varchar(128) not null,
  `available` int(1) default null comment '是否可用,1：可用，0不可用',
  primary key (`id`)
)
  engine = InnoDB
  auto_increment = 7
  default charset = utf8
;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
insert into `sys_role` values ('1','超级管理员','1')
;

insert into `sys_role` values ('2','总经理','1')
;

insert into `sys_role` values ('3','客服','1')
;

insert into `sys_role` values ('4','销售/市场专员','1')
;

insert into `sys_role` values ('5','产品团队','1')
;

insert into `sys_role` values ('6','技术团队','1')
;

-- ----------------------------
-- Table structure for sys_role_permission
-- ----------------------------
drop table if exists `sys_role_permission`
;

create table `sys_role_permission` (
  `id` int(20) not null auto_increment,
  `sys_role_id` int(20) not null comment '角色id',
  `sys_permission_id` int(20) not null comment '权限id',
  primary key (`id`)
)
  engine = InnoDB
  auto_increment = 12
  default charset = utf8
;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
insert into `sys_role_permission` values ('1','1','237')
;

insert into `sys_role_permission` values ('2','1','238')
;

insert into `sys_role_permission` values ('3','1','239')
;

insert into `sys_role_permission` values ('4','1','240')
;

insert into `sys_role_permission` values ('5','1','241')
;

insert into `sys_role_permission` values ('6','6','250')
;

insert into `sys_role_permission` values ('7','6','251')
;

insert into `sys_role_permission` values ('8','6','252')
;

insert into `sys_role_permission` values ('9','6','253')
;

insert into `sys_role_permission` values ('10','6','254')
;

insert into `sys_role_permission` values ('11','6','255')
;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
drop table if exists sys_user
;

create table sys_user (
  `id` varchar(20) not null,
  `username` varchar(60) not null comment '用户名，登录名',
  `password` varchar(64) not null comment '密码',
  `nickname` varchar(60) not null comment '昵称',
  `age` int(3) default null comment '年龄',
  `sex` int(1) default null comment '性别\r\n0：女\r\n1：男\r\n2：保密 ',
  `job` int(10) default null comment '职业类型：\r\n1：Java开发\r\n2：前端开发\r\n3：大数据开发\r\n4：ios开发\r\n5：Android开发\r\n6：Linux系统工程师\r\n7：PHP开发\r\n8：.net开发\r\n9：C/C++\r\n10：学生\r\n11：其它',
  `face_image` varchar(255) default null comment '头像地址',
  `province` varchar(12) default null comment '省',
  `city` varchar(12) default null comment '市',
  `district` varchar(12) default null comment '区',
  `address` varchar(128) default null comment '详细地址',
  `auth_salt` varchar(16) default null comment '用于权限的“盐”',
  `last_login_ip` varchar(20) default null comment '最后一次登录IP',
  `last_login_time` datetime default null comment '最后一次登录时间',
  `is_delete` int(1) not null,
  `regist_time` datetime not null,
  primary key (`id`),
  unique key `username`(`username`)
)
  engine = InnoDB
  default charset = utf8 comment ='系统后台用户'
;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
insert into `sys_user`
values
('1001','test','72e1242b855fb038212135e0ad348842','lee123',null,null,null,null,null,null,null,null,'test',null,null,'0','2017-11-06 10:20:36')
;

insert into `sys_user`
values
('1709067GM45GAF5P','jack','afee05e30d029ac3b61a2dc6c08d7b27','jack','22','0','3',null,'上海市','上海市市辖区','静安区','上海老薛','abcd',null,null,'0',
 '2017-09-06 10:35:28')
;

insert into `sys_user`
values
('170908G65M59XWH0','test003','afee05e30d029ac3b61a2dc6c08d7b27','test003','20','0','3',null,'上海市','上海市市辖区','黄浦区','老薛家','tx5D',null,null,'1',
 '2017-09-08 21:19:40')
;

insert into `sys_user`
values
('170918GDXW2DNP4H','test001','afee05e30d029ac3b61a2dc6c08d7b27','test0016','18','1','9',null,'湖北省','鄂州市','华容区','123','W5k4',null,null,'0',
 '2017-09-18 21:42:51')
;

insert into `sys_user`
values
('171020FWN55RS5AW','test1001','75a5298456daeb532320fdd4a9eacec0','test1001',null,null,null,null,null,null,null,null,'3883',null,null,'0',
 '2017-10-20 20:51:05')
;

insert into `sys_user`
values
('1803269654BP2428','imoocMon Mar 26 12:55:11 CST 2018','abc123','imoocMon Mar 26 12:55:11 CST 2018',null,null,null,null,null,null,null,null,null,
 null,null,'0','2018-03-26 12:55:11')
;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
drop table if exists `sys_user_role`
;

create table `sys_user_role` (
  `id` int(20) not null auto_increment,
  `sys_user_id` varchar(20) not null,
  `sys_role_id` int(20) not null,
  primary key (`id`)
)
  engine = InnoDB
  auto_increment = 22
  default charset = utf8
;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
insert into `sys_user_role` values ('21','1709067GM45GAF5P','1')
;

-- ----------------------------
-- Table structure for t_test
-- ----------------------------
drop table if exists `t_test`
;

create table `t_test` (
  `id` int(11) unsigned not null auto_increment,
  `name` varchar(50) default null,
  primary key (`id`)
)
  engine = InnoDB
  auto_increment = 4
  default charset = latin1
;

-- ----------------------------
-- Records of t_test
-- ----------------------------
insert into `t_test` values ('1','111')
;

insert into `t_test` values ('2','222')
;

insert into `t_test` values ('3','333')
;
