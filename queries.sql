INSERT INTO `comment` (`id`, `datetime`, `text`, `id_user`, `id_post`) VALUES
(1, '2020-04-14 12:16:34', 'Даже не думал, что такое возможно!...', 1, 1),
(2, '2020-04-14 12:16:34', 'Вот это номер! Как так получилось?', 2, 3),
(3, '2020-04-14 12:17:17', 'Это - фейк стопудово. Я там была - всё это - наглая ложь...', 2, 2);

INSERT INTO `content_type` (`id`, `name`, `class`) VALUES
(1, 'Текст', 'text'),
(2, 'Цитата', 'quote'),
(3, 'Картинка', 'photo'),
(4, 'Видео', 'video'),
(5, 'Ссылка', 'link');

INSERT INTO `post` (`id`, `datetime`, `title`, `text`, `author`, `img`, `youtube`, `link`, `count`, `id_user`, `id_type_content`, `hash`) VALUES
(1, '2020-04-14 12:00:57', 'Цитата', 'Мы в жизни любим только раз, а после ищем лишь похожих', 'Неизвестный Автор', 'none.svg', 'none', 'none', 7, 1, 2, NULL),
(2, '2020-04-14 12:03:32', 'Игра престолов', 'Не могу дождаться начала финального сезона своего любимого сериала!', '-', 'none.svg', 'none', 'none', 0, 2, 1, NULL),
(3, '2020-04-14 12:05:29', 'Наконец, обработал фотки!', NULL, '-', 'rock-medium.jpg', 'none', 'none', 21, 1, 3, NULL),
(4, '2020-04-14 12:06:23', 'Моя мечта', NULL, '-', 'coast-medium.jpg', 'none', 'none', 10, 2, 3, NULL),
(5, '2020-04-14 12:07:40', 'Лучшие курсы', NULL, '-', 'none.svg', 'none', 'www.htmlacademy.ru', 4, 1, 5, NULL);

INSERT INTO `users` (`id`, `datetime`, `email`, `login`, `access_level`, `pass`, `img`) VALUES
(1, '2020-04-14 10:58:25', 'vasya@mail.ru', 'robocop', 0, 'secret', 'user.svg'),
(2, '2020-04-14 10:58:25', 'termik@mail.ru', 'terminator', 0, 'secret2', 'user.svg');
COMMIT;
