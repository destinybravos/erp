<?php
session_start();
date_default_timezone_set("Africa/Lagos");
?>
<style>
@media print{
    #foot_btn{
        display:none;
    }
    table{
        text-align:left !important;
    }
    tr, td, th{
        margin:10px auto !important;
    }
    #totalAmt{
        margin-top: 20px !important;
    }
}
</style>
<?php
include_once "connect.php";
include_once "head.php";

if(isset($_POST['sale_id'])){
    $sales_id = $_POST['sale_id'];
}elseif (isset($_GET['sale_id'])) {
    $sales_id = $_GET['sale_id'];
}else{
    $sales_id = '5815498';
}

$sqlQuery = $conn->query("SELECT * FROM sales WHERE sales_id='". $sales_id . "'");
if(isset($_SESSION['SALES_ID'])){
    unset($_SESSION['SALES_ID']);
}
if($sqlQuery->num_rows > 0){
    $saleData = $sqlQuery->fetch_assoc();
    $customerID = $saleData['cust_id'];
    $salePersonID = $saleData['user_id'];
    $amount = $saleData['total'];
    $transdate = $saleData['date_added'];
    $cashTender = (int)$saleData['cash_tendered'];
    $payment_status = $saleData['payment_status'];
//  Fetch all neccessary data for invoice
    $custQuery = $conn->query("SELECT * FROM customer WHERE cust_id='". $customerID . "'");
    $staffQuery = $conn->query("SELECT * FROM users WHERE id='". $salePersonID . "'");
    $proQuery = $conn->query("SELECT * FROM sales_details WHERE sales_id='". $sales_id . "'");
    $payQuery = $conn->query("SELECT * FROM payment WHERE sales_id='". $sales_id . "'");

    // Strip some data into associative array
    $custData = $custQuery->fetch_assoc();
    $staffData = $staffQuery->fetch_assoc();
    $payData = $payQuery->fetch_assoc();
?>

<div class="container" style="padding:1px 10px; margin-top:90px;">
    <div class="row">
        <div class="col-md-8">
            <h4>Payment Status for Invoice : <?php echo $sales_id; 
            if($payment_status == "Paid"){?>
                <button class="btn btn-sm btn-success"> <i class="fa fa-check-circle"></i> <?php echo $payment_status; ?></button>
            <?php 
            }else{?>
                <button class="btn btn-sm btn-danger"> <i class="fa fa-times-circle"></i> <?php echo $payment_status; ?> </button>
            <?php }
 ?>
             </h4>
        </div>
        <div class="col-md-4" style="text-align:right; padding:10px;">
            <small> 
                <?php echo date('l jS F, Y', strtotime($transdate)); ?> <br>
                @ <?php echo date('g:i a', strtotime($transdate)); ?> <br>
             </small>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th width="30%">Customer Name: </th>
                        <td width="70%"> <?php echo $custData['cust_first'] . " " . $custData['cust_last']; ?></td>
                    </tr>
                    <tr>
                        <th>Customer Contact: </th>
                        <td> <?php echo $custData['cust_contact'] ; ?></td>
                    </tr>
                    <tr>
                        <th>Customer Email: </th>
                        <td> <?php echo $custData['cust_email']; ?></td>
                    </tr>
                    <tr>
                        <th>Sales Made By: </th>
                        <td> <?php echo $staffData['firstname'] . " " . $staffData['lastname']; ?></td>
                    </tr>
                    <tr>
                        <th>Total Amount: </th>
                        <td> &#8358; <?php echo number_format($amount); ?></td>
                    </tr>
                    <tr>
                        <th>Amount Paid: </th>
                        <td> &#8358; <?php echo number_format((int)$saleData['cash_tendered']); ?></td>
                    </tr>
                    
                    <tr>
                        <th>Balance: </th>
                        <td> &#8358; <?php echo number_format((int)$saleData['amount_due']); ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <form method="post" name="submit_pay">
    <div class="row">
        <div class="col-md-12">
            <h4 style="margin-top:20px;">Recieve Payment</h4>
            <div class="row">
                <div class="col-sm-6 form-group">
                    <label for="">Mode of Payment</label>
                    <select name="payment_mode" id="" class="form-control" required>
                        <option value="">Select Mode of Payment</option>
                        <option value="Cash <small>(Office Paypoint)</small>">Cash <small>(Office Paypoint)</small></option>
                        <option value="Mobile Transfer">Mobile Transfer</option>
                        <option value="Credit Card">Credit Card</option>
                    </select>
                </div>
                <div class="col-sm-6 form-group">
                    <label for="">Amount Recieved</label>
                    <input type="number" name="amount" id="" required class="form-control" placeholder="Paid/Received Amount"/>
                </div>
            </div>
        </div>
    </div>

    
    <div class="row" style="margin:30px; text-align:right;">
        <div class="col-md" id="">
            <a href="#" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-times-circle"></i> Close </a>
            <button type="submit" name="submit" class="btn btn-success btn-sm" style="color:white;"><i class="fa fa-save"></i> Save Payment </a>
        </div>
    </div>

    <input type="hidden" name="saleid" value="<?php echo $sales_id; ?>">
    <input type="hidden" name="customerID" value="<?php echo $customerID; ?>">
    <input type="hidden" name="total" value="<?php echo (int)$saleData['total']; ?>">
    <input type="hidden" name="cashtender" value="<?php echo  $cashTender; ?>">

    <?php
        // if(isset($_POST['submit'])){
        //     $mode = $_POST['payment_mode'];
        //     $amt_paid = (int)$_POST['amount'];
        //     $totalAmountPaid = $amt_paid + $cashTender;
        //     $bal = (int)$totalAmountPaid - (int)$saleData['total'];
        //     $payment = "Payment made for product sales with invoice number <strong>#" . $sales_id . "</strong> on ". date('l jS F, Y');
        //     $user_id = $_SESSION['id'];
        //     $paymentQuery = $conn->query("INSERT INTO payment(cust_id, sales_id, payment, user_id, modeofpayment, remaining) VALUES('". $customerID ."','". $sales_id ."','". $payment ."','". $user_id ."','". $mode ."','". $bal ."')");
        //     if($paymentQuery){
        //         $updateQuery = $conn->query("UPDATE sales SET cash_tendered='".$totalAmountPaid."', amount_due='". $bal ."', payment_status='Paid' WHERE sales_id='". $sales_id . "'");
        //         echo '<script> alert("Payment Recorded Successfully"); </script>';
        //     }else{
        //         echo '<script> alert("An Error Occured"); </script>';
        //     }
        // }
    ?>
    </form>
</div>

<?php
}else{
    ?>

<div class="container" style="padding:1px; margin-top:80px;">
    <div class="row">
        <div class="col-md-12">
            <h4 class="my-4 px-4">You can not view the payment details from this module! Please view it from the sales history module!</h4>
            <a href="sales_history.php" class="btn btn-primary mb-4 mx-4">View Sales History</a>
        </div>
    </div>
</div>

<?php
}
?>

<script>
    // function printWin() {
        
    // var base_url = window.location.origin;
    // // var host = window.location.host;
    // var pathArray = window.location.pathname;//.split( '/' );
    
    // url = base_url  + pathArray;
    // // alert(url)
    // var url2print = frames['frame'].src;
    // alert(url2print);
    //     // window.print(url);
    // }
$(document).ready(function(){
    $('form[name=submit_pay]').on('submit', function(e){
        e.preventDefault();
        $data = $('form[name=submit_pay]').serialize();
        $.ajax({
            type : 'post',
            url : 'ajax/save_payment.php',
            data : {data: $data},
            dataType : 'json',
            success : function (response) {
                if(response.status == 2){
                    alert("Payment Record Saved Successfully");
                    window.location = "";
                }else{
                    alert("An Error Occured while trying to save payment! : " + response.status);
                }
            },
            error: function (param,error,) {
                console.log(error);
                alert("An Error Occured while trying to save payment!");
            }
        });
    });
});
</script>
