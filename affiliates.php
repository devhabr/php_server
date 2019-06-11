<?php

require_once 'MysqlManager.php';

class affiliates {

    public static function get($urlSegments) {

    }

    public static function post($urlSegments) {

        if (!isset($urlSegments[0])) {
            throw new ApiException(
                400,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                "No $_SERVER[REQUEST_URI] no result"
            );
        }

        switch ($urlSegments[0]) {
            case "register":
                return self::saveAffiliate();
                break;
            case "login":
                return self::authAffiliate();
                break;
            default:
                throw new ApiException(
                    404,
                    0,
                    "er",
                    "https://waterwaters.000webhostapp.com/", "No  \"affiliates/$urlSegments[0]\".");
        }
    }

    public static function put($urlSegments) {

    }

    public static function delete($urlSegments) {

    }

    private static function saveAffiliate() {
        $parameters = file_get_contents('php://input');
        $decodedParameters = json_decode($parameters, true);
        if (json_last_error() != JSON_ERROR_NONE) {
            $internalServerError = new ApiException(
                500,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                "Error parsing JSON: " . json_last_error_msg());
            throw $internalServerError;
        }
        if (!isset($decodedParameters["id_user"]) ||
            !isset($decodedParameters["password"]) ||
            !isset($decodedParameters["nickname_user"]) ||
            !isset($decodedParameters["email_user"])
        ) {
            throw new ApiException(
                400,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                " params");
        }

        $dbResult = self::insertAffiliate($decodedParameters);

        if ($dbResult) {
            return ["status" => 201, "message" => "reg"];
        } else {
            throw new ApiException(
                500,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                "Error ");
        }
    }

    private static function authAffiliate() {

        $parameters = file_get_contents('php://input');
        $decodedParameters = json_decode($parameters, true);

        if (json_last_error() != JSON_ERROR_NONE) {
            $internalServerError = new ApiException(
                500,
                0,
                "Error auth",
                "https://waterwaters.000webhostapp.com/",
                "Error parsing JSON. " . json_last_error_msg());
            throw $internalServerError;
        }
        if (!isset($decodedParameters["id_user"]) ||
            !isset($decodedParameters["password"])
        ) {
            throw new ApiException(
                400,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                "atribut \"id\" o \"password\" "
            );
        }

        $userId = $decodedParameters["id_user"];
        $password = $decodedParameters["password"];

        $dbResult = self::findAffiliateByCredentials($userId, $password);

        if ($dbResult != NULL) {
            return [
                "status" => 200,
                "id_user" => $dbResult["id_user"],
                "nickname_user" => $dbResult["nickname_user"],
                "email_user" => $dbResult["email_user"],
                "token" => $dbResult["token"]
            ];
        } else {
            throw new ApiException(
                400,
                0,
                " Error",
                "https://waterwaters.000webhostapp.com/",
                "id \"$userId\" pass \"$password\"correct."
            );
        }
    }

    private static function insertAffiliate($decodedParameters) {
        $id = $decodedParameters["id_user"];
        $password = $decodedParameters["password"];
        $name = $decodedParameters["nickname_user"];
        $address = $decodedParameters["email_user"];
        $hashPassword = password_hash($password, PASSWORD_DEFAULT);

        // Generar token
        $token = uniqid(rand(), TRUE);

        try {
            $pdo = MysqlManager::get()->getDb();
            $sentence = "INSERT INTO user (id_user, pass_hash, nickname_user, email_user, token)" .
                " VALUES (?,?,?,?,?)";

            $preparedStament = $pdo->prepare($sentence);
            $preparedStament->bindParam(1, $id);
            $preparedStament->bindParam(2, $hashPassword);
            $preparedStament->bindParam(3, $name);
            $preparedStament->bindParam(4, $address);
            $preparedStament->bindParam(5, $token);

      
            return $preparedStament->execute();

        } catch (PDOException $e) {
            throw new ApiException(
                500,
                0,
                "Error",
                "https://waterwaters.000webhostapp.com/",
                "Message: " . $e->getMessage());
        }
    }

    private static function findAffiliateByCredentials($userId, $password) {
        try {
            $pdo = MysqlManager::get()->getDb();

         
            $sentence = "SELECT * FROM user WHERE id_user=?";

      
            $preparedSentence = $pdo->prepare($sentence);
            $preparedSentence->bindParam(1, $userId, PDO::PARAM_INT);


            if ($preparedSentence->execute()) {
                $affiliateData = $preparedSentence->fetch(PDO::FETCH_ASSOC);

             
                if (password_verify($password, $affiliateData["pass_hash"])) {
                    return $affiliateData;
                } else {
                    return null;
                }

            } else {
                throw new ApiException(
                    500,
                    0,
                    "Error pass_hash",
                    "https://waterwaters.000webhostapp.com/",
                    "Desc:" . $pdo->errorInfo()[2]
                );
            }

        } catch (PDOException $e) {
            throw new ApiException(
                500,
                0,
                "Error ",
                "https://waterwaters.000webhostapp.com/",
                " " . $e->getMessage());
        }
    }

}
?>