<?php
	session_start();
	$url = 'https://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
    $_SESSION['url'] = $url;
?>

<!doctype html>
<html lang="en">
  <head>
    <title>INFS3208/7208</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway:400,800">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/styles.css">
    <link rel='stylesheet' href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

  <body>
    <header id="topNav">
        <div class="container" id="header_container">
            
            <nav class="navbar navbar-expand-md navbar-dark bg-dark px-0 py-0">
            
                <a class="navbar-brand py-2 font-weight-bold" href="index.php">CompanyName</a>
                
                <button class="navbar-toggler my-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <?php
                        if(!isset($_SESSION['u_id'])){
                            echo '
                                <li class="nav-item py-2">
                                    <a class="nav-link px-4" href="signup.php">Sign Up</a>
                                </li>
                                <li class="nav-item py-2">
                                    <a class="nav-link px-4" href="login.php">Log In</a>
                                </li>
                            ';
                        } else {
                            echo '
                                <li class="nav-item py-2">
                                    <a class="nav-link px-4"> Hi, ' . $_SESSION['u_name'] . '</a>
                                </li>
                                <li class="nav-item dropdown py-2">
                                    <a class="nav-link dropdown-toggle px-4" href="#" onclick="dropControl()">My Account</a>
                                    <div class="dropdown_menu bg-dark py-0 d-flex" id="dropdown_menu">
                                        <a class="dropdown-item py-2" href="#">My Profile</a>
                                        <a class="dropdown-item py-2" href="includes/logout.inc.php">Logout</a>
                                    </div>
                                </li>
                            ';
                        }
                        ?>
                    </ul>
                </div>
            </nav>
        </div>
    </header>