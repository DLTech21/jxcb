-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2011 年 06 月 18 日 18:05
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
  `userName` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `yonghumima` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户密码',
  `email` varchar(11) COLLATE utf8_bin NOT NULL COMMENT '用户邮箱',
  `shijian` int(11) NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表' AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `jxcb_user`
--


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
