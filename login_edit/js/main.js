/* Shared UI behaviour: mobile nav, user menu, slideshow, toasts, form helpers. */
(function () {
    'use strict';

    /* ---------- Mobile navigation ---------- */
    var navToggle = document.querySelector('.nav-toggle');
    if (navToggle) {
        navToggle.addEventListener('click', function () {
            var open = document.body.classList.toggle('nav-open');
            navToggle.setAttribute('aria-expanded', String(open));
            navToggle.setAttribute('aria-label', open ? 'ปิดเมนู' : 'เปิดเมนู');
        });
        document.querySelectorAll('.site-nav__links a').forEach(function (link) {
            link.addEventListener('click', function () {
                document.body.classList.remove('nav-open');
                navToggle.setAttribute('aria-expanded', 'false');
            });
        });
    }

    /* ---------- User dropdown (click, not hover — works on touch) ---------- */
    document.querySelectorAll('.user-menu').forEach(function (menu) {
        var btn = menu.querySelector('.user-menu__button');
        btn.addEventListener('click', function (e) {
            e.stopPropagation();
            var open = menu.classList.toggle('is-open');
            btn.setAttribute('aria-expanded', String(open));
        });
        document.addEventListener('click', function (e) {
            if (!menu.contains(e.target)) {
                menu.classList.remove('is-open');
                btn.setAttribute('aria-expanded', 'false');
            }
        });
        document.addEventListener('keydown', function (e) {
            if (e.key === 'Escape') {
                menu.classList.remove('is-open');
                btn.setAttribute('aria-expanded', 'false');
            }
        });
    });

    /* ---------- Slideshow ---------- */
    document.querySelectorAll('[data-slideshow]').forEach(function (show) {
        var slides = show.querySelectorAll('.slideshow__slide');
        var dotsWrap = show.querySelector('.slideshow__dots');
        if (slides.length < 2) return;
        var index = 0, timer = null;
        var dots = [];

        slides.forEach(function (_, i) {
            var dot = document.createElement('button');
            dot.type = 'button';
            dot.className = 'slideshow__dot';
            dot.setAttribute('aria-label', 'รูปที่ ' + (i + 1));
            dot.addEventListener('click', function () { go(i); restart(); });
            dotsWrap.appendChild(dot);
            dots.push(dot);
        });

        // Only the first slide is in the HTML with a real src; the others load just before they are shown.
        function load(i) {
            var img = slides[(i + slides.length) % slides.length].querySelector('img[data-src]');
            if (img) { img.src = img.dataset.src; img.removeAttribute('data-src'); }
        }
        function go(i) {
            slides[index].classList.remove('is-active');
            dots[index].classList.remove('is-active');
            index = (i + slides.length) % slides.length;
            load(index);
            slides[index].classList.add('is-active');
            dots[index].classList.add('is-active');
            load(index + 1); // preload the next one during the 4.5 s display time
        }
        function restart() {
            clearInterval(timer);
            timer = setInterval(function () { go(index + 1); }, 4500);
        }
        slides[0].classList.add('is-active');
        dots[0].classList.add('is-active');
        window.addEventListener('load', function () { load(1); });
        restart();
        show.addEventListener('mouseenter', function () { clearInterval(timer); });
        show.addEventListener('mouseleave', restart);
    });

    /* ---------- Toasts ---------- */
    function dismiss(toast) {
        toast.classList.add('is-leaving');
        setTimeout(function () {
            var stack = toast.parentNode;
            toast.remove();
            if (stack && !stack.children.length) stack.remove();
        }, 220);
    }
    function wireToast(toast, ms) {
        var close = toast.querySelector('.toast__close');
        if (close) close.addEventListener('click', function () { dismiss(toast); });
        if (ms) setTimeout(function () { if (toast.isConnected) dismiss(toast); }, ms);
    }
    document.querySelectorAll('.toast').forEach(function (t) { wireToast(t, 6000); });

    var ICONS = {
        success: '<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"/><path d="m9 11 3 3L22 4"/></svg>',
        error: '<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="10"/><path d="M12 8v4M12 16h.01"/></svg>'
    };

    /**
     * showToast('ข้อความ', {type: 'success'|'error', action: {label, onClick}, duration})
     */
    window.showToast = function (message, opts) {
        opts = opts || {};
        var type = opts.type || 'success';
        var stack = document.querySelector('.toast-stack');
        if (!stack) {
            stack = document.createElement('div');
            stack.className = 'toast-stack';
            stack.setAttribute('aria-live', 'polite');
            document.body.appendChild(stack);
        }
        var toast = document.createElement('div');
        toast.className = 'toast toast--' + type;
        toast.setAttribute('role', 'status');
        toast.innerHTML = (ICONS[type] || ICONS.success) + '<span></span>' +
            '<button type="button" class="toast__close" aria-label="ปิด">' +
            '<svg class="icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><path d="M18 6 6 18M6 6l12 12"/></svg></button>';
        toast.querySelector('span').textContent = message;
        if (opts.action) {
            var a = document.createElement('button');
            a.type = 'button';
            a.className = 'toast__action';
            a.textContent = opts.action.label;
            a.addEventListener('click', function () { dismiss(toast); opts.action.onClick(); });
            toast.insertBefore(a, toast.querySelector('.toast__close'));
        }
        stack.appendChild(toast);
        wireToast(toast, opts.duration === undefined ? 6000 : opts.duration);
        return toast;
    };

    /* ---------- Show / hide password ---------- */
    document.querySelectorAll('.pw-toggle').forEach(function (btn) {
        btn.addEventListener('click', function () {
            var input = document.getElementById(btn.getAttribute('aria-controls'));
            var show = input.type === 'password';
            input.type = show ? 'text' : 'password';
            btn.classList.toggle('is-shown', show);
            btn.setAttribute('aria-label', show ? 'ซ่อนรหัสผ่าน' : 'แสดงรหัสผ่าน');
            input.focus();
        });
    });

    /* ---------- Quantity steppers ---------- */
    document.querySelectorAll('.stepper').forEach(function (stepper) {
        var input = stepper.querySelector('input');
        var min = parseInt(input.min || '1', 10), max = parseInt(input.max || '99', 10);
        function set(v) { input.value = Math.min(max, Math.max(min, isNaN(v) ? min : v)); }
        stepper.querySelector('[data-step="-1"]').addEventListener('click', function () { set(parseInt(input.value, 10) - 1); });
        stepper.querySelector('[data-step="1"]').addEventListener('click', function () { set(parseInt(input.value, 10) + 1); });
        input.addEventListener('change', function () { set(parseInt(input.value, 10)); });
    });

    /* ---------- Prevent double submits ---------- */
    document.querySelectorAll('form[data-loading]').forEach(function (form) {
        form.addEventListener('submit', function () {
            var btn = form.querySelector('[type="submit"]');
            if (btn) {
                btn.classList.add('is-loading');
                if (form.dataset.loading) btn.lastChild.textContent = form.dataset.loading;
            }
        });
    });
})();
