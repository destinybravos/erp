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
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-clipboard-list "></i>
                        Payment List
                    </strong>
                </div>
                <div class="card-body" style="padding:0;">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Payment For</th>
                        <th>Amount</th>
                        <th>Type</th>
                        <th>date</th>
                        <th></th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM payment ORDER BY payment_date DESC LIMIT 10");
                        while($payData = $queryCheck->fetch_assoc()){
                            $payment = $payData['payment'];
                            $amtt  = $payData['amount'];
                            $payment_type = $payData['payment_type'];
                            $payment_date = $payData['payment_date'];
                            ?>
                            <tr id="<?php echo $payData['payment_id']; ?>" style="cursor:pointer;">
                                <td><?php echo $count; ?></td>
                                <td><?php echo $payment; ?></td>
                                <td>&#8358; <?php echo number_format($amtt); ?></td>
                                <td><?php echo $payment_type; ?></td>
                                <td><?php echo $payment_date; ?></td>
                                <?php if($payData['payment_type'] == "Sales"){
                                ?>
                                <td>
                                    <a href="#" class="btn btn-sm btn-success"><i class="fa fa-arrow-alt-circle-down"></i></button>
                                </td>
                                <?php
                                }else{
                                ?>
                                <td>
                                    <a href="#" class="btn btn-sm btn-danger"><i class="fa fa-arrow-alt-circle-up"></i></button>
                                </td>
                                <?php
                                }
                                ?>
                            </tr>
                            <?php
                            $count++;
                        }
                    ?>
                    </tbody>
                    </table>
                </div>

                <div class="card-footer">
                    
                </div>
            </div>
        </div>
    <!-- End of Second Row -->


    <div class="col-md-5">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-list "></i>
                        Unpaid Invioce List
                    </strong>
                </div>
                <div class="card-body" style="padding:0;">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Sales ID</th>
                        <th>Date</th>
                        <th></th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM sales ORDER BY date_added");
                        while($saleData = $queryCheck->fetch_assoc()){
                            $saleid = $saleData['sales_id'];
                            $date = date('d/m/Y', strtotime($saleData['date_added']));
                            if((int)$saleData['cash_tendered'] == 0 || $saleData['payment_status'] == "Not Paid" || (int)$saleData['cash_tendered'] < (int)$saleData['total']){
                            ?>
                            <tr>
                                <td><?php echo $count; ?></td>
                                <td><?php echo $saleid; ?></td>
                                <td><?php echo $date; ?></td>
                                <td>
                                    <a href="#" title="paybtn" class="btn btn-sm btn-success" id="<?php echo $saleid; ?>"><i class="fa fa-money-bill"> Pay </i></button>
                                </td>
                            </tr>
                            <?php
                            $count++;
                            }
                        }
                    ?>
                    </tbody>
                    </table>
                </div>

                <div class="card-footer">
                    
                </div>
            </div>
    </div>
    <!-- dfghjkl Row -->

</div>
</div>


<!-- Modal -->
<div class="modal fade" id="paymodal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-body" id="paydetails" style="padding:0;">
        ...
      </div>
    </div>
  </div>
</div>

<script>
$(document).ready(function () {
    $('a[title=paybtn]').on('click', function(){
        $id = $(this).attr('id');
        $.ajax({
            type : 'post',
            url : 'ajax/paysales.php',
            data : {sale_id: $id},
            success : function (page) {
                $('#paymodal').on('show.bs.modal', function () {
                $('#paydetails').html(page);
                });
                $('#paymodal').modal('show');
            }
        });
    });
});
</script>
    
</body>
</html>