<?php
include_once ('./functions.php');
include_once ('./helpers.php');


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

