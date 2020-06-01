CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `id_user` int(11) NOT NULL,
  `id_post` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица комментариев';

CREATE TABLE `content_type` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '-',
  `class` varchar(20) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Тип контента';

CREATE TABLE `hashtag` (
  `id` int(11) NOT NULL,
  `hash` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `like_type` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписка';

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` text,
  `id_user` int(11) NOT NULL,
  `id_targ_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Чат';

CREATE TABLE `post` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(150) NOT NULL DEFAULT '-',
  `text` text,
  `author` varchar(100) NOT NULL DEFAULT '-',
  `img` varchar(100) NOT NULL DEFAULT 'none.svg',
  `youtube` varchar(100) NOT NULL DEFAULT 'none',
  `link` varchar(100) NOT NULL DEFAULT 'none',
  `count` int(11) NOT NULL DEFAULT '0',
  `id_user` int(11) NOT NULL,
  `id_type_content` tinyint(2) NOT NULL DEFAULT '0',
  `hash` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Посты';

CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL,
  `id_user` int(11) NOT NULL COMMENT 'пользователь, который подписался',
  `id_author` int(11) NOT NULL COMMENT 'пользователь, на которого подписались'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Подписки';

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(30) NOT NULL DEFAULT 'mail@mail.ru',
  `login` varchar(30) NOT NULL DEFAULT 'user',
  `access_level` tinyint(1) NOT NULL DEFAULT '0',
  `pass` varchar(15) NOT NULL DEFAULT '-',
  `img` varchar(50) NOT NULL DEFAULT 'user.svg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица пользователей';


ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_name` (`name`),
  ADD UNIQUE KEY `ix_class` (`class`);

ALTER TABLE `hashtag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_hash` (`hash`);

ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `message`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `post`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ix_users` (`login`),
  ADD UNIQUE KEY `ix_email` (`email`);


ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `hashtag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
