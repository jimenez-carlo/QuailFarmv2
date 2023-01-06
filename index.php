<?php include('functions.php') ?>
<?php
if (isset($_SESSION['user'])) {
  if ($_SESSION['user']->access_id == 1  || $_SESSION['user']->access_id == 2 || $_SESSION['user']->access_id == 4 || $_SESSION['user']->access_id == 5) {
    header('location:' . $base_url . 'admin/index.php');
  } else if ($_SESSION['user']->access_id == 3) {
    header('location:' . $base_url . 'customer/index.php');
  }
} else {
  header('location:' . $base_url . 'landing/index.php');
} ?>