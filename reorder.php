<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png">
    <title>ERP - Products</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" media="screen" href="plugs/DataTables/datatables.min.css">
    <link href="fa_dir/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="css/main.css">
</head>
<body>
<?php 
include_once "ajax/connect.php";
include_once "head.php"; 
include_once "side_nav.php"; 
?>

<div style="max-width:100%; z-index:-1;">
<div class="content">
    <div class="container" style="margin-top:10px;">
        <div class="row">
            <div class="col-md">
                <div class="alert alert-info show fade" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <p class="mb-0">
                    These products needs urgent re-ordering. 
                    </p>
                    
                </div>
            </div>
        </div>



        <div class="row">
        <!-- Column -->
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">

                        <?php 
                            //  $queryCheck = $conn->query("SELECT * FROM product ORDER BY prod_name ASC");
                             $queryCheck = $conn->query("SELECT * FROM product WHERE prod_qty < 10 ");
                             $count = 1;
                        ?>
                        <div class="table-responsive-sm text-nowrap"  style="width:100%;">
                            <table id="pro_table" data-order='[[ 0, "asc" ]]' data-page-length='10' class="table table-hover table-striped table-sm pro_content" >
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>Product </th>
                                        <th>Description</th>
                                        <th>Quantiy</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <?php 
                                    while($proData = $queryCheck->fetch_assoc()){
                                        // Data Fetched Next Step 
                                    ?>
                                    <tr> 
                                        <td><?php echo $count; ?></td>
                                        <td><?php echo $proData['prod_name']; ?></td>
                                        <td><?php echo $proData['prod_desc'];; ?></td>
                                        <td> <?php echo $proData['prod_qty']; ?> &nbsp; 
                                            <button class="btn btn-sm btn-primary btn-order" id="<?php echo $proData['prod_id'] ?>"> <i class="fa fa-plus"></i> </button>
                                        </td>
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

            <div class="col-md-5">
                <div class="card" style="min-height:300px;">
                    <div class="card-header">
                        <strong>
                            <i class="fa fa-clipboard"></i>
                            Active Order - #<span id="id"></span> <small> (&#8358;<span id="amount"></span> )</small>
                        </strong>
                    </div>
                    <div class="card-body" id="orders" style="padding:0;">
                    <table class="table table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Product Name</th>
                                <th>QTY</th>
                                <th>Unit Cost</th>
                                <th>Amount</th>
                            </tr>
                        </thead>

                        <tbody id="sel_orders">
                            
                        </tbody>
                    </table>
                    </div>

                    <div class="card-footer">
                        <button type="button" class="btn btn-sm btn-primary" id="save_order"> <i class="fa fa-save"></i> Save Orders </button>
                        <button type="button" class="btn btn-sm btn-danger" id="clear_order"> <i class="fa fa-trash"></i> Clear Active Order </button>
                    </div>
                    
                </div>
            </div>
            </div>
            <!-- End of Column md-9 -->



    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <script src="plugs/DataTables/datatables.min.js"></script>
    <script src="js/main_ext.js"></script>
    <script src="js/main.js"></script>
    
</body>
</html>