<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="icon" href="images/logo.png">
    <title>Login Module</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="bootstrap4/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" media="screen" href="fa_dir/css/all.css">
    <link rel="stylesheet" type="text/css" media="screen" href="main.css">
    <script src="js/jquery.js"></script>
    <script src="bootstrap4/js/bootstrap.js"></script>
    <script src="js/main.js"></script>
    <style type="text/css">
    *{
        margin:0;
        padding:0;
    }
    .content{
        width:100%;
        height:100vh;
        padding:5px;
        /* Background Color */
        background: -moz-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -o-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -ms-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -webkit-linear-gradient(bottom, #106940 0%, #033f15 100%);
        /* Other Styles */
    }
    #content{
        margin:10vh auto auto;
        max-width:400px;
    }
    #passView{
        background-color:grey;
    }
    .input-group-prepend .btn{
       /* Background Color */
        background: -moz-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -o-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -ms-linear-gradient(bottom, #106940 0%, #033f15 100%);
        background: -webkit-linear-gradient(bottom, #106940 0%, #033f15 100%);
        /* Other Styles */
        border:none;
        color:white; 
    }
    #spinner{
        position:relative;
        font-size:2rem;
        text-align:center;
        display:none;
    }
    </style>
</head>
<body>
<?php 
// check session
if (isset($_SESSION['active_user'])){
    header('location:index.php');
}
?>
    <div class="content">

    <div id="content">
    <h3 style="text-align:center; color:white; font-weight:bold;">
        <i class="fa fa-plus-square"></i>  
        Chemek <br> Enterprise Limited
    </h3>
    <div class="card">
        <div class="card-header">
            <i class="fa fa-login"></i> User Login
        </div>
        <div class="card-body">
        <div id="spinner">
            <i class="fa fa-spinner fa-spin"></i>
        </div>
        <form method="post" name="login_form" id="login_form">
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
                <input type="password" name="pass" id="pass" placeholder="PASSWORD" class="form-control">
                <div class="input-group-append">
                    <span class="btn btn-default" id="passView">
                        <i class="fa fa-eye"></i>
                    </span>
                </div>
            </div>
            <small class="alert fade" id="pass_val"></small>

            <div class="form-group">
                <input type="checkbox" name="chk_remeber" id="chk_remeber"> 
                Remember me
            </div>

            <div class="form-group">
                <button class="btn btn-success btn-block btn-submit" type="submit" id="btnLogin">
                    <i class="fa fa-sign-alt"></i>
                    LOGIN
                </button>
            </div>
            
        </form>
        </div>
    </div>
    </div>

    
    </div>


    <script>
    $(document).ready(function(){
        $('#passView').on('click', function(){
            $inptype = $('input[name=pass]').attr('type');
            if($inptype == "text"){
                $('input[name=pass]').attr('type','password')
                $(this).children('i.fa').removeClass('fa-eye-slash');
                $(this).children('i.fa').addClass('fa-eye')
            }else{
                $('input[name=pass]').attr('type','text');
                $(this).children('i.fa').removeClass('fa-eye');
                $(this).children('i.fa').addClass('fa-eye-slash');
            }
        });

        $('button[type=submit]').on('click', function(e){
            e.preventDefault(0);
            $('#spinner').slideDown('slow')
            $username = $('input[name=uname]').val();
            $password = $('input[name=pass]').val();
            $.ajax({
                type:'post',
                url: 'ajax/login.php',
                data: 'user=' + $username + '&pass='+ $password,
                success: function(result){
                    console.log(result);
                    if(result == 1){
                        window.location = 'index.php';
                    }else{
                        alert('Invalid Username or Password');
                    }
                },
                error: function () {
                    
                }
            });
        });

        if(localStorage.access != null || localStorage.access != ''){
            localStorage.removeItem('access');
        }
    });
    </script>
</body>
</html>
