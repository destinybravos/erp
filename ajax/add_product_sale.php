<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$product_id = $_POST['id'];

if(!isset($_SESSION['SALES_ID'])){
    $sales_id = generateNumber(4) . $product_id;
    $_SESSION['SALES_ID'] = $sales_id;
}else{
    $sales_id = $_SESSION['SALES_ID'];
}

$sqlQuery = $conn->query("SELECT * FROM cart WHERE sales_id='". $sales_id ."' AND item_id='".$product_id ."'");
if($sqlQuery->num_rows > 0){
    $data = $sqlQuery->fetch_assoc();
    $qty = (int)$data['qty'];
    $avaQty = getQty($product_id, $conn);
    if($qty >= $avaQty){
        echo 2;
    }else{
        $qty = $qty + 1;
        $updateQuery = $conn->query("UPDATE cart SET qty='" . $qty. "' WHERE sales_id='". $sales_id ."' AND item_id='".$product_id ."'");
        if($updateQuery){
            echo $sales_id;
        }else{
            echo 1;
        }
    }
    
}else{
    $getProductQuery = $conn->query("SELECT * FROM product WHERE prod_id='" . $product_id . "'");
    $data = $getProductQuery->fetch_assoc();
    $price = (int)$data['prod_price'];
    $qty = (int)$data['prod_qty'];
    if($qty > 1){
        $item = $data['prod_name'];
        $insertQuery = $conn->query("INSERT INTO cart(sales_id,item_id,item,unit_price,amount) VALUES('". $sales_id ."','". $product_id ."','". $item ."','". $price ."','". $price ."')");
        if($insertQuery){
            echo $sales_id;
        }else{
            echo 1;
        }
    }else{
        echo 2;
    }
    
}

function getQty($product_id, $conn){
    $getProductQuery = $conn->query("SELECT * FROM product WHERE prod_id='" . $product_id . "'");
    $data = $getProductQuery->fetch_assoc();
    $qty = (int)$data['prod_qty'];
    return $qty;
}



function generateNumber($num_digit){
    $num = "";
    for($i = 1; $i <= $num_digit; $i++){
        $num = $num . rand(1, 9);
    }
    return $num;
}

?>
