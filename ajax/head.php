<?php 
// check session
if (isset($_SESSION['active_user'])){
    $active_user = $_SESSION['active_user'];
    $sqlQuery = $conn->query("SELECT * FROM users WHERE user_name='".$active_user."'");
    if($sqlQuery->num_rows > 0){
        $fulname = $_SESSION['firstname'] . " " . $_SESSION['lastname'];
        $design = $_SESSION['designation'];
        $user_id = $_SESSION['id'];
    }else{
        $actValidate = "Invalid_ActiveUser";
        header('location:logout.php?reason=' . $actValidate);
    }
    
}else{
    $actValidate = "Invalid_Login_session";
    header('location:logout.php?reason=' . $actValidate);
}
?>
<link rel="stylesheet" type="text/css" media="screen" href="../bootstrap4/css/bootstrap.css">
    <link href="../fa_dir/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen" href="../css/main.css">
<header>
    <nav class="container">
        <div class="row">
            <div class="col-md-6">
            <i class="fa fa-plus-square" style="display:inline-block;"></i>
                Chemek Enterprise Limited
            </div>

            <div class="col-md-6" style="text-align:right;">
                <small>
                    <strong>Address:</strong> #32 Aba Road, Owerri
                </small>
            </div>
        </div>
    </nav>
</header>