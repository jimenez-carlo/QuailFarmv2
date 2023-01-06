<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Products</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <select class="form-select category">
              <option selected hidden>Select Category...</option>

              <option value="all">ALL</option>
              <?php foreach (get_list("select id,UPPER(name) as 'category' from tbl_category where is_deleted = 0") as $res) { ?>
                <option value="<?= strtolower($res['category']) ?>"><?= $res['category'] ?></option>
              <?php }  ?>
            </select>

          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script>
  $(document).on("change", '.category ', function() {
    var id = $(this).val();
    window.location = 'category.php?filter=' + id;
  });
</script>
<?php include_once('footer.php') ?>