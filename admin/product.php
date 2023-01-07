<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Products</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col">PID#</th>
                  <th scope="col">Category</th>
                  <th scope="col" style="width: 0.1%;">Image</th>
                  <th scope="col">Name</th>
                  <th scope="col">Price</th>
                  <th scope="col">Description</th>
                  <!-- <th scope="col">Date Created</th> -->
                  <th scope="col">Created By</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select c.name as category_name,p.*,concat('(ID#',i.id,') ',i.last_name,', ',i.first_name) as created_by from tbl_product p left join tbl_users_info i on i.id = p.created_by inner join tbl_category c on c.id = p.category_id where p.is_deleted = 0") as $res) { ?>
                  <tr>
                    <td><?php echo $res['id']; ?></td>
                    <td><span class="badge bg-secondary text-light"><?php echo $res['category_name']; ?></span></td>
                    <!-- <td><?php echo $res['category_name']; ?></td> -->
                    <td style="width: 0.1%;"><img src="../images/products/<?php echo $res['image']; ?>" style="width:100px;height:100px" /></td>
                    <td><?php echo $res['name']; ?></td>
                    <td class="text-end"><?php echo $res['price']; ?></td>
                    <td><?php echo $res['description']; ?></td>
                    <!-- <td><?php echo $res['date_created']; ?></td> -->
                    <td><?php echo $res['created_by']; ?></td>
                    <td>
                      <form method="post" name="update_product">
                        <button type="button" class="btn btn-sm btn-secondary btn-edit" name="product_edit" value="<?php echo $res['id']; ?>"> Edit </button>
                        <input type="hidden" value="<?php echo $res['id']; ?>" name="product_id">
                        <button type="submit" class="btn btn-sm btn-secondary" name="type" value="delete"> Delete </button>
                      </form>
                    </td>
                  </tr>
                <?php } ?>
              </tbody>
            </table>

          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script>
  var tbl = $('table').DataTable({
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
    buttons: [{
      className: 'btn btn-sm btn-secondary',
      text: 'Add Product',
      action: function(e, dt, node, config) {
        $("#content").load(base_url + 'module/page.php?page=product_add');
      }
    }]
  });



  $(document).ready(function() {
    $('<select name="category" id="category" class="select" style="margin-left:5px;vertical-align:middle"> <option value="">All</option><?php foreach (get_list("select id,UPPER(name) as 'category' from tbl_category where is_deleted = 0") as $res) { ?><option><?php echo $res['category']; ?></option><?php } ?></select>').insertAfter(".dt-button");
    $(document).on("change", '#category ', function() {
      var val = $(this).val(); //attr('value');
      tbl
        .column(1)
        .search(val)
        .draw();
    });
  });
</script>
<?php include_once('footer.php') ?>