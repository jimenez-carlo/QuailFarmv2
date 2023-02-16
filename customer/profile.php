<?php include_once('header.php') ?>
<?php


$info = get_one("select g.gender,UPPER(a.name) as 'access',ui.*,u.* from tbl_users u inner join tbl_users_info ui on ui.id = u.id inner join tbl_access a on a.id = u.access_id inner join tbl_gender g on g.id = ui.gender_id WHERE u.id = " . $_SESSION['user']->id);

function update_profile($data)
{
  extract($data);
  $customer_id = $_SESSION['user']->id;
  $check_username = get_one("select count(username) as `exists` from tbl_users where username = '$username' and id <> '$customer_id' group by username limit 1");

  if (isset($check_username->exists) && !empty($check_username->exists)) {
    return alert("Username Already In-Used!");
  }


  query("UPDATE tbl_users_info set first_name = '$first_name', last_name = '$last_name', contact_no = '$contact_no', gender_id = '$gender',province = '$province',city = '$city',barangay = '$barangay' where id = '$customer_id'");
  query("UPDATE tbl_users set username = '$username' where id = '$customer_id'");
  $_SESSION['user']->first_name = $first_name;
  $_SESSION['user']->last_name = $last_name;
  unset($_POST);
  return alert("Profile Updated!");
}

function change_password($data)
{
  extract($data);

  $check_password = password_verify($old_password, $_SESSION['user']->password);
  if (!empty($old_password) && $check_password == false) {
    return alert("Entered Wrong Old Password!");
  }

  if (!empty($new_password) && !empty($re_password) && $new_password != $re_password) {
    return alert("New Password & Re-Type New Password Doest Not Match!");
  }
  unset($_POST);
  return alert("Password Updated!");
}

?>
<?= (isset($_POST['update_profile'])) ? update_profile($_POST) : ''; ?>
<?= (isset($_POST['change_password'])) ? change_password($_POST) : ''; ?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>My Profile</strong></h1>


    <div class="col-12 col-lg-12">
      <div class="card">
        <div class="card-header">
          <h5 class="card-title mb-0">Personal Information</h5>
        </div>
        <div class="card-body">
          <form method="post" autocomplete="off" onsubmit="return confirm('Are You Sure?');">
            <div class="row">
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputEmail4">*Username</label>
                <input type="text" name="username" class="form-control form-control-sm" id="inputEmail4" placeholder="Username" value="<?= isset($_POST['new_password']) && isset($_POST['update_profile']) ? $_POST['username'] : $info->username ?>">
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputPassword4">*Email</label>
                <input type="email" name="email" class="form-control form-control-sm" id="inputPassword4" placeholder="Email" value="<?= isset($_POST['email']) && isset($_POST['update_profile']) ? $_POST['email'] : $info->email ?>">
              </div>
            </div>

            <div class="row">
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputEmail4">*First Name</label>
                <input type="text" name="first_name" class="form-control form-control-sm" id="inputEmail4" placeholder="First Name" value="<?= isset($_POST['first_name']) && isset($_POST['update_profile']) ? $_POST['first_name'] : $info->first_name ?>">
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputPassword4">*Last Name</label>
                <input type="text" name="last_name" class="form-control form-control-sm" id="inputPassword4" placeholder="Last Name" value="<?= isset($_POST['last_name']) && isset($_POST['update_profile']) ? $_POST['last_name'] : $info->last_name ?>">
              </div>
            </div>

            <div class="row">
              <div class="mb-3 col-md-6">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*Province</label>
                  <input type="text" class="form-control form-control-sm" id="province" required name="province" placeholder="province" value="<?= isset($_POST['update_profile']) ? $_POST['province'] : $info->province; ?>">
                  <label for="lastname" class="form-label">*City</label>
                  <input type="text" class="form-control form-control-sm" id="city" required name="city" placeholder="city" value="<?= isset($_POST['update_profile']) ? $_POST['city'] : $info->city; ?>">
                  <label for="lastname" class="form-label">*Barangay</label>
                  <input type="text" class="form-control form-control-sm" id="barangay" required name="barangay" placeholder="barangay" value="<?= isset($_POST['update_profile']) ? $_POST['barangay'] : $info->barangay; ?>">
                </div>
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputPassword4">*Contact</label>
                <input type="number" name="contact_no" class="form-control form-control-sm" id="inputPassword4" placeholder="Contact" value="<?= isset($_POST['re_password']) && isset($_POST['update_profile']) ? $_POST['contact_no'] : $info->contact_no ?>">

                <label class="form-label" for="inputPassword4">Gender</label>
                <select name="gender" id="" class="form-control form-control-sm">
                  <?php foreach (get_list("select id,UPPER(gender) as 'gender' from tbl_gender") as $res) {
                    if ($info->gender_id == $res['id']) {
                      echo '<option value="' . $res['id'] . '" selected>' . $res['gender'] . '</option>';
                    } else {
                      echo '<option value="' . $res['id'] . '">' . $res['gender'] . '</option>';
                    }
                  } ?>
                </select>
              </div>
            </div>

            <button type="submit" class="btn btn-secondary btn-sm" name="update_profile">Save Changes</button>
          </form>
        </div>
      </div>
    </div>


    <div class="col-12 col-lg-12">
      <div class="card">
        <div class="card-header">
          <h5 class="card-title mb-0">Change Password</h5>
        </div>
        <div class="card-body">
          <form method="post" autocomplete="off" onsubmit="return confirm('Are You Sure?');">
            <div class="row">
              <div class="mb-3 col-md-12">
                <label class="form-label" for="inputPassword4">Old Password</label>
                <input type="password" name="old_password" class="form-control form-control-sm" id="inputPassword4" placeholder="Password" value="<?= isset($_POST['old_password']) && isset($_POST['change_password']) ? $_POST['old_password'] : '' ?>" required>
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputEmail4">New Password</label>
                <input type="password" name="new_password" class="form-control form-control-sm" id="inputEmail4" placeholder="Password" value="<?= isset($_POST['new_password']) && isset($_POST['change_password']) ? $_POST['new_password'] : '' ?>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputPassword4">Re-type New Password</label>
                <input type="password" name="re_password" class="form-control form-control-sm" id="inputPassword4" placeholder="Password" value="<?= isset($_POST['re_password']) && isset($_POST['change_password']) ? $_POST['re_password'] : '' ?>" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
              </div>
            </div>
            <button type="submit" class="btn btn-secondary btn-sm" name="change_password">Save Changes</button>
          </form>
        </div>
      </div>
    </div>

  </div>
</main>
<?php include_once('footer.php') ?>