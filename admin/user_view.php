<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_users u inner join tbl_users_info ui on ui.id = u.id where u.id = $id");
$tmp = array();
$order_history = get_list("select t.id,t.qty,s.status,t.date_updated,t.status_id,i.invoice, i.date_created as invoice_date,p.id as `product_id`,p.name,p.price as product_price from tbl_transactions t inner join tbl_status s on s.id = t.status_id inner join tbl_invoice i on i.id = t.invoice_id  inner join tbl_product p on p.id = t.product_id where t.is_deleted = 0 and p.is_deleted = 0 and t.status_id > 1 and buyer_id = '$id' order by t.date_created desc");
foreach ($order_history as $res) {
  $tmp['invoice'][$res['invoice']][$res['id']] = $res;
}
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>View User ID#<?= $id ?> </strong> <a href="customer.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" name="register_user" onSubmit="return confirm('Are You Sure?') ">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6">
                <label for="password" class="form-label">*Username</label>
                <input disabled type="text" class="form-control form-control-sm" id="username" name="username" placeholder="John Doe" required value="<?= $info->username ?>">
              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Access</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="access" required name="access" style="width: 100%;" disabled>
                  <?php foreach (get_list("select * from tbl_access where id not in (1,3) order by name asc") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . (($res['id'] == $info->access_id) ? 'selected' : '') . ' >' . strtoupper($res['name']) . '</option>';
                  } ?>
                </select>
              </div>
              <div class="col-md-6">
                <label for="firstname" class="form-label">*First Name</label>
                <input disabled type="text" class="form-control form-control-sm" id="firstname" required name="firstname" placeholder="firstname" value="<?= $info->first_name ?>">
              </div>
              <div class="col-md-6">
                <label for="lastname" class="form-label">*Last Name</label>
                <input disabled type="text" class="form-control form-control-sm" id="lastname" required name="lastname" placeholder="lastname" value="<?= $info->last_name ?>">
              </div>
              <div class="col-md-6">
                <div class="col-md-12">
                  <label for="lastname" class="form-label">*Province</label>
                  <input disabled type="text" class="form-control form-control-sm" id="province" required name="province" placeholder="province" value="<?= $info->province ?>">
                  <label for="lastname" class="form-label">*City</label>
                  <input disabled type="text" class="form-control form-control-sm" id="city" required name="city" placeholder="city" value="<?= $info->city ?>">
                  <label for="lastname" class="form-label">*Barangay</label>
                  <input disabled type="text" class="form-control form-control-sm" id="barangay" required name="barangay" placeholder="barangay" value="<?= $info->barangay ?>">
                </div>
              </div>
              <div class="col-md-6">
                <label for="contact" class="form-label">*Contact No</label>
                <input disabled type="text" class="form-control form-control-sm" id="contact" required name="contact" placeholder="09xxxxxxxxx" value="<?= $info->contact_no ?>">
                <label for="contact" class="form-label">*Gender</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="gender" required name="gender" style="width: 100%;" disabled>
                  <?php foreach (get_list("select * from tbl_gender") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . (($res['id'] == $info->gender_id) ? 'selected' : '') . ' >' . $res['gender'] . '</option>';
                  } ?>
                </select>

              </div>

            </div>
          </div>

        </div>
      </div>
    </form>


  </div>
</main>

<?php include_once('footer.php') ?>