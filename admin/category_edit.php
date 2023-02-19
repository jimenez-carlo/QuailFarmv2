<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_category where id = $id and is_deleted = 0");

function update($data)
{
  extract($data);
  $check_name = get_one("select count(`name`) as `exists` from tbl_category where `name` = '$name' and id <> '$id' and is_deleted = 0 group by name limit 1");

  if (isset($check_name->exists) && !empty($check_name->exists)) {
    return alert("Category Already In-Used!");
  }

  query("UPDATE tbl_category set `name` = '$name' where id = '$id'");
  return alert("Category Updated!");
}

echo isset($_POST['update']) ? update($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Edit Category ID#<?= $id ?> </strong> <a href="category.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" onSubmit="return confirm('Are You Sure?') ">
      <input type="hidden" name="id" value="<?= $id ?>">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-12">
                <label for="password" class="form-label">*Name</label>
                <input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="Category" required value="<?= isset($_POST['update']) ? $_POST['name'] : $info->name; ?>">
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