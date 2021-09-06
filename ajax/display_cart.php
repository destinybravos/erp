<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$sales_id = $_POST['sale_id'];
if($sales_id != ""){
    $sqlQuery = $conn->query("SELECT * FROM cart WHERE sales_id='". $sales_id . "' ORDER BY cart_id DESC");
    if($sqlQuery->num_rows > 0){
    while($data = $sqlQuery->fetch_assoc()){
        echo '
        <tr>
        <td>' . $data['item'] . '</td> 
        <td><input type="text" value="' . $data['qty'] . '" size="1" /></td> 
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
    if(!isset($_SESSION['SALES_ID'])){
        echo '<tr>
            <td colspan="3"> No Current Transaction</td>
        </tr>';
    }else{
        $sales_id = $_SESSION['SALES_ID'];
        $sqlQuery = $conn->query("SELECT * FROM cart WHERE sales_id='". $sales_id . "' ORDER BY cart_id DESC");
        if($sqlQuery->num_rows > 0){
        while($data = $sqlQuery->fetch_assoc()){
            echo '
            <tr>
            <td>' . $data['item'] . '</td> 
            <td><input type="text" value="' . $data['qty'] . '" size="1" /></td> 
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
