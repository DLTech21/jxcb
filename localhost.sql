-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 07 月 26 日 02:22
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jxcb`
--
CREATE DATABASE `jxcb` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `jxcb`;

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_access`
--

CREATE TABLE IF NOT EXISTS `jxcb_access` (
  `role_id` smallint(6) unsigned NOT NULL COMMENT '用户组ID',
  `node_id` smallint(6) unsigned NOT NULL COMMENT '节点ID',
  `level` tinyint(1) NOT NULL COMMENT '等级,1为项目,2为模块.3为方法',
  `module` varchar(50) DEFAULT NULL,
  `pid` int(11) NOT NULL COMMENT '父ID',
  KEY `groupId` (`role_id`),
  KEY `nodeId` (`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='组访问权限';

--
-- 转存表中的数据 `jxcb_access`
--

INSERT INTO `jxcb_access` (`role_id`, `node_id`, `level`, `module`, `pid`) VALUES
(7, 1, 1, NULL, 0),
(7, 4, 2, NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_group`
--

CREATE TABLE IF NOT EXISTS `jxcb_group` (
  `id` smallint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL COMMENT '名称',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='运用菜单' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jxcb_group`
--

INSERT INTO `jxcb_group` (`id`, `name`, `title`, `create_time`, `update_time`, `status`, `sort`, `show`) VALUES
(1, 'Management Center', '管理中心', 1222841259, 0, 1, 0, 1),
(2, 'DocManagement', '文档管理', 1311486446, 0, 1, 0, 1),
(3, 'DocManagement', '', 1311645993, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_node`
--

CREATE TABLE IF NOT EXISTS `jxcb_node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '节点名字',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态,0为关,1为开',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `sort` smallint(6) unsigned DEFAULT '0' COMMENT '排序',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '等级,1为项目,2为模块.3为方法',
  `group_id` int(5) NOT NULL DEFAULT '0' COMMENT '运用菜单ID',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='节点表' AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `jxcb_node`
--

INSERT INTO `jxcb_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`, `group_id`) VALUES
(1, 'Jxcb', '文档管理系统', 1, NULL, NULL, 0, 1, 0),
(2, 'Group', '菜单管理', 1, NULL, NULL, 1, 2, 1),
(3, 'User', '用户管理', 1, NULL, NULL, 1, 2, 1),
(4, 'Role', '部门管理', 1, '', NULL, 1, 2, 1),
(5, 'Node', '权限管理', 1, NULL, 0, 1, 2, 1),
(6, 'Add', '添加', 1, '', 0, 2, 3, 0),
(7, 'Read', '读取', 1, '', 0, 2, 3, 0),
(8, 'Edit', '编辑', 1, '', 0, 2, 3, 0),
(9, 'Update', '更新', 1, '', 0, 2, 3, 0),
(10, 'Delete', '删除', 1, '', 0, 2, 3, 0),
(11, 'ForeverDelete', '永久删除', 1, '不可恢复', 0, 2, 3, 0),
(12, 'Add', '添加', 1, '', 0, 3, 3, 0),
(13, 'Delete', '删除', 1, '', 0, 3, 3, 0),
(14, 'Edit', '编辑', 1, '', 0, 3, 3, 0),
(15, 'Read', '读取', 1, '', 0, 3, 3, 0),
(16, 'Update', '更新', 1, '', 0, 3, 3, 0),
(17, 'ForeverDelete', '永久删除', 1, '', 0, 3, 3, 0),
(18, 'Forbid', '状态禁用', 1, '', 0, 2, 3, 0),
(19, 'Recycle', '状态恢复', 1, '', 0, 2, 3, 0),
(20, 'Uploadfile', '文件上传', 1, '', 0, 1, 2, 2),
(21, 'Setup', '全站配置信息', 1, '', 0, 1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_role`
--

CREATE TABLE IF NOT EXISTS `jxcb_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '组名',
  `pid` smallint(6) DEFAULT NULL COMMENT '父ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态,0为关,1为开',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `jxcb_role`
--

INSERT INTO `jxcb_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, '总经办', 0, 1, ''),
(2, '办公室', 0, 1, ''),
(3, '员工', 0, 1, ''),
(4, '总经理', 1, 1, ''),
(5, '副总经理', 1, 1, ''),
(6, '主任', 2, 1, ''),
(7, '副主任', 2, 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_role_user`
--

CREATE TABLE IF NOT EXISTS `jxcb_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT NULL COMMENT '用户组ID',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ID',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户、用户组关系表';

--
-- 转存表中的数据 `jxcb_role_user`
--

INSERT INTO `jxcb_role_user` (`role_id`, `user_id`) VALUES
(1, '2'),
(3, '3'),
(4, '2'),
(7, '3');

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_setup`
--

CREATE TABLE IF NOT EXISTS `jxcb_setup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) COLLATE utf8_bin NOT NULL,
  `title` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '标题显示名称',
  `value` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '值',
  `remarks` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='配置' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jxcb_setup`
--

INSERT INTO `jxcb_setup` (`id`, `name`, `title`, `value`, `remarks`) VALUES
(1, 'title', '标题', '文档管理系统', ''),
(2, 'title', '标题', '文档管理系统', '');

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_shangpin`
--

CREATE TABLE IF NOT EXISTS `jxcb_shangpin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `name` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '商品名称',
  `huohao` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '货号',
  `yanse` varchar(5) COLLATE utf8_bin NOT NULL COMMENT '颜色',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='商品' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_uploadfile`
--

CREATE TABLE IF NOT EXISTS `jxcb_uploadfile` (
  `id` int(11) NOT NULL,
  `filename` int(11) NOT NULL COMMENT '文件名'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文件上传表';

-- --------------------------------------------------------

--
-- 表的结构 `jxcb_user`
--

CREATE TABLE IF NOT EXISTS `jxcb_user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `account` varchar(64) NOT NULL COMMENT '用户账户',
  `nickname` varchar(50) NOT NULL COMMENT '用户别名',
  `password` char(32) NOT NULL COMMENT '密码',
  `bind_account` varchar(50) NOT NULL COMMENT '绑定帐户',
  `last_login_time` int(11) unsigned DEFAULT '0' COMMENT '上次登录时间',
  `last_login_ip` varchar(40) DEFAULT NULL COMMENT '上次登录IP',
  `login_count` mediumint(8) unsigned DEFAULT '0' COMMENT '登录计数',
  `verify` varchar(32) DEFAULT NULL COMMENT '验证',
  `email` varchar(50) NOT NULL COMMENT '邮箱',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL COMMENT '更新',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `type_id` tinyint(2) unsigned DEFAULT '0' COMMENT '类型ID',
  `info` text NOT NULL COMMENT '信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户' AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `jxcb_user`
--

INSERT INTO `jxcb_user` (`id`, `account`, `nickname`, `password`, `bind_account`, `last_login_time`, `last_login_ip`, `login_count`, `verify`, `email`, `remark`, `create_time`, `update_time`, `status`, `type_id`, `info`) VALUES
(1, 'admin', '管理员', '202cb962ac59075b964b07152d234b70', '', 1311644571, '127.0.0.1', 42, NULL, '', '', 1311487586, 0, 1, 0, ''),
(2, 'leader', '领导', 'c444858e0aaeb727da73d2eae62321ad', '', 1311499477, '127.0.0.1', 5, NULL, '', '', 1311487688, 1311487715, 1, 0, ''),
(3, 'member', '员工', 'aa08769cdcb26674c6706093503ff0a3', '', 0, NULL, 0, NULL, '', '', 1311487849, 0, 1, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
