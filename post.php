<?php
include_once ('./functions.php');
include_once ('./helpers.php');


<<<<<<< HEAD
if(isset($_GET['id']) )
$link = open_DB();
$ask = q($link, "
SELECT * FROM `post`
WHERE post.id = ".(int)$_GET['id']."
");

if($ask->num_rows) {
    $row = $ask->fetch_assoc();

$ask = q($link, "
SELECT * FROM `content_type` WHERE
`id` = ".(int)$row['id_type_content']."
LIMIT 1
");

    $post = print(include_template('content_'.$row['class'].'.php', ['itm'=>$row]));
    print(include_template('post-item.php', ['itm'=>$row, 'post'=>$post]));

} else {
    echo 'not writers';
}

=======
if(isset($_GET['id']) ) {
    $link = open_DB();
    $ask = q($link, "
SELECT post.*, content_type.id AS CONTENT_ID, content_type.class, users.id AS USER_ID, users.img AS AVATAR, users.login FROM `post`
LEFT JOIN `content_type` ON
post.id_type_content = content_type.id
LEFT JOIN `users` ON
post.id_user = users.id
WHERE post.id = " . (int)$_GET['id'] . "
");

    if ($ask->num_rows) {
        $row = $ask->fetch_assoc();

        $ask = q($link, "
SELECT COUNT(*) FROM `post` WHERE `id_user` = " . (int)$row['USER_ID'] . "
");

        if ($ask->num_rows) {
            $row['count_pub'] = $ask->fetch_assoc()['COUNT(*)'];
        }

        $ask = q($link, "
SELECT COUNT(*) FROM `subscriptions` WHERE `id_author` = " . (int)$row['USER_ID'] . "
");

        if ($ask->num_rows) {
            $row['count_subs'] = $ask->fetch_assoc()['COUNT(*)'];
        }

//    wtf($row);

        $post = include_template('content_' . $row['class'] . '.php', ['itm' => $row]);
        print(include_template('post-item.php', ['itm' => $row, 'post' => $post]));

    } else {
        echo '404';
    }
} else {
    echo 'Не верно заданы параметры $GET["id"]';
}
>>>>>>> aec6f343301cdef726fd19b26a1b0245e4051fdf
