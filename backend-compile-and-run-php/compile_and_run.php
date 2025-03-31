<?php
function compile_and_run($program, $input){
    if (!is_dir("Program")) {
        mkdir("Program", 0777, true);
    }
    chdir("Program");

    $file_name = uniqid('code_') . '.c';
    file_put_contents($file_name, $program);


    $output_name = uniqid('program_') . '.exe';
    $compile_result = shell_exec("gcc $file_name -o $output_name 2>&1");


    if ($compile_result !== null && strpos($compile_result, 'error') !== false) {
        unlink($file_name);
        chdir("../");

        //require_once './compile_error_message_clean.php';
        //$compile_result = cleanCompileErrorMessage($compile_result,$file_name);

        return "Compile error: $compile_result\n";
    }

    $descriptorspec = array(
        0 => array("pipe", "r"),  // stdin
        1 => array("pipe", "w"),  // stdout
        2 => array("pipe", "w")   // stderr
    );

    $process = proc_open($output_name, $descriptorspec, $pipes);

    if (!is_resource($process)) {
        unlink($file_name);
        unlink($output_name);

        chdir("../");

        return "Error: Unable to open process.\n";
    }

    fwrite($pipes[0], $input);
    fclose($pipes[0]);
    $output = "";

    $status = proc_get_status($process);

    $timeout =1;
    $is_done = 0;
    $start_time = microtime(true);
    while(proc_get_status($process)['running']) {
        if((microtime(true) - $start_time) >= $timeout){
            exec("taskkill /IM " . escapeshellarg($output_name) . " /F");
            proc_terminate($process);
            $output = "プログラムに無限ループまたは入力待ちになっている含む要素が無いか確かめてください。";
            $is_done = 1;
            break;
        }
    }
    if($is_done != 1) {
        $output_temp = stream_get_contents($pipes[1]);
        if (strlen($output_temp) > 600) {
            $output .= substr($output_temp, 0, 600) . '...';
        } else {
            $output .= $output_temp;
        }
    }

    foreach ($pipes as $pipe) {
        if (is_resource($pipe)) {
            fclose($pipe);
        }
    }

    proc_close($process);

    unlink($file_name);
    $result = @unlink($output_name);

    chdir("../");

    return $output;
}
?>
