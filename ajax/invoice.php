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
    $payment_status = $saleData['payment_status'];
//  Fetch all neccessary data for invoice
    $custQuery = $conn->query("SELECT * FROM customer WHERE cust_id='". $customerID . "'");
    $staffQuery = $conn->query("SELECT * FROM users WHERE id='". $salePersonID . "'");
    $proQuery = $conn->query("SELECT * FROM sales_details WHERE sales_id='". $sales_id . "'");

    // Strip some data into associative array
    $custData = $custQuery->fetch_assoc();
    $staffData = $staffQuery->fetch_assoc();
?>

<div class="container" style="padding:1px 10px; margin-top:90px;">
    <div class="row">
        <div class="col-md-8">
            <h4>Sales Invoice : <?php echo $sales_id; 
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
                </tbody>
            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4 style="margin-top:20px;">Product Details</h4>
            <table class="table table-striped">
                <tbody>
                    <tr>
                        <th width="5%">SN </th>
                        <th width="70%">Product Name </th>
                        <th width="10%">Quantity </th>
                        <th width="15%">Unit Price </th>
                        <th width="15%">Amount </th>
                    </tr>
                    <?php
                    $count = 1;
                        while($saleDet = $proQuery->fetch_assoc()){
                            $product_id = $saleDet['prod_id'];
                            $getProDet = $conn->query("SELECT * FROM product WHERE prod_id='". $product_id . "'");
                            $proDet = $getProDet->fetch_assoc();
                            $amt = (int)$saleDet['qty'] * (int)$saleDet['price'];
                        ?>
                            <tr>
                                <td><?php echo $count ?> </td>
                                <td><?php echo $proDet['prod_name']; ?> </td>
                                <td><?php echo $saleDet['qty']; ?> </td>
                                <td>&#8358; <?php echo number_format($saleDet['price']); ?> </td>
                                <td>&#8358; <?php echo number_format($amt); ?> </td>
                            </tr>
                        <?php
                        $count++;
                        }
                    ?>

                    <tr>
                        <th colspan="5" id="totalAmt" style="text-align:right;">
                            <strong> TOTAL AMOUNT: &#8358; <?php echo number_format($amount); ?> </strong>
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="row" style="margin:30px; text-align:right;">
        <div class="col-md" id="foot_btn">
        <iframe src="http://localhost/erp/ajax/invoice.php?sale_id=<?php echo $sales_id ?>" style="display:none;" name="frame"></iframe>
            <a href="#" class="btn btn-danger btn-sm" data-dismiss="modal"><i class="fa fa-times-circle"></i> Close </a>
            <a class="btn btn-success btn-sm" style="color:white;" onclick="frames['frame'].print()"><i class="fa fa-print"></i> Print Invoice </a>
        </div>
    </div>

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

    // What I will do, use a get method
</script>
