<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png">
    <title>Enterprise Resource Planning</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap4/css/bootstrap.css">
    <!-- <link rel="stylesheet" type="text/css" media="screen" href="css/dataTables.bootstrap.min.css"> -->
    <link href="fa_dir/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <!-- <script src="js/jquery.dataTables.min.js"></script> -->
    <!-- <script src="js/dataTables.bootstrap.min.js"></script> -->
    <script src="js/main.js"></script>
</head>
<body>
<?php 
include_once "ajax/connect.php";
include_once "head.php";
include_once "ajax/connect.php"; 
include_once "side_nav.php"; 
include_once "ajax/staticmodal.html"; 
?>

<div style="max-width:100%; z-index:-1;">
<div class="content">
    <div class="container" style="margin-top:20px;">
    <div class="row">
        <div class="col-md-12">
        <?php 
        $sqlQuery = $conn->query("SELECT * FROM product WHERE prod_qty < 10 ");
        $totalQty = $sqlQuery->num_rows; 
        if($totalQty > 0){    
         ?>
            <div class="alert alert-info show fade" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="alert-heading"><strong>Attention!</strong></h4>
                <hr>
                <p class="mb-0">
                There are about <?php echo $totalQty; ?> product that are below 10 and need urgent 
                re-ordering. Please click on the button bellow to see their full list.
                </p>
                <a href="reorder.php" class="btn btn-sm btn-primary" style="margin-top:15px;">
                    Re-Order Products
                </a>
                
            </div>
            <?php
            }   
            ?>
        </div>
    </div>


        <div class="row">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        
                        <div class="row">
                            <div class="col-md-4">
                            <div class="card text-white bg-primary mb-3" style="max-width: 18rem;">
                                <div class="card-header">Make Sales</div>
                                <div class="card-body">
                                    <a href="sales.php" style="color:white;">
                                    <h5 class="card-title"> <i class="fa fa-object-group" style="font-size:5rem;"></i> </h5>
                                    <p class="card-text">Sell Products to Customer</p>
                                    </a>
                                </div>
                            </div>
                            </div>

                            <div class="col-md-4">
                            <div class="card text-white bg-success mb-3" style="max-width: 18rem;">
                                <div class="card-header">Payments</div>
                                <div class="card-body">
                                    <a href="payments.php" style="color:white;">
                                    <h5 class="card-title"> <i class="fa fa-money-check" style="font-size:5rem;"></i> </h5>
                                    <p class="card-text">View / Manage All Payment</p>
                                    </a>
                                </div>
                            </div>
                            </div>

                            <div class="col-md-4">
                            <div class="card text-white bg-danger mb-3" style="max-width: 18rem;">
                                <div class="card-header">Transactions</div>
                                <div class="card-body">
                                    <a href="transactions.php" style="color:white;">
                                    <h5 class="card-title"> <i class="fa fa-history" style="font-size:5rem;"></i> </h5>
                                    <p class="card-text">View Customer Transactions</p>
                                    </a>
                                </div>
                            </div>
                            </div>
                        </div>
                        
                        
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card" style="min-height:300px;">
                    <div class="card-header">
                        <strong>
                            <i class="fa fa-history"></i>
                            Activity Log
                        </strong>
                    </div>
                    <div class="card-body">
                        <?php  
                            $queryCheck = $conn->query("SELECT * FROM activity_log WHERE employee_id='". $active_user ."' AND activity='login'");
                            while($data = $queryCheck->fetch_assoc()){
                                $date = date('d/m/Y', strtotime($data['activity_time_update']));
                                $time = date('g:i A', strtotime($data['activity_time_update']));
                                $log_msg = $data['activity_details'] . " -- " . $date . " @ " . $time;
                        ?>
                            <li><?php echo $log_msg; ?></li>
                        <?php
                            }
                        ?>
                    </div>
                    
                </div>
            </div>
        </div>

        <!-- End of First Row -->

    <div class="row" style="margin-top:40px;">
        <div class="col md">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-history"></i>
                        Recent Sales
                    </strong>
                </div>
                <div class="card-body">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Sales Made By</th>
                        <th>Customer</th>
                        <th>Amount</th>
                        <th>Date/Time</th>
                        <th></th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM sales ORDER BY date_added LIMIT 5");
                        while($saleData = $queryCheck->fetch_assoc()){
                            $customerID = $saleData['cust_id'];
                            $salePersonID = $saleData['user_id'];
                            $amount = $saleData['total'];
                            $transdate = $saleData['date_added'];
                            $salesid = $saleData['sales_id'];
                        //  Fetch all neccessary data for invoice
                            $custQuery = $conn->query("SELECT * FROM customer WHERE cust_id='". $customerID . "'");
                            $staffQuery = $conn->query("SELECT * FROM users WHERE id='". $salePersonID . "'");                        
                            // Strip some data into associative array
                            $custData = $custQuery->fetch_assoc();
                            $staffData = $staffQuery->fetch_assoc();
                            ?>
                            <tr>
                                <td><?php echo $count; ?></td>
                                <td><?php echo $staffData['firstname'] . " " . $staffData['lastname']; ?></td>
                                <td><?php echo $custData['cust_first'] . " " . $custData['cust_last']; ?></td>
                                <td> &#8358; <?php echo number_format($amount); ?> </td>
                                <td> <?php echo date('l dS F, Y @ g:i A', strtotime($transdate)); ?> </td>
                                <td> <button class="btn btn-sm btn-success btn-view_sale" id="<?php echo $salesid; ?>"> <i class="fa fa-eye"> View Details </i> </button> </td>
                            </tr>
                            <?php
                            $count++;
                        }
                    ?>
                    </tbody>
                    </table>
                </div>

                <div class="card-footer">
                    <button class="btn btn-sm btn-primary">View all Sales</button>
                </div>
            </div>
        </div>
    </div>
    <!-- End of Second Row -->
    </div>
</div>
</div>
    
</body>
</html>