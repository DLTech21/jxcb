-- phpMyAdmin SQL Dump
-- version 3.4.3.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 07 月 24 日 08:05
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
(1, 5, 1, NULL, 0),
(2, 1, 1, NULL, 0),
(3, 1, 1, NULL, 0),
(1, 2, 2, NULL, 1),
(2, 3, 2, NULL, 1),
(1, 1, 1, NULL, 0),
(1, 3, 2, NULL, 1),
(1, 6, 3, NULL, 2),
(1, 7, 3, NULL, 2),
(1, 8, 3, NULL, 2),
(1, 9, 3, NULL, 2),
(4, 1, 1, NULL, 0),
(4, 5, 1, NULL, 0),
(4, 2, 2, NULL, 1),
(4, 3, 2, NULL, 1),
(4, 4, 2, NULL, 1),
(4, 9, 3, NULL, 2),
(4, 8, 3, NULL, 2),
(4, 7, 3, NULL, 2),
(4, 6, 3, NULL, 2);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='运用菜单' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jxcb_group`
--

INSERT INTO `jxcb_group` (`id`, `name`, `title`, `create_time`, `update_time`, `status`, `sort`, `show`) VALUES
(1, 'Management Center', '管理中心', 1222841259, 0, 1, 0, 1),
(2, 'DocManagement', '文档管理', 1311486446, 0, 1, 0, 1);

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
  `sort` smallint(6) unsigned DEFAULT NULL COMMENT '排序',
  `pid` smallint(6) unsigned NOT NULL COMMENT '父ID',
  `level` tinyint(1) unsigned NOT NULL COMMENT '等级,1为项目,2为模块.3为方法',
  `group_id` int(5) NOT NULL COMMENT '运用菜单ID',
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='节点表' AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `jxcb_node`
--

INSERT INTO `jxcb_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`, `group_id`) VALUES
(1, 'Management Center', '管理中心', 1, NULL, NULL, 0, 1, 0),
(2, 'User', '用户管理', 1, NULL, NULL, 1, 2, 1),
(3, 'Role', '部门管理', 1, NULL, NULL, 1, 2, 1),
(6, 'Add', '添加用户', 1, '', NULL, 2, 3, 0),
(4, 'Node', '节点管理', 1, NULL, NULL, 1, 2, 1),
(5, 'DocManagement', '文档管理', 1, '', NULL, 0, 1, 0),
(7, 'Edit', '编辑用户', 1, '', NULL, 2, 3, 0),
(8, 'Delete', '删除用户', 1, '', NULL, 2, 3, 0),
(9, 'Disable', '禁用用户', 1, '', NULL, 2, 3, 0);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `jxcb_role`
--

INSERT INTO `jxcb_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, '总经办', 0, 1, ''),
(2, '办公室', 0, 1, ''),
(3, '员工', 0, 1, ''),
(4, '总经理', 1, 1, '');

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
(4, '2');

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
(1, 'admin', '管理员', '202cb962ac59075b964b07152d234b70', '', 1311493935, '127.0.0.1', 11, NULL, '', '', 1311487586, 0, 1, 0, ''),
(2, 'leader', '领导', 'c444858e0aaeb727da73d2eae62321ad', '', 1311494022, '127.0.0.1', 3, NULL, '', '', 1311487688, 1311487715, 1, 0, ''),
(3, 'member', '员工', 'aa08769cdcb26674c6706093503ff0a3', '', 0, NULL, 0, NULL, '', '', 1311487849, 0, 1, 0, '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
