<?php include_once('header.php') ?>
<?php
$id = $_GET['id'];
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Product ID#<?= $id ?> </strong> <a href="inventory.php" class="btn btn-sm btn-secondary" style="float:right"> Back</a></h1>
    <table class="table table-sm table-striped table-hover table-bordered">
      <thead class="table-secondary">
        <tr>
          <th scope="col" class="text-center">ID#</th>
          <th scope="col" class="text-center">Original Qty</th>
          <th scope="col" class="text-center">Re-stocked Qty</th>
          <th scope="col" class="text-center">New Qty</th>
          <th scope="col" class="text-center">Re-stocked By</th>
          <th scope="col" class="text-center">Date Created</th>
        </tr>
      </thead>
      <tbody>
        <?php foreach (get_list("select h.*,concat('(ID#',i.id,') ',i.last_name,', ',i.first_name) as created_by from tbl_inventory_history h left join tbl_users_info i on i.id = h.created_by where h.product_id =" . $id . " order by h.date_created desc") as $res) { ?>
          <tr>
            <td><?php echo $res['id']; ?></td>
            <td class="text-end"><span class="badge bg-secondary"><?php echo $res['original_qty']; ?></span></td>
            <td class="text-end"><span class="badge <?php echo ($res['qty'] + $res['original_qty'] > $res['original_qty']) ? 'bg-success' : 'bg-danger'; ?>"><?php echo abs($res['qty']); ?><?php echo ($res['qty'] + $res['original_qty'] > $res['original_qty']) ? '+' : '-'; ?></span> </td>
            <td class="text-end"><span class="badge <?php echo ($res['qty'] + $res['original_qty'] > $res['original_qty']) ? 'bg-success' : 'bg-danger'; ?>"><?php echo $res['qty'] + $res['original_qty']; ?></span></td>
            <td><?php echo $res['created_by']; ?></td>
            <td><?php echo $res['date_created']; ?></td>
          </tr>
        <?php } ?>
      </tbody>
    </table>


  </div>
</main>

<?php include_once('footer.php') ?>