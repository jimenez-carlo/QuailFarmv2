<?php
// error_reporting(E_ERROR | E_PARSE);
session_start();
$host = "localhost";
$username = "root";
$password = "";
$database = "db_menor";
$base_url = "http://localhost/QuailFarmv2/";
$conn = mysqli_connect($host, $username, $password, $database);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
