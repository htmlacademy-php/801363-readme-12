<?php
$link = open_DB();
q($link, "
SELECT * FROM `post` WHERE `id` = 1
");

print(include_template('post-item.php', ['main'=>$main, 'is_auth'=>$is_auth, 'user_name'=>$user_name]));
