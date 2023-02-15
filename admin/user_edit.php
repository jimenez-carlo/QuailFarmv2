<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_users u inner join tbl_users_info ui on ui.id = u.id where u.id = $id");

function update($data)
{
  extract($data);
  $check_username = get_one("select count(username) as `exists` from tbl_users where username = '$username' and id <> '$id' group by username limit 1");

  if (!empty($new_password) && !empty($re_password) && $new_password != $re_password) {
    return alert("New Password & Re-Type New Password Doest Not Match!");
  }

  if (isset($check_username->exists) && !empty($check_username->exists)) {
    return alert("Username Already In-Used!");
  }


  $password = password_hash($new_password, PASSWORD_DEFAULT);

  // query("UPDATE tbl_users_info set first_name = '$firstname', last_name = '$lastname', contact_no = '$contact', gender_id = '$gender',province = '$province', city = '$city', barangay = '$barangay' where id = '$id'");
  query("UPDATE tbl_users set username = '$username', password = '$password', access_id ='$access'  where id = '$id'");
  return alert("Customer Updated!");
}

echo isset($_POST['update']) ? update($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Edit Customer ID#<?= $id ?> </strong> <a href="user.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" onSubmit="return confirm('Are You Sure?') ">
      <input type="hidden" name="id" value="<?= $id ?>">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6">
                <label for="password" class="form-label">*Username</label>
                <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="username" required value="<?= isset($_POST['update']) ? $_POST['username'] : $info->username; ?>">
              </div>

              <div class="col-md-6">
                <label for="contact" class="form-label">*Access</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="access" required name="access" style="width: 100%;">
                  <?php foreach (get_list("select * from tbl_access  order by name asc") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . (($res['id'] == $info->gendeaccess_idr_id) ? 'selected' : $info->access_id) . ' >' . strtoupper($res['name']) . '</option>';
                  } ?>
                </select>
              </div>
              <div class="col-md-6">
                <label for="password" class="form-label">*Password</label>
                <input type="password" class="form-control form-control-sm" id="new_password" name="new_password" placeholder="password" required value="<?= isset($_POST['update']) ? $_POST['new_password'] : '' ?>">
              </div>
              <div class="col-md-6">
                <label for="password_retype" class="form-label">*Re-Type Password</label>
                <input type="password" class="form-control form-control-sm" id="re_password" name="re_password" placeholder="re-type password" required value="<?= isset($_POST['update']) ? $_POST['re_password'] : '' ?>">
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