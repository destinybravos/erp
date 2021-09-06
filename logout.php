<?php
session_start();
include_once "ajax/connect.php";
    $user_id = $_SESSION['id'];
    $action = " : logged out of the system";
    $insert = $conn->query("INSERT INTO history_log(user_id, action, tag) VALUES('". $user_id ."','". $action ."','login')");
session_destroy();
header('location:login.php');

?>