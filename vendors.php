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
                        Vendors List
                    </strong>
                </div>
                <div class="card-body">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Vendor</th>
                        <th>Address</th>
                        <th>Contact</th>
                        <th>Call</th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM supplier ORDER BY supplier_name");
                        while($venData = $queryCheck->fetch_assoc()){
                            $vendor = $venData['supplier_name'];
                            $venAddr = $venData['supplier_address'];
                            $venPhone = $venData['supplier_contact'];
                            ?>
                            <tr>
                                <td><?php echo $count; ?></td>
                                <td><?php echo $vendor; ?></td>
                                <td><?php echo $venAddr; ?></td>
                                <td><?php echo $venPhone; ?></td>
                                <td>
                                    <a href="tel:<?php echo $venPhone; ?>" class="btn btn-sm btn-primary"><i class="fa fa-phone"></i></button>
                                </td>
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