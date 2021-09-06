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
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-history"></i>
                        Customer Transaction History
                    </strong>
                </div>
                <div class="card-body" style="padding:0;">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th></th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM history_log WHERE tag='sales' OR tag='payment'");
                        while($transData = $queryCheck->fetch_assoc()){
                            $client_id = $transData['client_id'];
                            $user_id  = $transData['user_id'];
                            $tags = $transData['tag'];
                            
                            $queryCust = $conn->query("SELECT * FROM customer WHERE cust_id='". $client_id ."'");
                            $queryUser = $conn->query("SELECT * FROM users WHERE id='". $user_id ."'");

                            $custData = $queryCust->fetch_assoc(); 
                            $userData = $queryUser->fetch_assoc(); 

                            if($tags == "sales"){
                                $msg = $userData['firstname'] .  " ". $transData['action'] ." " .$custData['cust_first'];
                            }else{
                                $msg =  $userData['firstname'] .  " ". $transData['action'] ." " . $custData['cust_first'] ;
                            }

                            ?>
                            <tr style="cursor:pointer;">
                                <td><?php echo $count; ?></td>
                                <td><?php echo $msg; ?></td>
                                <td><?php echo date('d-m-Y g:i a', strtotime($transData['date'])); ?></td>
                                <td></td>
                                
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