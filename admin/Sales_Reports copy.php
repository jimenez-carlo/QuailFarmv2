<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Sales Reports <a href="inventory_r.php?search=true&from=<?= isset($_GET['from']) ? $_GET['from'] : ''  ?>&to=<?= isset($_GET['to']) ? $_GET['to'] : ''  ?>" class="btn btn-secondary btn-sm">Inventory Transaction</a></strong>

      <form method="get" style="float:right">
        Date From: <input type="date" name="from" value="<?= isset($_GET['search']) ? $_GET['from'] : '' ?>">
        Date To: <input type="date" name="to" value="<?= isset($_GET['search']) ? $_GET['to'] : '' ?>">
        <input type="submit" value="Filter" name="search" class="btn btn-secondary btn-sm">
      </form>
    </h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col" class="text-center">Date Created</th>
                  <th scope="col" class="text-center">OR#</th>
                  <th scope="col" class="text-center">Customer Name</th>
                  <th scope="col" class="text-center">Amount</th>
                  <th scope="col" class="text-center">Original Qty</th>
                  <th scope="col" class="text-center">New Qty</th>
                  <th scope="col" class="text-center">Subtotal</th>

                </tr>
              </thead>
              <tbody>
                <?php $tmp2 = 0 ?>
                <?php $where = isset($_GET['search']) ? " and t.date_created between '" . $_GET['from'] . "' and '" . $_GET['to'] . "'" : "" ?>
                <?php if (isset($_GET['search'])) { ?>
                  <?php foreach (get_list("select p.name,t.price,t.qty,t.date_created,i.invoice, concat(ui.first_name, ' ',ui.last_name) as customer_name,h.original_qty,h.qty as new_qty from tbl_transactions t inner join tbl_product p on p.id = t.product_id inner join tbl_invoice i on i.id= t.invoice_id inner join tbl_users_info ui on ui.id = i.customer_id inner join tbl_inventory_history h on h.product_id = t.product_id and h.qty = (t.qty*-1) where 1 = 1 $where") as $res) { ?>
                    <tr>
                      <?php $tmp = date_create($res['date_created']); ?>
                      <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                      <td class="text-center"><?php echo $res['invoice']; ?></td>
                      <td class="text-center"><?php echo $res['customer_name']; ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo $res['original_qty']; ?></td>
                      <td class="text-center"><?php echo $res['original_qty'] + (int)$res['new_qty']; ?></td>
                      <td class="text-center"><?php echo $res['price']; ?></td>

                      <!-- <td class="text-center"><?php echo $res['name']; ?></td> -->
                      <?php $tmp2 += $res['price'] ?>
                    </tr>
                  <?php } ?>
                <?php } ?>
              </tbody>
            </table>
            <p style="float:right;">Total : <?= number_format($tmp2, 2) ?></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script>
  $('table23').DataTable({
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
    "order": []
  });
</script>
<?php include_once('footer.php') ?>