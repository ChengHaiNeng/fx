-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-02-04 09:02:33
-- 服务器版本： 10.1.9-MariaDB
-- PHP Version: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fx`
--

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE `goods` (
  `gid` int(10) UNSIGNED NOT NULL,
  `gname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gimg` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`gid`, `gname`, `price`, `gimg`) VALUES
(1, '小沈阳', '10', '/img/x.jpg'),
(2, '宋小宝', '20', '/img/s.jpg'),
(3, '刘能', '30', '/img/l.jpg'),
(4, '赵四', '40', '/img/z.jpg');

-- --------------------------------------------------------

--
-- 表的结构 `items`
--

CREATE TABLE `items` (
  `iid` int(10) UNSIGNED NOT NULL,
  `oid` int(11) NOT NULL,
  `gid` int(11) NOT NULL,
  `goods_name` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `price` double(7,2) NOT NULL,
  `amount` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_12_28_132758_add_column_state_to_table_users', 2),
('2016_12_30_040121_add_column_level_to_users', 3),
('2016_12_30_133512_create_table_goods', 4),
('2016_12_31_045004_create_table_orders', 5),
('2016_12_31_045030_create_table_items', 5);

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `oid` int(10) UNSIGNED NOT NULL,
  `ordsn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `uid` int(11) NOT NULL,
  `openid` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `xm` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `money` double(7,2) NOT NULL,
  `ispay` tinyint(4) NOT NULL,
  `ordtime` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `openid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subtime` int(11) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `p1` int(11) NOT NULL DEFAULT '0',
  `p2` int(11) NOT NULL DEFAULT '0',
  `p3` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `name`, `openid`, `subtime`, `state`, `p1`, `p2`, `p3`) VALUES
(1, '程', 'ossVEwOLtsaPnDXRsoW-M7l8Ql9w', 1483089419, 1, 0, 0, 0),
(2, '无名小白1', 'ossVEwMjMJ9iUCYnFWRR5Sox0xu4', 1483089622, 1, 1, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`gid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`iid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `goods`
--
ALTER TABLE `goods`
  MODIFY `gid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用表AUTO_INCREMENT `items`
--
ALTER TABLE `items`
  MODIFY `iid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
