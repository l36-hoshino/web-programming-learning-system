<?php

$program = "";//空のストリング代入
$token_objects = array();//空の配列を代入
$error_messages = array();//空の配列を代入
$include_list = array();//空の配列を代入
$print_error_messages = [];

header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER["REQUEST_METHOD"] == "POST") {

    $postData = file_get_contents('php://input');
    $requestData = json_decode($postData, true);



    if (isset($requestData["program"])) {//入力フォームが空ではない時
        $program = $requestData["program"];//入力されたプログラムを保存
        require_once './parse_tokens.php';
        require_once './split_tokens.php';
        require_once './group_bracket_content.php';
        require_once './check_grammar.php';
        require_once './join_k.php';
        require_once './checkT.php';
        require_once './create_error_messages.php';

        $tokens = split_tokens($program);//字句分割
        $token_objects = parse_tokens($tokens);//字句解析
        $token_parentheses_objects = groupBracketContent($token_objects);//括弧内オブジェクトの作成
        $token_parentheses_objects = joinK($token_parentheses_objects);//配列の[]をIDの中に結合
        checkGrammar($token_parentheses_objects);//文法確認
        checkT($token_parentheses_objects);

        usort($error_messages, 'compare_objects');

        $print_error_messages = create_error_messages($error_messages);

        error_log("Generated error messages: " . print_r($print_error_messages, true));
    }
}

function put_error_message($line,$type,$content){//エラーメッセージを配列に追加する関数
    global $error_messages;//エラーメッセージ配列変数のグローバル呼び出し
    $size = sizeof($error_messages);//配列サイズ
    $error_messages[$size] = new error_();//エラーオブジェクトのインスタンス
    $error_messages[$size]->line = $line;//行番号
    $error_messages[$size]->type = $type;//タイプ
    if($type=="B"){//もしエラーメッセージがタイプBだったら予約語番号を代入
        $error_messages[$size]->number = $content;
    }else{//Aだったらそのまま代入
        $error_messages[$size]->message = $content;
    }
}
//ソートのためのcompare_objects
function compare_objects($a, $b) {
    return $a->line - $b->line;
}

class error_{//エラーオブジェクト
    public $line;//行番号
    public $type;//タイプ
    public $message;//メッセージ
    public $number;//タイプBだった時の予約語番号
}


header('Content-Type: application/json');
echo json_encode(['print_error_messages' => $print_error_messages]);
exit();
?>