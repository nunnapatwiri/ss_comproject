<?php
$BASE = '../';
require __DIR__ . '/../includes/bootstrap.php';
$user = require_login('Student');

$docTypes = document_types();
$cart = $_SESSION['cart_item'] ?? [];
const MAX_QTY = 10;

// ---- Actions (POST + redirect, so refreshing never re-submits) -----------
$action = $_GET['action'] ?? '';
if ($action !== '') {
    $code = (int) ($_GET['code'] ?? $_POST['code'] ?? 0);

    switch ($action) {
        case 'add':
            $qty = max(1, min(MAX_QTY, (int) ($_POST['quantity'] ?? 1)));
            if (isset($docTypes[$code])) {
                $current = $cart[$code]['quantity'] ?? 0;
                $cart[$code] = [
                    'type'     => $docTypes[$code]['name'],
                    'code'     => $code,
                    'quantity' => min(MAX_QTY, $current + $qty),
                    'image'    => $docTypes[$code]['image'],
                ];
                flash('success', 'เพิ่ม “' . e($docTypes[$code]['name']) . '” ' . $qty . ' ใบ ลงในรายการแล้ว');
            }
            break;

        case 'remove':
            if (isset($cart[$code])) {
                flash('info', 'นำ “' . e($cart[$code]['type']) . '” ออกจากรายการแล้ว');
                unset($cart[$code]);
            }
            break;

        case 'empty':
            $cart = [];
            break;

        case 'confirm':
            if ($cart && $_SERVER['REQUEST_METHOD'] === 'POST') {
                // One multi-row INSERT instead of one query per document (all-or-nothing)
                $placeholders = [];
                $params = [];
                foreach ($cart as $item) {
                    $placeholders[] = '(?, ?, ?, ?, ?, ?, ?, 0)';
                    array_push($params, (int) $user['grade'], (int) $user['class'], $user['name'],
                        (int) $user['username'], (string) $item['code'], (int) $item['quantity'], $item['type']);
                }
                db_exec(
                    'INSERT INTO tbl_orders (grade, class, name, username, code, quantity, type, status) VALUES '
                        . implode(', ', $placeholders),
                    str_repeat('iisisis', count($cart)),
                    $params
                );
                $count = count($cart);
                $cart = [];
                flash('success', 'ส่งคำขอ ' . $count . ' รายการเรียบร้อย — <a href="stu_id.php">ดูสถานะคำขอ</a>');
            }
            break;
    }
    $_SESSION['cart_item'] = $cart;
    header('Location: student.php');
    exit;
}

$totalQty = array_sum(array_column($cart, 'quantity'));

$PAGE_TITLE = 'ขอเอกสารทางการศึกษา';
$ACTIVE_NAV = 'request';
$BODY_CLASS = $cart ? 'has-cart-bar' : '';
require __DIR__ . '/../includes/header.php';
?>

<div class="page-head">
    <div class="container">
        <div class="page-head__row">
            <div>
                <h1>ขอเอกสารทางการศึกษา</h1>
                <ol class="steps" aria-label="ขั้นตอน">
                    <li><b>1</b>เลือกเอกสารและจำนวน</li>
                    <li><b>2</b>ตรวจสอบรายการแล้วกดยืนยัน</li>
                    <li><b>3</b>ติดตามสถานะ และรับที่ห้องทะเบียน</li>
                </ol>
            </div>
            <a class="btn btn--outline" href="stu_id.php"><?= icon('history') ?>ประวัติคำขอ</a>
        </div>
    </div>
</div>

<div class="page-body">
    <div class="container request-layout">
        <section aria-labelledby="catalog-title">
            <h2 class="visually-hidden" id="catalog-title">เลือกเอกสาร</h2>
            <div class="catalog">
                <?php foreach ($docTypes as $code => $doc): ?>
                    <article class="card product">
                        <div class="product__thumb">
                            <img src="<?= e(img($doc['image'])) ?>" alt="ตัวอย่าง <?= e($doc['name']) ?>" loading="lazy" decoding="async">
                        </div>
                        <div class="product__body">
                            <div>
                                <h3><?= e($doc['name']) ?></h3>
                                <?php if (isset($cart[$code])): ?>
                                    <span class="product__in-cart"><?= icon('check') ?>อยู่ในรายการแล้ว <?= (int) $cart[$code]['quantity'] ?> ใบ</span>
                                <?php endif; ?>
                            </div>
                            <form action="student.php?action=add&amp;code=<?= $code ?>" method="post">
                                <div class="stepper">
                                    <button type="button" data-step="-1" aria-label="ลดจำนวน"><?= icon('minus') ?></button>
                                    <input type="number" name="quantity" value="1" min="1" max="<?= MAX_QTY ?>" aria-label="จำนวน <?= e($doc['name']) ?>">
                                    <button type="button" data-step="1" aria-label="เพิ่มจำนวน"><?= icon('plus') ?></button>
                                </div>
                                <button type="submit" class="btn btn--primary"><?= icon('plus') ?>เพิ่มในรายการ</button>
                            </form>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        </section>

        <aside class="card cart" id="cart" aria-labelledby="cart-title">
            <div class="cart__head">
                <h2 id="cart-title"><?= icon('clipboard') ?>รายการที่จะขอ</h2>
                <?php if ($cart): ?><span class="count"><?= count($cart) ?></span><?php endif; ?>
            </div>

            <?php if (!$cart): ?>
                <div class="empty">
                    <span class="empty__icon"><?= icon('clipboard') ?></span>
                    <h3>ยังไม่มีรายการ</h3>
                    <p>เลือกเอกสารทางซ้าย แล้วกด “เพิ่มในรายการ”</p>
                </div>
            <?php else: ?>
                <div class="cart__items">
                    <?php foreach ($cart as $item): ?>
                        <div class="cart__item">
                            <div class="cart__item-info">
                                <strong><?= e($item['type']) ?></strong>
                                <span>จำนวน <?= (int) $item['quantity'] ?> ใบ</span>
                            </div>
                            <form action="student.php?action=remove&amp;code=<?= (int) $item['code'] ?>" method="post">
                                <button type="submit" class="icon-btn" aria-label="นำ <?= e($item['type']) ?> ออก" title="นำออก"><?= icon('trash') ?></button>
                            </form>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div class="cart__total"><span>รวมทั้งหมด</span><span><?= $totalQty ?> ใบ</span></div>
                <form action="student.php?action=confirm" method="post" data-loading="กำลังส่งคำขอ…">
                    <button type="submit" class="btn btn--accent btn--lg btn--block"><?= icon('check') ?><span>ยืนยันส่งคำขอ</span></button>
                </form>
                <p class="cart__note"><?= icon('info') ?>หลังยืนยัน ติดตามสถานะได้ที่ “ประวัติคำขอ” และมารับเอกสารที่ห้องทะเบียนเมื่อสถานะเป็น “พร้อมให้รับ”</p>
            <?php endif; ?>
        </aside>
    </div>
</div>

<?php if ($cart): ?>
    <div class="mobile-cart-bar">
        <span><?= icon('clipboard') ?><?= count($cart) ?> รายการ · <?= $totalQty ?> ใบ</span>
        <a class="btn btn--accent btn--sm" href="#cart">ตรวจสอบและยืนยัน</a>
    </div>
<?php endif; ?>

<?php require __DIR__ . '/../includes/footer.php'; ?>
