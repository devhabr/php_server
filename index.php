<?php

require 'data/affiliates.php';
require 'views/XmlView.php';
require 'views/JsonView.php';
require 'utils/ApiException.php';

$format = isset($_GET['format']) ? $_GET['format'] : 'json';

if (strcasecmp($format, 'xml') == 0) {
    $apiView = new XmlView();
} else {
    $apiView = new JsonView();
}


set_exception_handler(
    function (ApiException $exception) use ($apiView) {
        http_response_code($exception->getStatus());
        $apiView->render($exception->toArray());
    }
);


$resourceNotFound = new ApiException(404, 1000, "Serv", "https://waterwaters.000webhostapp.com/",
    "No exist: http://$_SERVER[HTTP_HOST]$_SERVER[REQUEST_URI]");


if (isset($_GET['PATH_INFO'])) {
    $urlSegments = explode('/', $_GET['PATH_INFO']);
} else {
    throw $resourceNotFound;
}

$resource = array_shift($urlSegments);
$apiResources = array('affiliates');

if (!in_array($resource, $apiResources)) {
    throw $resourceNotFound;
}


$httpMethod = strtolower($_SERVER['REQUEST_METHOD']);

switch ($httpMethod) {
    case 'get':
    case 'post':
    case 'put':
    case 'delete':
        if (method_exists($resource, $httpMethod)) {
            $apiResponse = call_user_func(array($resource, $httpMethod), $urlSegments);
            $apiView->render($apiResponse);
            break;
        }
    default:
      
        $methodNotAllowed = new ApiException(
            405,
            1001,
            "error",
            "http://localhost",
            "method $_SERVER[REQUEST_METHOD] res \"$resource\"");
        $apiView->render($methodNotAllowed->toArray());

}
?>

