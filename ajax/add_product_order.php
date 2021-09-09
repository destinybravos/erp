<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$product_id = $_POST['id'];
$qty = $_POST['qty'];

if(!isset($_SESSION['ORDER_ID'])){
    $order_id = generateNumber(4) . $product_id;
    $_SESSION['ORDER_ID'] = $order_id;
}else{
    $order_id = $_SESSION['ORDER_ID'];
}

$sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id ."' AND item_id='".$product_id ."'");
if($sqlQuery->num_rows > 0){
    $update = $conn->query("Update order_cart SET qty= qty + '" . $qty ."' WHERE order_id='". $order_id ."' AND item_id='".$product_id ."'");
    $amount = number_format(getAmount($order_id, $conn));
    $data = ['order_id'=>$order_id, 'amount'=>$amount];
    echo json_encode($data);   
}else{
    $getProductQuery = $conn->query("SELECT * FROM product WHERE prod_id='" . $product_id . "'");
    $data = $getProductQuery->fetch_assoc();
    $cost = (int)$data['prod_cost_price'];
    $item = $data['prod_name'];
    $amt = $cost *  $qty;
    $insertQuery = $conn->query("INSERT INTO order_cart(order_id,item_id,qty,item,unit_price,amount) VALUES('". $order_id ."','". $product_id ."','". $qty ."','". $item ."','". $cost ."','". $amt ."')");
    
    if($insertQuery){
        $amount = number_format(getAmount($order_id, $conn));
        $data = ['order_id'=>$order_id, 'amount'=>$amount];
        echo json_encode($data);
    }else{
        echo 1;
    }
    
}

function getAmount($order_id, $conn){
    $amt = 0;
    $sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id . "' ORDER BY cart_id DESC");
    while($data = $sqlQuery->fetch_assoc()){
        $amt += (int)$data['amount'];
    }
    return $amt;
}



function generateNumber($num_digit){
    $num = "";
    for($i = 1; $i <= $num_digit; $i++){
        $num = $num . rand(1, 9);
    }
    return $num;
}

?>
