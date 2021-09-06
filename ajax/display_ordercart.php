<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$order_id = $_POST['order_id'];
if($order_id != ""){
    $sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id . "' ORDER BY cart_id DESC");
    if($sqlQuery->num_rows > 0){
    while($data = $sqlQuery->fetch_assoc()){
        echo '
        <tr>
        <td>' . $data['item'] . '</td> 
        <td>' . $data['qty'] . '</td>  
        <td>' . $data['unit_price'] . '</td> 
        <td>&#8358; ' . number_format($data['amount']) . '</td> 
        </tr>
        ';
    }
    
    }else{
        echo '<tr>
        <td colspan="3"> No Item Added Yet</td>
    </tr>';
    }
}else{
    if(!isset($_SESSION['ORDER_ID'])){
        echo '<tr>
            <td colspan="3"> No Current Order List</td>
        </tr>';
    }else{
        $order_id = $_SESSION['ORDER_ID'];
        $sqlQuery = $conn->query("SELECT * FROM order_cart WHERE order_id='". $order_id . "' ORDER BY cart_id DESC");
        if($sqlQuery->num_rows > 0){
        while($data = $sqlQuery->fetch_assoc()){
            echo '
            <tr>
            <td>' . $data['item'] . '</td> 
            <td>' . $data['qty'] . '</td> 
            <td>' . $data['unit_price'] . '</td> 
            <td>&#8358; ' . number_format($data['amount']) . '</td> 
            </tr>
            ';
        }
        
        }else{
            echo '<tr>
            <td colspan="3"> No Item Added Yet</td>
        </tr>';
        }
    }

}


?>
