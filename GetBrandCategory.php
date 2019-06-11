<?php
require_once 'AllFunction.php';
if ($_SERVER['REQUEST_METHOD'] == 'GET') {

    if (isset($_GET['id_brand'])) {

        $mParameters = $_GET['id_brand'];


        $fun_save = AllFunction::getCategoryBrandAll($mParameters);


        if ($fun_save) {

            $correctedRun["Status"] = "1";
            $correctedRun["Brand_category"] = $fun_save;
           print json_encode($correctedRun,JSON_UNESCAPED_UNICODE);
              } else {
        
            print json_encode(
                array(
                    'Status' => '2',
                    'Brand_category' => 'Error php all category brand'
                )
            );
        }

    } else {
       
        print json_encode(
            array(
                'Status' => '3',
                'Brand_category' => 'Error identity  all category brand'
            )
        );
    }
}