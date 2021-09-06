<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

if(isset($_SESSION['SALES_ID'])){
    $sales_id = $_SESSION['SALES_ID'];
    $sqlQuery = $conn->query("DELETE FROM cart WHERE sales_id='". $sales_id ."'");
    if($sqlQuery){
        unset($_SESSION['SALES_ID']);
        echo 1;
    }else{
        echo 2;
    }
}else{
    echo 0;
}


?>