<?php
session_start();

date_default_timezone_set("Africa/Lagos");

include_once "connect.php";

$sqlQuery = $conn->query("SELECT * FROM product");
if($sqlQuery->num_rows > 0){
    $totalQty = 0;
    while ($data = $sqlQuery->fetch_assoc()) {
        $totalQty++;
    }

    echo $totalQty;
    
}


?>
