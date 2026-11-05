<?php
/**
 * Shared setup for every page: session, database connection and small helpers.
 * Each page sets $BASE ('' for pages at the root, '../' for pages in a subfolder)
 * before including this file.
 */
// gzip every page (HTML/JSON shrink ~80-90%). Must run before any output.
if (!headers_sent() && extension_loaded('zlib') && !ini_get('zlib.output_compression')) {
    ini_set('zlib.output_compression', '1');
}
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
if (!isset($BASE)) {
    $BASE = '';
}
date_default_timezone_set('Asia/Bangkok');

require_once __DIR__ . '/icons.php';

/** Shared mysqli connection, opened the first time a page actually needs the database. */
function db(): mysqli
{
    static $con = null;
    if ($con === null) {
        require __DIR__ . '/../config/condb.php'; // sets $con
    }
    return $con;
}

/** URL for a CSS/JS file with its modification time appended, so browsers can cache it forever. */
function asset(string $path): string
{
    global $BASE;
    $file = __DIR__ . '/../' . $path;
    return $BASE . $path . (is_file($file) ? '?v=' . filemtime($file) : '');
}

/** Use the optimized .webp version of an image when one exists (see images/*.webp). */
function img(string $file): string
{
    global $BASE;
    static $map = ['logoHead2 (1).png' => 'logo-head.webp'];
    $webp = $map[$file] ?? preg_replace('/\.(jpe?g|png)$/i', '.webp', $file);
    return $BASE . 'images/' . (is_file(__DIR__ . '/../images/' . $webp) ? $webp : $file);
}

// Status codes used in tbl_orders.status
const ORDER_STATUSES = [
    0 => ['label' => 'กำลังดำเนินการ',     'student' => 'กำลังดำเนินการ',  'key' => 'pending',  'icon' => 'clock'],
    1 => ['label' => 'เสร็จสิ้น',           'student' => 'พร้อมให้รับ',     'key' => 'done',     'icon' => 'check-circle'],
    2 => ['label' => 'รับเอกสารเรียบร้อย', 'student' => 'รับเอกสารแล้ว',   'key' => 'received', 'icon' => 'package'],
];

/** Escape a value for safe HTML output. */
function e($value): string
{
    return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8');
}

/** Run a prepared query and return all rows as associative arrays. */
function db_all(string $sql, string $types = '', array $params = []): array
{
    $stmt = mysqli_prepare(db(), $sql);
    if ($types !== '') {
        mysqli_stmt_bind_param($stmt, $types, ...$params);
    }
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    return $result ? mysqli_fetch_all($result, MYSQLI_ASSOC) : [];
}

/** Run a prepared INSERT/UPDATE/DELETE. Returns true on success. */
function db_exec(string $sql, string $types = '', array $params = []): bool
{
    $stmt = mysqli_prepare(db(), $sql);
    if ($types !== '') {
        mysqli_stmt_bind_param($stmt, $types, ...$params);
    }
    return mysqli_stmt_execute($stmt);
}

function current_user(): ?array
{
    if (empty($_SESSION['username'])) {
        return null;
    }
    return [
        'username' => $_SESSION['username'],
        'name'     => $_SESSION['name'] ?? '',
        'level'    => $_SESSION['level'] ?? '',
        'grade'    => $_SESSION['grade'] ?? '',
        'class'    => $_SESSION['class'] ?? '',
    ];
}

/** The landing page for a logged-in user, relative to the site root. */
function dashboard_path(?string $level): string
{
    return $level === 'Teacher' ? 'teacher/teacher.php' : 'student/student.php';
}

/** Send visitors who are not logged in (or have the wrong role) somewhere sensible. */
function require_login(?string $role = null): array
{
    global $BASE;
    $user = current_user();
    if (!$user) {
        header('Location: ' . $BASE . 'auth/login.php');
        exit;
    }
    if ($role !== null && $user['level'] !== $role) {
        header('Location: ' . $BASE . dashboard_path($user['level']));
        exit;
    }
    return $user;
}

/** One-time messages shown on the next page load (after a redirect). */
function flash(string $type, string $message): void
{
    $_SESSION['flash'][] = ['type' => $type, 'message' => $message];
}

function take_flashes(): array
{
    $messages = $_SESSION['flash'] ?? [];
    unset($_SESSION['flash']);
    return $messages;
}

/** Format a MySQL timestamp as Thai date, e.g. "13 ส.ค. 2567 · 23:52". */
function thai_datetime(?string $value): string
{
    if (!$value) {
        return '-';
    }
    $ts = strtotime($value);
    $months = ['ม.ค.', 'ก.พ.', 'มี.ค.', 'เม.ย.', 'พ.ค.', 'มิ.ย.', 'ก.ค.', 'ส.ค.', 'ก.ย.', 'ต.ค.', 'พ.ย.', 'ธ.ค.'];
    return date('j', $ts) . ' ' . $months[(int) date('n', $ts) - 1] . ' ' . ((int) date('Y', $ts) + 543)
        . ' · ' . date('H:i', $ts);
}

function status_badge(int $status, bool $forStudent = false): string
{
    $s = ORDER_STATUSES[$status] ?? ORDER_STATUSES[0];
    $label = $forStudent ? $s['student'] : $s['label'];
    return '<span class="badge badge--' . $s['key'] . '">' . icon($s['icon']) . e($label) . '</span>';
}

/** Document types offered to students (tbl_products), keyed by code. */
function document_types(): array
{
    static $types = null; // query once per request even if called from several places
    if ($types !== null) {
        return $types;
    }
    $types = [];
    foreach (db_all('SELECT code, type, image FROM tbl_products ORDER BY code') as $row) {
        $types[(int) $row['code']] = ['name' => trim($row['type']), 'image' => $row['image']];
    }
    return $types;
}
