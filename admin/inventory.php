<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Inventory</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col">PID#</th>
                  <th scope="col">Name</th>
                  <th scope="col">Stock</th>
                  <th scope="col">Price</th>
                  <th scope="col">Date Created</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select i.qty,p.* from tbl_product p inner join tbl_inventory i on i.product_id = p.id where is_deleted = 0") as $res) { ?>
                  <tr>
                    <td><?php echo $res['id']; ?></td>
                    <td><?php echo $res['name']; ?></td>
                    <td class="text-end"><?php echo $res['qty']; ?></td>
                    <td class="text-end"><?php echo $res['price']; ?></td>
                    <td><?php echo $res['date_created']; ?></td>
                    <td style="width: 25%;">
                      <form method="post" name="update_product">
                        <input type="hidden" value="<?php echo $res['id']; ?>" name="product_id">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <button class="btn btn-sm btn-secondary" type="submit" name="type" value="re_stock_list">Re-Stock </button>
                          </div>
                          <input type="text" class="form-control form-control-sm" name="qty" value="0" style="text-align:right;max-width:20%">
                          <button type="button" class="btn btn-sm btn-secondary btn-edit" name="inventory_edit" value="<?php echo $res['id']; ?>"> View </button>
                        </div>
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
  $('table').DataTable({
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
  });
</script>
<?php include_once('footer.php') ?>