<?php include_once('header.php') ?>
<?php
function pay($id, $amount, $change, $total)
{
  if ($total > $amount) {
    return alert($amount . "Paid Amount Not Enough!" . $total);
  }
  query("update tbl_invoice set paid_status_id = 2,amount= '$amount',`change`='$change'  where invoice = '$id'");
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

  $new_invoice_status = (($transaction_count->cancelled == $transaction_count->approved && $transaction_count->approved > 0) || ($transaction_count->rejected == $transaction_count->approved && $transaction_count->approved > 0)) ? 3 : $status[$max_transaction_status[0]]; // update invoice & insert invoice history
  query("update tbl_invoice set status_id = $new_invoice_status where id = $invoice_id ");
  query("insert into tbl_invoice_status_history (invoice_id, status_id, created_by) values('$invoice_id','$new_invoice_status','$created_by')");


  return alert("Order Updated!");
}

echo isset($_POST['approve']) ? update_item($_POST['id'], $_POST['invoice_id'], 3) : '';
echo isset($_POST['reject']) ? update_item($_POST['id'], $_POST['invoice_id'], 6) : '';

echo isset($_POST['pay']) ? pay($_POST['pay'], $_POST['amount_post'], $_POST['change_post'], $_POST['total']) : '';

echo isset($_POST['approve_all']) ? update_order($_POST['id'], 3) : '';
echo isset($_POST['reject_all']) ? update_order($_POST['id'], 6) : '';

$id = $_GET['id'];
$main = get_list("select t.invoice_id,t.date_updated,p.id as `product_id`,t.id,t.buyer_id,t.price as `total_price`,t.qty,i.invoice,p.name,p.price,t.status_id,ss.status,concat('(ID#',b.id,') ',b.last_name,', ',b.first_name) as buyer_name ,concat('(ID#',s.id,') ',s.last_name,', ',s.first_name) as seller_name FROM tbl_transactions t inner join tbl_invoice i on i.id = t.invoice_id inner join tbl_product p on p.id = t.product_id inner join tbl_users_info b on b.id = t.buyer_id left join tbl_users_info s on s.id = t.seller_id inner join tbl_status ss on ss.id = t.status_id where t.status_id > 1 and t.is_deleted = 0 and i.invoice = '$id' and p.is_deleted = 0 order by t.date_updated desc");
$customer_id = reset($main)['buyer_id'];
$invoice_id = reset($main)['invoice_id'];
$transactions = $main;
$customer = get_one("select ui.*,u.* from tbl_users_info ui inner join tbl_users u on u.id = ui.id WHERE ui.id = " . $customer_id . " limit 1");
$actual_invoice = get_one("SELECT * FROM tbl_invoice where invoice = '$id' limit 1");
?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong> Order #<?php echo reset($transactions)['invoice']; ?></strong> <a href="order.php" class="btn btn-sm btn-secondary float-end"> Back</a></h1>
    <div class="card">

      <div class="card-header">
        <h5 class="card-title mb-0">Cart Details</h5>
      </div>
      <div class="card-body">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-12 mt-3">
              <table class="table table-sm table-striped table-hover table-bordered">
                <thead class="table-secondary">
                  <tr>
                    <th scope="col" class="text-center">Product Name</th>
                    <th scope="col" class="text-center">TXN#</th>
                    <th scope="col" class="text-center">Status</th>
                    <!-- <th scope="col" class="text-center">PID#</th> -->
                    <th scope="col" class="text-center">Product Price</th>
                    <th scope="col" class="text-center">Qty</th>
                    <th scope="col" class="text-center">Total Price</th>
                    <th scope="col" class="text-center">Last Updated</th>
                    <th scope="col" class="text-center"></th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                  $price = 0;
                  $qty = 0;
                  $total_price = 0;
                  $approvable = 0;
                  ?>
                  <?php foreach ($transactions as $res) { ?>
                    <tr>
                      <td class="text-center"><?php echo $res['name']; ?></td>
                      <td class="text-center"><?php echo $res['id']; ?></td>
                      <td class="text-center"><?php echo strtoupper($res['status']); ?></td>
                      <!-- <td class="text-center"><a href="#" class="a-view" name="product_edit" value="<?php echo $res['product_id']; ?>"><?php echo $res['product_id']; ?></a></td> -->
                      <td class="text-center"><?php echo number_format($res['price'], 2); ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo number_format($res['total_price'], 2); ?></td>
                      <td class="text-center"><?php echo $res['date_updated']; ?></td>
                      <td class="text-center"> <?php if (in_array($res['status_id'], array(2))) { ?>
                          <form method="post" onsubmit="return confirm('Are You Sure?')">
                            <input type="hidden" name="id" value="<?php echo $res['id']; ?>">
                            <input type="hidden" name="invoice_id" value="<?php echo reset($transactions)['invoice']; ?>">
                            <button type="submit" class="btn btn-sm btn-secondary" name="approve"> Approve </button>
                            <button type="submit" class="btn btn-sm btn-secondary" name="reject"> Reject </button>
                            <!-- <button type="button" class="btn btn-sm btn-secondary btn-view" name="transaction_view" value="<?php echo $res['id']; ?>"> View <i class="fa fa-eye"></i> </button> -->
                          </form>
                          <?php $approvable++; ?>
                        <?php } else { ?>
                          <button type="button" class="btn btn-sm btn-secondary" disabled> Approve </button>
                          <button type="button" class="btn btn-sm btn-secondary" disabled> Reject </button>
                          <!-- <button type="button" class="btn btn-sm btn-secondary btn-view" name="transaction_view" value="<?php echo $res['id']; ?>"> View <i class="fa fa-eye"></i> </button> -->
                        <?php } ?>
                      </td>
                    </tr>
                    <?php $price += $res['price']; ?>
                    <?php $total_price += $res['total_price']; ?>
                    <?php $qty += $res['qty']; ?>
                  <?php } ?>
                  <tr class="fw-bold">
                    <td colspan="3">Grand Total</td>
                    <td id="total_price" class="text-center"><?php //echo number_format($price, 2);  
                                                              ?></td>
                    <td id="total_qty" class="text-center"><?php //echo $qty; 
                                                            ?></td>
                    <td id="total_final_price" class="text-center"><?php echo number_format($total_price, 2); ?></td>
                    <td class="text-center"></td>
                    <td class="text-center"></td>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- 
            <div class="row">
              <div class="col-md-4">
                <label for="" class="form-label">Total</label>
                <input type="text" class="form-control form-control-sm" disabled value="<?= $total_price ?>" id="total">
              </div>
              <div class="col-md-4">
                <label for="" class="form-label">Amount</label>
                <div class="input-group">
                  <input type="number" class="form-control form-control-sm" name="amount" id="amount" min="<?= $total_price ?>" <?= ($actual_invoice->paid_status_id == 2) ? 'value="' . $actual_invoice->amount . '" disabled' : 0 ?>>


                  <form method="post" onsubmit="return confirm('Are You Sure?')">
                    <?php if ($actual_invoice->paid_status_id == 1) { ?>
                      <input type="hidden" name="total" value="value=" <?= $total_price ?>"">
                      <input type="hidden" name="amount_post" id="amount_post">
                      <input type="hidden" name="change_post" id="change_post">
                      <button type="submit" class="btn btn-sm btn-secondary" name="pay" value="<?php echo reset($transactions)['invoice']; ?>"> PAY </button>
                    <?php } else { ?>
                      <button type="button" class="btn btn-sm btn-secondary" disabled> PAY </button>
                    <?php } ?>
                  </form>
                </div>

              </div>

              <div class="col-md-4">
                <label for="" class="form-label">Change</label>
                <input type="text" class="form-control form-control-sm" disabled id="change" value="<?= ($actual_invoice->paid_status_id == 2) ? $actual_invoice->change : 0 ?>">
              </div>

            </div> -->

            <div class="col-md-12 mt-3">
              <div class="pull-right">

                <form method="post" onsubmit="return confirm('Are You Sure?')">
                  <?php if (!empty($approvable)) { ?>
                    <input type="hidden" name="id" value="<?php echo reset($transactions)['invoice']; ?>">
                    <button type="submit" class="btn btn-sm btn-secondary" name="approve_all"> Approve All </button>
                    <button type="submit" class="btn btn-sm btn-secondary" name="reject_all"> Reject All </button>
                  <?php } else { ?>
                    <button type="button" class="btn btn-sm btn-secondary" disabled> Approve All </button>
                    <button type="button" class="btn btn-sm btn-secondary" disabled> Reject All </button>
                  <?php } ?>
                </form>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

    <!-- <input type="hidden" id="product_id" name="product_id" requireds value="<?php echo $product->id; ?>"> -->

    <!-- <div class="card">
      <div class="card-header">
        <h5 class="card-title mb-0">Customer Details</h5>
      </div>

      <div class="card-body">
        <div class="container-fluid">
          <div class="row">
            <div class="col-md-6">

              <label for="" class="form-label">Full Name</label>
              <input type="text" class="form-control form-control-sm" disabled value="<?php echo $customer->first_name . ', ' . $customer->last_name; ?>">

              <label for="" class="form-label">Contact No</label>
              <input type="text" class="form-control form-control-sm" disabled value="<?php echo $customer->contact_no; ?>">
            </div>
            <div class="col-md-6">
              <label for="description" class="form-label">Address</label>
              <textarea class="form-control form-control-sm" rows="4" disabled><?php echo $customer->address; ?></textarea>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="card">

      <div class="card-header">
        <h5 class="card-title mb-0"> Status History</h5>
      </div>
      <div class="card-body">
        <div class="container-fluid">

          <div class="row">
            <div class="col-md-12 mt-3">
              <table class="table table-sm table-striped table-hover table-bordered">
                <thead class="table-secondary">
                  <tr>
                    <th scope="col" class="text-center">ID#</th>
                    <th scope="col" class="text-center">Status</th>
                    <th scope="col" class="text-center">Created By</th>
                    <th scope="col" class="text-center">Date Created</th>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach (get_list('select sh.date_created,sh.id,UPPER(s.status) as `status`,u.id as user_id,concat("(ID#",u.id,") ",u.last_name,", ", u.first_name) as `user`,ac.access_id FROM tbl_invoice_status_history sh inner join tbl_invoice_status s on s.id = sh.status_id inner join tbl_users_info u on u.id = sh.created_by inner join tbl_users ac on ac.id = sh.created_by where sh.invoice_id = ' . $invoice_id . ' order by id desc') as $res) { ?>
                    <tr>
                      <td class="text-center"><?php echo $res['id']; ?></td>
                      <td class="text-center"><?php echo $res['status']; ?></td>
                      <td class="text-center">
                        <a href="<?php echo ($res['access_id'] == 3) ? 'customer_view' : 'user_view'; ?>_view.php?id=<?php echo $res['user_id']; ?>"><?php echo $res['user']; ?></a></a>
                      </td>
                      <td class="text-center"><?php echo $res['date_created']; ?></td>
                    </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div>
    </div> -->
  </div>
</main>
<script>
  // $('table').DataTable({
  //   dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
  //   "order": []
  // });
  var amount = document.querySelector("#amount");
  var amount_post = document.querySelector("#amount_post");
  var change_post = document.querySelector("#change_post");

  amount.addEventListener("keyup", e => {
    var change = document.querySelector("#change");
    var total = document.querySelector("#total");
    if (amount.value == '') {
      amount.value = 0;
    }
    var tmp = parseInt(amount.value) - parseInt(total.value);
    if (parseInt(total.value) > parseInt(amount.value)) {
      var tmp = 0;
    }
    change.value = tmp;
    amount_post.value = amount.value;
    change_post.value = change.value;
  });
</script>
<?php include_once('footer.php') ?>