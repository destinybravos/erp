<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="main.js"></script>
</head>
<body>

<form method="post" name="login_form" id="login_form">
<?php 
    if(isset($_POST['submit'])){
        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $phone = $_POST['phone'];
        $email = $_POST['email'];
        $desig = $_POST['desig'];
        $uname = $_POST['uname'];
        $pass = $_POST['pass'];
        $pass = md5($pass);

        // connect
        $conn = new MySqli('localhost','root','','project2021_erp');

        $query = $conn->query('INSERT INTO users(firstname, lastname, phone, email, designation, user_name, password) VALUES("'. $fname .'","'. $lname .'","'. $phone .'","'. $email .'","'. $desig .'","'. $uname .'","'. $pass .'")') or die($conn->error);
        echo 'Saved Successfully';
    }
?>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" name="fname" id="uname" placeholder="Firstname" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-key"></i>
                    </span>
                </div>
                <input type="text" name="lname" id="pass" placeholder="Lastname" class="form-control">
                <div class="input-group-append">
                    <span class="btn btn-default" id="passView">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" name="phone" id="uname" placeholder="Phone Number" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-key"></i>
                    </span>
                </div>
                <input type="email" name="email" id="pass" placeholder="Email" class="form-control">
                <div class="input-group-append">
                    <span class="btn btn-default" id="passView">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" name="desig" id="uname" placeholder="Designation" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <small class="alert fade" id="pass_val"></small>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-user"></i>
                    </span>
                </div>
                <input type="text" name="uname" id="uname" placeholder="USER ID" class="form-control">
            </div>
            <small class="alert fade" id="uname_val"></small>

            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="btn btn-warning">
                        <i class="fa fa-key"></i>
                    </span>
                </div>
                <input type="text" name="pass" id="pass" placeholder="PASSWORD" class="form-control">
                <div class="input-group-append">
                    <span class="btn btn-default" id="passView">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
            
            <small class="alert fade" id="pass_val"></small>
            <div class="form-group">
                <button class="btn btn-success btn-block btn-submit" type="submit" name="submit" id="btnLogin">
                    <i class="fa fa-sign-alt"></i>
                    LOGIN
                </button>
            </div>
            </form>
    
</body>
</html>