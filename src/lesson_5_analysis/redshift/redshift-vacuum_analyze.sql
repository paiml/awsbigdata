-- VACUUM and ANALYZE are important to do after add/delete/modify a significant number of rows
-- VACUUM recovers space from deleted rows and restores the sort order
-- ANALYZE updates the statistics metadata.  This helps the query optimizer to generate more accurate query plans
vacuum;

-- this threshold can be changes; 0 means all rows in all tables are analyzed
set analyze_threshold_percent to 0;
analyze;
