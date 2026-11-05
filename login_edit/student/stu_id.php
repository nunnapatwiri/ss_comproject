<?php
$BASE = '../';
require __DIR__ . '/../includes/bootstrap.php';
$user = require_login('Student');

// username is an INT column: bind as int so idx_username_time is used
$orders = db_all('SELECT id, type, quantity, time, status FROM tbl_orders WHERE username = ? ORDER BY time DESC, id DESC', 'i', [(int) $user['username']]);
$counts = array_fill_keys(array_keys(ORDER_STATUSES), 0);
foreach ($orders as $o) {
    $counts[(int) $o['status']]++;
}
$readyCount = $counts[1];

$PAGE_TITLE = 'ประวัติการขอเอกสาร';
$ACTIVE_NAV = 'history';
require __DIR__ . '/../includes/header.php';
?>

<div class="page-head">
    <div class="container">
        <div class="page-head__row">
            <div>
                <h1>ประวัติการขอเอกสาร</h1>
                <p>ติดตามสถานะคำขอทั้งหมดของคุณ</p>
            </div>
            <a class="btn btn--primary" href="student.php"><?= icon('plus') ?>ขอเอกสารเพิ่ม</a>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container history-layout">
        <aside class="card profile">
            <span class="avatar" aria-hidden="true"><?= e(mb_substr(trim($user['name']), 0, 1)) ?></span>
            <h2><?= e($user['name']) ?></h2>
            <p class="profile__meta">เลขประจำตัว <?= e($user['username']) ?></p>
            <?php if ($user['grade']): ?>
                <p class="profile__meta">ชั้นมัธยมศึกษาปีที่ <?= (int) $user['grade'] ?>/<?= (int) $user['class'] ?></p>
            <?php endif; ?>
            <div class="profile__stats">
                <div class="pending"><strong><?= $counts[0] ?></strong><span>กำลังดำเนินการ</span></div>
                <div class="done"><strong><?= $counts[1] ?></strong><span>พร้อมให้รับ</span></div>
                <div class="received"><strong><?= $counts[2] ?></strong><span>รับแล้ว</span></div>
            </div>
            <?php if ($readyCount): ?>
                <div class="alert alert--success">
                    <?= icon('check-circle') ?>
                    <span>มีเอกสาร <?= $readyCount ?> รายการพร้อมให้รับที่ห้องทะเบียน</span>
                </div>
            <?php endif; ?>
        </aside>

        <section>
            <?php if ($orders): ?>
                <div class="toolbar">
                    <span class="toolbar__label">แสดง:</span>
                    <div class="chips" role="group" aria-label="กรองตามสถานะ">
                        <button type="button" class="chip is-active" data-filter="all">ทั้งหมด <span class="count"><?= count($orders) ?></span></button>
                        <?php foreach (ORDER_STATUSES as $s => $info): ?>
                            <button type="button" class="chip" data-filter="<?= $s ?>"><?= e($info['student']) ?> <span class="count"><?= $counts[$s] ?></span></button>
                        <?php endforeach; ?>
                    </div>
                </div>
            <?php endif; ?>

            <div class="card">
                <?php if (!$orders): ?>
                    <div class="empty">
                        <span class="empty__icon"><?= icon('inbox') ?></span>
                        <h3>ยังไม่มีคำขอเอกสาร</h3>
                        <p>เมื่อคุณยื่นคำขอ รายการและสถานะจะแสดงที่นี่</p>
                        <a class="btn btn--primary" href="student.php"><?= icon('plus') ?>ขอเอกสาร</a>
                    </div>
                <?php else: ?>
                    <div class="history-list">
                        <?php foreach ($orders as $o): $s = (int) $o['status']; ?>
                            <div class="history-item" data-status="<?= $s ?>">
                                <span class="history-item__icon"><?= icon('file-text') ?></span>
                                <div>
                                    <h3><?= e(trim($o['type'])) ?> · <?= (int) $o['quantity'] ?> ใบ</h3>
                                    <div class="history-item__meta">
                                        <span>คำขอ #<?= (int) $o['id'] ?></span>
                                        <span><?= e(thai_datetime($o['time'])) ?></span>
                                    </div>
                                    <?php if ($s === 1): ?>
                                        <div class="history-item__hint">มารับได้ที่ห้องทะเบียนในเวลาราชการ</div>
                                    <?php endif; ?>
                                </div>
                                <?= status_badge($s, true) ?>
                            </div>
                        <?php endforeach; ?>
                    </div>
                    <div class="empty" id="filter-empty" hidden>
                        <span class="empty__icon"><?= icon('inbox') ?></span>
                        <h3>ไม่มีคำขอในสถานะนี้</h3>
                    </div>
                <?php endif; ?>
            </div>
        </section>
    </div>
</div>

<?php
$EXTRA_SCRIPTS = <<<'HTML'
<script>
document.querySelectorAll('[data-filter]').forEach(function (chip) {
    chip.addEventListener('click', function () {
        var f = chip.dataset.filter, shown = 0;
        document.querySelectorAll('[data-filter]').forEach(function (c) { c.classList.toggle('is-active', c === chip); });
        document.querySelectorAll('.history-item').forEach(function (item) {
            var show = f === 'all' || item.dataset.status === f;
            item.hidden = !show;
            if (show) shown++;
        });
        document.getElementById('filter-empty').hidden = shown > 0;
    });
});
</script>
HTML;
require __DIR__ . '/../includes/footer.php';
?>
