<?php 
session_start();
include_once "connect.php";

$user = $_SESSION['active_user'];

$queryCheck = $conn->query("SELECT * FROM activity_log WHERE employee_id='".$user."'");
        $count = 0;
        if($queryCheck->num_rows > 0){
           while ($data = $queryCheck->fetch_assoc()) {
               $lastDate = strtotime('d:m:Y', $data['activity_date']);
               $today = strtotime('d:m:Y', date());
               if($today == $lastDate){
                   $count = $count + 1;
               }
           }
           if($count > 0){
                $activity = 'login';
                $detials = 'Your Last Login was ';
           }else{
                $activity = 'attendance';
                $detials = 'Resumtion time and date : ';
           }
           
           $queryInsert = $conn->query("INSERT INTO activity_log(employee_id,activity,activity_details) VALUES('". $user ."','". $activity ."','". $detials ."')"); 
           if($queryInsert){
                echo 'Activity Log Successful';
           }else{
                echo 'An error occured while loggin activity';
           }
        } 

?>