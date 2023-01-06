<?php
require_once 'connection.php';
$_SESSION['conn'] = $conn;

function query($sql)
{
    return mysqli_query($_SESSION['conn'], $sql);
}

function get_inserted_id($sql)
{
    $conn =  $_SESSION['conn'];
    mysqli_query($conn, $sql);
    return mysqli_insert_id($conn);
}

function get_one($sql)
{
    $result = mysqli_query($_SESSION['conn'], $sql);
    while ($row = mysqli_fetch_object($result)) {
        return $row;
    }
}

function get_list($sql)
{
    $result = mysqli_query($_SESSION['conn'], $sql);
    $temp = array();
    while ($row = $result->fetch_assoc()) {
        $temp[] = $row;
    }
    return $temp;
}


function alert($message = '')
{
    return '<script>alert("' . $message . '");</script>';
}

function alert_reload($message = '')
{
    return '<script>alert("' . $message . '");window.location.reload();</script>';
}


function error_landing_message($message = "Error Something Went Wrong")
{
    return '<div class="alert alert-danger" role="alert">' . $message . '</div>';
}

function success_landing_message($message = "Successfull")
{
    return '<div class="alert alert-success" role="alert">' . $message . '</div>';
}

function error_message($message = "Error Something Went Wrong")
{
    return '<div class="alert alert-danger" role="alert"> ' . $message . ' </div>';
}

function success_message($message = "Successfull")
{
    return '<div class="alert alert-success" role="alert"> ' . $message . ' </div>';
}
