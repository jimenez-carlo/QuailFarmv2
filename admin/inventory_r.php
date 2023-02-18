<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Inventory Reports <button type="button" onclick="return tae();" class="btn btn-secondary btn-sm">Print</button></strong>


    </h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col" class="text-center">OR#</th>
                  <th scope="col" class="text-center">Transaction ID</th>
                  <th scope="col" class="text-center">Product Name</th>
                  <th scope="col" class="text-center">Qty</th>
                  <th scope="col" class="text-center">Unit / Item / Price / Cost</th>
                  <th scope="col" class="text-center">Sold</th>
                  <th scope="col" class="text-center">Product Quantity Remaining </th>
                  <th scope="col" class="text-center">Date Created</th>
                  <!-- <th scope="col" class="text-center">Customer Name</th>
                  <th scope="col" class="text-center">Amount</th>
                  <th scope="col" class="text-center">Original Qty</th>
                  <th scope="col" class="text-center">New Qty</th>
                  <th scope="col" class="text-center">Subtotal</th> -->

                </tr>
              </thead>
              <tbody>
                <?php $tmp2 = 0 ?>
                <?php $tmp_products = array(); ?>
                <?php $where = isset($_GET['search']) ? " and t.date_created between '" . $_GET['from'] . "' and '" . $_GET['to'] . "'" : "" ?>
                <?php if (isset($_GET['search'])) { ?>
                  <?php foreach (get_list("select p.name,t.id as trans_id,t.price,t.qty,t.date_created,i.invoice, concat(ui.first_name, ' ',ui.last_name) as customer_name,h.original_qty,h.qty as new_qty from tbl_transactions t inner join tbl_product p on p.id = t.product_id inner join tbl_invoice i on i.id= t.invoice_id inner join tbl_users_info ui on ui.id = i.customer_id inner join tbl_inventory_history h on h.product_id = t.product_id and h.qty = (t.qty*-1) where 1 = 1 $where") as $res) { ?>
                    <tr>
                      <td class="text-center"><?php echo $res['invoice']; ?></td>
                      <td class="text-center"><?php echo $res['trans_id']; ?></td>
                      <td class="text-center"><?php echo $res['name']; ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo $res['price'] / $res['qty']; ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo $res['original_qty'] + (int)$res['new_qty']; ?></td>
                      <?php $tmp = date_create($res['date_created']); ?>
                      <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                      <!-- <td class="text-center"><?php echo $res['customer_name']; ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo $res['original_qty']; ?></td>
                      <td class="text-center"><?php echo $res['price']; ?></td>
                      <td class="text-center"><?php echo $res['name']; ?></td> -->
                      <?php $tmp2 += $res['price'] ?>
                      <?php $tmp_products['name'][$res['name']] = $res['name'] ?>
                      <?php $tmp_products[$res['name']]['total_qty'] = 0 ?>
                      <?php $tmp_products[$res['name']]['qty'][] = $res['qty'] ?>
                      <?php $tmp_products[$res['name']]['sold'][] = $res['new_qty'] ?? 0 ?>
                      <?php $tmp_products[$res['name']]['remaining'][] = $res['original_qty'] ?? 0 ?>
                      <?php $tmp_products[$res['name']]['date'][] = date_format($tmp, "F d Y") ?>
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
    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <h5>
              Summary of Report:
            </h5>

            Inventory Report
            <?php $tmpfrom = date_create($_GET['from']); ?>
            <?php $tmpto = date_create($_GET['to']); ?>

            <table>
              <tr>
                <td>From: <?= date_format($tmpfrom, "F d Y") ?> To: <?= date_format($tmpfrom, "F d Y") ?></td>
              </tr>
              <tr>
                <td>Company /Branch Name: Quail Farm </td>
              </tr>

            </table>




            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col" class="text-center">Product Name</th>
                  <th scope="col" class="text-center">Total Qty</th>
                  <th scope="col" class="text-center">Quantity Sold</th>
                  <th scope="col" class="text-center">Qty Remaining</th>
                  <th scope="col" class="text-center">Date from and To</th>

                </tr>
              </thead>
              <tbody>
                <?php
                foreach ($tmp_products['name'] as $key => $value) { ?>
                  <tr>
                    <td class="text-center"><?= $value  ?></td>
                    <td class="text-center"><?= array_sum($tmp_products[$value]['qty'])  ?></td>
                    <td class="text-center"><?= array_sum($tmp_products[$value]['sold'])  ?></td>
                    <td class="text-center"><?= array_sum($tmp_products[$value]['remaining']) - array_sum($tmp_products[$value]['sold'])  ?></td>
                    <td class="text-center"><?= date_format($tmpfrom, "F d Y") ?> - <?= date_format($tmpfrom, "F d Y") ?></td>

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
  $('table23').DataTable({
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
    "order": []
  });

  function tae() {
    window.print();
  }
</script>
<?php include_once('footer.php') ?>