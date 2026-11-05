/* Teacher dashboard: searchable table + one-click status changes with undo (no jQuery). */
(function () {
    'use strict';
    var table = document.getElementById('orders');
    if (!table) return;

    var viewStatus = parseInt(table.dataset.viewStatus, 10);
    var LABELS = { 0: 'กำลังดำเนินการ', 1: 'เสร็จสิ้น', 2: 'รับเอกสารเรียบร้อย' };

    var grid = new DataGrid(table, {
        pageLength: 15,
        lengths: [10, 15, 25, 50, 100],
        order: [1, 'asc'],
        skip: [6],
        placeholder: 'ค้นหาชื่อ เลขประจำตัว หรือรหัส…'
    });

    function bump(selector, delta) {
        var node = document.querySelector(selector);
        if (node) node.textContent = Math.max(0, parseInt(node.textContent, 10) + delta);
    }

    function save(id, status) {
        return fetch('teacher.php', {
            method: 'POST',
            credentials: 'same-origin',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'id=' + encodeURIComponent(id) + '&status=' + encodeURIComponent(status)
        }).then(function (res) {
            return res.json().catch(function () { return {}; }).then(function (data) {
                if (!res.ok || !data.ok) throw new Error(data.message || 'บันทึกไม่สำเร็จ กรุณาลองใหม่');
                return data;
            });
        });
    }

    function setPressed(group, status) {
        group.querySelectorAll('button').forEach(function (b) {
            b.setAttribute('aria-pressed', String(parseInt(b.dataset.status, 10) === status));
        });
    }

    /** Change one request from `from` to `to`, keeping the row, tabs and chips in sync. */
    function apply(tr, group, id, from, to, offerUndo) {
        group.classList.add('is-busy');
        save(id, to).then(function () {
            setPressed(group, to);
            var code = tr.dataset.code;
            bump('[data-count-status="' + from + '"]', -1);
            bump('[data-count-status="' + to + '"]', +1);

            if (from === viewStatus && to !== viewStatus) {          // leaves this tab
                tr.classList.add('is-removing');
                tr._removeTimer = setTimeout(function () { grid.remove(tr); tr.classList.remove('is-removing'); }, 300);
                bump('[data-count-code="all"]', -1);
                bump('[data-count-code="' + code + '"]', -1);
            } else if (to === viewStatus && from !== viewStatus) {   // comes back (undo)
                clearTimeout(tr._removeTimer);
                tr.classList.remove('is-removing');
                grid.restore(tr);
                bump('[data-count-code="all"]', +1);
                bump('[data-count-code="' + code + '"]', +1);
            }

            if (offerUndo) {
                showToast('คำขอ #' + id + ' → ' + LABELS[to], {
                    action: { label: 'เลิกทำ', onClick: function () { apply(tr, group, id, to, from, false); } }
                });
            } else {
                showToast('ย้อนกลับคำขอ #' + id + ' เป็น “' + LABELS[to] + '” แล้ว');
            }
        }).catch(function (err) {
            showToast(err.message || 'บันทึกไม่สำเร็จ กรุณาลองใหม่', { type: 'error' });
        }).then(function () {
            group.classList.remove('is-busy');
        });
    }

    // One delegated listener for every row (also rows on other pages of the table)
    table.addEventListener('click', function (e) {
        var btn = e.target.closest('.status-select button');
        if (!btn) return;
        var group = btn.closest('.status-select');
        var current = group.querySelector('[aria-pressed="true"]');
        var from = current ? parseInt(current.dataset.status, 10) : viewStatus;
        var to = parseInt(btn.dataset.status, 10);
        if (from === to) return;
        apply(btn.closest('tr'), group, group.dataset.id, from, to, true);
    });
})();
