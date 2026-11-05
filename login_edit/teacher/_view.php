<?php
/**
 * Shared teacher dashboard. Each page in this folder (teacher.php, status1.php,
 * tbl1.0.php, ...) sets $VIEW_STATUS (0/1/2) and $VIEW_CODE (null = all, 1-4)
 * and includes this file, so every old URL keeps working.
 */
$BASE = '../';
require __DIR__ . '/../includes/bootstrap.php';

/** File name for a given status/document-type combination (keeps the original URLs). */
function teacher_page(int $status, ?int $code): string
{
    if ($code === null) {
        return [0 => 'teacher.php', 1 => 'status1.php', 2 => 'status2.php'][$status];
    }
    return "tbl{$code}.{$status}.php";
}

// ---- AJAX: change the status of one request --------------------------------
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['id'], $_POST['status'])) {
    header('Content-Type: application/json; charset=utf-8');
    $user = current_user();
    if (!$user || $user['level'] !== 'Teacher') {
        http_response_code(403);
        echo json_encode(['ok' => false, 'message' => 'กรุณาเข้าสู่ระบบด้วยบัญชีเจ้าหน้าที่']);
        exit;
    }
    $id = (int) $_POST['id'];
    $status = (int) $_POST['status'];
    if (!isset(ORDER_STATUSES[$status])) {
        http_response_code(422);
        echo json_encode(['ok' => false, 'message' => 'สถานะไม่ถูกต้อง']);
        exit;
    }
    $ok = db_exec('UPDATE tbl_orders SET status = ? WHERE id = ?', 'ii', [$status, $id]);
    echo json_encode(['ok' => $ok, 'label' => ORDER_STATUSES[$status]['label']]);
    exit;
}

// ---- Page ----------------------------------------------------------------
$user = require_login('Teacher');
$VIEW_STATUS = (int) ($VIEW_STATUS ?? 0);
$VIEW_CODE = isset($VIEW_CODE) ? (int) $VIEW_CODE : null;
$docTypes = document_types();

// Counts for the tabs (per status, for the selected document type) and chips (per type, for the selected status)
$statusCounts = array_fill_keys(array_keys(ORDER_STATUSES), 0);
$codeCounts = array_fill_keys(array_keys($docTypes), 0);
foreach (db_all('SELECT status, code, COUNT(*) AS n FROM tbl_orders GROUP BY status, code') as $r) {
    $s = (int) $r['status'];
    $c = (int) $r['code'];
    if ($VIEW_CODE === null || $VIEW_CODE === $c) {
        $statusCounts[$s] = ($statusCounts[$s] ?? 0) + $r['n'];
    }
    if ($s === $VIEW_STATUS) {
        $codeCounts[$c] = ($codeCounts[$c] ?? 0) + $r['n'];
    }
}

if ($VIEW_CODE === null) {
    $rows = db_all('SELECT id, time, name, username, grade, class, type, quantity, status, code FROM tbl_orders WHERE status = ? ORDER BY time ASC, id ASC', 'i', [$VIEW_STATUS]);
} else {
    // code is a VARCHAR column: bind it as a string so MySQL can use idx_status_code_time
    $rows = db_all('SELECT id, time, name, username, grade, class, type, quantity, status, code FROM tbl_orders WHERE status = ? AND code = ? ORDER BY time ASC, id ASC', 'is', [$VIEW_STATUS, (string) $VIEW_CODE]);
}

$PAGE_TITLE = 'รายการคำขอเอกสาร';
$ACTIVE_NAV = 'requests';
$EXTRA_SCRIPTS = '<script src="' . asset('js/table.js') . '"></script>'
    . '<script src="' . asset('js/teacher.js') . '"></script>';

$statusHelp = [
    0 => 'คำขอใหม่ที่รอจัดทำ เรียงจากคำขอที่เก่าที่สุดก่อน',
    1 => 'จัดทำเอกสารเสร็จแล้ว รอนักเรียนมารับ',
    2 => 'นักเรียนรับเอกสารไปเรียบร้อยแล้ว',
];

require __DIR__ . '/../includes/header.php';
?>

<div class="page-head">
    <div class="container">
        <div class="page-head__row">
            <div>
                <h1>รายการคำขอเอกสาร</h1>
                <p><?= e($statusHelp[$VIEW_STATUS]) ?></p>
            </div>
        </div>
        <nav class="tabs" aria-label="สถานะเอกสาร">
            <?php foreach (ORDER_STATUSES as $s => $info): ?>
                <a class="tab <?= $s === $VIEW_STATUS ? 'is-active' : '' ?>" href="<?= teacher_page($s, $VIEW_CODE) ?>"
                   <?= $s === $VIEW_STATUS ? 'aria-current="page"' : '' ?>>
                    <?= icon($info['icon']) ?><?= e($info['label']) ?>
                    <span class="count" data-count-status="<?= $s ?>"><?= $statusCounts[$s] ?></span>
                </a>
            <?php endforeach; ?>
        </nav>
    </div>
</div>

<div class="page-body">
    <div class="container">
        <div class="toolbar">
            <span class="toolbar__label">ประเภทเอกสาร:</span>
            <div class="chips">
                <a class="chip <?= $VIEW_CODE === null ? 'is-active' : '' ?>" href="<?= teacher_page($VIEW_STATUS, null) ?>">
                    ทั้งหมด <span class="count" data-count-code="all"><?= array_sum($codeCounts) ?></span>
                </a>
                <?php foreach ($docTypes as $code => $doc): ?>
                    <a class="chip <?= $VIEW_CODE === $code ? 'is-active' : '' ?>" href="<?= teacher_page($VIEW_STATUS, $code) ?>">
                        <?= e($doc['name']) ?> <span class="count" data-count-code="<?= $code ?>"><?= $codeCounts[$code] ?? 0 ?></span>
                    </a>
                <?php endforeach; ?>
            </div>
        </div>

        <div class="card table-card">
            <?php if (!$rows): ?>
                <div class="empty">
                    <span class="empty__icon"><?= icon('inbox') ?></span>
                    <h3>ไม่มีคำขอในสถานะนี้</h3>
                    <p>เมื่อมีคำขอเข้ามา รายการจะแสดงที่นี่</p>
                </div>
            <?php else: ?>
                <div class="table-scroll">
                    <table class="data-table" id="orders" data-view-status="<?= $VIEW_STATUS ?>">
                        <thead>
                            <tr>
                                <th>รหัส</th>
                                <th>วันที่ยื่น</th>
                                <th>นักเรียน</th>
                                <th>ชั้น</th>
                                <th>เอกสาร</th>
                                <th>จำนวน</th>
                                <th>สถานะ</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($rows as $row): ?>
                                <tr id="row-<?= (int) $row['id'] ?>" data-code="<?= (int) $row['code'] ?>">
                                    <td class="num" data-label="รหัสคำขอ">#<?= (int) $row['id'] ?></td>
                                    <td class="when" data-label="วันที่ยื่น" data-order="<?= e($row['time']) ?>"><?= e(thai_datetime($row['time'])) ?></td>
                                    <td class="student"><strong><?= e($row['name']) ?></strong><span><?= e($row['username']) ?></span></td>
                                    <td data-label="ชั้น" data-order="<?= (int) $row['grade'] * 100 + (int) $row['class'] ?>">ม.<?= (int) $row['grade'] ?>/<?= (int) $row['class'] ?></td>
                                    <td data-label="เอกสาร"><?= e(trim($row['type'])) ?></td>
                                    <td class="num" data-label="จำนวน"><?= (int) $row['quantity'] ?> ใบ</td>
                                    <td class="cell-status">
                                        <div class="status-select" role="group" aria-label="เปลี่ยนสถานะคำขอ #<?= (int) $row['id'] ?>" data-id="<?= (int) $row['id'] ?>">
                                            <?php foreach (ORDER_STATUSES as $s => $info): ?>
                                                <button type="button" data-status="<?= $s ?>" aria-pressed="<?= (int) $row['status'] === $s ? 'true' : 'false' ?>">
                                                    <?= icon($info['icon']) ?><?= e($info['label']) ?>
                                                </button>
                                            <?php endforeach; ?>
                                        </div>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            <?php endif; ?>
        </div>
    </div>
</div>

<?php require __DIR__ . '/../includes/footer.php'; ?>
