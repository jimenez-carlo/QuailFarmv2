<?php include_once('header.php') ?>
<?php

function delete($data)
{
  extract($data);
  query("UPDATE tbl_users set is_deleted = 1 where id = $delete");
  return alert("Customer Deleted!");
}

echo isset($_POST['delete']) ? delete($_POST) : '';
?>
<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Customer's</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <!-- <th scope="col" class="text-center">ID#</th> -->
                  <th scope="col" class="text-center">Username</th>
                  <!-- <th scope="col" class="text-center">Email</th> -->
                  <th scope="col" class="text-center">Full Name</th>
                  <th scope="col" class="text-center">Gender</th>
                  <th scope="col" class="text-center">Contact</th>
                  <th scope="col" class="text-center">Registered Date</th>
                  <th scope="col" class="text-center">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select g.gender,UPPER(a.name) as 'access',ui.*,u.* from tbl_users u inner join tbl_users_info ui on ui.id = u.id inner join tbl_access a on a.id = u.access_id inner join tbl_gender g on g.id = ui.gender_id and u.is_deleted = 0") as $res) { ?>
                  <tr>
                    <!-- <td class="text-center"><?php echo $res['id']; ?></td> -->
                    <td class="text-center"><?php echo $res['username']; ?></td>
                    <!-- <td class="text-center"><?php echo $res['email']; ?></td> -->
                    <td class="text-center"><?php echo ucwords($res['first_name'] . ' ' . $res['last_name']); ?></td>
                    <td class="text-center"><?php echo strtoupper($res['gender']); ?></td>
                    <td class="text-center"><?php echo $res['contact_no']; ?></td>
                    <td class="text-center"><?php echo $res['date_created']; ?></td>
                    <td class="text-center">
                      <form method="post" onsubmit="return confirm('Are You Sure?')">
                        <a href="customer_edit.php?id=<?php echo $res['id']; ?>" class="btn btn-sm btn-secondary btn-edit"> Edit </a>
                        <a href="customer_view.php?id=<?php echo $res['id']; ?>" class="btn btn-sm btn-secondary btn-edit"> View </a>
                        <button type="submit" class="btn btn-sm btn-secondary" name="delete" value="<?php echo $res['id']; ?>"> Delete </button>
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
    buttons: [
      // {
      //       className: 'btn btn-sm btn-secondary',
      //       text: 'Add Customer',
      //       action: function(e, dt, node, config) {
      //         window.location = "customer_register.php";
      //       }
      //     }
    ]
  });
</script>
<?php include_once('footer.php') ?>