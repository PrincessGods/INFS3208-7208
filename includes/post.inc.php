<?php

session_start();

if (isset($_POST['submit']) && isset($_SESSION['u_id'])){
	include_once 'dbh.inc.php';

	$title = mysqli_real_escape_string($conn, $_POST['title']);
    $content = mysqli_real_escape_string($conn, $_POST['message-text']);
    $type = mysqli_real_escape_string($conn, $_POST['type']);
    $address = $_SESSION['u_address'];
    $uid = $_SESSION['u_id'];
    $owner = $_SESSION['u_name'];

    //echo $title . $content . $type;

    if (empty($title) || empty($content)) {
    	header("Location: ../index.php?post=empty");
        exit();
    } else {
        $sql = "INSERT INTO posttest (address, contents, title, type, Owner) VALUES 
                ('$address', '$content','$title', '$type', '$owner');";
                                
        mysqli_query($conn, $sql);

        $postID = mysqli_insert_id($conn);

        $sql = "INSERT INTO user_post_relationship (U_id, P_id) VALUES 
                ('$uid', '$postID');";
                                
        mysqli_query($conn, $sql);

        //echo "Error updating record: " . $conn->error;
        header("Location: ../index.php?post=suceessfully");
        exit();
    }

} else{
    header("Location: ../login.php?login=haven't_login");
	exit();
}