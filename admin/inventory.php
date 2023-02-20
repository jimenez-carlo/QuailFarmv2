<?php include_once('header.php') ?>
<?php

function re_stock($data)
{
  extract($data);
  $created_by = $_SESSION['user']->id;

  if (empty($qty)) {
    return alert("Qty Empty!");
  }

  $qty = (int)$qty;
  $original_qty = get_one("select qty from tbl_inventory where product_id = '$product_id'")->qty;
  query("UPDATE tbl_inventory set qty = (qty + $qty) where product_id = '$product_id'");
  query("INSERT into tbl_inventory_history (product_id,original_qty,qty,created_by) values ('$product_id', '$original_qty','$qty', '$created_by')");
  return alert("Product Re-Stocked!");
}
echo isset($_POST['re_stock']) ? re_stock($_POST) : '';
?>
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
                  <!-- <th scope="col" class="text-center">PID#</th> -->
                  <th scope="col" class="text-center">Name</th>
                  <th scope="col" class="text-center">Stock</th>
                  <th scope="col" class="text-center">Price</th>
                  <th scope="col" class="text-center">Total Price</th>
                  <th scope="col" class="text-center">Expiration Date</th>
                  <th scope="col" class="text-center">Date Created</th>
                  <th scope="col" class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select i.qty,p.* from tbl_product p inner join tbl_inventory i on i.product_id = p.id where is_deleted = 0 order by p.date_created desc") as $res) { ?>
                  <tr>
                    <!-- <td><?php echo $res['id']; ?></td> -->
                    <td class="text-center"><?php echo $res['name']; ?></td>
                    <td class="text-center"><?php echo $res['qty']; ?></td>
                    <td class="text-center"><?php echo $res['price']; ?></td>
                    <td class="text-center"><?php echo number_format($res['price'] * $res['qty'], 2); ?></td>
                    <td class="text-center"><?php echo $res['expiration_date']; ?></td>
                    <!-- <td class="text-center"><?php echo $res['date_created']; ?></td> -->
                    <?php $tmp = date_create($res['date_created']); ?>
                    <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                    <td style="width: 25%;" class="text-center">
                      <center>
                        <form method="post" onsubmit="return confirm('Are You Sure?')">
                          <input type="hidden" value="<?php echo $res['id']; ?>" name="product_id">
                          <div class="input-group " style="justify-content: center;">
                            <div class="input-group-prepend">
                              <button class="btn btn-sm btn-secondary" type="submit" name="re_stock">Re-Stock </button>
                            </div>
                            <input type="text" class="form-control form-control-sm" name="qty" value="0" style="text-align:right;max-width:20%">
                            <a href="inventory_view.php?id=<?php echo $res['id']; ?>" class="btn btn-sm btn-secondary btn-edit"> View </a>
                          </div>
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
  $('table').DataTable({
    ordering: false,
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
  });
</script>
<?php include_once('footer.php') ?>