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
        <div class="col-md-5">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-clipboard-list "></i>
                        Add a Budget
                    </strong>
                </div>
                <form action="" method="post">
                <div class="card-body">
                    <div class="form-group">
                        <label for="">Budget Title</label>
                        <input type="text" name="title" class="form-control" id="">
                    </div>
                    <div class="form-group">
                        <label for="">Budget Description</label>
                        <textarea name="desc" class="form-control" id=""></textarea>
                    </div>
                    <div class="form-group">
                        <label for="">Budget Category</label>
                        <select name="category" id="" class="form-control">
                            <option value="">Select a Category</option>
                            <option value="Purchase">Purchase</option>
                            <option value="Maintenance">Maintenance</option>
                            <option value="Others">Others</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="">Budget Amount</label>
                        <input type="text" name="amount" class="form-control" id="">
                    </div>
                </div>

                <div class="card-footer">
                    <button type="submit" name="btn_submit" class="btn btn-sm btn-primary"> <i class="fa fa-save"> </i> Save Budget</button>
                </div>
                <?php
                if(isset($_POST['btn_submit'])){
                    $title = $_POST['title'];
                    $desc = $_POST['desc'];
                    $category = $_POST['category'];
                    $amount = $_POST['amount'];

                    $insertQuery = $conn->query("INSERT INTO budget(budget, description, category, amount) VALUES('". $title ."','". $desc ."','". $category ."','". $amount ."')");
                    if($insertQuery){
                        echo "
                        <script>
                        $('#alert_modal_12').on('show.bs.modal', function(){
                            $('#alertMsgSpan').html('<h3><strong>Success!</strong></h3> <p>Budget Added Successfully.</p>');
                        });
                        $('#alert_modal_12').modal('show');
                        </script>
                        ";
                    }
                }
                ?>
                </form>
            </div>
        </div>
    <!-- End of Second Row -->


    <div class="col-md-7">
            <div class="card">
                <div class="card-header">
                    <strong>
                        <i class="fa fa-list "></i>
                        Scheduled Budget
                    </strong>
                </div>
                <div class="card-body" style="padding:0;">
                <table class="table table-striped">
                <tbody>
                    <tr>
                        <th>SN</th>
                        <th>Budget</th>
                        <th>Amount</th>
                        <th>Category</th>
                        <th>Date</th>
                    </tr>
                    <?php 
                    $count = 1; 
                        $queryCheck = $conn->query("SELECT * FROM budget ORDER BY date_added");
                        while($budData = $queryCheck->fetch_assoc()){
                            ?>
                            <tr>
                                <td><?php echo $count; ?></td>
                                <td><?php echo $budData['budget']; ?></td>
                                <td>&#8358; <?php echo number_format($budData['amount']); ?></td>
                                <td><?php echo $budData['category']; ?></td>
                                <td><?php echo date('F, Y', strtotime($budData['date_added'])); ?></td>
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