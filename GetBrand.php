<?php
require_once 'AllFunction.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $oper = AllFunction::getBrandAll();
    if ($oper) {
        $correctedRun["Status"] = 1;
        $correctedRun["Brand"] = $oper;
     print json_encode($correctedRun,JSON_UNESCAPED_UNICODE);
    } else {
        print json_encode(array(
            "Status" => 2,
            "Brand" => "Error function getBrandAll php server"
        ));
    }
}