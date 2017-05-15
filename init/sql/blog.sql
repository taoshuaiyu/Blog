/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2017-05-14 23:56:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` bigint(20) NOT NULL auto_increment,
  `title` varchar(100) character set utf8 default NULL COMMENT '名称',
  `content` longtext character set utf8 COMMENT '内容',
  `type` tinyint(2) default NULL COMMENT '专题类型',
  `status` tinyint(1) default NULL COMMENT '是否有效 0否 1是',
  `create_date` datetime default NULL COMMENT '创建时间',
  `update_date` datetime default NULL COMMENT '更新时间',
  `create_user_id` bigint(20) default NULL COMMENT '创建人Id',
  `update_user_id` bigint(20) default NULL COMMENT '更新人Id',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='文章';

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '火箭', '哈登', '1', '1', '2017-05-14 15:17:55', null, null, null);

-- ----------------------------
-- Table structure for `u_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_permission`;
CREATE TABLE `u_permission` (
  `id` bigint(20) NOT NULL auto_increment,
  `url` varchar(256) default NULL COMMENT 'url地址',
  `name` varchar(64) default NULL COMMENT 'url描述',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_permission
-- ----------------------------
INSERT INTO `u_permission` VALUES ('4', '/permission/index.shtml', '权限列表');
INSERT INTO `u_permission` VALUES ('6', '/permission/addPermission.shtml', '权限添加');
INSERT INTO `u_permission` VALUES ('7', '/permission/deletePermissionById.shtml', '权限删除');
INSERT INTO `u_permission` VALUES ('8', '/member/list.shtml', '用户列表');
INSERT INTO `u_permission` VALUES ('9', '/member/online.shtml', '在线用户');
INSERT INTO `u_permission` VALUES ('10', '/member/changeSessionStatus.shtml', '用户Session踢出');
INSERT INTO `u_permission` VALUES ('11', '/member/forbidUserById.shtml', '用户激活&禁止');
INSERT INTO `u_permission` VALUES ('12', '/member/deleteUserById.shtml', '用户删除');
INSERT INTO `u_permission` VALUES ('13', '/permission/addPermission2Role.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('14', '/role/clearRoleByUserIds.shtml', '用户角色分配清空');
INSERT INTO `u_permission` VALUES ('15', '/role/addRole2User.shtml', '角色分配保存');
INSERT INTO `u_permission` VALUES ('16', '/role/deleteRoleById.shtml', '角色列表删除');
INSERT INTO `u_permission` VALUES ('17', '/role/addRole.shtml', '角色列表添加');
INSERT INTO `u_permission` VALUES ('18', '/role/index.shtml', '角色列表');
INSERT INTO `u_permission` VALUES ('19', '/permission/allocation.shtml', '权限分配');
INSERT INTO `u_permission` VALUES ('20', '/role/allocation.shtml', '角色分配');
INSERT INTO `u_permission` VALUES ('21', '/article/index.shtml', '文章列表');

-- ----------------------------
-- Table structure for `u_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` bigint(20) NOT NULL auto_increment,
  `name` varchar(32) default NULL COMMENT '角色名称',
  `type` varchar(10) default NULL COMMENT '角色类型',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '系统管理员', '888888');
INSERT INTO `u_role` VALUES ('3', '权限角色', '100003');
INSERT INTO `u_role` VALUES ('4', '用户中心', '100002');

-- ----------------------------
-- Table structure for `u_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `u_role_permission`;
CREATE TABLE `u_role_permission` (
  `rid` bigint(20) default NULL COMMENT '角色ID',
  `pid` bigint(20) default NULL COMMENT '权限ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_role_permission
-- ----------------------------
INSERT INTO `u_role_permission` VALUES ('4', '8');
INSERT INTO `u_role_permission` VALUES ('4', '9');
INSERT INTO `u_role_permission` VALUES ('4', '10');
INSERT INTO `u_role_permission` VALUES ('4', '11');
INSERT INTO `u_role_permission` VALUES ('4', '12');
INSERT INTO `u_role_permission` VALUES ('3', '4');
INSERT INTO `u_role_permission` VALUES ('3', '6');
INSERT INTO `u_role_permission` VALUES ('3', '7');
INSERT INTO `u_role_permission` VALUES ('3', '13');
INSERT INTO `u_role_permission` VALUES ('3', '14');
INSERT INTO `u_role_permission` VALUES ('3', '15');
INSERT INTO `u_role_permission` VALUES ('3', '16');
INSERT INTO `u_role_permission` VALUES ('3', '17');
INSERT INTO `u_role_permission` VALUES ('3', '18');
INSERT INTO `u_role_permission` VALUES ('3', '19');
INSERT INTO `u_role_permission` VALUES ('3', '20');
INSERT INTO `u_role_permission` VALUES ('1', '4');
INSERT INTO `u_role_permission` VALUES ('1', '6');
INSERT INTO `u_role_permission` VALUES ('1', '7');
INSERT INTO `u_role_permission` VALUES ('1', '8');
INSERT INTO `u_role_permission` VALUES ('1', '9');
INSERT INTO `u_role_permission` VALUES ('1', '10');
INSERT INTO `u_role_permission` VALUES ('1', '11');
INSERT INTO `u_role_permission` VALUES ('1', '12');
INSERT INTO `u_role_permission` VALUES ('1', '13');
INSERT INTO `u_role_permission` VALUES ('1', '14');
INSERT INTO `u_role_permission` VALUES ('1', '15');
INSERT INTO `u_role_permission` VALUES ('1', '16');
INSERT INTO `u_role_permission` VALUES ('1', '17');
INSERT INTO `u_role_permission` VALUES ('1', '18');
INSERT INTO `u_role_permission` VALUES ('1', '19');
INSERT INTO `u_role_permission` VALUES ('1', '20');
INSERT INTO `u_role_permission` VALUES ('1', '21');

-- ----------------------------
-- Table structure for `u_user`
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` bigint(20) NOT NULL auto_increment,
  `nickname` varchar(20) default NULL COMMENT '用户昵称',
  `email` varchar(128) default NULL COMMENT '邮箱|登录帐号',
  `pswd` varchar(32) default NULL COMMENT '密码',
  `create_time` datetime default NULL COMMENT '创建时间',
  `last_login_time` datetime default NULL COMMENT '最后登录时间',
  `status` bigint(1) default '1' COMMENT '1:有效，0:禁止登录',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '管理员', 'admin', '57eb72e6b78a87a12d46a7f5e9315138', '2016-06-16 11:15:33', '2017-05-14 23:41:15', '1');
INSERT INTO `u_user` VALUES ('11', 'soso', '8446666@qq.com', 'd57ffbe486910dd5b26d0167d034f9ad', '2016-05-26 20:50:54', '2016-06-16 11:24:35', '1');
INSERT INTO `u_user` VALUES ('12', '8446666', '8446666', '4afdc875a67a55528c224ce088be2ab8', '2016-05-27 22:34:19', '2016-06-15 17:03:16', '1');
INSERT INTO `u_user` VALUES ('13', '12', '12', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:32:34', '2017-05-14 15:32:38', '1');
INSERT INTO `u_user` VALUES ('14', '13', '13', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:32:52', '2017-05-14 15:32:54', '1');
INSERT INTO `u_user` VALUES ('15', '14', '14', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:33:05', '2017-05-14 15:33:07', '1');
INSERT INTO `u_user` VALUES ('16', '15', '15', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:33:19', '2017-05-14 15:33:25', '1');
INSERT INTO `u_user` VALUES ('17', '16', '16', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:33:35', '2017-05-14 15:33:38', '1');
INSERT INTO `u_user` VALUES ('18', '17', '17', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:33:52', '2017-05-14 15:33:56', '1');
INSERT INTO `u_user` VALUES ('19', '18', '18', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:34:05', '2017-05-14 15:34:08', '1');
INSERT INTO `u_user` VALUES ('20', '19', '19', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:34:17', '2017-05-14 15:34:21', '1');
INSERT INTO `u_user` VALUES ('21', '20', '20', '57eb72e6b78a87a12d46a7f5e9315138', '2017-05-14 15:34:43', '2017-05-14 15:34:46', '1');

-- ----------------------------
-- Table structure for `u_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `uid` bigint(20) default NULL COMMENT '用户ID',
  `rid` bigint(20) default NULL COMMENT '角色ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('12', '4');
INSERT INTO `u_user_role` VALUES ('11', '3');
INSERT INTO `u_user_role` VALUES ('11', '4');
INSERT INTO `u_user_role` VALUES ('1', '1');
