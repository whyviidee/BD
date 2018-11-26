<?php
    $host = "db.ist.utl.pt";
    $user ="ist181609";
    $password = "KappaPride";
    $dbname = $user;
    
    $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
