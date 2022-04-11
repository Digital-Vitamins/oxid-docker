<?php
//var_dump(gd_info());die();
//phpinfo();

$host = "mysql-server";
$port = "3306";
$user = "oxid";
$pass = "oxid";
$db = "oxid";

try {
    $conn = new PDO("mysql:host=$host;dbname=$db;port=$port", $user, $pass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Connected successfully";
} catch(PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
