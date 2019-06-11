<?php

require_once "View.php";
class JsonView extends View {

    public function render($body) {
 
        if (isset($body["status"])) {
            http_response_code($body["status"]);
        }
        header('Content-Type: application/json; charset=utf8');
        $jsonResponse = json_encode($body, JSON_PRETTY_PRINT, JSON_UNESCAPED_UNICODE);

        if (json_last_error() != JSON_ERROR_NONE) {
            $internalServerError = new ApiException(
                500,
                0,
                "Contact admin",
                "https://waterwaters.000webhostapp.com/",
                "Parse json er: " . json_last_error_msg());
            throw $internalServerError;
        }

        echo $jsonResponse;

        exit;
    }
}
?>