-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Июн 02 2019 г., 18:09
-- Версия сервера: 10.3.14-MariaDB
-- Версия PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `id2088586_market`
--
CREATE DATABASE IF NOT EXISTS `id2088586_market` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id2088586_market`;

-- --------------------------------------------------------

--
-- Структура таблицы `brand_tovar`
--

CREATE TABLE `brand_tovar` (
  `id_brand` int(11) NOT NULL,
  `image_brand` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name_brand` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `rating_brand` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `brand_tovar`
--

INSERT INTO `brand_tovar` (`id_brand`, `image_brand`, `name_brand`, `rating_brand`) VALUES
(1, 'https://waterwaters.000webhostapp.com/image_brand/adidas-min.jpg', 'Adidas', 4.6),
(2, 'https://waterwaters.000webhostapp.com/image_brand/arc-min.jpg', 'Arcteryx', 4.5),
(3, 'https://waterwaters.000webhostapp.com/image_brand/armani-min.jpg', 'Armani', 4.9),
(4, 'https://waterwaters.000webhostapp.com/image_brand/boss-min.jpg', 'Hugo Boss', 4.3),
(5, 'https://waterwaters.000webhostapp.com/image_brand/everlast-min.jpg', 'Everlast', 3.9),
(6, 'https://waterwaters.000webhostapp.com/image_brand/gap-min.jpg', 'Gap', 4.4),
(7, 'https://waterwaters.000webhostapp.com/image_brand/helly-min.png', 'Helly Hansen', 3.4),
(8, 'https://waterwaters.000webhostapp.com/image_brand/Jack_Jones-min.jpg', 'Jack & Jones', 5),
(9, 'https://waterwaters.000webhostapp.com/image_brand/lacoste-min.jpeg', 'Lacoste', 4.9),
(10, 'https://waterwaters.000webhostapp.com/image_brand/levis-min.jpg', 'Levis', 4.1),
(11, 'https://waterwaters.000webhostapp.com/image_brand/lonsdale-min.jpg', 'Lonsdale', 4.1),
(12, 'https://waterwaters.000webhostapp.com/image_brand/new_balnce-min.jpg', 'New Balance', 5),
(13, 'https://waterwaters.000webhostapp.com/image_brand/nike-min.jpg', 'Nike', 2.3),
(14, 'https://waterwaters.000webhostapp.com/image_brand/north-min.jpg', 'The North Face', 3.5),
(15, 'https://waterwaters.000webhostapp.com/image_brand/puma-min.jpg', 'Puma', 1.5),
(16, 'https://waterwaters.000webhostapp.com/image_brand/thrasher-min.jpg', 'Thtasher', 3.6),
(17, 'https://waterwaters.000webhostapp.com/image_brand/vans-min.jpg', 'Vans', 2.8),
(18, 'https://waterwaters.000webhostapp.com/image_brand/wolf-min.png', 'Jack Wolfskin', 3.3);

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id_categories` int(11) NOT NULL,
  `name_categories` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments_tovar`
--

CREATE TABLE `comments_tovar` (
  `id_comments` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_tovar` int(11) NOT NULL,
  `date_comments` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `detail_comments` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `like_comments` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `detail_tovar`
--

CREATE TABLE `detail_tovar` (
  `id_detail_tovar` int(11) NOT NULL,
  `name_tovar` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `detail_tovar` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `time_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_tovar` int(11) NOT NULL,
  `price_tovar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery_tovar`
--

CREATE TABLE `gallery_tovar` (
  `id_detail_photo` int(11) NOT NULL,
  `link_photo` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `detail_photo` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `id_tovar` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gender`
--

CREATE TABLE `gender` (
  `id_gender` int(11) NOT NULL,
  `name_gender` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `gender`
--

INSERT INTO `gender` (`id_gender`, `name_gender`) VALUES
(1, 'Man'),
(2, 'Woman');

-- --------------------------------------------------------

--
-- Структура таблицы `tovar`
--

CREATE TABLE `tovar` (
  `id_tovar` int(11) NOT NULL,
  `photo_tovar` int(250) NOT NULL,
  `rating_tovar` float NOT NULL,
  `id_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `type_categories`
--

CREATE TABLE `type_categories` (
  `id_type` int(11) NOT NULL,
  `name_type` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `image_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `id_gender` int(11) NOT NULL,
  `id_brand` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `type_categories`
--

INSERT INTO `type_categories` (`id_type`, `name_type`, `image_type`, `id_gender`, `id_brand`) VALUES
(10, 'Accessories', 'https://waterwaters.000webhostapp.com/image_type_category/accseess-min.jpeg', 2, 2),
(11, 'Сlothes', 'https://waterwaters.000webhostapp.com/image_type_category/odejda-min.jpg', 2, 2),
(12, 'Shoes', 'https://waterwaters.000webhostapp.com/image_type_category/obuv-min.jpg', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `id_user_desc` int(11) DEFAULT NULL,
  `pass_hash` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `nickname_user` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email_user` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id_user`, `id_user_desc`, `pass_hash`, `nickname_user`, `email_user`, `token`) VALUES
(23, 0, '$2y$10$K7qqj4tMcZWKnKQtBQO.GeLhu18A682bpn93/E2jo90yjtodlo6Hm', '0', '0', '87481092059e8e0a48b76a7.59116525'),
(24, 0, '$2y$10$subFwPL4LnZ4goHHwEpwkeZkVlC31ez5nd44VlmR8cEx3BolflIXi', 'admin', 'email', '80964126759e8e190586a45.13923262');

-- --------------------------------------------------------

--
-- Структура таблицы `user_desc`
--

CREATE TABLE `user_desc` (
  `id_user_desc` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_location` int(11) DEFAULT NULL,
  `img_ava` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bg_img` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brand_tovar`
--
ALTER TABLE `brand_tovar`
  ADD PRIMARY KEY (`id_brand`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categories`),
  ADD KEY `id_type` (`id_type`);

--
-- Индексы таблицы `comments_tovar`
--
ALTER TABLE `comments_tovar`
  ADD PRIMARY KEY (`id_comments`),
  ADD KEY `id_user` (`id_user`);

--
-- Индексы таблицы `detail_tovar`
--
ALTER TABLE `detail_tovar`
  ADD PRIMARY KEY (`id_detail_tovar`),
  ADD KEY `id_tovar` (`id_tovar`);

--
-- Индексы таблицы `gallery_tovar`
--
ALTER TABLE `gallery_tovar`
  ADD PRIMARY KEY (`id_detail_photo`),
  ADD KEY `id_tovar` (`id_tovar`);

--
-- Индексы таблицы `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id_gender`);

--
-- Индексы таблицы `tovar`
--
ALTER TABLE `tovar`
  ADD PRIMARY KEY (`id_tovar`),
  ADD KEY `id_categories` (`id_categories`);

--
-- Индексы таблицы `type_categories`
--
ALTER TABLE `type_categories`
  ADD PRIMARY KEY (`id_type`),
  ADD KEY `id_gender` (`id_gender`),
  ADD KEY `id_brand` (`id_brand`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Индексы таблицы `user_desc`
--
ALTER TABLE `user_desc`
  ADD PRIMARY KEY (`id_user_desc`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brand_tovar`
--
ALTER TABLE `brand_tovar`
  MODIFY `id_brand` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categories` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comments_tovar`
--
ALTER TABLE `comments_tovar`
  MODIFY `id_comments` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `detail_tovar`
--
ALTER TABLE `detail_tovar`
  MODIFY `id_detail_tovar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gender`
--
ALTER TABLE `gender`
  MODIFY `id_gender` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `tovar`
--
ALTER TABLE `tovar`
  MODIFY `id_tovar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `type_categories`
--
ALTER TABLE `type_categories`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `user_desc`
--
ALTER TABLE `user_desc`
  MODIFY `id_user_desc` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`id_type`) REFERENCES `type_categories` (`id_type`);

--
-- Ограничения внешнего ключа таблицы `detail_tovar`
--
ALTER TABLE `detail_tovar`
  ADD CONSTRAINT `detail_tovar_ibfk_1` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`);

--
-- Ограничения внешнего ключа таблицы `gallery_tovar`
--
ALTER TABLE `gallery_tovar`
  ADD CONSTRAINT `gallery_tovar_ibfk_1` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`);

--
-- Ограничения внешнего ключа таблицы `tovar`
--
ALTER TABLE `tovar`
  ADD CONSTRAINT `tovar_ibfk_1` FOREIGN KEY (`id_categories`) REFERENCES `categories` (`id_categories`);

--
-- Ограничения внешнего ключа таблицы `type_categories`
--
ALTER TABLE `type_categories`
  ADD CONSTRAINT `type_categories_ibfk_1` FOREIGN KEY (`id_gender`) REFERENCES `gender` (`id_gender`),
  ADD CONSTRAINT `type_categories_ibfk_2` FOREIGN KEY (`id_brand`) REFERENCES `brand_tovar` (`id_brand`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
