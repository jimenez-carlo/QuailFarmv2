<?php include_once('header.php') ?>
<?php
$filter = $_GET['filter'];
$where = '';
$where .= ($filter == 'all') ? '' : "and c.name LIKE '%$filter%'";
$data['inventory'] = get_list("select i.qty,p.* from tbl_product p inner join tbl_inventory i on i.product_id = p.id inner join tbl_category c on c.id = p.category_id where 1 = 1  and i.qty > 0 and p.is_deleted = 0 $where");


function add_to_cart($data)
{
  extract($data);

  $customer_id = $_SESSION['user']->id;
  $stocks = get_one("select qty from tbl_inventory where product_id='$product_id' limit 1");
  if (!empty($stocks) && isset($stocks->qty)) {
    if ($qty > $stocks->qty) {
      return alert("Not Enough Stocks.");
    } else {
      $draft = get_one("select id,qty from tbl_transactions where product_id='$product_id' and buyer_id = '$customer_id' and status_id = 1 and is_deleted = 0 limit 1");

      if (isset($draft->qty) && isset($draft->id) && !empty($draft->qty) && !empty($draft->id)) {
        $total_qty = intval($draft->qty) + $qty;
        $total_price = $total_qty * $price;
        $id = $draft->id;
        $date = date('Y-m-d H:i:s');
        query("update tbl_transactions set qty = '$total_qty', price = '$total_price', date_updated = '$date' where id = '$id'");
      } else {
        $total_price = $qty * intval($price);
        $last_id = get_inserted_id("insert into tbl_transactions (price,qty,product_id,buyer_id,status_id) VALUES ('$total_price', '$qty', '$product_id', '$customer_id', 1) ");
        query("insert into tbl_status_history (transaction_id,status_id,created_by) VALUES ('$last_id', 1, '$customer_id') ");
      }
      return alert_redirect("Product Added To Cart Successfully!", "walkin_product.php?filter=" . $_GET['filter']);
    }
  } else {
    return alert_redirect("Product Out Of Stock.", "walkin_product.php?filter=" . $_GET['filter']);
  }
}
?>
<main class="content">
  <div class="container-fluid p-0">
    <?= (isset($_POST['add_to_cart'])) ? add_to_cart($_POST) : ''; ?>
    <h1 class="h3 mb-3"><strong>Products</strong> <i data-feather="chevrons-right"></i> <?= ucfirst(strtolower($_GET['filter'])) ?> </h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <?php if (!empty($data['inventory'])) { ?>
              <div class="col-12 mb-3">
                <input type="search" class="form-control" id="search-item" placeholder="Search items...">
              </div>
              <br>
              <div class="row">
                <?php foreach ($data['inventory'] as $res) { ?>
                  <div class="col-3 col-md-3 item-box" data-name="<?php echo strtolower($res['name']); ?>">
                    <div class="card">
                      <div class="card-header">
                        <h5 class="card-title mb-0" data-name="<?php echo strtolower($res['name']); ?>"><?php echo $res['name']; ?></h5>
                      </div>
                      <center>
                        <img class="card-img-top" src="../images/products/<?php echo $res['image']; ?>" style="width:100px;height:100px;text-align:center">
                      </center>
                      <div class="card-body">
                        <form method="POST" name="add_to_cart" onsubmit="return confirm('Are You Sure?');">
                          <input type="hidden" name="product_id" value="<?php echo $res['id']; ?>">
                          <input type="hidden" name="price" value="<?php echo $res['price']; ?>">
                          <div class="btn-group btn-group-sm" role="group" aria-label="Large button group" style="width:100%">
                            <!-- <button type="submit" class="btn btn-secondary" name="add_to_cart">Add&nbsp;To&nbsp;Cart</button> -->
                            <button type="submit" class="btn btn-secondary" name="add_to_cart">Add&nbsp;To&nbsp;Cart <i class="fa fa-plus"></i></button>
                            <input type="number" name="qty" class="form-control" placeholder="" value="1" min="1" max="<?php echo $res['qty'] + 1; ?>">

                          </div>
                        </form>
                      </div>
                    </div>
                  </div>
                <?php } ?>
              </div>
            <?php } else { ?>
              <p>No Result. </p>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
<script>
  $(document).on("change", '.category ', function() {
    var id = $(this).val();
    window.location = 'category.php?filter=' + id;

  });

  var search = document.querySelector("#search-item"),
    images = document.querySelectorAll(".item-box");

  search.addEventListener("keyup", e => {
    // if (e.key == "Enter") {
    let searcValue = search.value,
      value = searcValue.toLowerCase();
    images.forEach(image => {
      if (image.dataset.name.includes(value)) {
        return image.style.display = "block";
      }
      image.style.display = "none";
    });
    // }
  });

  search.addEventListener("keyup", () => {
    if (search.value != "") return;
    images.forEach(image => {
      image.style.display = "block";
    })
  })
</script>
<?php include_once('footer.php') ?>