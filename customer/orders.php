<?php include_once('header.php') ?>
<?php

function cancel_all($data)
{
  extract($data);
  query("update tbl_invoice set status_id = 6 where id = '$invoice_id'");
  query("update tbl_transactions set status_id = 5 where invoice_id = '$invoice_id'");
  return alert("Order Cancelled!");
}



$customer_id = $_SESSION['user']->id;
$tmp = array();
$tmp_res = get_list("select t.id,t.qty,s.status,t.date_updated,t.status_id,i.invoice, i.date_created as invoice_date,is.status as `invoice_status`, p.id as `product_id`,p.name,p.price as product_price from tbl_transactions t inner join tbl_status s on s.id = t.status_id inner join tbl_invoice i on i.id = t.invoice_id  inner join tbl_product p on p.id = t.product_id inner join tbl_invoice_status `is` on is.id = i.status_id where t.is_deleted = 0 and t.status_id > 1 and buyer_id = '$customer_id' and p.is_deleted = 0 order by i.invoice desc");

foreach ($tmp_res as $res) {
  $tmp['invoice'][$res['invoice']][$res['id']] = $res;
  $tmp['status'][$res['invoice']] = $res['invoice_status'];
}
echo isset($_POST['cancel']) ? cancel_all($_POST) : '';
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
                  <th scope="col" class="text-center">Updated Date</th>
                  <th scope="col" class="text-center">Total Qty</th>
                  <th scope="col" class="text-center">Total Price</th>
                  <th scope="col" class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select i.paid_status_id,ps.name as `paid_status`,t.date_updated, s.id as `seller_id`, b.id as `buyer_id`, t.id,sum(IF(t.status_id in (2,3,4), t.price, 0)) as `total_price`,sum(IF(t.status_id in (2,3,4), t.qty, 0)) as qty,i.id as invoice_id,i.invoice,p.name,p.price,i.status_id,concat('',b.last_name,', ',b.first_name) as buyer_name ,concat(' ',s.last_name,', ',s.first_name) as seller_name,is.status as `status` FROM tbl_transactions t inner join tbl_invoice i on i.id = t.invoice_id inner join tbl_invoice_status `is` on `is`.id = i.status_id inner join tbl_product p on p.id = t.product_id inner join tbl_users_info b on b.id = t.buyer_id left join tbl_users_info s on s.id = t.seller_id inner join tbl_paid_status ps on ps.id = i.paid_status_id where t.status_id > 1 and t.is_deleted = 0 and t.buyer_id = '".$_SESSION['user']->id."' group by t.invoice_id order by t.invoice_id desc") as $res) { ?>
                  <tr>
                    <td class="text-center"><?php echo $res['invoice']; ?></td>
                    <td class="text-center"><?php echo $res['status']; ?></td>
                
                    <?php $tmp = date_create($res['date_updated']); ?>
                    <td class="text-center"><?php echo date_format($tmp, "F d Y") ?> </td>
                    <td class="text-center"><?php echo $res['qty']; ?></td>
                    <td class="text-center"><?php echo number_format($res['total_price'], 2); ?></td>
                    <td class="text-center">
                      <?php if ($res['status'] == 'PENDING') { ?>
                        <form method="post" onsubmit="return confirm('Are You Sure?')">
                          <input type="hidden" name="invoice_id" value="<?php echo $res['invoice_id']; ?>">
                          <input type="hidden" name="id" value="<?php echo $res['id']; ?>">
                          <input type="hidden" name="status" value="5">
                          <button type="submit" class="btn btn-sm btn-secondary" name="cancel"> Cancel</button>
                          <a href="order_view.php?id=<?php echo $res['invoice']; ?>" class="btn btn-sm btn-secondary"> View</a>
                        </form>
                        <?php }else{ ?>
                          <a href="order_view.php?id=<?php echo $res['invoice']; ?>" class="btn btn-sm btn-secondary"> View</a>
                          <?php } ?>
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
<?php include_once('footer.php') ?>
