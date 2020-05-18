<?php
date_default_timezone_set('Europe/Moscow');

include_once ('./functions.php');
include_once ('./helpers.php');

// функция q - находится там же, где и все остальные в functions.php там же происходит настройка и подключение к БД

$link = open_DB();

$ask = q($link, "
SELECT post.id, post.title, post.datetime, post.id_type_content, post.text, post.img, post.youtube, post.link, post.count, post.author, post.id_user, post.hash, users.id AS ID_USER, users.login, users.img AS avatar, content_type.id AS ID_CONTENT, content_type.class FROM `post`
LEFT JOIN `users` ON
post.id_user = users.id
LEFT JOIN `content_type` ON
post.id_type_content = content_type.id
ORDER BY post.count ASC
");

$array = [];
if($ask->num_rows) {
    while($row = $ask->fetch_assoc()) {
        if(isset($_GET['id'])) {
            if($row['id_type_content'] == $_GET['id']) {
                $array[] = $row;
            }
        } else {
            $array[] = $row;
        }
    }
}


$is_auth = rand(0, 1);

$user_name = 'Robin'; // укажите здесь ваше имя

foreach($array as $k=>$v) {
    $tim = generate_random_date($k);
    $array[$k]['datetime'] = $tim;
    $array[$k]['show_date'] = date('d.m.Y H:i', strtotime($tim));
    $array[$k]['interval'] = calc_local_time($tim);
}

$main = include_template('main.php', ['array'=>$array]);

print(include_template('layout.php', ['main'=>$main, 'is_auth'=>$is_auth, 'user_name'=>$user_name]));
?>
