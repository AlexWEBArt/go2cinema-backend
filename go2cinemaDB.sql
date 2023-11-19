-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 19 2023 г., 20:29
-- Версия сервера: 5.7.39-log
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `go2cinemaDB`
--

-- --------------------------------------------------------

--
-- Структура таблицы `films`
--

CREATE TABLE `films` (
  `film_id` int(11) NOT NULL,
  `film_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `film_duration` int(11) NOT NULL,
  `film_origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `film_poster` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `film_description` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `films`
--

INSERT INTO `films` (`film_id`, `film_name`, `film_duration`, `film_origin`, `film_poster`, `film_description`) VALUES
(1, 'Зверополис', 108, 'США', 'https://qamid.tmweb.ru/img/posters/118.png', 'Добро пожаловать в Зверополис – современный город, населенный самыми разными животными, от огромных слонов до крошечных мышек.'),
(2, 'Терминатор-заржавел', 120, 'Зимбабве', 'https://qamid.tmweb.ru/img/posters/99.png', 'Машины так и не научились делать wd-40'),
(3, 'Унесенные ветром', 222, 'Америка', 'https://qamid.tmweb.ru/img/posters/102.png', 'Могучие ветры Гражданской войны в один миг уносят беззаботную юность южанки Скарлетт О`Хара, когда привычный шум балов сменяется грохотом канонад на подступах к родному дому. Для молодой женщины, вынужденной бороться за новую жизнь на разоренной земле, испытания и лишения становятся шансом переосмыслить идеалы, обрести веру в себя и найти настоящую любовь.\r\n\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `halls`
--

CREATE TABLE `halls` (
  `hall_id` int(11) NOT NULL,
  `hall_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hall_open` tinyint(1) DEFAULT NULL,
  `hall_price_standart` decimal(10,2) DEFAULT NULL,
  `hall_price_vip` decimal(10,2) DEFAULT NULL,
  `hall_places` int(11) DEFAULT NULL,
  `hall_row` int(11) DEFAULT NULL,
  `hall_config` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `halls`
--

INSERT INTO `halls` (`hall_id`, `hall_name`, `hall_open`, `hall_price_standart`, `hall_price_vip`, `hall_places`, `hall_row`, `hall_config`) VALUES
(1, 'Зал 1', 0, '200.00', '300.00', 8, 5, '<div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>'),
(2, 'Зал-2', 1, '200.00', '500.00', 7, 6, '<div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div>');

-- --------------------------------------------------------

--
-- Структура таблицы `seances`
--

CREATE TABLE `seances` (
  `seance_id` int(11) NOT NULL,
  `seance_filmid` int(11) NOT NULL,
  `seance_hallid` int(11) NOT NULL,
  `seance_time` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seance_start` int(11) NOT NULL,
  `seance_end` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seances`
--

INSERT INTO `seances` (`seance_id`, `seance_filmid`, `seance_hallid`, `seance_time`, `seance_start`, `seance_end`) VALUES
(1, 1, 1, '11:20', 680, 788),
(2, 1, 1, '15:30', 930, 1038),
(3, 2, 1, '13:20', 800, 920),
(4, 2, 1, '18:00', 1080, 1200),
(5, 3, 1, '07:30', 450, 672),
(6, 3, 1, '03:00', 180, 402),
(7, 1, 1, '20:30', 1230, 1338),
(8, 2, 1, '23:00', 1380, 60);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`film_id`);

--
-- Индексы таблицы `halls`
--
ALTER TABLE `halls`
  ADD PRIMARY KEY (`hall_id`);

--
-- Индексы таблицы `seances`
--
ALTER TABLE `seances`
  ADD PRIMARY KEY (`seance_id`),
  ADD KEY `seance_hallid` (`seance_hallid`),
  ADD KEY `seance_filmid` (`seance_filmid`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `films`
--
ALTER TABLE `films`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `halls`
--
ALTER TABLE `halls`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `seances`
--
ALTER TABLE `seances`
  MODIFY `seance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seances`
--
ALTER TABLE `seances`
  ADD CONSTRAINT `seances_ibfk_1` FOREIGN KEY (`seance_hallid`) REFERENCES `halls` (`hall_id`),
  ADD CONSTRAINT `seances_ibfk_2` FOREIGN KEY (`seance_filmid`) REFERENCES `films` (`film_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
