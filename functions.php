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
