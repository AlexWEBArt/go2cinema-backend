-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 26 2023 г., 18:55
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
(3, 'Унесенные ветром', 222, 'Америка', 'https://qamid.tmweb.ru/img/posters/102.png', 'Могучие ветры Гражданской войны в один миг уносят беззаботную юность южанки Скарлетт О`Хара, когда привычный шум балов сменяется грохотом канонад на подступах к родному дому. Для молодой женщины, вынужденной бороться за новую жизнь на разоренной земле, испытания и лишения становятся шансом переосмыслить идеалы, обрести веру в себя и найти настоящую любовь.\r\n\r\n'),
(6, 'Зеленая миля', 189, 'США', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1900788/b3ada917-54d4-4150-b148-16ca4543b3fb/1920x', 'Пол Эджкомб — начальник блока смертников в тюрьме «Холодная гора», каждый из узников которого однажды проходит «зеленую милю» по пути к месту казни. Пол повидал много заключённых и надзирателей за время работы. Однако гигант Джон Коффи, обвинённый в страшном преступлении, стал одним из самых необычных обитателей блока.'),
(7, 'Побег из Шоушенка', 142, 'США', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/e26044e5-2d5a-4b38-a133-a776ad93366f/1920x', 'Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием, царящими по обе стороны решётки. Каждый, кто попадает в эти стены, становится их рабом до конца жизни. Но Энди, обладающий живым умом и доброй душой, находит подход как к заключённым, так и к охранникам, добиваясь их особого к себе расположения.'),
(8, 'Форрест Гамп', 142, 'США', 'https://avatars.mds.yandex.net/get-kinopoisk-image/6201401/da241cd4-0828-4aed-bfd2-27332dc4c94c/1920x', 'Сидя на автобусной остановке, Форрест Гамп — не очень умный, но добрый и открытый парень — рассказывает случайным встречным историю своей необыкновенной жизни.  С самого малолетства парень страдал от заболевания ног, соседские мальчишки дразнили его, но в один прекрасный день Форрест открыл в себе невероятные способности к бегу. Подруга детства Дженни всегда его поддерживала и защищала, но вскоре дороги их разошлись.'),
(9, 'Тайна Коко', 105, ' США, Япония', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1629390/e7d24b45-4e96-4cf5-9128-00710ed712dd/1920x', '12-летний Мигель живёт в мексиканской деревушке в семье сапожников и тайно мечтает стать музыкантом. Тайно, потому что в его семье музыка считается проклятием. Когда-то его прапрадед оставил жену, прапрабабку Мигеля, ради мечты, которая теперь не даёт спокойно жить и его праправнуку. С тех пор музыкальная тема в семье стала табу. Мигель обнаруживает, что между ним и его любимым певцом Эрнесто де ла Крусом, ныне покойным, существует некая связь. Паренёк отправляется к своему кумиру в Страну Мёртвых, где встречает души предков. Мигель знакомится там с духом-скелетом по имени Гектор, который становится его проводником. Вдвоём они отправляются на поиски де ла Круса.'),
(10, 'Шрэк', 90, 'США, Канада, Швеция', 'https://avatars.mds.yandex.net/get-kinopoisk-image/1946459/191ba182-8612-4fe2-a3e6-ae3517165cc3/1920x', 'Жил да был в сказочном государстве большой зеленый великан по имени Шрэк. Жил он в гордом одиночестве в лесу, на болоте, которое считал своим. Но однажды злобный коротышка — лорд Фаркуад, правитель волшебного королевства, безжалостно согнал на Шрэково болото всех сказочных обитателей.  И беспечной жизни зеленого великана пришел конец. Но лорд Фаркуад пообещал вернуть Шрэку болото, если великан добудет ему прекрасную принцессу Фиону, которая томится в неприступной башне, охраняемой огнедышащим драконом.');

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
  `hall_rows` int(11) DEFAULT NULL,
  `hall_config` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `halls`
--

INSERT INTO `halls` (`hall_id`, `hall_name`, `hall_open`, `hall_price_standart`, `hall_price_vip`, `hall_places`, `hall_rows`, `hall_config`) VALUES
(1, 'Зал 1', 1, '200.00', '300.00', 8, 5, '<div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_disabled\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>\n\n                <div className=\"conf-step__row\">\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_standart\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_vip\"></span><span className=\"conf-step__chair conf-step__chair_vip\"></span>\n                    <span className=\"conf-step__chair conf-step__chair_standart\"></span><span className=\"conf-step__chair conf-step__chair_disabled\"></span>\n                </div>'),
(2, 'Зал-2', 1, '200.00', '500.00', 7, 6, '<div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div>'),
(6, 'Зал 3', 1, '100.00', '150.00', 4, 5, '<div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_vip\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span></div><div class=\"conf-step__row\"><span class=\"conf-step__chair conf-step__chair_disabled\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_standart\"></span><span class=\"conf-step__chair conf-step__chair_disabled\"></span></div>');

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
(8, 2, 1, '23:00', 1380, 60),
(9, 10, 2, '10:00', 600, 690),
(10, 1, 2, '08:00', 480, 588),
(11, 9, 2, '13:00', 780, 885),
(12, 1, 2, '15:00', 900, 1008),
(14, 10, 2, '17:00', 1020, 1110),
(15, 9, 2, '20:00', 1200, 1305),
(16, 1, 6, '10:00', 600, 708),
(17, 6, 6, '06:00', 360, 549),
(19, 6, 2, '01:00', 60, 249),
(21, 7, 6, '13:00', 780, 922),
(22, 8, 6, '17:00', 1020, 1162),
(23, 8, 2, '04:00', 240, 382);

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
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `halls`
--
ALTER TABLE `halls`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `seances`
--
ALTER TABLE `seances`
  MODIFY `seance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
