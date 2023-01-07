<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Users</strong></h1>

    <div class="row">
      <div class="col-12 col-lg-12">
        <div class="card">
          <div class="card-body">
            <table class="table table-sm table-striped table-hover table-bordered">
              <thead class="table-secondary">
                <tr>
                  <th scope="col">ID#</th>
                  <th scope="col">Access</th>
                  <th scope="col">Username</th>
                  <!-- <th scope="col">Email</th> -->
                  <th scope="col">Full Name</th>
                  <th scope="col">Gender</th>
                  <th scope="col">Contact</th>
                  <th scope="col">Registered Date</th>
                  <th scope="col">Actions</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach (get_list("select g.gender,UPPER(a.name) as 'access',ui.*,u.* from tbl_users u inner join tbl_users_info ui on ui.id = u.id inner join tbl_access a on a.id = u.access_id inner join tbl_gender g on g.id = ui.gender_id and u.is_deleted = 0 where u.access_id != 3") as $res) { ?>
                  <tr>
                    <td><?php echo $res['id']; ?></td>
                    <td><span class="badge bg-secondary text-light"><?php echo $res['access']; ?></span></td>
                    <td><?php echo $res['username']; ?></td>
                    <!-- <td><?php echo $res['email']; ?></td> -->
                    <td><?php echo ucwords($res['first_name'] . ' ' . $res['last_name']); ?></td>
                    <td><?php echo strtoupper($res['gender']); ?></td>
                    <td><?php echo $res['contact_no']; ?></td>
                    <td><?php echo $res['date_created']; ?></td>
                    <td>
                      <?php if ($res['access_id'] == 1) { ?>
                        <button type="button" class="btn btn-sm btn-secondary" disabled> Edit </button>
                        <button type="button" class="btn btn-sm btn-secondary" disabled> View </button>
                        <button type="button" class="btn btn-sm btn-secondary" disabled> Delete </button>
                    </td>
                  <?php } else { ?>
                    <form method="post" name="update_user">
                      <button type="button" class="btn btn-sm btn-secondary btn-edit" name="user_edit" value="<?php echo $res['id']; ?>"> Edit </button>
                      <button type="button" class="btn btn-sm btn-secondary btn-edit" name="user_view" value="<?php echo $res['id']; ?>"> View </button>
                      <input type="hidden" value="<?php echo $res['id']; ?>" name="user_id">
                      <button type="submit" class="btn btn-sm btn-secondary" name="type" value="delete_user"> Delete </button>
                    </form>
                    </td>
                  <?php } ?>
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
      text: 'Register User',
      action: function(e, dt, node, config) {
        $("#content").load(base_url + 'module/page.php?page=user_register');
      }
    }]
  });
</script>
<?php include_once('footer.php') ?>