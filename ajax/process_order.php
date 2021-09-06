<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$action = $_POST['action'];

if(!isset($_SESSION['ORDER_ID'])){
    echo 1;
}else{
    $order_id = $_SESSION['ORDER_ID'];
    if($action == 'save'){
        $no_item = 0;
        $sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id ."'");
        while($cartData = $sqlQuery->fetch_assoc()){
            $product_id = $cartData['item_id'];
            $qty = $cartData['qty'];
            $insertQuery = $conn->query("INSERT INTO purchase_request(prod_id, order_id, qty) VALUES('". $product_id ."','". $order_id ."','". $qty ."')");
            if($insertQuery){
                $no_item++;
            }
        }
        if($no_item > 0){
            $amount = getAmount($order_id, $conn);
            $insertOrder = $conn->query("INSERT INTO orders(order_id, no_items, amount) VALUES('". $order_id ."', '". $no_item ."','". $amount ."')");
            if($insertOrder){
                clearCart($order_id, $conn);
                echo 2;
            }else{
                echo 0;
            }
        }else{
            echo 0;
        }
    }else{
        clearCart($order_id, $conn);
        echo 2;
    }
}

function clearCart($order_id, $conn){
    $delQuery = $conn->query("DELETE FROM order_cart WHERE order_id='". $order_id . "'");
    unset($_SESSION['ORDER_ID']);
}

function getAmount($order_id, $conn){
    $amt = 0;
    $sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id . "' ORDER BY cart_id DESC");
    while($data = $sqlQuery->fetch_assoc()){
        $amt += (int)$data['amount'];
    }
    return $amt;
}




?>
