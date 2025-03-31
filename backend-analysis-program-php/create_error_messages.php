<?php

function create_error_messages($error_messages)
{
    $error_messages_output = [];

    foreach ($error_messages as $s) {

        $error_message = [];
        $error_message['line_number'] = $s->line;
        $error_message['error_type'] = $s->type;
        $error_message['error_message'] = $s->message;
        $error_message['correct_grammar'] = [];

        if ($s->type == "B") {//タイプBの時
            $str_sql = "SELECT * FROM c_reserved_words WHERE word_number = " . $s->number;
            $rs = searchDB($str_sql);
            $result = '';
            while ($row = mysqli_fetch_assoc($rs)) {
                $result = $row['word'];
            }

            $str_sql = "SELECT * FROM c_grammar_error WHERE number = " . $s->number;
            $rs = searchDB($str_sql);

            $sss = [];

            while ($row = mysqli_fetch_assoc($rs)) {
                $ss = $row['grammar'];
                $ss = str_replace('\\n', '<br>', $ss);//正規の文法の中に改行があった時
                $ss = str_replace('\\t', '　　　　', $ss);//正規の文法の中に水平タブがあった時

                $sss[] = $ss;
            }


            $error_message['correct_grammar'] = $sss;
            $error_message['error_message'] = $result;
        }

        $error_messages_output[] = $error_message;
    }

    return $error_messages_output;
}


?>