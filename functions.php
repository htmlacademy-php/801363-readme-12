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
