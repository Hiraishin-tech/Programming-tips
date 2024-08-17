<?php

require "./assets/db-connect.php";

$query = $db->prepare("SELECT title FROM tips");
$result = $query->execute();
$result = $query->fetchAll();
$result = json_encode($result);
// var_dump($result);
echo $result;