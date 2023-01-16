<?php include_once('header.php') ?>
<?php
function register($data)
{
  extract($data);
  $check_name = get_one("select count(`name`) as `exists` from tbl_category where `name` = '$name' group by name limit 1");

  if (isset($check_name->exists) && !empty($check_name->exists)) {
    return alert("Category Already In-Used!");
  }

  query("INSERT into tbl_category (`name`) values('$name')");
  unset($_POST);
  return alert("Category Added!");
}

echo isset($_POST['register']) ? register($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Add Category </strong> <a href="category.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" onSubmit="return confirm('Are You Sure?') ">
      <input type="hidden" name="id" value="<?= $id ?>">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <label for="password" class="form-label">*Name</label>
                <input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="Category" required value="<?= isset($_POST['update']) ? $_POST['name'] : ''; ?>">
              </div>

              <div class="col-md-12 mt-3">
                <div class="pull-right">
                  <button type="submit" name="register" class="btn btn-sm btn-secondary">Add </button>
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