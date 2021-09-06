<?php
session_start();
include_once "connect.php";

date_default_timezone_set("Africa/Lagos");

$username = $_POST['user'];
$password = $_POST['pass'];

$sqlQuery = $conn->query("SELECT * FROM users WHERE user_name='".$username."' AND password='". md5($password) ."'");    
    if($sqlQuery->num_rows > 0){
        while($user_data = $sqlQuery->fetch_assoc()){
            $_SESSION['firstname'] = $user_data['firstname'];
            $_SESSION['lastname'] = $user_data['lastname'];
            $_SESSION['phone'] = $user_data['phone'];
            $_SESSION['email'] = $user_data['email'];
            $_SESSION['asses_level'] = $user_data['asses_level'];
            $_SESSION['designation'] = $user_data['designation'];
            $_SESSION['active_user'] = $user_data['user_name'];
            $_SESSION['id'] = $user_data['id'];
        }
        $response = activity_log($_SESSION['active_user'], $conn);
        $response = history_log($_SESSION['id'], $conn);
        echo 1;
    }else{
        echo 0;
    }

    function activity_log($user, $conn){ 

        $queryCheck = $conn->query("SELECT * FROM activity_log WHERE employee_id='".$user."'");
        $count = 0;
        $current='';
        if($queryCheck->num_rows > 0){
            while ($data = $queryCheck->fetch_assoc()) {
                $lastDate = date('Y-m-d', strtotime($data['activity_date']));
                $today = date('Y-m-d');
                if($today == $lastDate){
                    $count = $count + 1;
                }
                $current = $data['activity'];
            }

            if($count < 1){
                $activity = 'attendance1';
                $detials = 'Resumption time and date : ';
                $curentDateTime = date('Y-m-d H:i:s');
                $queryInsert = $conn->query("INSERT INTO activity_log(employee_id,activity,activity_details,activity_time_update,activity_date) VALUES('". $user ."','". $activity ."','". $detials ."','". $curentDateTime ."','". $curentDateTime ."')");
            }elseif ($count == 1) {
                $activity = 'login';
                $detials = 'Your Last Login was ';
                $curentDateTime = date('Y-m-d H:i:s');
                $queryInsert = $conn->query("INSERT INTO activity_log(employee_id,activity,activity_details,activity_time_update,activity_date) VALUES('". $user ."','". $activity ."','". $detials ."','". $curentDateTime ."','". $curentDateTime ."')");
            }else{
                $activity = 'login';
                $detials = 'Your Last Login was ';
                $curentDateTime = date('Y-m-d H:i:s');
                $queryInsert = $conn->query("UPDATE activity_log SET activity_time_update='". $curentDateTime ."' WHERE employee_id='". $user ."' AND activity='login'");    
            }
             
            if($queryInsert){
                    return 'Activity Log Successful';
            }else{
                    return 'An error occured while loggin activity';
            }
        }else{
            $activity = 'attendance2';
            $detials = 'Resumption time and date : ';
            $curentDateTime = date('Y-m-d H:i:s');
            $queryInsert = $conn->query("INSERT INTO activity_log(employee_id,activity,activity_details,activity_time_update,activity_date) VALUES('". $user ."','". $activity ."','". $detials ."','". $curentDateTime ."','". $curentDateTime ."')"); 
            if($queryInsert){
                    return 'Activity Log Successful';
            }else{
                    return 'An error occured while loggin activity';
            }
        }
        // End of Fuction Activity Log 

    }


    function history_log($user_id, $conn){
        $action = " : logged in the system";
        $insert = $conn->query("INSERT INTO history_log(user_id, action, tag) VALUES('". $user_id ."','". $action ."','login')");
    }

    
?>