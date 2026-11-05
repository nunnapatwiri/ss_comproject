<?php
/**
 * Page header + top navigation.
 * Expects: $BASE, $PAGE_TITLE. Optional: $ACTIVE_NAV (key), $EXTRA_HEAD (html), $BODY_CLASS.
 */
$user = current_user();
$onHome = ($ACTIVE_NAV ?? '') === 'home';
$homeLink = $onHome ? '' : $BASE . 'home.php';

if ($user && $user['level'] === 'Teacher') {
    $navItems = [
        'requests' => ['รายการคำขอ', $BASE . 'teacher/teacher.php'],
        'home'     => ['หน้าเว็บโรงเรียน', $BASE . 'home.php'],
    ];
} elseif ($user && !$onHome) {
    $navItems = [
        'request' => ['ขอเอกสาร', $BASE . 'student/student.php'],
        'history' => ['ประวัติคำขอ', $BASE . 'student/stu_id.php'],
        'home'    => ['หน้าเว็บโรงเรียน', $BASE . 'home.php'],
    ];
} else {
    $navItems = [
        'top'      => ['หน้าแรก', $homeLink . '#top'],
        'news'     => ['ข่าวสาร', $homeLink . '#news'],
        'services' => ['บริการ', $homeLink . '#services'],
        'contact'  => ['ติดต่อ', $homeLink . '#contact'],
    ];
}
$roleLabel = $user ? ($user['level'] === 'Teacher' ? 'เจ้าหน้าที่ / ครู' : 'นักเรียน') : '';
$initial = $user ? mb_substr(trim($user['name']), 0, 1) : '';
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($PAGE_TITLE) ?> | สำนักงานทะเบียน โรงเรียนสามเสนวิทยาลัย</title>
    <link rel="icon" href="<?= $BASE ?>images/favicon.png" type="image/png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;500&family=Sarabun:wght@400;600&display=swap" rel="stylesheet">
    <?= $EXTRA_HEAD ?? '' /* before main.css so our overrides win */ ?>
    <link rel="stylesheet" href="<?= asset('css/main.css') ?>">
</head>
<body class="<?= e($BODY_CLASS ?? '') ?>">
<a class="skip-link" href="#main">ข้ามไปยังเนื้อหา</a>

<header class="site-header">
    <div class="container site-header__inner">
        <a class="brand" href="<?= $user && !$onHome ? $BASE . dashboard_path($user['level']) : $homeLink . '#top' ?>">
            <img src="<?= img('logoHead2 (1).png') ?>" alt="โรงเรียนสามเสนวิทยาลัย" width="180" height="52">
        </a>

        <button class="nav-toggle" type="button" aria-expanded="false" aria-controls="site-nav" aria-label="เปิดเมนู">
            <?= icon('menu', 'nav-toggle__open') ?><?= icon('x', 'nav-toggle__close') ?>
        </button>

        <nav class="site-nav" id="site-nav" aria-label="เมนูหลัก">
            <ul class="site-nav__links">
                <?php foreach ($navItems as $key => [$label, $href]): ?>
                    <li><a href="<?= e($href) ?>" class="<?= ($ACTIVE_NAV ?? '') === $key ? 'is-active' : '' ?>"
                        <?= ($ACTIVE_NAV ?? '') === $key ? 'aria-current="page"' : '' ?>><?= e($label) ?></a></li>
                <?php endforeach; ?>
            </ul>

            <?php if ($user): ?>
                <div class="user-menu">
                    <button class="user-menu__button" type="button" aria-expanded="false" aria-haspopup="true">
                        <span class="avatar" aria-hidden="true"><?= e($initial) ?></span>
                        <span class="user-menu__name"><?= e($user['name']) ?></span>
                        <?= icon('chevron-down') ?>
                    </button>
                    <div class="user-menu__panel" role="menu">
                        <div class="user-menu__head">
                            <strong><?= e($user['name']) ?></strong>
                            <span><?= e($roleLabel) ?> · <?= e($user['username']) ?></span>
                        </div>
                        <?php if ($onHome): ?>
                            <a role="menuitem" href="<?= $BASE . dashboard_path($user['level']) ?>"><?= icon('arrow-right') ?>ไปที่ระบบขอเอกสาร</a>
                        <?php endif; ?>
                        <?php if ($user['level'] !== 'Teacher'): ?>
                            <a role="menuitem" href="<?= $BASE ?>student/stu_id.php"><?= icon('history') ?>ประวัติการขอเอกสาร</a>
                        <?php endif; ?>
                        <a role="menuitem" href="<?= $BASE ?>auth/logout.php" class="user-menu__logout"><?= icon('log-out') ?>ออกจากระบบ</a>
                    </div>
                </div>
            <?php else: ?>
                <a class="btn btn--accent btn--sm" href="<?= $BASE ?>auth/login.php"><?= icon('log-in') ?>เข้าสู่ระบบ</a>
            <?php endif; ?>
        </nav>
    </div>
</header>

<?php $flashes = take_flashes(); if ($flashes): ?>
    <div class="toast-stack" aria-live="polite">
        <?php foreach ($flashes as $f): ?>
            <div class="toast toast--<?= e($f['type']) ?>" role="status">
                <?= icon($f['type'] === 'error' ? 'alert-circle' : 'check-circle') ?>
                <span><?= $f['message'] ?></span>
                <button type="button" class="toast__close" aria-label="ปิด"><?= icon('x') ?></button>
            </div>
        <?php endforeach; ?>
    </div>
<?php endif; ?>

<main id="main">
