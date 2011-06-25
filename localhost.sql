-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 06 月 25 日 19:05
-- 服务器版本: 5.1.28
-- PHP 版本: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


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
(2, 1, 1, NULL, 0),
(2, 3, 2, NULL, 1),
(2, 4, 3, NULL, 2);

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
  PRIMARY KEY (`id`),
  KEY `level` (`level`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='节点表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `jxcb_node`
--

INSERT INTO `jxcb_node` (`id`, `name`, `title`, `status`, `remark`, `sort`, `pid`, `level`) VALUES
(1, 'jxcb', '进销存管理平台', 1, NULL, NULL, 0, 1),
(2, 'User', '用户管理', 1, NULL, NULL, 1, 2),
(3, 'Index', '显示数据', 1, NULL, NULL, 1, 2),
(4, 'index', '查看数据', 1, NULL, NULL, 3, 3);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='用户组表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jxcb_role`
--

INSERT INTO `jxcb_role` (`id`, `name`, `pid`, `status`, `remark`) VALUES
(1, '老板', 0, 1, NULL),
(2, '主管', 0, 1, NULL);

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
(2, '2'),
(1, '1');

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

--
-- 转存表中的数据 `jxcb_shangpin`
--


-- --------------------------------------------------------

--
-- 表的结构 `jxcb_user`
--

CREATE TABLE IF NOT EXISTS `jxcb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `email` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户邮箱',
  `shijian` int(11) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表' AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `jxcb_user`
--

INSERT INTO `jxcb_user` (`id`, `username`, `password`, `email`, `shijian`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', '', 0),
(2, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', '', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
