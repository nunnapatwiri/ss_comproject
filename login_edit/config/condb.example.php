<?php
// Copy this file to condb.php and fill in your own database credentials.
// condb.php is ignored by git so real passwords are never committed.
$con = mysqli_connect('localhost', 'DB_USER', 'DB_PASSWORD', 'shopping_cart');
mysqli_set_charset($con, 'utf8mb4');
