<?php include_once('header.php') ?>
<?php

function register($data)
{
  extract($data);
  $check_username = get_one("select count(username) as `exists` from tbl_users where username = '$username' group by username limit 1");


  if (!empty($new_password) && !empty($re_password) && $new_password != $re_password) {
    return alert("New Password & Re-Type New Password Doest Not Match!");
  }

  if (isset($check_username->exists) && !empty($check_username->exists)) {
    return alert("Username Already In-Used!");
  }


  $password = password_hash($new_password, PASSWORD_DEFAULT);

  $last_id = get_inserted_id("INSERT INTO tbl_users (username,`password`,access_id) values ('$username', '$password', 3)");
  query("INSERT INTO tbl_users_info (id,first_name,last_name,contact_no,gender_id,province,city,barangay) VALUES ('$last_id', '$firstname', '$lastname','$contact','$gender','$province','$city','$barangay')");
  unset($_POST);
  return alert("User Registered!");
}

echo isset($_POST['register']) ? register($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Customer Registration</strong></h1>
    <form method="post" name="register_user" onSubmit="return confirm('Are You Sure?') ">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6">
                <label for="password" class="form-label">*Username</label>
                <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="John Doe" required value="<?= isset($_POST['register']) ? $_POST['username'] : ''; ?>">
              </div>
              <div class="col-md-6">
                <label for="email" class="form-label">*Access</label>
                <input type="text" class="form-control form-control-sm" id="email" name="email" value="Customer" disabled>
                <input type="hidden" name="access" value="3">
              </div>
              <div class="col-md-6">
                <label for="password" class="form-label">*Password</label>
                <input type="password" class="form-control form-control-sm" id="new_password" name="new_password" placeholder="password" required value="<?= isset($_POST['register']) ? $_POST['new_password'] : ''; ?>">
              </div>
              <div class="col-md-6">
                <label for="password_retype" class="form-label">*Re-Type Password</label>
                <input type="password" class="form-control form-control-sm" id="re_password" name="re_password" placeholder="re-type password" required value="<?= isset($_POST['register']) ? $_POST['re_password'] : ''; ?>">
              </div>
              <div class="col-md-6">
                <label for="firstname" class="form-label">*First Name</label>
                <input type="text" class="form-control form-control-sm" id="firstname" required name="firstname" placeholder="firstname" value="<?= isset($_POST['register']) ? $_POST['firstname'] : ''; ?>">
              </div>
              <div class="col-md-6">
                <label for="lastname" class="form-label">*Last Name</label>
                <input type="text" class="form-control form-control-sm" id="lastname" required name="lastname" placeholder="lastname" value="<?= isset($_POST['register']) ? $_POST['lastname'] : ''; ?>">
              </div>
              <div class="col-md-4">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*Province</label>
                  <input type="text" class="form-control form-control-sm" id="province" required name="province" placeholder="province" value="<?= isset($_POST['register']) ? $_POST['province'] : ''; ?>">
                </div>
              </div>
              <div class="col-md-4">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*City</label>
                  <input type="text" class="form-control form-control-sm" id="city" required name="city" placeholder="city" value="<?= isset($_POST['register']) ? $_POST['city'] : ''; ?>">
                </div>
              </div>
              <div class="col-md-4">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*Barangay</label>
                  <input type="text" class="form-control form-control-sm" id="barangay" required name="barangay" placeholder="barangay" value="<?= isset($_POST['register']) ? $_POST['barangay'] : ''; ?>">
                </div>
              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Gender</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="gender" required name="gender" style="width: 100%;">
                  <?php foreach (get_list("select * from tbl_gender") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . ((isset($_POST['register']) && $res['id'] == $_POST['gender']) ? 'selected' : '') . ' >' . $res['gender'] . '</option>';
                  } ?>
                </select>

              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Contact No</label>
                <input type="text" class="form-control form-control-sm" id="contact" required name="contact" placeholder="09xxxxxxxxx" value="<?= isset($_POST['register']) ? $_POST['contact'] : ''; ?>">
              </div>


              <div class="col-md-12 mt-3">
                <div class="pull-right">
                  <a href="customer.php" class="btn btn-sm btn-secondary"> Back</a>
                  <button type="submit" name="register" class="btn btn-sm btn-secondary">Register </button>
                </div>
              </div>
            </div>
          </div>

        </div>
      </div>
    </form>

  </div>
</main>

<?php include_once('footer.php') ?>