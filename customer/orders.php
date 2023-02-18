<?php include_once('header.php') ?>

<?php


echo isset($_POST['cancel']) ? update_transaction($_POST['id'], $_POST['status']) : '';
$customer_id = $_SESSION['user']->id;
$tmp = array();
$tmp_res = get_list("select t.id,t.qty,s.status,t.date_updated,t.status_id,i.invoice, i.date_created as invoice_date,is.status as `invoice_status`, p.id as `product_id`,p.name,p.price as product_price from tbl_transactions t inner join tbl_status s on s.id = t.status_id inner join tbl_invoice i on i.id = t.invoice_id  inner join tbl_product p on p.id = t.product_id inner join tbl_invoice_status `is` on is.id = i.status_id where t.is_deleted = 0 and t.status_id > 1 and buyer_id = '$customer_id' and p.is_deleted = 0 order by t.date_created desc");
foreach ($tmp_res as $res) {
  $tmp['invoice'][$res['invoice']][$res['id']] = $res;
  $tmp['status'][$res['invoice']] = $res['invoice_status'];
}
?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Orders</strong></h1>
    <?php if (isset($tmp['invoice'])) { ?>
      <?php foreach ($tmp['invoice'] as $res => $invoice_key) { ?>
        <div class="col-12 col-lg-12 mb-3">
          <div class="card">
            <div class="card-header">
              <h5 class="card-title mb-0">#<?php echo $res; ?> - <?php echo $tmp['status'][$res]; ?></h5>
            </div>
            <div class="card-body" id="<?php echo str_replace('#', '', 'accordion_' . $res); ?>">
              <table class="table table-sm table-striped table-hover table-bordered" style="width:100%">
                <thead class="table-secondary">
                  <tr>
                    <th scope="col">TXN#</th>
                    <th scope="col">Status</th>
                    <th scope="col">PID#</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Product Price</th>
                    <th scope="col">Qty</th>
                    <th scope="col">Total Price</th>
                    <th scope="col">Last Updated</th>
                    <th scope="col"></th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $id = 1;
                  $price = 0;
                  $total_price = 0;
                  $qty = 0; ?>
                  <?php foreach ($tmp['invoice'][$res] as $sub_res) { ?>
                    <tr>
                      <td><?php echo $sub_res['id']; ?></td>
                      <td><?php echo ucwords($sub_res['status']); ?></td>
                      <td><?php echo $sub_res['product_id']; ?></td>
                      <td><?php echo $sub_res['name']; ?></td>
                      <td class="text-end"><?php echo number_format($sub_res['product_price'], 2); ?></td>
                      <td class="text-end"><?php echo $sub_res['qty']; ?></td>
                      <td class="text-end"><?php echo number_format($sub_res['product_price'] * $sub_res['qty'], 2); ?></td>
                      <td><?php echo $sub_res['date_updated']; ?></td>
                      <td class="text-end" style="width: 0.1%;">
                        <?php if ($sub_res['status_id'] == 2) { ?>
                          <form method="post">
                            <input type="hidden" name="id" value="<?php echo $sub_res['id']; ?>">
                            <input type="hidden" name="status" value="5">
                            <button type="submit" class="btn btn-sm btn-secondary" name="cancel"> Cancel</button>
                          </form>
                        <?php } ?>
                      </td>
                    </tr>
                    </td>
                    <?php $price +=       (in_array(intval($sub_res['status_id']), array(1, 5, 6))) ? 0 :  $sub_res['product_price']; ?>
                    <?php $total_price += (in_array(intval($sub_res['status_id']), array(1, 5, 6))) ? 0 :  $sub_res['product_price'] * $sub_res['qty']; ?>
                    <?php $qty +=         (in_array(intval($sub_res['status_id']), array(1, 5, 6))) ? 0 :  $sub_res['qty']; ?>
                  <?php } ?>
                  <tr class="fw-bold">
                    <td colspan="4">Grand Total</td>
                    <td id="total_price" class="text-end"><?php echo number_format($price, 2); ?></td>
                    <td id="total_qty" class="text-end"><?php echo $qty; ?></td>
                    <td id="total_final_price" class="text-end"><?php echo number_format($total_price, 2); ?></td>
                    <td></td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      <?php } ?>
    <?php } ?>


  </div>
</main>

<?php include_once('footer.php') ?>