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

$id = $_GET['id'];
$main = get_list("select t.invoice_id,t.date_updated,p.id as product_id,t.id,t.buyer_id,t.price as total_price,t.qty,i.invoice,p.name,p.price,t.status_id,ss.status,concat('(ID#',b.id,') ',b.last_name,', ',b.first_name) as buyer_name ,concat('(ID#',s.id,') ',s.last_name,', ',s.first_name) as seller_name FROM tbl_transactions t inner join tbl_invoice i on i.id = t.invoice_id inner join tbl_product p on p.id = t.product_id inner join tbl_users_info b on b.id = t.buyer_id left join tbl_users_info s on s.id = t.seller_id inner join tbl_status ss on ss.id = t.status_id where t.status_id > 1 and t.is_deleted = 0 and i.invoice = '$id' and p.is_deleted = 0 order by t.date_updated desc");
$customer_id = reset($main)['buyer_id'];
$invoice_id = reset($main)['invoice_id'];
$transactions = $main;
$customer = get_one("select ui.*,u.* from tbl_users_info ui inner join tbl_users u on u.id = ui.id WHERE ui.id = " . $customer_id . " limit 1");
$actual_invoice = get_one("SELECT * FROM tbl_invoice where invoice = '$id' limit 1");
?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong> Order #<?php echo reset($transactions)['invoice']; ?></strong> <a href="orders.php" class="btn btn-sm btn-secondary float-end"> Back</a></h1>
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
                      <td class="text-center"><?php echo ($res['status'] == 'order placed') ? 'PENDING' : strtoupper($res['status']); ?></td>
                      <!-- <td class="text-center"><a href="#" class="a-view" name="product_edit" value="<?php echo $res['product_id']; ?>"><?php echo $res['product_id']; ?></a></td> -->
                      <td class="text-center"><?php echo number_format($res['price'], 2); ?></td>
                      <td class="text-center"><?php echo $res['qty']; ?></td>
                      <td class="text-center"><?php echo number_format($res['total_price'], 2); ?></td>
                      <?php $tmp = date_create($res['date_updated']); ?>
                    <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                      <td class="text-center"> 
                      <?php if ($res['status'] == 'order placed') { ?>
                          <form method="post" onsubmit="return confirm('Are You Sure?')">
                            <input type="hidden" name="invoice_id" value="<?php echo $res['invoice']; ?>">
                            <input type="hidden" name="id" value="<?php echo $res['id']; ?>">
                            <input type="hidden" name="status" value="5">
                            <button type="submit" class="btn btn-sm btn-secondary" name="cancel"> Cancel</button>
                          </form>
                        <?php } ?>
                      </td>
                    </tr>
                    <?php $price += $res['price']; ?>
                    <?php $total_price += ($res['status'] == 'approved' || $res['status'] == 'pending') ? $res['total_price'] : 0; ?>
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
     
          </div>
        </div>

      </div>
    </div>



    

  </div>
</main>

<?php include_once('footer.php') ?>