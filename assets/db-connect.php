<?php

$db = new PDO(
    "mysql:host=".getenv("DB_HOST").";dbname=".getenv("DB_NAME").";charset=utf8",
    getenv("DB_USER"),
    getenv("DB_PASSWORD"),
    array(
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    ),
);