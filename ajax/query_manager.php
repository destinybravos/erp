<?php

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$action = $_POST['action'];

if ($action == 'delete_product') {
    $product_id = $_POST['product_id'];
    $sqlQuery = $conn->query("DELETE FROM product WHERE prod_id='". $product_id . "'");
    if($sqlQuery){
        echo 1;    
    }else{
        echo 0;
    }
}



?>