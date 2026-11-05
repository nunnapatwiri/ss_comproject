<?php
$BASE = '';
require __DIR__ . '/includes/bootstrap.php';

$PAGE_TITLE = 'หน้าแรก';
$ACTIVE_NAV = 'home';
$user = current_user();
$ctaHref = $user ? dashboard_path($user['level']) : 'auth/login.php';
$ctaLabel = $user ? 'ไปที่ระบบขอเอกสาร' : 'ขอเอกสารออนไลน์';

$guides = [
    ['title' => 'ขั้นตอนการขอเอกสาร', 'desc' => 'คู่มือการใช้งานเว็บไซต์ขอเอกสารทางการศึกษาสำหรับนักเรียน ทีละขั้นตอน', 'img' => 'step2.png', 'pdf' => 'step1.pdf'],
    ['title' => 'เอกสารทางการศึกษา', 'desc' => 'รายละเอียดเอกสารแต่ละประเภทที่สำนักงานทะเบียนให้บริการ', 'img' => 'doc.jpg', 'pdf' => 'doc1.pdf'],
    ['title' => 'ตัวอย่างเอกสาร', 'desc' => 'ดูตัวอย่างเอกสารจริงก่อนยื่นคำขอ เพื่อเลือกประเภทที่ตรงกับการใช้งาน', 'img' => 'example.jpg', 'pdf' => 'example.pdf'],
];

$services = [
    ['ใบ ปพ.1', 'ระเบียนแสดงผลการเรียน ฉบับภาษาไทย'],
    ['Transcript', 'ระเบียนแสดงผลการเรียน ฉบับภาษาอังกฤษ'],
    ['ปพ.7 รับรองผลการศึกษา', 'หนังสือรับรองผลการศึกษาของนักเรียน'],
    ['ปพ.7 รับรองสภาพนักเรียน', 'หนังสือรับรองสภาพการเป็นนักเรียนปัจจุบัน'],
];

require __DIR__ . '/includes/header.php';
?>

<section class="hero" id="top">
    <div class="container hero__grid">
        <div>
            <span class="eyebrow">Registration Office · Samsenwittayalai School</span>
            <h1>สำนักงานทะเบียน<br>โรงเรียนสามเสนวิทยาลัย</h1>
            <p class="hero__lead">ยื่นคำขอเอกสารทางการศึกษาออนไลน์ ติดตามสถานะได้ตลอดเวลา และรับเอกสารที่ห้องทะเบียนเมื่อพร้อม</p>
            <div class="hero__actions">
                <a class="btn btn--accent btn--lg" href="<?= e($ctaHref) ?>"><?= e($ctaLabel) ?><?= icon('arrow-right') ?></a>
                <a class="btn btn--outline btn--lg" href="#news"><?= icon('file-text') ?>ดูขั้นตอนการขอ</a>
            </div>
            <div class="hero__stats">
                <div><strong>4 ประเภท</strong><span>เอกสารที่ให้บริการ</span></div>
                <div><strong>ออนไลน์</strong><span>ยื่นคำขอได้ทุกที่</span></div>
                <div><strong>ติดตามได้</strong><span>สถานะคำขอแบบเรียลไทม์</span></div>
            </div>
        </div>

        <div class="slideshow" data-slideshow>
            <div class="slideshow__slide"><img src="<?= img('all.jpg') ?>" alt="บรรยากาศโรงเรียนสามเสนวิทยาลัย" fetchpriority="high"></div>
            <div class="slideshow__slide"><img data-src="<?= img('school.png') ?>" alt="อาคารเรียนโรงเรียนสามเสนวิทยาลัย"></div>
            <div class="slideshow__slide"><img data-src="<?= img('school2.jpg') ?>" alt="โรงเรียนสามเสนวิทยาลัย"></div>
            <div class="slideshow__dots"></div>
        </div>
    </div>
</section>

<section class="section section--alt" id="news">
    <div class="container">
        <div class="section__head">
            <span class="eyebrow">ข่าวสาร</span>
            <h2>คู่มือและเอกสารที่ควรรู้</h2>
            <p>อ่านก่อนยื่นคำขอ เพื่อให้ได้เอกสารที่ถูกต้องและรวดเร็ว</p>
        </div>
        <div class="doc-grid">
            <?php foreach ($guides as $g): ?>
                <article class="card doc-card">
                    <a class="doc-card__thumb" href="documents/<?= e($g['pdf']) ?>" target="_blank" rel="noopener" tabindex="-1" aria-hidden="true">
                        <img src="<?= e(img($g['img'])) ?>" alt="" loading="lazy" decoding="async">
                    </a>
                    <div class="doc-card__body">
                        <h3><?= e($g['title']) ?></h3>
                        <p><?= e($g['desc']) ?></p>
                        <a class="btn btn--outline btn--sm" href="documents/<?= e($g['pdf']) ?>" target="_blank" rel="noopener">
                            <?= icon('download') ?>เปิดไฟล์ PDF
                        </a>
                    </div>
                </article>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<section class="section" id="services">
    <div class="container">
        <div class="section__head">
            <span class="eyebrow">บริการ</span>
            <h2>เอกสารที่ขอได้ผ่านระบบ</h2>
            <p>นักเรียนเข้าสู่ระบบด้วยเลขประจำตัวนักเรียน แล้วเลือกเอกสารที่ต้องการ</p>
        </div>
        <div class="services">
            <div class="service-list">
                <?php foreach ($services as [$title, $desc]): ?>
                    <div class="card service-item">
                        <span class="service-item__icon"><?= icon('file-text') ?></span>
                        <div>
                            <h3><?= e($title) ?></h3>
                            <p><?= e($desc) ?></p>
                        </div>
                    </div>
                <?php endforeach; ?>
            </div>
            <div class="service-cta">
                <h3>ขอเอกสารใน 3 ขั้นตอน</h3>
                <ol>
                    <li>เข้าสู่ระบบด้วยเลขประจำตัวนักเรียน</li>
                    <li>เลือกเอกสารและจำนวนที่ต้องการ แล้วกดยืนยัน</li>
                    <li>ติดตามสถานะ และมารับเอกสารที่ห้องทะเบียนเมื่อ “พร้อมให้รับ”</li>
                </ol>
                <a class="btn btn--accent btn--lg" href="<?= e($ctaHref) ?>"><?= e($ctaLabel) ?><?= icon('arrow-right') ?></a>
            </div>
        </div>
    </div>
</section>

<section class="section section--alt" id="contact">
    <div class="container">
        <div class="section__head">
            <span class="eyebrow">ติดต่อ</span>
            <h2>ติดต่อสำนักงานทะเบียน</h2>
        </div>
        <div class="contact-grid">
            <div class="card contact-item">
                <span class="contact-item__icon"><?= icon('map-pin') ?></span>
                <span>ที่ตั้ง</span>
                <a href="https://maps.google.com/?q=โรงเรียนสามเสนวิทยาลัย" target="_blank" rel="noopener">132/11 ถนนพระรามที่ 6 แขวงพญาไท เขตพญาไท กรุงเทพฯ 10400</a>
            </div>
            <div class="card contact-item">
                <span class="contact-item__icon"><?= icon('mail') ?></span>
                <span>อีเมล</span>
                <a href="mailto:regis@samsenwit.ac.th">regis@samsenwit.ac.th</a>
            </div>
            <div class="card contact-item">
                <span class="contact-item__icon"><?= icon('phone') ?></span>
                <span>โทรศัพท์</span>
                <p><a href="tel:022791992">0-2279-1992</a>, <a href="tel:022792429">0-2279-2429</a> ต่อ 116</p>
            </div>
        </div>
    </div>
</section>

<?php require __DIR__ . '/includes/footer.php'; ?>
