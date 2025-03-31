<?php
$program = "";
$input = "";
$compileError_executionResult = "";

header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    exit(0);
}else if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $postData = file_get_contents('php://input');
    $requestData = json_decode($postData, true);

    if (isset($requestData["program"])) {
        $program = $requestData["program"];
        $input = isset($requestData["input"]) ? $requestData["input"] : "";

        require_once './compile_and_run.php';
        $compileError_executionResult = compile_and_run($program, $input);
    } else {
        $compileError_executionResult = "Error: Program or input not provided.";
    }
} else {
    $compileError_executionResult = "Error: Invalid request method.";
}

header('Content-Type: application/json');
echo json_encode([
    'compileErrorExecutionResult' => $compileError_executionResult
]);
exit();
?>