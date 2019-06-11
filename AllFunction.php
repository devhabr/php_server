<?php
require_once 'Connection.php';
class AllFunction
{
    function __construct()
    {}
 public static function getBrandAll()
    {
        $quers = "SELECT * FROM brand_tovar";
        try {
            $coms= Connection::getInstance()->getDb()->prepare($quers);
    
            $coms->execute();

            return $coms->fetchAll(PDO::FETCH_ASSOC);

        } catch (PDOException $e) {
            return false;
        }
    }



 public static function getCategoryBrandAll($idBrand)
    {

        $my_query= "SELECT * FROM type_categories WHERE id_brand=?";
        try {
                $sql_new = Connection::getInstance()->getDb()->prepare($my_query);
               $sql_new ->execute(array($idBrand));
                  $row = $sql_new->fetchAll(PDO::FETCH_ASSOC);
            return $row;
        } catch (PDOException $e) {
                     return -1;
        }
    }








}




?>