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
}elseif ($action == 'edit_branch') {
    $data = $_POST['data'];
    $queryCheck = $conn->query("SELECT * FROM branch WHERE branch_id='$data'");
    echo json_encode($queryCheck->fetch_assoc());
}elseif ($action == 'edit_users') {
    $data = $_POST['data'];
    $queryCheck = $conn->query("SELECT * FROM users WHERE id='$data'");
    echo json_encode($queryCheck->fetch_assoc());
}



?>