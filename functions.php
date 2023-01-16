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

function alert_redirect($message = '', $location = '')
{
    return '<script>alert("' . $message . '"); window.location = "' . $location . '" </script>';
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

function has_stocks($id)
{
    // $invoice_id = get_one("select id from tbl_invoice where invoice = $id");
    $transaction = get_one("select product_id,qty from tbl_transactions where id = $id limit 1");
    $stock = get_one("select qty from tbl_inventory where product_id = $transaction->product_id")->qty;
    return ($transaction->qty > $stock) ? false : $stock;
}

function get_transaction_count($where_id, $status_id)
{
    $res = get_one("select count(*) as result from tbl_transactions where invoice_id = $where_id and status_id = $status_id group by invoice_id limit 1");
    return isset($res->result) ? $res->result : 0;
}

function update_transaction($id, $status, $redirect = false)
{
    $user_id = $_SESSION['user']->id;
    $id = intval($id);
    $status = intval($status);
    $date = date("Y-m-d h:i:s");
    $seller = '';

    $stock = has_stocks($id);
    if ($status == 3 && !$stock) {
        return alert("Insuficient Stock!");
    }

    if (in_array($status, array(3, 6))) {
        $seller = ", seller_id = $user_id";
    }
    $invoice = get_one("select invoice_id,status_id,product_id,qty,buyer_id from tbl_transactions where id = $id limit 1");
    query("update tbl_transactions set status_id = '$status',date_updated = '$date' $seller  where id = $id");
    query("insert into tbl_status_history (transaction_id,status_id,created_by) values('$id', '$status', '$user_id')");

    if (in_array($status, array(3, 5, 6))) {
        $tmp = get_one("select count(*) as result from tbl_transactions where invoice_id = $invoice->invoice_id group by invoice_id limit 1");
        $items = isset($tmp->result) ? $tmp->result : 0;
        $pending = get_transaction_count($invoice->invoice_id, 2);
        $rejected = get_transaction_count($invoice->invoice_id, 6);
        $cancelled = get_transaction_count($invoice->invoice_id, 5);
        if ($status == 3) {
            query("insert into tbl_inventory_history (product_id,original_qty,qty,created_by) values('$invoice->product_id', $stock, -$invoice->qty, '$invoice->buyer_id')");
            query("update tbl_inventory set qty = (qty - $invoice->qty) where product_id = $invoice->product_id");
            // approved
            if ($pending == 0) {
                query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->product_id', 3, '$user_id')");
                query("update tbl_invoice set status_id = 3 where id = $invoice->invoice_id");
            } else {
                query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->invoice_id', 3, '$user_id')");
                query("update tbl_invoice set status_id = 3 where id = $invoice->invoice_id");
            }
        } else if ($status == 5) {
            // cancelled
            if ($cancelled == $items) {
                query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->invoice_id', 6, '$user_id')");
                query("update tbl_invoice set status_id = 6 where id = $invoice->invoice_id");
            } else {
                if ($pending == 0) {
                    query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->invoice_id', 3, '$user_id')");
                    query("update tbl_invoice set status_id = 3 where id = $invoice->invoice_id");
                } else if ($pending == 0) {
                    if ($cancelled > $rejected) {
                        query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->invoice_id', 6, '$user_id')");
                        query("update tbl_invoice set status_id = 6 where id = $invoice->invoice_id");
                    } else {
                        query("insert into tbl_invoice_status_history (invoice_id,status_id,created_by) values('$invoice->invoice_id', 7, '$user_id')");
                        query("update tbl_invoice set status_id = 7 where id = $invoice->invoice_id");
                    }
                }
            }
        } else if ($status == 6) {
            // rejected
            if ($rejected == $items) {
                query("insert into tbl_invoice_status_history (transaction_id,status_id,created_by) values('$invoice->invoice_id', 7, '$user_id')");
                query("update tbl_invoice set status_id = 7 where id = $invoice->invoice_id");
            } else {
                if ($pending == 0) {
                    query("insert into tbl_invoice_status_history (transaction_id,status_id,created_by) values('$invoice->invoice_id', 3, '$user_id')");
                    query("update tbl_invoice set status_id = 3 where id = $invoice->invoice_id");
                } else if ($pending == 0) {
                    if ($cancelled > $rejected) {
                        query("insert into tbl_invoice_status_history (transaction_id,status_id,created_by) values('$invoice->invoice_id', 6, '$user_id')");
                        query("update tbl_invoice set status_id = 6 where id = $invoice->invoice_id");
                    } else {
                        query("insert into tbl_invoice_status_history (transaction_id,status_id,created_by) values('$invoice->invoice_id', 7, '$user_id')");
                        query("update tbl_invoice set status_id = 7 where id = $invoice->invoice_id");
                    }
                }
            }
        }
    }
    return alert("Transaction Updated!");
}
