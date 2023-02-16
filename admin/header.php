<?php include('../functions.php') ?>
<?php
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']->access_id == 3) {
    header('location:' . $base_url . 'customer/index.php');
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
  <!-- <script src="js/jquery.js"></script> -->

  <link href="css/custom.css" rel="stylesheet">
  <script src="js/datable.js"></script>
  <script src="js/datable.bootstrap.js"></script>
  <script src="js/datatable.buttons.js"></script>
</head>
<style>
  .sidebar-brand,
  .sidebar-nav,
  .sidebar-link,
  a.sidebar-link {
    /* background: blue; */
  }
</style>

<body>
  <div class="wrapper">
    <nav id="sidebar" class="sidebar js-sidebar">
      <div class="sidebar-content js-simplebar">
        <a class="sidebar-brand" href="index.php">
          <span class="align-middle">Menors Quail Farm</span>
        </a>

        <ul class="sidebar-nav">
          <?php if (in_array($_SESSION['user']->access_id, array(1, 5))) { ?>
            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'index') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="index.php">
                <i class="align-middle" data-feather="home"></i> <span class="align-middle">Dashboard</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'customer') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="customer.php">
                <i class="align-middle" data-feather="users"></i> <span class="align-middle">Customer's Accounts</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'user') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="user.php">
                <i class="align-middle" data-feather="users"></i> <span class="align-middle">Users Account</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'category') !== false || strpos($_SERVER['REQUEST_URI'], 'category_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="category.php">
                <i class="align-middle" data-feather="layers"></i> <span class="align-middle">Categories</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'product') !== false || strpos($_SERVER['REQUEST_URI'], 'product_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="product.php">
                <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Products</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'inventory') !== false || strpos($_SERVER['REQUEST_URI'], 'inventory_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="inventory.php">
                <i class="align-middle" data-feather="package"></i> <span class="align-middle">Inventory</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'order') !== false || strpos($_SERVER['REQUEST_URI'], 'order_view') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="order.php">
                <i class="align-middle" data-feather="shopping-bag"></i> <span class="align-middle">Orders</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'report') !== false || strpos($_SERVER['REQUEST_URI'], 'report_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="report.php">
                <i class="align-middle" data-feather="file"></i> <span class="align-middle">Reports</span>
              </a>
            </li>
            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'walkin_product') !== false || strpos($_SERVER['REQUEST_URI'], 'walkin_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="walkin_product.php?filter=all">
                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Walkin Products</span>
              </a>
            </li>
            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'walkin_checkout') !== false || strpos($_SERVER['REQUEST_URI'], 'walkin_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="walkin_checkout.php">
                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Walkin Checkout</span>
              </a>
            </li>

            <!-- <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'profile') !== false || strpos($_SERVER['REQUEST_URI'], 'profile_edit') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="profile.php">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
            </a>
          </li>
 -->

          <?php } else { ?>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'index') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="index.php">
                <i class="align-middle" data-feather="home"></i> <span class="align-middle">Dashboard</span>
              </a>
            </li>



            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'category') !== false || strpos($_SERVER['REQUEST_URI'], 'category_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="category.php">
                <i class="align-middle" data-feather="layers"></i> <span class="align-middle">Categories</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'product') !== false || strpos($_SERVER['REQUEST_URI'], 'product_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="product.php">
                <i class="align-middle" data-feather="tag"></i> <span class="align-middle">Products</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'inventory') !== false || strpos($_SERVER['REQUEST_URI'], 'inventory_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="inventory.php">
                <i class="align-middle" data-feather="package"></i> <span class="align-middle">Inventory</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'order') !== false || strpos($_SERVER['REQUEST_URI'], 'order_view') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="order.php">
                <i class="align-middle" data-feather="shopping-bag"></i> <span class="align-middle">Orders</span>
              </a>
            </li>

            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'report') !== false || strpos($_SERVER['REQUEST_URI'], 'report_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="report.php">
                <i class="align-middle" data-feather="file"></i> <span class="align-middle">Reports</span>
              </a>
            </li>
            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'walkin_product') !== false || strpos($_SERVER['REQUEST_URI'], 'walkin_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="walkin_product.php?filter=all">
                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Walkin Products</span>
              </a>
            </li>
            <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'walkin_checkout') !== false || strpos($_SERVER['REQUEST_URI'], 'walkin_edit') !== false) ? 'active' : '' ?>">
              <a class="sidebar-link" href="walkin_checkout.php">
                <i class="align-middle" data-feather="monitor"></i> <span class="align-middle">Walkin Checkout</span>
              </a>
            </li>

            <!-- <li class="sidebar-item <?= (strpos($_SERVER['REQUEST_URI'], 'profile') !== false || strpos($_SERVER['REQUEST_URI'], 'profile_edit') !== false) ? 'active' : '' ?>">
            <a class="sidebar-link" href="profile.php">
              <i class="align-middle" data-feather="user"></i> <span class="align-middle">Profile</span>
            </a>
          </li>
 -->
          <?php } ?>
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
                <a class="dropdown-item" href="profile.php">Profile</a>
                <a class="dropdown-item" href="../logout.php">Log out</a>
              </div>
            </li>
          </ul>
        </div>
      </nav>