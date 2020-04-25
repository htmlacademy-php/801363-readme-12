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

if(isset($_GET['id']) && ((int)$_GET['id'] <=0 || (int)$_GET['id'] > 5)) {   // проверка диапазона номеров категорий что б не ввели что не нужно
    unset($_GET['id']);
}

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

//$array[] = ['title'=>'Цитата', 'type'=>'post-quote', 'description'=>'Мы в жизни любим только раз, а после ищем лишь похожих', 'login'=>'Лариса', 'avatar'=>'userpic-larisa-small.jpg'];
//$array[] = ['title'=>'Игра престолов', 'type'=>'post-text', 'description'=>'Не могу дождаться начала финального сезона своего любимого сериала!', 'login'=>'Владик', 'avatar'=>'userpic.jpg'];
//$array[] = ['title'=>'Наконец, обработал фотки!', 'type'=>'post-photo', 'description'=>'rock-medium.jpg', 'login'=>'Виктор', 'avatar'=>'userpic-mark.jpg'];
//$array[] = ['title'=>'Моя мечта', 'type'=>'post-photo', 'description'=>'coast-medium.jpg', 'login'=>'Лариса', 'avatar'=>'userpic-larisa-small.jpg'];
//$array[] = ['title'=>'Лучшие курсы', 'type'=>'post-link', 'description'=>'www.htmlacademy.ru', 'login'=>'Владик', 'avatar'=>'userpic.jpg'];

foreach($array as $k=>$v) {
    $tim = generate_random_date($k);
    $array[$k]['datetime'] = $tim;
    $array[$k]['show_date'] = date('d.m.Y H:i', strtotime($tim));
    $array[$k]['interval'] = calc_local_time($tim);
}

//wtf($array);

//
//$array[1]['description'] = crop('Церковь - это не здание, церковь - это, прежде всего люди, прихожане, мы с вами. От нас многое зависит. Один батюшка с матушкой просто всех не вытянут, тем более забот у них - “выше крыши” всегда. Это и воскресная школа и приход, и организация молодёжи (та же “Гармония”).
//Что я хотел бы сказать: нужно нам (прихожанам), как-то собраться всем и поговорить. Мы же община, нас объединил сам Господь под сводами нашей церкви. Почему бы не развить эту тему дальше?
//Что если мы начнём друг-другу помогать? С самых простых вещей. 100% у нас на приходе есть люди, которые что то умеют делать лучше остальных, например: штукатурить или вязать варежки или у кого-то есть грузовая машина, что бы что то куда-то отвезти… Почему бы не разузнать это и не обращаться именно к этим людям? За услуги конечно нужно платить, но так - мы будем платить “денюжку” своим же. Да и, мне кажется, что в этом случае мы хотя бы будем знать к какому человеку мы обращаемся.
//Давно пора понять, что мы не просто так собрались. Помогать друг-другу, не это ли одна из заповедей?.. Нам нужно своими действиями показывать, что мы вместе, что мы не просто пришли, постояли, (хорошо, если помолились :) ) и разошлись в ночи…
//У нас (прихожан) появится действительно серьёзная, добрая сила, которая будет помогать другим не просто потому что на вопрос:
//Ты Православный?
//Мы будем отвечать что то типа:
//Конечно… Я каждое воскресенье в церковь хожу...
//Но и еще что-то. Что то осязаемое, что можно будет поставить в пример тем же нашим детям. Ведь вера в Бога подразумевает именно помощь ближнему. После прочтения этой статьи, напишите Ваше отношение к такой идее или, возможно, у Вас появятся какие-то свои предложения?.. Будем рады их обсудить и самое главное - воплотить в жизнь.');

$main = include_template('main.php', ['array'=>$array]);

print(include_template('layout.php', ['main'=>$main, 'is_auth'=>$is_auth, 'user_name'=>$user_name]));
?>
