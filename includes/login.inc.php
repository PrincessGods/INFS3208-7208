<?php

session_start();

if (isset($_POST['submit'])){
	include_once 'dbh.inc.php';

	$username = mysqli_real_escape_string($conn, $_POST['username']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    if (empty($username) || empty($password)) {
    	header("Location: ../login.php?login=empty");
    	exit();

    }else{
    	$sql = "SElECT * FROM usertest WHERE Username='$username' OR Email='$username'";
    	$result = mysqli_query($conn, $sql);
    	$resultCheck = mysqli_num_rows($result);

    	if($resultCheck < 1){
			//echo $username;
			header("Location: ../login.php?login=invalid_id");
    		exit();

    	} else {
    		if ($row = mysqli_fetch_assoc($result)) {
    			//De-hashing the password
    			$hashedPwdCheck = password_verify($password, $row['Password']);

    			if($hashedPwdCheck == false){
    				header("Location: ../index.php?login=invalid_password");
    				exit();

    			} elseif ($hashedPwdCheck == true){
    				//Log in the user here
    				$_SESSION['u_id'] = $row['ID'];
    				$_SESSION['u_email'] = $row['Email'];
    				$_SESSION['u_name'] = $row['Username'];
                    $_SESSION['u_phone'] = $row['Phone'];
                    $_SESSION['u_address'] = $row['Address'];
                    $_SESSION['u_gender'] = $row['Gender'];
                    $_SESSION['u_country'] = $row['Country'];
                    //echo $_SESSION['u_id'];
    				header("Location: ../index.php");
    				exit();
    			}
    		}
    	}
    }
} else{
    header("Location: ../login.php?db=conn_error");
	exit();
}