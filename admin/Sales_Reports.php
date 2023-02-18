<?php include_once('header.php') ?>
<style>
  @media print {
    .myDivToPrint {
      background-color: white;
      height: 100%;
      width: 100%;
      position: fixed;
      top: 0;
      left: 0;
      margin: 0;
      padding: 15px;
      font-size: 14px;
      line-height: 18px;
      display: block !important;
    }

    html,
    body {
      height: 100%;
      margin: 0 !important;
      padding: 0 !important;
      overflow: hidden;
    }
  }
</style>
<main class="content">
  <div class="container-fluid p-0">


    <h1 class="h3 mb-3"><strong>Sales Reports <button type="button" onclick="return tae();" class="btn btn-secondary btn-sm">Print</button></strong>

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
                  <th scope="col" class="text-center">OR#</th>
                  <th scope="col" class="text-center">Transaction ID</th>
                  <th scope="col" class="text-center">Customer</th>
                  <th scope="col" class="text-center">Product Name</th>
                  <th scope="col" class="text-center">Product Price</th>
                  <!-- <th scope="col" class="text-center">Original Qty</th> -->
                  <th scope="col" class="text-center">Buyer Qty</th>
                  <!-- <th scope="col" class="text-center">New Qty</th> -->
                  <th scope="col" class="text-center">Subtotal</th>
                  <th scope="col" class="text-center">Date Created</th>

                </tr>
              </thead>
              <tbody>
                <?php $tmp2 = (float)0 ?>
                <?php $tmp_products = array(); ?>
                <?php $where = isset($_GET['search']) ? " and t.date_created between '" . $_GET['from'] . "' and '" . $_GET['to'] . "'" : "" ?>
                <?php if (isset($_GET['search'])) { ?>
                  <?php foreach (get_list("select p.id as product_id,p.name,t.id as trans_id,t.price,t.qty,t.date_created,i.invoice, concat(ui.first_name, ' ',ui.last_name) as customer_name,h.original_qty,h.qty as new_qty from tbl_transactions t inner join tbl_product p on p.id = t.product_id inner join tbl_invoice i on i.id= t.invoice_id inner join tbl_users_info ui on ui.id = i.customer_id inner join tbl_inventory_history h on h.product_id = t.product_id and h.qty = (t.qty*-1) where 1 = 1 and t.status_id = 3 $where group by t.id order by t.date_created desc") as $res) { ?>
                    <tr>
                      <td class="text-center"><?php echo $res['invoice']; ?></td>
                      <td class="text-center"><?php echo $res['trans_id']; ?></td>
                      <td class="text-center"><?php echo $res['customer_name']; ?></td>
                      <td class="text-center"><?php echo $res['name']; ?></td>
                      <td class="text-center"><?php echo $res['price'] / $res['qty']; ?></td>
                      <!-- <td class="text-center"><?php echo $res['original_qty'] ?></td> -->
                      <td class="text-center"><?php echo -(int)$res['new_qty']; ?></td>
                      <!-- <td class="text-center"><?php echo $res['original_qty'] + (int)$res['new_qty']; ?></td> -->
                      <td class="text-center"><?php echo $res['price']; ?></td>
                      <?php $tmp = date_create($res['date_created']); ?>
                      <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>

                      <?php $tmp2 += (float)$res['price'] ?>
                      <?php $tmp_products['name'][$res['name']] = $res['name'] ?>
                      <?php $tmp_products['product_id'][$res['name']] = $res['product_id'] ?>
                      <?php $tmp_products[$res['name']]['total_qty'] = 0 ?>
                      <?php $tmp_products[$res['name']]['qty'][] = $res['qty'] ?>
                      <?php $tmp_products[$res['name']]['sold'][] = $res['new_qty'] ?? 0 ?>
                      <?php $tmp_products[$res['name']]['remaining'][] = $res['original_qty'] ?? 0 ?>
                      <?php $tmp_products[$res['name']]['date'][] = date_format($tmp, "F d Y") ?>
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
        <div class="card myDivToPrint" style="display:none">
          <div class="card-body">
            <h5>
              Summary of Report:
            </h5>

            Inventory Report
            <?php $tmpfrom = date_create($_GET['from']); ?>
            <?php $tmpto = date_create($_GET['to']); ?>

            <table>
              <tr>
                <td>From: <?= date_format($tmpfrom, "F d Y") ?> To: <?= date_format($tmpto, "F d Y") ?></td>
              </tr>
              <tr>
                <td>Company /Branch Name: Quail Farm </td>
              </tr>

            </table>




            <table class="table table-sm table-striped table-hover table-bordered ">
              <thead class="table-secondary">
                <tr>
                  <th scope="col" class="text-center">Product Name</th>
                  <th scope="col" class="text-center">Original Qty</th>
                  <th scope="col" class="text-center">Quantity Sold</th>
                  <th scope="col" class="text-center">Product Price</th>
                  <th scope="col" class="text-center">Qty Remaining</th>
                  <th scope="col" class="text-center">Product Sales</th>
                  <th scope="col" class="text-center">Date from and To</th>

                </tr>
              </thead>
              <tbody>
                <?php
                foreach ($tmp_products['name'] as $key => $value) { ?>
                  <tr>

                    <?php $tmp3 = $tmp_products['product_id'][$value] ?>
                    <?php $tmp4 = get_one("select price from tbl_product where id = " . $tmp3)->price ?? 0 ?>
                    <?php $tmp5 = get_one("select qty from tbl_inventory where product_id = " . $tmp3)->qty ?? 0 ?>
                    <td class="text-center"><?= $value  ?></td> <!-- Product Name -->
                    <td class="text-center"><?= $tmp5 + array_sum($tmp_products[$value]['qty'])  ?></td><!-- Original Qty -->
                    <td class="text-center"><?= array_sum($tmp_products[$value]['qty'])  ?></td><!-- Quantity Sold -->
                    <td class="text-center"><?= number_format((float)$tmp4, 2)  ?></td><!-- Product Price -->
                    <td class="text-center"><?= $tmp5  ?></td><!-- Qty Remaining -->
                    <td class="text-center"><?= number_format((float)$tmp4 * array_sum($tmp_products[$value]['qty']), 2)  ?></td><!-- Product Sales -->
                    <td class="text-center"><?= date_format($tmpfrom, "F d Y") ?> - <?= date_format($tmpto, "F d Y") ?></td><!-- Date from and To -->

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