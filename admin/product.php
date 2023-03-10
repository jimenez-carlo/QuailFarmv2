<?php include_once('header.php') ?>
<?php

function delete($data)
{
  extract($data);
  query("UPDATE tbl_product set is_deleted = 1 where id = $delete");
  return alert("Product Deleted!");
}

echo isset($_POST['delete']) ? delete($_POST) : '';
?>
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
                  <!-- <th scope="col" class="text-center">PID#</th> -->
                  <th scope="col" class="text-center">Category</th>
                  <th scope="col" class="text-center" style="width: 0.1%;">Image</th>
                  <th scope="col" class="text-center">Name</th>
                  <th scope="col" class="text-center">Price</th>
                  <th scope="col" class="text-center">Qty</th>
                  <th scope="col" class="text-center">Total</th>
                  <th scope="col" class="text-center">Expiration Date</th>
                  <th scope="col" class="text-center">Description</th>
                  <!-- <th scope="col" class="text-center">Date Created</th> -->
                  <!-- <th scope="col" class="text-center">Created By</th> -->
                  <th scope="col" class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("

select i.qty,c.name as category_name,p.*,concat('(ID#',ui.id,') ',ui.last_name,', ',ui.first_name) as created_by from tbl_product p inner join tbl_inventory i on i.product_id = p.id left join tbl_users_info ui on ui.id = p.created_by inner join tbl_category c on c.id = p.category_id where p.is_deleted = 0 order by p.date_created desc") as $res) { ?>
                  <tr>
                    <!-- <td><?php echo $res['id']; ?></td> -->
                    <td class="text-center"><span class="badge bg-secondary text-light"><?php echo $res['category_name']; ?></span></td>
                    <!-- <td><?php echo $res['category_name']; ?></td> -->
                    <td style="width: 0.1%;"><img src="../images/products/<?php echo $res['image']; ?>" style="width:100px;height:100px" /></td>
                    <td class="text-center"><?php echo $res['name']; ?></td>
                    <td class="text-center"><?php echo number_format($res['price'], 2); ?></td>
                    <td class="text-center"><?php echo $res['qty']; ?></td>
                    <td class="text-center"><?php echo number_format($res['qty'] * (float)$res['price'], 2); ?></td>
                    <td class="text-center"><?php echo $res['expiration_date']; ?></td>
                    <td class="text-center"><?php echo $res['description']; ?></td>
                    <!-- <td><?php echo $res['date_created']; ?></td> -->
                    <!-- <td class="text-center"><?php echo $res['created_by']; ?></td> -->
                    <td>
                      <center>
                        <form method="post" onsubmit="return confirm('Are You Sure?')">
                          <a href="product_edit.php?id=<?php echo $res['id']; ?>" class="btn btn-sm btn-secondary btn-edit"> Edit </a>
                          <button type="submit" class="btn btn-sm btn-secondary" name="delete" value="<?php echo $res['id']; ?>"> Delete </button>
                        </form>
                      </center>
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
        window.location = "product_add.php";
      }
    }]
  });



  $(document).ready(function() {
    $('<select name="category" id="category" class="select" style="margin-left:5px;vertical-align:middle"> <option value="">All</option><?php foreach (get_list("select id,UPPER(name) as 'category' from tbl_category where is_deleted = 0") as $res) { ?><option><?php echo $res['category']; ?></option><?php } ?></select>').insertAfter(".dt-button");
    $(document).on("change", '#category ', function() {
      var val = $(this).val(); //attr('value');
      tbl
        .column(0)
        .search(val)
        .draw();
    });
  });
</script>
<?php include_once('footer.php') ?>