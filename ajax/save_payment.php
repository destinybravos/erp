<?php  
session_start();
date_default_timezone_set("Africa/Lagos");
$user_id = $_SESSION['id'];
include_once "connect.php";

if(isset($_POST['data'])){
    $formData = $_POST['data'];
    parse_str($formData, $data);
    $customerID = $data['customerID'];
    $mode = $data['payment_mode'];
    $amt_paid = (int)$data['amount'];
    $total = $data['total'];
    $sales_id = $data['saleid'];
    $cashTender = (int)$data['cashtender'];
    $totalAmountPaid = $amt_paid + $cashTender;
    $bal = (int)$totalAmountPaid - (int)$total;
    $payment = "Payment made for product sales with invoice number <strong>#" . $sales_id . "</strong> on ". date('l jS F, Y');
    $paymentQuery = $conn->query("INSERT INTO payment(cust_id, sales_id, payment, amount, user_id, modeofpayment, remaining) VALUES('". $customerID ."','". $sales_id ."','". $payment ."','". $amt_paid ."','". $user_id ."','". $mode ."','". $bal ."')");
    if($paymentQuery){
        $updateQuery = $conn->query("UPDATE sales SET cash_tendered='".$totalAmountPaid."', amount_due='". $bal ."', payment_status='Paid' WHERE sales_id='". $sales_id . "'");
        $record_history = history_log($user_id, $sales_id, $customerID, $conn);
        $data = ['status'=>2, 'sales'=>$sales_id];
        echo json_encode($data);
    }else{
        $data = ['status'=>1, 'sales'=>$sales_id];
        echo json_encode($data);
    }
}else{
        $data = ['status'=>0];
        echo json_encode($data);
}

function history_log($user_id, $sales_id, $client_id, $conn){
    $action = " accepted payment for  sales in respect to invoice with saled id <strong>#" . $sales_id . "</strong> from ";
    $insert = $conn->query("INSERT INTO history_log(user_id, action, tag, client_id) VALUES('". $user_id ."','". $action ."','payment','". $client_id ."')");
}

?>



