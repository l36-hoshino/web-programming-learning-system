<?php

function cleanCompileErrorMessage($str,$file_name) {
    $result = "";
    $lines = preg_split('/\n/', $str);
    foreach ($lines as $line){

        if(strpos($line, ' | ' ) || strpos($line, ' |' )){
            //echo($line."<br>");
        }else{
            $line = str_replace($file_name.":", '', $line);
            $result .= $line . "\n";
        }
    }
    return $result;
}

?>