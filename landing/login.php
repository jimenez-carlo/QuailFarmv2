<?php include_once('header.php'); ?>
<style>
   /* .get_btn a {
      color: #fff;
      background: red;
   } */

   .main_form select {
      border: inherit;
      padding: 0px 15px;
      margin-bottom: 20px;
      width: 100%;
      height: 45px;
      background: #ffffff;
      color: #777977;
      font-size: 18px;
      font-weight: normal;
      border-bottom: #ddd solid 1px;
   }
</style>
<?php

function login($data)
{
   extract($data);

   $result = get_one("SELECT a.name as access_name,ui.*,u.*,count(username) as user_count FROM tbl_users u inner join tbl_users_info ui on ui.id = u.id  inner join tbl_access a on a.id = u.access_id WHERE (u.username = '$username' OR u.email = '$username') limit 1");
   if (isset($result->user_count) && !empty($result->user_count)) {
      $password_validate = password_verify($password, $result->password);
      if ($password_validate == true) {
         $_SESSION['user'] = $result;
         echo "<script>location.reload();</script>";
      } else {
         return error_landing_message("Invalid Username/Password!");
      }
   } else {
      return error_landing_message("Invalid Username/Password!");
   }
}

function signup($data)
{
   extract($data);
   try {
      //code...
      $check_username = get_one("select count(username) as `exists` from tbl_users where username = '$username' group_by username limit 1");

      if (isset($check_username->exists) && !empty($check_username->exists)) {
         return error_landing_message("Username Already In-Used!");
      }
   } catch (\Throwable $th) {
      //throw $th;
   }

   $hashed_password = password_hash($password, PASSWORD_DEFAULT);

   $last_id = get_inserted_id("INSERT INTO tbl_users (username,`password`,access_id) values ('$username', '$hashed_password', '3')");
   query("INSERT INTO tbl_users_info (id,first_name,last_name,contact_no,`province`,`city`,`barangay`) VALUES ('$last_id', '$first_name', '$last_name','$contact','$province','$city','$barangay')");
   unset($_POST);
   return success_landing_message("User Registered!");
}
?>
<!--  footer -->
<footer id="contact">
   <div class="footer" style="background:#fff">
      <div class="container">
         <?= (isset($_POST['login'])) ? login($_POST) : ''; ?>
         <?= (isset($_POST['signup'])) ? signup($_POST) : ''; ?>
         <div class="row">
            <div class="col-md-6" style="border-right: #212121 solid 1px;">


               <div class="row">
                  <div class="cold-md-12">
                     <div class="titlepage">
                        <h2 style="color:#212121">Login</h2>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <form class="main_form" method="post" autocomplete="off">
                        <div class="row">
                           <div class="col-md-12 ">
                              <input class="contactus" placeholder="Username" type="text" name="username" required value="<?= isset($_POST['username']) && isset($_POST['login']) ? $_POST['username'] : '' ?>">
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Password" type="password" name="password" required value="<?= isset($_POST['password']) && isset($_POST['login']) ? $_POST['password'] : '' ?>">
                           </div>
                           <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                              <button class="send_btn" type="submit" name="login">Login</button>
                           </div>
                        </div>
                     </form>
                  </div>

               </div>
            </div>
            <div class="col-md-6">
               <div class="row" style="padding-left:10px">
                  <div class="cold-md-12">
                     <div class="titlepage">
                        <h2 style="color:#212121">Signup</h2>
                     </div>
                  </div>
                  <div class="col-md-12">
                     <form class="main_form" method="post" autocomplete="off">
                        <div class="row">
                           <div class="col-md-12 ">
                              <input class="contactus" placeholder="Username" type="text" required name="username" value="<?= isset($_POST['username']) && isset($_POST['signup']) ? $_POST['username'] : '' ?>">
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="First Name" type="text" required name="first_name" value="<?= isset($_POST['first_name']) && isset($_POST['signup']) ? $_POST['first_name'] : '' ?>">
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Last Name" type="text" required name="last_name" value="<?= isset($_POST['last_name']) && isset($_POST['signup']) ? $_POST['last_name'] : '' ?>">
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Password" type="password" required name="password" value="<?= isset($_POST['password']) && isset($_POST['signup']) ? $_POST['password'] : '' ?>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
                           </div>
                           <div class="col-md-12">
                              <input class="contactus" placeholder="Contact" type="number" required name="contact" value="<?= isset($_POST['contact']) && isset($_POST['signup']) ? $_POST['contact'] : '' ?>">
                           </div>
                           <div class="col-md-12">

                              <select name="province" id="">
                                 <?php foreach (get_list("select * from tbl_province order by name asc") as $res) { ?>
                                    <option value="<?= $res['id'] ?>"><?= $res['name'] ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                           <div class="col-md-12">
                              <select name="city" id="">
                                 <?php foreach (get_list("select * from tbl_city where province_id = '0128' order by name asc") as $res) { ?>
                                    <option value="<?= $res['id'] ?>"><?= $res['name'] ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                           <div class="col-md-12">

                              <select name="barangay" id="">
                                 <?php foreach (get_list("select * from tbl_barangay where city_id = '012801' order by name asc") as $res) { ?>
                                    <option value="<?= $res['id'] ?>"><?= $res['name'] ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                           <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
                              <button class="send_btn" type="submit" name="signup">Sign Up</button>
                           </div>
                        </div>
                     </form>
                  </div>

               </div>
            </div>

         </div>
      </div>
      <div class="copyright">
         <div class="container">
            <div class="row">
               <div class="col-md-12">

               </div>
            </div>
         </div>
      </div>
   </div>
</footer>
<?php include_once('footer.php'); ?>
<script>
   $('select[name="province"]').on('change', function() {
      city();
      barangay();
   });

   $('select[name="city"]').on('change', function() {
      barangay();
   });

   function city() {
      $.ajax({
            method: "POST",
            url: "<?= $base_url ?>city.php?id=" + $('select[name="province"]').val()
         })
         .done(function(result) {
            $('select[name="city"]').html(result);
            barangay();
         });
   }

   function barangay() {
      $.ajax({
            method: "POST",
            url: "<?= $base_url ?>barangay.php?id=" + $('select[name="city"]').val()
         })
         .done(function(result) {
            $('select[name="barangay"]').html(result);
         });
   }
</script>