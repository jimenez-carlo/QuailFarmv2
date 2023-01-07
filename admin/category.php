<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Categories</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col">ID#</th>
                  <th scope="col">Name</th>
                  <th scope="col">Date Created</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select * from tbl_category where is_deleted = 0") as $res) { ?>
                  <tr>
                    <td><?php echo $res['id']; ?></td>
                    <td><?php echo $res['name']; ?></td>
                    <td><?php echo $res['date_created']; ?></td>
                    <td style="width: 25%;">
                      <form method="post" name="update_category">
                        <input type="hidden" value="<?php echo $res['id']; ?>" name="category_id">
                        <button type="button" class="btn btn-sm btn-secondary btn-edit" name="category_edit" value="<?php echo $res['id']; ?>"> Edit </button>
                        <button type="submit" class="btn btn-sm btn-secondary" name="type" value="delete"> Delete </button>
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
    buttons: [{
      className: 'btn btn-sm btn-secondary',
      text: ' Add Category',
      action: function(e, dt, node, config) {
        $("#content").load(base_url + 'module/page.php?page=category_add');
      }
    }]
  });
</script>
<?php include_once('footer.php') ?>