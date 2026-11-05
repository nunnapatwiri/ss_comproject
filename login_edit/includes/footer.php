</main>

<footer class="site-footer">
    <div class="container site-footer__inner">
        <div>
            <strong>สำนักงานทะเบียน โรงเรียนสามเสนวิทยาลัย</strong>
            <p>132/11 ถนนพระรามที่ 6 แขวงพญาไท เขตพญาไท กรุงเทพฯ 10400</p>
        </div>
        <div class="site-footer__contact">
            <a href="tel:022791992"><?= icon('phone') ?>0-2279-1992</a>
            <a href="mailto:regis@samsenwit.ac.th"><?= icon('mail') ?>regis@samsenwit.ac.th</a>
        </div>
    </div>
</footer>

<?= icon_sprite() ?>
<script src="<?= asset('js/main.js') ?>"></script>
<?= $EXTRA_SCRIPTS ?? '' ?>
</body>
</html>
