<?php

$db = new PDO(
    "mysql:host=localhost;dbname=programming_tips;charset=utf8",
    "root",
    "Harry123.",
    array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ),
);