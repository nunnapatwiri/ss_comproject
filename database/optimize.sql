-- Run once after importing shopping_cart.sql:
--   C:\xampp\mysql\bin\mysql.exe -u root shopping_cart < database\optimize.sql
-- Safe to run on an existing database: it only adds indexes and fixes one column default.

-- 1) `time` = when the request was submitted.
--    It was declared ON UPDATE CURRENT_TIMESTAMP, so every status change overwrote the submit date.
ALTER TABLE tbl_orders
    MODIFY `time` timestamp NOT NULL DEFAULT current_timestamp();

-- 2) Indexes for the queries the site runs on every page load.
--    Teacher dashboard: WHERE status = ? [AND code = ?] ORDER BY time, and the per-tab counts (GROUP BY status, code)
ALTER TABLE tbl_orders ADD INDEX idx_status_code_time (status, code, time);
--    Teacher dashboard without a document-type filter: WHERE status = ? ORDER BY time
ALTER TABLE tbl_orders ADD INDEX idx_status_time (status, time);
--    Student history: WHERE username = ? ORDER BY time DESC
ALTER TABLE tbl_orders ADD INDEX idx_username_time (username, time);
--    Product lookup by code
ALTER TABLE tbl_products ADD UNIQUE INDEX idx_code (code);
