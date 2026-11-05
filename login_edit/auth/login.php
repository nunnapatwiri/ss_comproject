<?php
$BASE = '../';
require __DIR__ . '/../includes/bootstrap.php';

// Already logged in? Go straight to the right dashboard.
if ($user = current_user()) {
    header('Location: ../' . dashboard_path($user['level']));
    exit;
}

$error = $_GET['error'] ?? '';
$prefill = $_GET['u'] ?? '';
?>
<!DOCTYPE html>
<html lang="th">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ | สำนักงานทะเบียน โรงเรียนสามเสนวิทยาลัย</title>
    <link rel="icon" href="../images/favicon.png" type="image/png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Kanit:wght@400;500&family=Sarabun:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<?= asset('css/main.css') ?>">
</head>
<body class="auth-page">
<main class="auth">
    <div class="auth__card">
        <div class="auth__aside">
            <div class="slideshow" data-slideshow>
                <div class="slideshow__slide"><img src="<?= img('all.jpg') ?>" alt="" fetchpriority="high"></div>
                <div class="slideshow__slide"><img data-src="<?= img('school.png') ?>" alt=""></div>
                <div class="slideshow__slide"><img data-src="<?= img('school2.jpg') ?>" alt=""></div>
                <div class="slideshow__dots"></div>
            </div>
            <img class="auth__logo" src="<?= img('logoHead2 (1).png') ?>" alt="โรงเรียนสามเสนวิทยาลัย">
            <div class="auth__aside-text">
                <h2>ระบบขอเอกสารทางการศึกษา</h2>
                <p>ยื่นคำขอ ติดตามสถานะ และรับเอกสารได้สะดวกขึ้น</p>
            </div>
        </div>

        <div class="auth__form">
            <a class="auth__back" href="../home.php"><?= icon('arrow-left') ?>กลับหน้าแรก</a>
            <h1>เข้าสู่ระบบ</h1>
            <p>สำหรับนักเรียนและเจ้าหน้าที่สำนักงานทะเบียน</p>

            <?php if ($error === 'invalid'): ?>
                <div class="alert alert--error" role="alert">
                    <?= icon('alert-circle') ?>
                    <span>เลขประจำตัวหรือรหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง</span>
                </div>
            <?php elseif (isset($_GET['logged_out'])): ?>
                <div class="alert alert--success" role="status">
                    <?= icon('check-circle') ?>
                    <span>ออกจากระบบเรียบร้อยแล้ว</span>
                </div>
            <?php endif; ?>

            <form action="checklogin.php" method="POST" data-loading="กำลังเข้าสู่ระบบ…" novalidate>
                <div class="field">
                    <label for="username">เลขประจำตัว / ชื่อผู้ใช้</label>
                    <div class="input-wrap">
                        <?= icon('user') ?>
                        <input class="input" type="text" id="username" name="username" required
                               autocomplete="username" inputmode="numeric" placeholder="เช่น 48246"
                               value="<?= e($prefill) ?>" <?= $prefill ? '' : 'autofocus' ?>>
                    </div>
                </div>
                <div class="field">
                    <label for="password">รหัสผ่าน</label>
                    <div class="input-wrap">
                        <?= icon('lock') ?>
                        <input class="input input--pw" type="password" id="password" name="password" required
                               autocomplete="current-password" placeholder="กรอกรหัสผ่าน" <?= $prefill ? 'autofocus' : '' ?>>
                        <button type="button" class="pw-toggle" aria-controls="password" aria-label="แสดงรหัสผ่าน">
                            <?= icon('eye', 'icon-show') ?><?= icon('eye-off', 'icon-hide') ?>
                        </button>
                    </div>
                </div>
                <button type="submit" class="btn btn--primary btn--lg btn--block"><?= icon('log-in') ?><span>เข้าสู่ระบบ</span></button>
            </form>

            <p class="auth__help">ลืมรหัสผ่านหรือเข้าสู่ระบบไม่ได้? ติดต่อสำนักงานทะเบียน
                <a href="tel:022791992">0-2279-1992</a> หรือ <a href="mailto:regis@samsenwit.ac.th">regis@samsenwit.ac.th</a></p>
        </div>
    </div>
</main>
<?= icon_sprite() ?>
<script src="<?= asset('js/main.js') ?>"></script>
<script>
    // Show the browser's own "required" message only when the user actually submits empty fields.
    document.querySelector('.auth form').addEventListener('submit', function (e) {
        if (!this.checkValidity()) { e.preventDefault(); this.reportValidity(); }
    });
</script>
</body>
</html>
