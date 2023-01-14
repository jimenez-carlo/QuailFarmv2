<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_users u inner join tbl_users_info ui on ui.id = u.id where u.id = $id");
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Edit Customer ID#<?= $id ?> </strong> <a href="customer.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" name="update_user" onSubmit="return confirm('Are You Sure?') ">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6">
                <label for="password" class="form-label">*Username</label>
                <input type="text" class="form-control form-control-sm" id="username" name="username" placeholder="John Doe" required value="<?= isset($_POST['update']) ? $_POST['username'] : $info->username; ?>">
              </div>
              <div class="col-md-6">
                <label for="email" class="form-label">*Email Address</label>
                <input type="email" class="form-control form-control-sm" id="email" name="email" placeholder="user@example.com" required value="<?= isset($_POST['update']) ? $_POST['email'] : $info->email; ?>">
              </div>
              <div class="col-md-6">
                <label for="password" class="form-label">*Password</label>
                <input type="password" class="form-control form-control-sm" id="new_password" name="new_password" placeholder="password" required value="<?= isset($_POST['update']) ? $_POST['new_password'] : '' ?>">
              </div>
              <div class="col-md-6">
                <label for="password_retype" class="form-label">*Re-Type Password</label>
                <input type="password" class="form-control form-control-sm" id="re_password" name="re_password" placeholder="re-type password" required value="<?= isset($_POST['update']) ? $_POST['re_password'] : '' ?>">
              </div>
              <div class="col-md-6">
                <label for="firstname" class="form-label">*First Name</label>
                <input type="text" class="form-control form-control-sm" id="firstname" required name="firstname" placeholder="firstname" value="<?= isset($_POST['update']) ? $_POST['firstname'] : $info->first_name; ?>">
              </div>
              <div class="col-md-6">
                <label for="lastname" class="form-label">*Last Name</label>
                <input type="text" class="form-control form-control-sm" id="lastname" required name="lastname" placeholder="lastname" value="<?= isset($_POST['update']) ? $_POST['lastname'] : $info->last_name; ?>">
              </div>
              <div class="col-md-6">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*Province</label>
                  <input type="text" class="form-control form-control-sm" id="province" required name="province" placeholder="province" value="<?= isset($_POST['update']) ? $_POST['province'] : $info->province; ?>">
                  <label for="lastname" class="form-label">*City</label>
                  <input type="text" class="form-control form-control-sm" id="city" required name="city" placeholder="city" value="<?= isset($_POST['update']) ? $_POST['city'] : $info->city; ?>">
                  <label for="lastname" class="form-label">*Barangay</label>
                  <input type="text" class="form-control form-control-sm" id="barangay" required name="barangay" placeholder="barangay" value="<?= isset($_POST['update']) ? $_POST['barangay'] : $info->barangay; ?>">
                </div>
              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Contact No</label>
                <input type="text" class="form-control form-control-sm" id="contact" required name="contact" placeholder="09xxxxxxxxx" value="<?= isset($_POST['update']) ? $_POST['contact'] : $info->contact_no; ?>">
                <label for="contact" class="form-label">*Gender</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="gender" required name="gender" style="width: 100%;">
                  <?php foreach (get_list("select * from tbl_gender") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . (($res['id'] == $info->gender_id) ? 'selected' : $info->username) . ' >' . $res['gender'] . '</option>';
                  } ?>
                </select>

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