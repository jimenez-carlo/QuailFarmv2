<?php include_once('header.php') ?>

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
                  <th scope="col">Order#</th>
                  <th scope="col">Paid/Unpaid</th>
                  <th scope="col">Status</th>
                  <th scope="col">Total Qty</th>
                  <th scope="col">Total Price</th>
                  <th scope="col">Buyer</th>
                  <th scope="col">Seller</th>
                  <th scope="col">Updated Date</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select ps.name as `paid_status`,t.date_updated, s.id as `seller_id`, b.id as `buyer_id`, t.id,sum(IF(t.status_id in (2,3,4), t.price, 0)) as `total_price`,sum(IF(t.status_id in (2,3,4), t.qty, 0)) as qty,i.invoice,p.name,p.price,i.status_id,concat('(ID#',b.id,') ',b.last_name,', ',b.first_name) as buyer_name ,concat('(ID#',s.id,') ',s.last_name,', ',s.first_name) as seller_name,is.status as `status` FROM tbl_transactions t inner join tbl_invoice i on i.id = t.invoice_id inner join tbl_invoice_status `is` on `is`.id = i.status_id inner join tbl_product p on p.id = t.product_id inner join tbl_users_info b on b.id = t.buyer_id left join tbl_users_info s on s.id = t.seller_id inner join tbl_paid_status ps on ps.id = i.paid_status_id where t.status_id > 1 and t.is_deleted = 0 group by t.invoice_id order by t.date_updated desc") as $res) { ?>
                  <tr>
                    <td><?php echo $res['invoice']; ?></td>
                    <td><?php echo $res['paid_status']; ?></td>
                    <td><?php echo $res['status']; ?></td>
                    <td class="text-end"><?php echo $res['qty']; ?></td>
                    <td class="text-end"><?php echo number_format($res['total_price'], 2); ?></td>
                    <td><a href="#" class="a-view" name="customer_view" value="<?php echo $res['buyer_id']; ?>"><?php echo $res['buyer_name']; ?></a></td>
                    <td><a href="#" class="a-view" name="user_view" value="<?php echo $res['seller_id']; ?>"><?php echo $res['seller_name']; ?></a></td>
                    <td><?php echo $res['date_updated']; ?></td>
                    <td>
                      <?php if (in_array($res['status_id'], array(1, 2))) { ?>
                        <form method="post" name="update_order">
                          <input type="hidden" name="id" value="<?php echo $res['invoice']; ?>">
                          <button type="submit" class="btn btn-sm btn-secondary" name="status" value="3"> Approve </button>
                          <button type="submit" class="btn btn-sm btn-secondary" name="status" value="6"> Reject </button>
                          <button type="button" class="btn btn-sm btn-secondary btn-view" name="orders_view" value="<?php echo $res['invoice']; ?>"> View </button>
                        </form>
                      <?php } else { ?>
                        <button type="button" class="btn btn-sm btn-secondary" disabled> Approve </button>
                        <button type="button" class="btn btn-sm btn-secondary" disabled> Reject </button>
                        <button type="button" class="btn btn-sm btn-secondary btn-view" name="orders_view" value="<?php echo $res['invoice']; ?>"> View </button>
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
<script>
  $('table').DataTable({
    dom: '<"top"<"left-col"B><"center-col"><"right-col"f>> <"row"<"col-sm-12"tr>><"row"<"col-sm-10"i><"col-sm-2"p>>',
    "order": []
  });
</script>
<?php include_once('footer.php') ?>