<?php include_once('header.php') ?>
<?php
function update_paid($id)
{
  query("update tbl_invoice set paid_status_id = 2 where invoice = $id");
  return alert("Order Updated!");
}
function update_order($id, $status)
{

  $invoice_id = get_one("select id from tbl_invoice where invoice = $id")->id;
  $transaction_items = get_list("select id from tbl_transactions where invoice_id = $invoice_id and status_id = 2");
  $created_by = $_SESSION['user']->id;

  // update transaction
  foreach ($transaction_items as $res) {
    $transaction_id = $res['id'];
    query("update tbl_transactions set status_id = $status, seller_id = '$created_by' where id = $transaction_id");
    query("insert into tbl_status_history (transaction_id, status_id, created_by) values('$transaction_id', '$status', '$created_by')");
    if ($status == 3) {
      $trxn = get_one("select product_id,qty from tbl_transactions where id = '$transaction_id'");
      $quantity = $trxn->qty;
      $prd_id = $trxn->product_id;
      $original_qty = get_one("select * from tbl_inventory where product_id = $prd_id")->qty;
      query("update tbl_inventory set qty = qty - $quantity where product_id = $prd_id");
      query("insert into tbl_inventory_history (product_id,original_qty,qty,created_by) values($prd_id,$original_qty,-$quantity,'$created_by')");
    }
  }


  $transaction_count = get_one("select sum(CASE WHEN status_id = 3 THEN 1 ELSE 0 END) AS `approved`, sum(CASE WHEN status_id = 5 THEN 1 ELSE 0 END) AS `cancelled`, sum(CASE WHEN status_id = 6 THEN 1 ELSE 0 END) AS `rejected` from tbl_transactions where invoice_id = $invoice_id group by invoice_id");

  $data = array(
    'approved' => $transaction_count->approved,
    'cancelled' => $transaction_count->cancelled,
    'rejected' => $transaction_count->rejected
  );

  $max_transaction_status = array_keys($data, max($data));

  $status = array(
    'approved' => 3,
    'cancelled' => 6,
    'rejected' => 7
  );
  $new_invoice_status = (($transaction_count->cancelled == $transaction_count->approved && $transaction_count->approved > 0) || ($transaction_count->rejected == $transaction_count->approved && $transaction_count->approved > 0)) ? 3 : $status[$max_transaction_status[0]];


  // update invoice & insert invoice history
  query("update tbl_invoice set status_id = $new_invoice_status where id = $invoice_id ");
  query("insert into tbl_invoice_status_history (invoice_id, status_id, created_by) values('$invoice_id','$new_invoice_status','$created_by')");


  return alert("Order Updated!");
}

function get_color($id)
{
  switch ($id) {
    case 1:
    case 6:
    case 7:
      $color = 'danger';
      break;
    case 2:
    case 3:
      $color = 'primary';
      break;
  }
  return $color;
}
echo isset($_POST['paid']) ? update_paid($_POST['id']) : '';
echo isset($_POST['approve']) ? update_order($_POST['id'], 3) : '';
echo isset($_POST['reject']) ? update_order($_POST['id'], 6) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Orders</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col" class="text-center">Order#</th>
                  <th scope="col" class="text-center">Status</th>
                  <th scope="col" class="text-center">Buyer</th>
                  <th scope="col" class="text-center">Seller</th>
                  <th scope="col" class="text-center">Updated Date</th>
                  <th scope="col" class="text-center">Paid/Unpaid</th>
                  <th scope="col" class="text-center">Total Qty</th>
                  <th scope="col" class="text-center">Total Price</th>
                  <th scope="col" class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select i.paid_status_id,ps.name as `paid_status`,t.date_updated, s.id as `seller_id`, b.id as `buyer_id`, t.id,sum(IF(t.status_id in (2,3,4), t.price, 0)) as `total_price`,sum(IF(t.status_id in (2,3,4), t.qty, 0)) as qty,i.invoice,p.name,p.price,i.status_id,concat('',b.last_name,', ',b.first_name) as buyer_name ,concat(' ',s.last_name,', ',s.first_name) as seller_name,is.status as `status` FROM tbl_transactions t inner join tbl_invoice i on i.id = t.invoice_id inner join tbl_invoice_status `is` on `is`.id = i.status_id inner join tbl_product p on p.id = t.product_id inner join tbl_users_info b on b.id = t.buyer_id left join tbl_users_info s on s.id = t.seller_id inner join tbl_paid_status ps on ps.id = i.paid_status_id where t.status_id > 1 and t.is_deleted = 0 group by t.invoice_id order by t.invoice_id desc") as $res) { ?>
                  <tr>
                    <td class="text-center"><?php echo $res['invoice']; ?></td>
                    <td class="text-center"><?php echo $res['status']; ?></td>
                    <td class="text-center"><?php echo $res['buyer_name']; ?> </td>
                    <td class="text-center"><?php echo $res['seller_name']; ?> </td>
                    <!-- <td class="text-center"><a href="customer_view.php?id=<?php echo $res['buyer_id']; ?>" target="_blank"> <?php echo $res['buyer_name']; ?> </a> </td>
                    <td class="text-center"><a href="user_edit.php?id=<?php echo $res['seller_id']; ?>" target="_blank"> <?php echo $res['seller_name']; ?> </a></td> -->
                    <?php $tmp = date_create($res['date_updated']); ?>
                    <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                    <td class="text-center"><?php echo $res['paid_status']; ?></td>
                    <td class="text-center"><?php echo $res['qty']; ?></td>
                    <td class="text-center"><?php echo number_format($res['total_price'], 2); ?></td>
                    <td class="text-center">
                      <form method="post" onsubmit="return confirm('Are You Sure?')">
                        <?php if (in_array($res['status_id'], array(1, 2))) { ?>
                          <input type="hidden" name="id" value="<?php echo $res['invoice']; ?>">
                          <button type="submit" class="btn btn-sm btn-<?= get_color($res['status_id']) ?>" name="paid" <?= ($res['paid_status_id'] != 1 || $res['status'] != 'APPROVED') ? 'disabled' : '' ?>> Paid </button>
                          <!-- <button type="submit" class="btn btn-sm btn-secondary" name="approve"> Approve </button>
                          <button type="submit" class="btn btn-sm btn-secondary" name="reject"> Reject </button> -->
                          <!-- <button type="button" class="btn btn-sm btn-secondary"> View </button> -->
                          <a href="order_view.php?id=<?php echo $res['invoice']; ?>" class="btn btn-sm btn-secondary btn-view"> View </a>
                        <?php } else { ?>
                          <input type="hidden" name="id" value="<?php echo $res['invoice']; ?>">
                          <input type="hidden" name="id" value="<?php echo $res['invoice']; ?>">
                          <button type="submit" class="btn btn-sm btn-<?= get_color($res['status_id']) ?>" name=" paid" <?= ($res['paid_status_id'] != 1 || $res['status'] != 'APPROVED')  ? 'disabled' : '' ?>> Paid </button>
                          <!-- <button type="button" class="btn btn-sm btn-secondary" disabled> Approve </button>
                          <button type="submit" class="btn btn-sm btn-secondary" disabled> Reject </button> -->
                          <!-- <button type="button" class="btn btn-sm btn-secondary"> View </button> -->
                          <a href="order_view.php?id=<?php echo $res['invoice']; ?>" class="btn btn-sm btn-secondary btn-view"> View </a>
                        <?php } ?>
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
    "order": false
  });
</script>
<?php include_once('footer.php') ?>