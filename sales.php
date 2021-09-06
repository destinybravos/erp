<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png">
    <title>ERP - Sales</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" media="screen" href="plugs/DataTables/datatables.min.css">
    <link href="fa_dir/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
</head>
<body id="sales_body">
<?php 
include_once "ajax/connect.php";
include_once "head.php";
include_once "ajax/connect.php"; 
include_once "side_nav.php"; 
?>

<div style="max-width:100%; z-index:-1;">
<div class="content">

<div class="container">
        <div class="row">
        <!-- Column -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <h5>
                            <strong>
                                <i class="fa fa-cash-register"></i> Make / Record Sales
                            </strong>
                        </h5>
                    </div>
                </div>
            </div>
        </div><!-- Row -->
</div><!-- Container -->

<!-- Second Row -->
    <div class="container" style="margin-top:30px;">
        <div class="row">
        <!-- Column -->
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <?php 
                             $queryCheck = $conn->query("SELECT * FROM product ORDER BY prod_name ASC");
                             $count = 1;
                        ?>
                        <div class="table-responsive-sm text-nowrap"  style="width:100%; max-heigth:100px; overflow:scrollY;">
                            <table id="pro_table" data-order='[[ 0, "asc" ]]' data-page-length='10' class="table table-hover table-striped table-sm pro_content" >
                                <thead>
                                    <tr>
                                        <th>S/N</th>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                    while($data = $queryCheck->fetch_assoc()){
                                        // Data Fetched Next Step 
                                    ?>
                                    <tr> 
                                        <td><?php echo $count; ?></td> 
                                        <td><?php echo $data['prod_name']; ?></td>  
                                        <td><?php echo $data['prod_desc']; ?></td>
                                        <td id="<?php echo $data['prod_id']; ?>" class="action_btn">
                                            <a class="btn btn-sm btn-primary" style="color:white;">
                                                <i class="fa fa-cart-plus"></i>
                                            </a>
                                        </td> 
                                    </tr> 
                                    <?php
                                        $count++;
                                    }
                                    ?> 
                                </tbody>
                            </table>
                        <?php

                        ?>
                    </div>
                </div>
            </div>
            <!-- End of Column md-8 -->
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <strong>
                            <i class="fa fa-shopping-basket"></i> Added Products 
                            <span id="sale_id">
                            <?php
                                if(isset($_SESSION['SALES_ID'])){
                                    echo ' - ID:' . $_SESSION['SALES_ID'];
                                }
                            ?>
                            </span>
                        </strong>
                    </div>
                    <div class="card-body" style="padding:0;">
                        <div>
                            <table class="table table-hover">
                                <thead class="table-dark">
                                    <tr>
                                        <th>Product Name</th>
                                        <th>QTY</th>
                                        <th>Unit Price</th>
                                    </tr>
                                </thead>

                                <tbody id="sel_products">
                                    
                                </tbody>

                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        <a class="btn btn-success bg-success" id="process_btn" style="color:white;">
                            <i class="fa fa-handshake"></i> Process Sales
                        </a>
                        <a class="btn btn-success bg-danger" id="clearcart_btn" style="color:white;">
                            <i class="fa fa-toilet-paper"></i> Clear Cart
                        </a>
                    </div>
                </div>
            </div>
            <!-- End of Column md-4 -->
    </div>
    
</div>


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <script src="plugs/DataTables/datatables.min.js"></script>
    <script src="js/main_ext.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>