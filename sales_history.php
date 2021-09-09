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
    <link rel="stylesheet" type="text/css" media="screen" href="css/dataTables.bootstrap.min.css">
    <link href="fa_dir/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-3.3.1.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <script src="js/jquery.dataTables.min.js"></script>
    <script src="js/dataTables.bootstrap.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body>
<?php 
include_once "ajax/connect.php";
include_once "head.php";
include_once "ajax/connect.php"; 
include_once "side_nav.php"; 
?>

<div style="max-width:100%; z-index:-1;">
<div class="content">
    <div class="container">
    <!-- End of First Row -->

    <div class="row" style="margin-top:40px;">
        <div class="col md">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-industry "></i>
                        All Sales Made
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
            </div>
        </div>
    </div>
    <!-- End of Second Row -->
    </div>
</div>
</div>
    
</body>
</html>