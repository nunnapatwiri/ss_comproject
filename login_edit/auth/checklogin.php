<?php
$BASE = '../';
require __DIR__ . '/../includes/bootstrap.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['username'])) {
    header('Location: login.php');
    exit;
}

$username = trim($_POST['username']);
$password = $_POST['password'] ?? '';

// Prepared statement: the old string-built query allowed logging in with ' OR '1'='1
$rows = db_all('SELECT * FROM login WHERE username = ? AND password = ? LIMIT 1', 'ss', [$username, $password]);

if (count($rows) !== 1) {
    header('Location: login.php?error=invalid&u=' . urlencode($username));
    exit;
}

$row = $rows[0];
session_regenerate_id(true);
$_SESSION['name']     = $row['name'];
$_SESSION['username'] = $row['username'];
$_SESSION['level']    = $row['level'];
$_SESSION['grade']    = $row['grade'];
$_SESSION['class']    = $row['class'];

header('Location: ../' . dashboard_path($row['level']));
exit;
