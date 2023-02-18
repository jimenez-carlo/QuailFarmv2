<?php include_once('header.php') ?>

<main class="content">
  <div class="container-fluid p-0">

    <h1 class="h3 mb-3"><strong>Dashboard</strong></h1>

    <div class="row">
      <div class="col-xl-12">
        <div class="w-100">
          <div class="row">
            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col mt-0">
                      <h5 class="card-title">Users</h5>
                    </div>

                    <div class="col-auto">
                      <div class="stat text-primary">
                        <i class="align-middle" data-feather="users"></i>
                      </div>
                    </div>
                  </div>
                  <h1 class="mt-1 mb-3"><?= get_one("select count(id) as result from tbl_users where is_deleted = 0 ")->result ?? 0 ?></h1>
                  <div class="mb-0">

                  </div>
                </div>
              </div>

            </div>

            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col mt-0">
                      <h5 class="card-title">Products</h5>
                    </div>

                    <div class="col-auto">
                      <div class="stat text-primary">
                        <i class="align-middle" data-feather="tag"></i>
                      </div>
                    </div>
                  </div>
                  <h1 class="mt-1 mb-3"><?= get_one("select count(id) as result from tbl_product where is_deleted = 0")->result ?? 0 ?></h1>
                  <div class="mb-0">

                  </div>
                </div>
              </div>

            </div>

          </div>

          <div class="row">
            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col mt-0">
                      <h5 class="card-title">Orders</h5>
                    </div>

                    <div class="col-auto">
                      <div class="stat text-primary">
                        <i class="align-middle" data-feather="shopping-bag"></i>
                      </div>
                    </div>
                  </div>
                  <h1 class="mt-1 mb-3"><?= get_one("select count(id) as result from tbl_invoice where status_id in(2,3) ")->result ?? 0 ?></h1>
                  <div class="mb-0">

                  </div>
                </div>
              </div>

            </div>

            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col mt-0">
                      <h5 class="card-title">Total Sales</h5>
                    </div>

                    <div class="col-auto">
                      <div class="stat text-primary">
                        <i class="align-middle" data-feather="dollar-sign"></i>
                      </div>
                    </div>
                  </div>
                  <!-- where status_id = 3 -->
                  <?php $result = get_one("SELECT sum(price) as result FROM tbl_transactions   where status_id = 3")->result ?? 0 ?>
                  <h1 class="mt-1 mb-3"><?= number_format($result, 2) ?></h1>
                  <div class="mb-0">

                  </div>
                </div>
              </div>

            </div>

          </div>
        </div>
      </div>


    </div>
  </div>
</main>

<?php include_once('footer.php') ?>