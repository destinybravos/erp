<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$sales_id = $_POST['sales_id'];
$sales_id = explode(':', $sales_id);
$sales_id = $sales_id[1];

$sqlQuery = $conn->query("SELECT * FROM cart WHERE sales_id='". $sales_id ."'");
if($sqlQuery->num_rows > 0){
    $totalQty = 0;
    $totlPrice = 0;
    while ($data = $sqlQuery->fetch_assoc()) {
        $totlPrice = $totlPrice + ((int)$data['qty'] * (int)$data['unit_price']);
        $totalQty++;
    }
    $data = ['status'=>'ok', 'sales_id'=>$sales_id, 'total'=>$totlPrice, 'quantity'=>$totalQty];
    echo json_encode($data);
}else{
    $data = ['status'=>'bad', 'sales_id'=>$sales_id];
    echo json_encode($data);
}


?>
