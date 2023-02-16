<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
$info = get_one("SELECT * from tbl_product p WHERE is_deleted = 0 and p.id = $id");

function update($data)
{
  extract($data);
  // $check_name = get_one("select count(name) as `exists` from tbl_product where name = '$name' and id <> '$id' group by name limit 1");

  // if (isset($check_name->exists) && !empty($check_name->exists)) {
  //   return alert("Product Name Already In-Used!");
  // }


  $info = get_one("SELECT * from tbl_product p WHERE p.is_deleted = 0 and p.id = $id");
  $image_name = $info->image;
  if ($_FILES['image']['error'] == 0) {
    $image_name = 'image_' . date('YmdHis') . '.jpeg';
    move_uploaded_file($_FILES["image"]["tmp_name"],   '../images/products/' . $image_name);
  }

  query("UPDATE tbl_product set `name` = '$name', `description` = '$description', price = '$price', `image`='$image_name',category_id ='$category',`expiration_date` ='$expiration'  where id = '$id'");
  return alert("Product Updated!");
}

echo isset($_POST['update']) ? update(array_merge($_POST, $_FILES)) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Edit Product ID#<?= $id ?> </strong> <a href="product.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <form method="post" onSubmit="return confirm('Are You Sure?') " enctype="multipart/form-data">
      <input type="hidden" name="id" value="<?= $id ?>">
      <div class="card">

        <div class="card-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-6">
                <label for="password" class="form-label">*Name</label>
                <input type="text" class="form-control form-control-sm" id="name" name="name" placeholder="Product Name" required value="<?= isset($_POST['update']) ? $_POST['name'] : $info->name; ?>">
                <label for="contact" class="form-label">*Category</label>
                <select class="form-select form-select-sm" aria-label=".form-select-lg example" id="category" required name="category" style="width: 100%;">
                  <?php foreach (get_list("select * from tbl_category where is_deleted = 0 order by name asc") as $res) {
                    echo '<option value="' . $res['id'] . '"  ' . (($res['id'] == $info->category_id) ? 'selected' : $info->category_id) . ' >' . strtoupper($res['name']) . '</option>';
                  } ?>
                </select>
                <label for="password2" class="form-label">*Price</label>
                <input type="number" class="form-control form-control-sm" id="price" name="price" placeholder="Product Price" required value="<?= isset($_POST['update']) ? $_POST['price'] : $info->price ?>">
                <label for="password2" class="form-label">*Expiration Date</label>
                <input type="date" class="form-control form-control-sm" id="expiration" name="expiration" placeholder="Product Expiration Date" required value="<?= isset($_POST['update']) ? $_POST['expiration'] : '' ?>">
                <label for="password" class="form-label">Description</label>
                <textarea name="description" class="form-control" id="" cols="30" rows="3" placeholder="Product Description"><?= isset($_POST['update']) ? $_POST['price'] : $info->description ?></textarea>
              </div>

              <div class="col-md-6">
                <label for="password" class="form-label">Image</label>
                <center>
                  <img src="../images/products/<?php echo $info->image; ?>" alt="" style="width:200px;height:200px;align-self: center;" id="preview">
                </center>
                <input type="file" class="form-control form-control-sm" id="image" name="image" style="margin-top: 13px;">
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
<script>
  inputImage = document.getElementById('image');
  preview = document.getElementById('preview');
  inputImage.onchange = evt => {
    const [file] = inputImage.files
    if (file && file['type'].split('/')[0] === 'image') {
      preview.src = URL.createObjectURL(file)
    } else {
      preview.src = '../images/products/default.png';
    }
  }
</script>
<?php include_once('footer.php') ?>