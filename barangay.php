<?php
include('functions.php');

foreach (get_list("select * from tbl_barangay where city_id = '" . $_GET['id'] . "' order by name asc") as $res) { ?>
  <option value="<?= $res['id'] ?>"> <?= $res['name'] ?></option>
<?php
}
?>