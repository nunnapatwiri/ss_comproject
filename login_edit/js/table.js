/*
 * DataGrid — small replacement for jQuery + DataTables (~4 KB instead of ~160 KB).
 * Search, column sorting, page-size select and pagination on an existing <table>.
 *
 *   var grid = new DataGrid(tableEl, { pageLength: 15, lengths: [10, 15, 25], order: [1, 'asc'], skip: [6] });
 *   grid.remove(tr);  grid.restore(tr);
 *
 * Sorting uses each cell's data-order attribute when present, otherwise its text.
 * Columns listed in `skip` are neither sortable nor searchable.
 */
(function () {
    'use strict';

    var collator = new Intl.Collator('th', { numeric: true, sensitivity: 'base' });

    function el(tag, cls, html) {
        var n = document.createElement(tag);
        if (cls) n.className = cls;
        if (html !== undefined) n.innerHTML = html;
        return n;
    }

    function DataGrid(table, opts) {
        opts = opts || {};
        var self = this;
        var skip = opts.skip || [];
        var tbody = table.tBodies[0];
        var heads = Array.prototype.slice.call(table.tHead.rows[0].cells);
        var colCount = heads.length;

        // Cache everything the grid needs once, so filtering/sorting never touches the DOM.
        var items = Array.prototype.map.call(tbody.rows, function (tr) {
            var keys = [], text = [];
            Array.prototype.forEach.call(tr.cells, function (td, i) {
                var t = td.textContent.replace(/\s+/g, ' ').trim();
                keys.push(td.hasAttribute('data-order') ? td.getAttribute('data-order') : t);
                if (skip.indexOf(i) === -1) text.push(t);
            });
            return { tr: tr, keys: keys, text: text.join(' ').toLowerCase(), removed: false };
        });

        var state = {
            q: '',
            col: opts.order ? opts.order[0] : -1,
            dir: opts.order && opts.order[1] === 'desc' ? -1 : 1,
            page: 0,
            size: opts.pageLength || 15
        };

        // ----- controls -----
        var host = table.closest('.table-scroll') || table;
        var top = el('div', 'grid-bar');
        var sizeLabel = el('label', 'grid-size', 'แสดง ');
        var sizeSel = el('select');
        (opts.lengths || [10, 15, 25, 50, 100]).forEach(function (n) {
            var o = el('option', '', String(n));
            o.value = n;
            if (n === state.size) o.selected = true;
            sizeSel.appendChild(o);
        });
        sizeLabel.appendChild(sizeSel);
        sizeLabel.appendChild(document.createTextNode(' รายการ'));
        var search = el('input', 'grid-search');
        search.type = 'search';
        search.placeholder = opts.placeholder || 'ค้นหา…';
        search.setAttribute('aria-label', 'ค้นหาในตาราง');
        top.appendChild(sizeLabel);
        top.appendChild(search);
        host.parentNode.insertBefore(top, host);

        var bottom = el('div', 'grid-bar grid-bar--bottom');
        var info = el('div', 'grid-info');
        info.setAttribute('aria-live', 'polite');
        var pager = el('nav', 'grid-pager');
        pager.setAttribute('aria-label', 'เลือกหน้า');
        bottom.appendChild(info);
        bottom.appendChild(pager);
        host.parentNode.insertBefore(bottom, host.nextSibling);

        var emptyRow = el('tr', 'grid-empty');
        var emptyCell = el('td', '', 'ไม่พบรายการที่ค้นหา');
        emptyCell.colSpan = colCount;
        emptyRow.appendChild(emptyCell);

        // ----- sorting -----
        function sortItems() {
            if (state.col < 0) return;
            var c = state.col, d = state.dir;
            items.sort(function (a, b) { return d * collator.compare(a.keys[c], b.keys[c]); });
        }
        function updateHeads() {
            heads.forEach(function (th, i) {
                if (skip.indexOf(i) !== -1) return;
                th.setAttribute('aria-sort', i === state.col ? (state.dir === 1 ? 'ascending' : 'descending') : 'none');
            });
        }
        heads.forEach(function (th, i) {
            if (skip.indexOf(i) !== -1) return;
            th.classList.add('is-sortable');
            th.tabIndex = 0;
            function toggle() {
                state.dir = state.col === i ? -state.dir : 1;
                state.col = i;
                state.page = 0;
                sortItems();
                updateHeads();
                render();
            }
            th.addEventListener('click', toggle);
            th.addEventListener('keydown', function (e) {
                if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); toggle(); }
            });
        });

        // ----- rendering -----
        function pageButton(label, page, opts2) {
            var b = el('button', 'grid-page' + (opts2 && opts2.current ? ' is-current' : ''), label);
            b.type = 'button';
            if (opts2 && opts2.disabled) b.disabled = true;
            if (opts2 && opts2.current) b.setAttribute('aria-current', 'page');
            if (opts2 && opts2.aria) b.setAttribute('aria-label', opts2.aria);
            b.addEventListener('click', function () { state.page = page; render(); });
            return b;
        }

        function render() {
            var q = state.q;
            var live = items.filter(function (it) { return !it.removed; });
            var list = q ? live.filter(function (it) { return it.text.indexOf(q) !== -1; }) : live;
            var pages = Math.max(1, Math.ceil(list.length / state.size));
            if (state.page >= pages) state.page = pages - 1;
            var start = state.page * state.size;
            var slice = list.slice(start, start + state.size);

            var frag = document.createDocumentFragment();
            slice.forEach(function (it) { frag.appendChild(it.tr); });
            if (!slice.length) frag.appendChild(emptyRow);
            tbody.textContent = '';
            tbody.appendChild(frag);

            info.textContent = list.length
                ? 'แสดง ' + (start + 1) + '–' + (start + slice.length) + ' จาก ' + list.length + ' รายการ'
                  + (q ? ' (ค้นจากทั้งหมด ' + live.length + ')' : '')
                : (q ? 'ไม่พบรายการ (ค้นจากทั้งหมด ' + live.length + ')' : 'ไม่มีรายการ');

            pager.textContent = '';
            if (pages > 1) {
                pager.appendChild(pageButton('ก่อนหน้า', state.page - 1, { disabled: state.page === 0 }));
                var from = Math.max(0, Math.min(state.page - 2, pages - 5)), to = Math.min(pages, from + 5);
                for (var p = from; p < to; p++) {
                    pager.appendChild(pageButton(String(p + 1), p, { current: p === state.page, aria: 'หน้า ' + (p + 1) }));
                }
                pager.appendChild(pageButton('ถัดไป', state.page + 1, { disabled: state.page >= pages - 1 }));
            }
        }

        var timer;
        search.addEventListener('input', function () {
            clearTimeout(timer);
            timer = setTimeout(function () {
                state.q = search.value.replace(/\s+/g, ' ').trim().toLowerCase();
                state.page = 0;
                render();
            }, 120);
        });
        sizeSel.addEventListener('change', function () {
            state.size = parseInt(sizeSel.value, 10);
            state.page = 0;
            render();
        });

        function find(tr) {
            for (var i = 0; i < items.length; i++) if (items[i].tr === tr) return items[i];
            return null;
        }
        self.remove = function (tr) { var it = find(tr); if (it) { it.removed = true; render(); } };
        self.restore = function (tr) { var it = find(tr); if (it) { it.removed = false; render(); } };

        sortItems();
        updateHeads();
        render();
    }

    window.DataGrid = DataGrid;
})();
