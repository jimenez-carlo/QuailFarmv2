<?php include_once('header.php') ?>
<?php

function remove_cart($data)
{
  extract($data);
  query("update tbl_transactions set is_deleted = 1  where id = $transaction_id");
  return alert("Product Removed From Cart!");
}

function update_cart($data)
{
  extract($data);
  $new_price = intval($price) * intval($qty);
  if ($qty > 0) {
    query("update tbl_transactions set price = '$new_price', qty = '$qty' where id = $transaction_id");
    return alert("Product Quantity Updated From Cart!");
  } else {
    return alert("Invalid Product Quantity");
  }
}

function checkout_cart($data)
{
  extract($data);
  $customer_id = $_SESSION['user']->id;
  $cart_count = get_one("select count(product_id) as count from tbl_transactions where status_id = 1 and is_deleted = 0 and buyer_id = '$customer_id' group by buyer_id");
  if (!isset($cart_count->count) || empty($cart_count->count)) {
    return alert("No Products To Checkout!.");
  } else {
    $err = "";
    foreach (get_list("select t.id,t.product_id, t.qty, i.qty as stocks,p.name from tbl_transactions t inner join tbl_inventory i on i.product_id = t.product_id inner join tbl_product p on p.id = t.product_id where t.status_id = 1 and t.is_deleted = 0 and t.buyer_id = '$customer_id'") as $res) {
      if ($res['qty'] > $res['stocks']) {
        $err .= " Product <b>`" . $res['name'] . "`</b> has only " . $res['stocks'] . " stocks.";
      }
    }

    if (!empty($err)) {
      return alert($err);
    }

    $invoice = time();
    $invoice_id = get_inserted_id("insert into tbl_invoice (invoice,customer_id,status_id) VALUES('$invoice','$customer_id',1)");

    foreach ($items as $res) {
      $id = $res['id'];
      query("insert into tbl_status_history (transaction_id,status_id,created_by) VALUES('$id',2,'$customer_id')");
    }
    query("update tbl_transactions set status_id = 2, invoice_id= '$invoice_id' where status_id = 1 and is_deleted = 0 and buyer_id = '$customer_id'");
    return alert("Successfully Checked Out!");
  }
}

?>
<?= (isset($_POST['remove_from_cart'])) ? remove_cart($_POST) : ''; ?>
<?= (isset($_POST['update_cart'])) ? update_cart($_POST) : ''; ?>
<?= (isset($_POST['checkout_cart'])) ? checkout_cart($_POST) : ''; ?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Cart</strong></h1>
    <div class="row">

      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-header">
            <h5 class="card-title mb-0">My Cart</h5>
          </div>
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-primary">
                <tr>
                  <th scope="col">ID#</th>
                  <th scope="col">Name</th>
                  <th scope="col">Price</th>
                  <th scope="col">Qty</th>
                  <th scope="col">Total Price</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                <?php
                $id = 1;
                $price = 0;
                $total_price = 0;
                $qty = 0;  ?>
                <?php foreach (get_list("select t.id,t.price as sum_price,t.qty,t.product_id,p.name,p.description,p.price from tbl_transactions t inner join tbl_product p on p.id = t.product_id where t.buyer_id = '" . $_SESSION['user']->id . "' and t.status_id = 1 and t.is_deleted = 0 and p.is_deleted = 0")
                  as $res) { ?>
                  <tr>
                    <td><?php echo $id++; //$res['id']; 
                        ?></td>
                    <td><?php echo $res['name']; ?></td>
                    <td class="text-end"><?php echo number_format($res['price'], 2); ?></td>
                    <td class="col-md-2">
                      <form method="post">
                        <input type="hidden" name="transaction_id" value="<?php echo $res['id']; ?>">
                        <input type="hidden" name="price" value="<?php echo $res['price']; ?>">
                        <div class="input-group mb-2">
                          <div class="input-group-prepend">
                            <button class="btn btn-sm btn-secondary" type="submit" name="update_cart">Update <i class="fa fa-save"></i></button>
                          </div>
                          <input type="text" class="form-control form-control-sm" name="qty" value="<?php echo $res['qty']; ?>" style="text-align:right">
                        </div>
                      </form>
                    </td>
                    <td class="text-end" data-sub-total-id="<?php echo $res['id']; ?>"><?php echo number_format($res['sum_price'], 2); ?></td>
                    <td class="">
                      <form method="post">
                        <input type="hidden" name="transaction_id" value="<?php echo $res['id']; ?>">
                        <button type="submit" class="btn btn-sm btn-secondary btn-remove-row" name="remove_from_cart"><i data-feather="trash"></i> </button>
                      </form>
                    </td>
                    <?php $price += $res['price']; ?>
                    <?php $total_price += $res['sum_price']; ?>
                    <?php $qty += $res['qty']; ?>
                  </tr>
                <?php } ?>
                <tr class="fw-bold">
                  <td colspan="2">Grand Total</td>
                  <td id="total_price" class="text-end"><?php echo number_format($price, 2); ?></td>
                  <td id="total_qty" class="text-end"><?php echo $qty; ?></td>
                  <td id="total_final_price" class="text-end"><?php echo number_format($total_price, 2); ?></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
          <form action="post" name="checkout_cart">
            <button class="btn btn-lg btn-secondary font-bold rounded-0 w-100" name="checkout_cart">Checkout Now <i class="fa fa-check fa-lg"></i></button>
          </form>
        </div>
      </div>
    </div>

    <br>

  </div>
</main>

<?php include_once('footer.php') ?>