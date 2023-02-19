<?php include_once('header.php') ?>
<?php




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
<?php

$info = get_one("select g.gender,UPPER(a.name) as 'access',ui.*,u.* from tbl_users u inner join tbl_users_info ui on ui.id = u.id inner join tbl_access a on a.id = u.access_id left join tbl_gender g on g.id = ui.gender_id WHERE u.id = " . $_SESSION['user']->id);
?>
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
                  <select name="province" id="" class="form-control form-control-sm">
                    <?php $tmp_dropdown = isset($_POST['province']) ? $_POST['province'] : $info->province ?>
                    <?php foreach (get_list("select * from tbl_province order by name asc") as $res) {
                      if ($tmp_dropdown == $res['id']) {
                        echo '<option value="' . $res['id'] . '" selected>' . $res['name'] . '</option>';
                      } else {
                        echo '<option value="' . $res['id'] . '">' . $res['name'] . '</option>';
                      }
                    } ?>
                  </select>

                  <label for="lastname" class="form-label">*City</label>
                  <select name="city" id="" class="form-control form-control-sm">
                    <?php $tmp_dropdown = isset($_POST['city']) ? '0128' : $info->province ?>
                    <?php foreach (get_list("select * from tbl_city where province_id = '$tmp_dropdown' order by name asc") as $res) {
                      if ($info->city == $res['id']) {
                        echo '<option value="' . $res['id'] . '" selected>' . $res['name'] . '</option>';
                      } else {
                        echo '<option value="' . $res['id'] . '">' . $res['name'] . '</option>';
                      }
                    } ?>
                  </select>
                  <label for="lastname" class="form-label">*Barangay</label>
                  <select name="barangay" id="" class="form-control form-control-sm">
                    <?php $tmp_dropdown = isset($_POST['barangay']) ? '012801' : $info->city ?>
                    <?php foreach (get_list("select * from tbl_barangay where city_id = '$tmp_dropdown' order by name asc") as $res) {
                      if ($info->barangay  == $res['id']) {
                        echo '<option value="' . $res['id'] . '" selected>' . $res['name'] . '</option>';
                      } else {
                        echo '<option value="' . $res['id'] . '">' . $res['name'] . '</option>';
                      }
                    } ?>
                  </select>
                </div>
              </div>
              <div class="mb-3 col-md-6">
                <label class="form-label" for="inputPassword4">*Contact</label>
                <input type="number" name="contact_no" class="form-control form-control-sm" id="inputPassword4" placeholder="Contact" value="<?= isset($_POST['re_password']) && isset($_POST['update_profile']) ? $_POST['contact_no'] : $info->contact_no ?>">


              </div>
            </div>

            <button type="submit" class="btn btn-secondary btn-sm" name="update_profile">Save Changes</button>
          </form>
        </div>
      </div>
    </div>


    <!-- <div class="col-12 col-lg-12">
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
    </div> -->

  </div>
</main>
<?php include_once('footer.php') ?>
<script>
  $('select[name="province"]').on('change', function() {
    city();
    barangay();
  });

  $('select[name="city"]').on('change', function() {
    barangay();
  });

  function city() {
    $.ajax({
        method: "POST",
        url: "<?= $base_url ?>city.php?id=" + $('select[name="province"]').val()
      })
      .done(function(result) {
        $('select[name="city"]').html(result);
        barangay();
      });
  }

  function barangay() {
    $.ajax({
        method: "POST",
        url: "<?= $base_url ?>barangay.php?id=" + $('select[name="city"]').val()
      })
      .done(function(result) {
        $('select[name="barangay"]').html(result);
      });
  }
</script>