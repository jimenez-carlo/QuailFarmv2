<?php include('../functions.php') ?>
<?php
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']->access_id == 1  || $_SESSION['user']->access_id == 2 || $_SESSION['user']->access_id == 4 || $_SESSION['user']->access_id == 5) {
    header('location:' . $base_url . 'admin/index.php');
  } else if ($_SESSION['user']->access_id == 3) {
    header('location:' . $base_url . 'customer/index.php');
  }
} ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="initial-scale=1, maximum-scale=1">
  <title>Quail Farm</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/responsive.css">
  <link rel="icon" href="images/fevicon.png" type="image/gif" />
  <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
  <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">

</head>
<!-- body -->

<body class="main-layout">
  <!-- loader  -->
  <!-- <div class="loader_bg">
    <div class="loader"><img src="images/loading.gif" alt="#" /></div>
  </div> -->
  <!-- end loader -->
  <!-- header -->
  <style>
    .logo::after {
      background: grey;
    }

    .navigation.navbar-dark .navbar-nav .active>.nav-link,
    .navigation.navbar-dark .navbar-nav .nav-link.active,
    .navigation.navbar-dark .navbar-nav .nav-link.show,
    .navigation.navbar-dark .navbar-nav .show>.nav-link {
      color: white;
      font-size: 30px;
    }

    .get_btn a {
      color: #fff;
      background: #363636;
    }

    .copyright {
      background: grey;
    }

    .text-bg a {
      border: grey solid 4px;
    }

    .hottest .hottest_box {
      background: grey;
    }

    .navigation.navbar-dark .navbar-nav .active>.nav-link:hover,
    .navigation.navbar-dark .navbar-nav .nav-link.active:hover,
    .navigation.navbar-dark .navbar-nav .nav-link.show:hover,
    .navigation.navbar-dark .navbar-nav .show>.nav-link:hover {
      color: yellow;
    }

    /* .hottest .hottest_box::after {
      background: url(../images/h_crossv2.png) !important;
    } */
  </style>
  <header>
    <!-- header inner -->
    <div class="header">
      <div class="container-fluid">
        <div class="row">
          <div class="col-xl-4 col-lg-4 col-md-4 col-sm-4 col logo_section">
            <div class="full">
              <div class="center-desk">
                <div class="logo">
                  <a href="index.html">
                    <h1 style="font-size:40px;color:#fff;font-weight:bold">Menor's Quail Farm</h1>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">
            <nav class="navigation navbar navbar-expand-md navbar-dark ">
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarsExample04">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="index.php"> Home </a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="tutorial.php">Tutorial</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="about_us.php">About Us</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="products.php">Products </a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="contact.php">Contact</a>
                  </li>
                  <li class="nav-item active">
                    <a class="nav-link" href="test.php">Contact</a>
                  </li>
                  <li class=" d_none get_btn">
                    <a href="login.php">Login</a>
                  </li>
                </ul>
              </div>
            </nav>
          </div>
        </div>
      </div>
    </div>
  </header>