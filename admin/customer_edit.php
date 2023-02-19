<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_users u inner join tbl_users_info ui on ui.id = u.id where u.id = $id");

function update($data)
{
  extract($data);
  // $check_username = get_one("select count(username) as `exists` from tbl_users where username = '$username' and id <> '$id' group by username limit 1");

  // if (!empty($new_password) && !empty($re_password) && $new_password != $re_password) {
  //   return alert("New Password & Re-Type New Password Doest Not Match!");
  // }

  // if (isset($check_username->exists) && !empty($check_username->exists)) {
  //   return alert("Username Already In-Used!");
  // }

  // $password = password_hash($new_password, PASSWORD_DEFAULT);
  // echo "UPDATE tbl_users_info set first_name = '$firstname', last_name = '$lastname', contact_no = '$contact', gender_id = '$gender',province = '$province', city = '$city', barangay = '$barangay' where id = '$id'";
  // die;


  query("UPDATE tbl_users_info set first_name = '$firstname', last_name = '$lastname', contact_no = '$contact', gender_id = '$gender',province = '$province', city = '$city', barangay = '$barangay' where id = '$id'");
  // query("UPDATE tbl_users set username = '$username', password = '$password' where id = '$id'");
  return alert("Customer Updated!");
}

echo isset($_POST['update']) ? update($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Edit Customer ID#<?= $id ?> </strong> <a href="customer.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" onSubmit="return confirm('Are You Sure?') ">
      <input type="hidden" name="id" value="<?= $id ?>">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">

              <div class="col-md-6">
                <label for="firstname" class="form-label">*First Name</label>
                <input type="text" class="form-control form-control-sm" id="firstname" required name="firstname" placeholder="firstname" value="<?= isset($_POST['update']) ? $_POST['firstname'] : $info->first_name; ?>">
              </div>
              <div class="col-md-6">
                <label for="lastname" class="form-label">*Last Name</label>
                <input type="text" class="form-control form-control-sm" id="lastname" required name="lastname" placeholder="lastname" value="<?= isset($_POST['update']) ? $_POST['lastname'] : $info->last_name; ?>">
              </div>


              <div class="col-md-6">
                <label for="contact" class="form-label">*Gender</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="gender" required name="gender" style="width: 100%;">
                  <?php foreach (get_list("select * from tbl_gender") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . ((isset($_POST['update']) && $res['id'] == $_POST['gender']) ? 'selected' : '') . ' >' . $res['gender'] . '</option>';
                  } ?>
                </select>

              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Contact No</label>
                <input type="text" class="form-control form-control-sm" id="contact" required name="contact" placeholder="09xxxxxxxxx" value="<?= isset($_POST['update']) ? $_POST['contact'] : $info->contact_no; ?>">
              </div>
              <div class="col-md-4">
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
                </div>
              </div>
              <div class="col-md-4">
                <div class="col-md-12">
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
                </div>
              </div>
              <div class="col-md-4">
                <div class="col-md-12">
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

              <div class="col-md-12 mt-3">
                <div class="pull-right">
                  <button type="submit" name="update" class="btn btn-sm btn-secondary">Update </button>
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