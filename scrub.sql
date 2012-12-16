-- 
-- Scrub important information from a Drupal database.
-- 

-- Remove all email addresses.
UPDATE users SET mail=CONCAT('user', uid, '@localhost'), init=CONCAT('user', uid, '@localhost') WHERE uid != 0;

-- Example: Disable a module by setting its system.status value to 0.
-- UPDATE system SET status = 0 WHERE name = 'securepages';

-- Example: Update or delete variables via the variable table.
-- DELETE FROM variable WHERE name='secret_key';
-- Note that to update variables the value must be a properly serialized php array.
-- UPDATE variable SET value='s:24:"http://test.gateway.com/";' WHERE name='payment_gateway';

-- IMPORTANT: If you change the variable table, clear the variables cache.
-- DELETE FROM cache WHERE cid = 'variables';

-- Scrub url aliases for non-admins since these also reveal names
-- Add the IGNORE keyword, since a user may have multiple aliases, and without
-- this keyword the attempt to store duplicate dst values causes the query to fail.
-- UPDATE IGNORE url_alias SET dst = CONCAT('users/', REPLACE(src,'/', '')) WHERE src IN (SELECT CONCAT('user/', u.uid) FROM users u WHERE u.uid NOT IN (SELECT uid FROM users_roles WHERE rid=3) AND u.uid > 0);

-- don't leave e-mail addresses, etc in comments table.
-- UPDATE comments SET name='Anonymous', mail='', homepage='http://example.com' WHERE uid=0;

-- Scrub webform submissions.
UPDATE webform_submitted_data set data='*scrubbed*';

-- remove sensitive customer data from custom module
-- TRUNCATE custom_customer_lead_data;

-- USER PASSWORDS
-- Drupal 7 requires sites to generate a hashed password specific to their site. A script in the 
-- docroot/scripts directory is provided for doing this. From your docroot run the following:
--      
--    scripts/password-hash.sh password
--
-- this will generate a hash for the password "password". In the following statements replace
-- $REPLACE THIS$ with your generated hash.
UPDATE users SET pass='$S$D3il5v9geW/945BghRCz.5fcMTPgSNqpGgcmTxDjzXea7z.yvDoi' WHERE uid > 0;

-- TRUNCATE accesslog;
-- TRUNCATE access;
TRUNCATE cache;
TRUNCATE cache_filter;
TRUNCATE cache_menu;
TRUNCATE cache_page;
TRUNCATE cache_views;
TRUNCATE cache_views_data;
-- TRUNCATE devel_queries;
-- TRUNCATE devel_times;
TRUNCATE flood;
TRUNCATE history;
TRUNCATE search_dataset;
TRUNCATE search_index;
TRUNCATE search_total;
TRUNCATE sessions;
TRUNCATE watchdog;
