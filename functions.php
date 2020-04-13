<?php
function crop($text, $count=300) {
    $count = (int)$count;
    if(strlen($text) <= $count) {
        return $text;
    } else {
        $array = explode(' ', $text);
        $res = '';
        foreach($array as $itm) {
            if(strlen($res) + (strlen($itm)+1) >= $count) {
                break;
            } else {
                $res .= $itm.' ';
            }
        }
        $res .= '...'.'<a class="post-text__more-link" href="#">Читать далее</a>';
       return $res;
    }
}

function out_secur($var) {
    if(!is_array($var)) {
        $var = htmlspecialchars($var);
    } else {
        $var = array_map('out_secur', $var);
    }
    return $var;
}

function db_secur($var, $key = 0) {
    if(!is_array($var)) {
        $var = DB::_($key)->real_escape_string($var);
    } else {
        $var = array_map('db_secur', DB::_($key)->real_escape_string($var));
    }
    return $var;
}

function trimAll($var) {
    if(!is_array($var)) {
        $var = trim($var);
    } else {
        $var = array_map('trimAll', $var);
    }
    return $var;
}

function wtf($array, $stop = false) {
    echo '<pre>'.print_r($array,1).'</pre>';
    if(!$stop) {
        exit();
    }
}

function calc_local_time($datetime) {
    $dat = strtotime($datetime);
    $diff = time() - $dat;

    if($diff < 3600) {
        $i = $diff / 60;
        $ans = get_noun_plural_form($i, 'минута', 'минуты', 'минут');
        return $i.' '.$ans.' назад.';
    } elseif($diff < 86400) {
        $i = $diff / 60 / 60;
        $ans = get_noun_plural_form($i, 'час', 'часа', 'часов');
        return $i.' '.$ans.' назад.';
    } elseif($diff < 604800) {
        $i = $diff / 60 / 60 / 24;
        $ans = get_noun_plural_form($i, 'день', 'дня', 'дней');
        return $i.' '.$ans.' назад.';
    } elseif($diff < 2592000) {
        $i = $diff / 60 / 60 / 24 / 7;
        $ans = get_noun_plural_form($i, 'неделя', 'недели', 'недель');
        return $i.' '.$ans.' назад.';
    } else {
        $i = floor($diff / 60 / 60 / 24 / 7 / 4);
        $ans = get_noun_plural_form($i, 'месяц', 'месяца', 'месяцев');
        return $i.' '.$ans.' назад.';
    }

}
