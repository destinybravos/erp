<?php  
session_start();
date_default_timezone_set("Africa/Lagos");
$user_id = $_SESSION['id'];
include_once "connect.php";

if(isset($_POST['data'])){
    $formData = $_POST['data'];
    parse_str($formData, $data);
    $fname = $data['fname'];
    $lname = $data['lname'];
    $address = $data['address'];
    $phone = $data['phone'];
    $email = $data['email'];
    $total_qty = $data['total_qty'];
    $total_price = $data['total_price'];
    $sales_id = $data['sales_id'];

    // Check if a customer already exist
    $check_query = $conn->query("SELECT * FROM customer WHERE cust_contact='". $phone ."' OR cust_email='". $email ."'");
    if($check_query->num_rows < 1){
        // Store Customer Details
        $insert_query = "INSERT INTO customer(cust_first, cust_last, cust_address, cust_contact, cust_email, balance) VALUES('". $fname ."', '". $lname ."', '". $address ."', '". $phone ."', '". $email ."', '0.0')";
        $query = $conn->query($insert_query);
        if($query){
            $cust_id = getCustomerID($phone, $conn);
            $record_status = RecordSalesDet($cust_id, $sales_id, $user_id, $total_price, $conn);
            if($record_status > 0){
                unset($_SESSION['SALES_ID']);
                $data = ['status'=>2, 'sales'=>$sales_id];
                echo json_encode($data);
            }else{
                $data = ['status'=>3, 'sales'=>$sales_id];
                echo json_encode($data);
            }
        }else{
                $data = ['status'=>1, 'sales'=>$sales_id];
                echo json_encode($data);
        }
    }else{
        $cust_id = getCustomerID($phone, $conn);
        $record_status = RecordSalesDet($cust_id, $sales_id, $user_id, $total_price, $conn);
            if($record_status > 0){
                unset($_SESSION['SALES_ID']);
                $data = ['status'=>2, 'sales'=>$sales_id];
                echo json_encode($data);
            }else{
                $data = ['status'=>4, 'sales'=>$sales_id];
                echo json_encode($data);
            }
    }
}else{
        $data = ['status'=>0];
        echo json_encode($data);
}

function getCustomerID($phone, $conn)
{
    $fetchDet = $conn->query("SELECT * FROM customer WHERE cust_contact='". $phone ."'");
    $customer = $fetchDet->fetch_assoc();
    return $customer['cust_id'];
}

function RecordSalesDet($cust_id, $sales_id, $user_id, $total_price, $conn)
{
    $count  = 0;
    $save_query = $conn->query("INSERT INTO sales(sales_id, cust_id, user_id, amount_due, total) VALUES('". $sales_id ."','". $cust_id ."','". $user_id ."','". $total_price ."','". $total_price ."')");
    if($save_query == true){
        $saleDet = $conn->query("SELECT * FROM cart WHERE sales_id='". $sales_id ."'");
        while ($data = $saleDet->fetch_assoc()) {
            $prod_id = $data['item_id'];
            $price = $data['unit_price'];
            $qty = $data['qty'];
            $savedet = $conn->query("INSERT INTO sales_details(sales_id, prod_id, price, qty) VALUES('". $sales_id ."','". $prod_id ."','". $price ."','". $qty ."')");
            if($savedet){
                $delete = $conn->query("DELETE FROM cart WHERE sales_id='". $sales_id ."' AND item_id='". $prod_id ."'");
                $count++;
            }
        }
    }
    $record_history = history_log($user_id, $sales_id, $cust_id, $conn);
    return $count;
}


function history_log($user_id, $sales_id, $client_id, $conn){
    $action = " recorded sales invoice with number <strong>" . $sales_id . "</strong> for ";
    $insert = $conn->query("INSERT INTO history_log(user_id, action, tag, client_id) VALUES('". $user_id ."','". $action ."','sales','". $client_id ."')");
}



