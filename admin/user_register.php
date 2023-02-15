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

  $last_id = get_inserted_id("INSERT INTO tbl_users (username,`password`,access_id) values ('$username', '$password', $access)");
  // query("INSERT INTO tbl_users_info (id,first_name,last_name,contact_no,gender_id,province,city,barangay) VALUES ('$last_id', '$firstname', '$lastname','$contact','$gender','$province','$city','$barangay')");
  unset($_POST);
  return alert("User Registered!");
}

echo isset($_POST['register']) ? register($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">
    <div class="col-md-12">
      <h1 class="h3 mb-3"><strong>User Registration</strong></h1>
      <form method="post" name="register_user" onSubmit="return confirm('Are You Sure?') ">
        <div class="card">

          <div class="card-body">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-6">
                  <label for="password" class="form-label">*Username</label>
                  <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="username " required value="<?= isset($_POST['register']) ? $_POST['username'] : ''; ?>">
                </div>
                <div class="col-md-6">
                  <label for="contact" class="form-label">*Access</label>
                  <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="access" required name="access" style="width: 100%;">
                    <?php foreach (get_list("select * from tbl_access order by name asc") as $res) {
                      echo '<option value="' . $res['id'] . '"  ' . ((isset($_POST['register']) && $res['id'] == $_POST['access']) ? 'selected' : '') . ' >' . strtoupper($res['name']) . '</option>';
                    } ?>
                  </select>
                </div>
                <div class="col-md-6">
                  <label for="password" class="form-label">*Password</label>
                  <input type="password" class="form-control form-control-sm" id="new_password" name="new_password" placeholder="password" required value="<?= isset($_POST['register']) ? $_POST['new_password'] : ''; ?>">
                </div>
                <div class="col-md-6">
                  <label for="password_retype" class="form-label">*Re-Type Password</label>
                  <input type="password" class="form-control form-control-sm" id="re_password" name="re_password" placeholder="re-type password" required value="<?= isset($_POST['register']) ? $_POST['re_password'] : ''; ?>">
                </div>


              </div>

              <div class="col-md-12 mt-3">
                <div class="pull-right">
                  <a href="user.php" class="btn btn-sm btn-secondary"> Back</a>
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