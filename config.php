<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$connection = new mysqli("localhost", "root2", "root2", "ushortnerapi");

if($connection->connect_error){
    die("Failed To Connect!" . $connection.connect_error);
}

?>