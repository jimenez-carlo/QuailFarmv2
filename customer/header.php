<?php include('../functions.php') ?>
<?php
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']->access_id == 1  || $_SESSION['user']->access_id == 2 || $_SESSION['user']->access_id == 4 || $_SESSION['user']->access_id == 5) {
    header('location:' . $base_url . 'admin/index.php');
  }
} else {
  header('location:' . $base_url . 'landing/index.php');
} ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <title>Quail Farm</title>

  <link href="css/app.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&display=swap" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>

<body>
  <div class="wrapper">
    <nav id="sidebar" class="sidebar js-sidebar">
      <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.php">
          <span class="align-middle">AdminKit</span>
        </a>

        <ul class="sidebar-nav">


          <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'index') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="index.php">
              <i class="align-middle" data-feather="home"></i> <span class="align-middle">Home</span>
            </a>
          </li>

          <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'products') !== false || strpos($_SERVER['REQUEST_URI'], 'category') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="products.php">
              <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Products</span>
            </a>
          </li>

          <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'cart') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="cart.php">
              <i class="align-middle" data-feather="shopping-cart"></i> <span class="align-middle">My Cart (<?= get_one("select count(*) as items from tbl_transactions where status_id = 1 and is_deleted = 0 and buyer_id = " . $_SESSION['user']->id)->items ?? 0; ?>)</span>
            </a>
          </li>

          <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'orders') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="orders.php">
              <i class="align-middle" data-feather="package"></i> <span class="align-middle">Orders</span>
            </a>
          </li>

          <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'profile') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="profile.php">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
            </a>
          </li>

      </div>
    </nav>

    <div class="main">
      <nav class="navbar navbar-expand navbar-light navbar-bg">
        <a class="sidebar-toggle js-sidebar-toggle">
          <i class="hamburger align-self-center"></i>
        </a>

        <div class="navbar-collapse collapse">
          <ul class="navbar-nav navbar-align">


            <li class="nav-item dropdown">
              <a class="nav-icon dropdown-toggle d-inline-block d-sm-none" href="#" data-bs-toggle="dropdown">
                <i class="align-middle" data-feather="settings"></i>
              </a>

              <a class="nav-link dropdown-toggle d-none d-sm-inline-block" href="#" data-bs-toggle="dropdown">
                <img src="img/avatars/avatar.jpg" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> <span class="text-dark"><?= $_SESSION['user']->first_name . " " . $_SESSION['user']->last_name ?></span>
              </a>
              <div class="dropdown-menu dropdown-menu-end">
                <a class="dropdown-item" href="../logout.php">Log out</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>