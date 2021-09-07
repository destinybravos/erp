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
include_once "ajax/connect.php"; 
include_once "side_nav.php"; 
?>

<div style="max-width:100%; z-index:-1;">
<div class="content">
    <div class="container">
    <div class="my-4">
        <div class="btn btn-primary" id="addProd" data-toggle="modal" data-target="#addProd">
            <i class="fab fa-product-hunt"></i>
            Add Product
        </div>
    </div>
        <div class="row">
        <!-- Column -->
            <div class="col-md-12">
                <div class="card">
                    <div class="card-body">
                        <?php 
                             $queryCheck = $conn->query("SELECT * FROM product ORDER BY prod_name ASC");
                             $count = 1;
                        ?>
                        <div class="table-responsive-sm text-nowrap"  style="width:100%;">
                            <table id="pro_table" data-order='[[ 0, "asc" ]]' data-page-length='25' class="table table-hover table-striped table-sm pro_content" >
                                <thead>
                                    <tr>
                                        <th>S/N</th>
                                        <th>Product Name</th>
                                        <th>Description</th>
                                        <th>Price</th>
                                        <th>Qty.</th>
                                        <th data-class-name="priority">More Action</th>
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
                                        <td><?php echo $data['prod_price']; ?></td> 
                                        <td><?php echo $data['prod_qty']; ?></td> 
                                        <td id="<?php echo $data['prod_id']; ?>" class="action_btn">
                                            <a href="#" class="btn btn-sm btn-success">
                                                <i class="fa fa-eye"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fa fa-edit"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-danger">
                                                <i class="fa fa-trash"></i>
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
            <!-- End of Column md-9 -->
    </div>

    
<!-- Modal -->
<div class="modal fade" id="alert_modal_product_edit" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body" id="" style="padding:30px auto; text-align:center;">
        <h1 id="alertMsgIcon"></h1>
        <span id="alertMsgSpan"></span>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="alert_modal_product_delete" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body" id="" style="padding:30px auto; text-align:center;">
        <h1 id="alertMsgIcon"></h1>
        <span id="alertMsgSpan"></span>
        <span class="d-none" id="product_id_span"></span>
      </div>
      <div class="modal-footer">
          <button class="btn btn-primary btn-sm" data-dismiss="modal">Cancel</button>
          <button class="btn btn-danger btn-sm" id="cornfirm_delete_product">YES! Delete Product</button>
      </div>
    </div>
  </div>
</div>
    
</div>


    <script src="js/jquery-3.4.1.min.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <script src="plugs/DataTables/datatables.min.js"></script>
    <script src="js/main_ext.js"></script>
    <script src="js/main.js"></script>

    <script>
        $('.action_btn').on('click', '.btn-danger', function () {
            $id = $(this).parent('td').attr('id');
            $.ajax({
                type:'post',
                data: {product_id: $id, action:'delete_product'},
                url: 'ajax/query_manager.php',
                success:function(data){
                    if(data == 1){
                        alert('Product deleted successfully');
                        window.location.reload();
                    }else{
                        alert('Something went wrong and could not delete product');
                    }
                }
            })
        })
    </script>
    
</body>
</html>