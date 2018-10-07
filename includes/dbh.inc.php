<?php

$dbServername = "127.0.0.1";
$dbUsername = "root";
$dbPassword = "Your Password";
$dbName = "test";

$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

if (!$conn) {
	echo "Failed to connect to MySQL: " . mysqli_connect_error();
    header("Location: ../index.php?login=dn_access_error");
}





