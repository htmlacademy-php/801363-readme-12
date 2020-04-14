-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2020 г., 11:26
-- Версия сервера: 5.7.25
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
-- База данных: `schema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица комментариев';

-- --------------------------------------------------------

--
-- Структура таблицы `content_type`
--

CREATE TABLE `content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '-',
  `class` varchar(20) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тип контента';

--
-- Дамп данных таблицы `content_type`
--

INSERT INTO `content_type` (`id`, `name`, `class`) VALUES
(1, 'Текст', 'text'),
(2, 'Цитата', 'quote'),
(3, 'Картинка', 'photo'),
(4, 'Видео', 'video'),
(5, 'Ссылка', 'link');

-- --------------------------------------------------------

--
-- Структура таблицы `hashtag`
--

CREATE TABLE `hashtag` (
  `id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `like_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписка';

-- --------------------------------------------------------

--
-- Структура таблицы `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `id_user` int(11) NOT NULL,
  `id_targ_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Чат';

-- --------------------------------------------------------

--
-- Структура таблицы `post`
--

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(150) NOT NULL DEFAULT '-',
  `text` text,
  `author` varchar(100) NOT NULL DEFAULT '-',
  `img` varchar(100) NOT NULL DEFAULT 'none.svg',
  `youtube` varchar(100) NOT NULL DEFAULT 'none',
  `link` varchar(100) NOT NULL DEFAULT 'none',
  `count` int(11) NOT NULL,
  `id_author` int(11) NOT NULL,
  `id_type_content` tinyint(2) NOT NULL DEFAULT '0',
  `hash` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Посты';

-- --------------------------------------------------------

--
-- Структура таблицы `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'пользователь, который подписался',
  `id_author` int(11) NOT NULL COMMENT 'пользователь, на которого подписались'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписки';

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(30) NOT NULL DEFAULT 'mail@mail.ru',
  `login` varchar(30) NOT NULL DEFAULT 'user',
  `access_level` tinyint(1) NOT NULL DEFAULT '0',
  `pass` varchar(15) NOT NULL DEFAULT '-',
  `img` varchar(50) NOT NULL DEFAULT 'user.svg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица пользователей';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `content_type`
--
ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_name` (`name`),
  ADD UNIQUE KEY `ix_class` (`class`);

--
-- Индексы таблицы `hashtag`
--
ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_hash` (`hash`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users` (`login`),
  ADD UNIQUE KEY `ix_email` (`email`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `content_type`
--
ALTER TABLE `content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `hashtag`
--
ALTER TABLE `hashtag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
