<?php include_once('header.php') ?>

<?php

function update_item($id, $invoice_id, $status)
{
  $created_by = $_SESSION['user']->id;
  $invoice_id = get_one("select id from tbl_invoice where invoice = $invoice_id")->id;
  query("update tbl_transactions set status_id = $status, seller_id = '$created_by' where id = $id");
  query("insert into tbl_status_history (transaction_id, status_id, created_by) values('$id', '$status', '$created_by')");

  if ($status == 3) {
    $trxn = get_one("select product_id,qty from tbl_transactions where id = '$id'");
    $quantity = $trxn->qty;
    $prd_id = $trxn->product_id;
    $original_qty = get_one("select * from tbl_inventory where product_id = $prd_id")->qty;
    query("update tbl_inventory set qty = qty - $quantity where product_id = $prd_id");
    query("insert into tbl_inventory_history (product_id,original_qty,qty,created_by) values($prd_id,$original_qty,-$quantity,'$created_by')");
  }

  $transaction_count = get_one("select sum(CASE WHEN status_id = 2 THEN 1 ELSE 0 END) AS `pending`,sum(CASE WHEN status_id = 3 THEN 1 ELSE 0 END) AS `approved`, sum(CASE WHEN status_id = 5 THEN 1 ELSE 0 END) AS `cancelled`, sum(CASE WHEN status_id = 6 THEN 1 ELSE 0 END) AS `rejected` from tbl_transactions where invoice_id = $invoice_id group by invoice_id");

  $data = array(
    'approved' => $transaction_count->approved,
    'cancelled' => $transaction_count->cancelled,
    'rejected' => $transaction_count->rejected
  );

  $max_transaction_status = array_keys($data, max($data));

  // invoice status partial approve or approved
  $approved_status = (empty($transaction_count->pending)) ? 3 : 2;


  $status = array(
    'approved' => $approved_status,
    'cancelled' => 6,
    'rejected' => 7
  );

  $new_status = $status[$max_transaction_status[0]];
  if ($transaction_count->approved > 0) {
    $new_status = $status['approved'];
  }

  $new_invoice_status = (($transaction_count->cancelled == $transaction_count->approved && $transaction_count->approved > 0) || ($transaction_count->rejected == $transaction_count->approved && $transaction_count->approved > 0)) ? 3 : $new_status; // update invoice & insert invoice history
  query("update tbl_invoice set status_id = $new_invoice_status where id = $invoice_id ");
  query("insert into tbl_invoice_status_history (invoice_id, status_id, created_by) values('$invoice_id','$new_invoice_status','$created_by')");


  return alert("Order Updated!");
}

echo isset($_POST['cancel']) ? update_item($_POST['id'], $_POST['invoice_id'], 5) : '';

// echo isset($_POST['cancel']) ? update_transaction($_POST['id'], $_POST['status']) : '';

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
                            <input type="hidden" name="invoice_id" value="<?php echo $sub_res['invoice']; ?>">
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