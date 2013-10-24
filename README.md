Turns out this project is pretty much unnecessary:

You can use drush sql-sanitize to do the same thing, though this is not entirely obvious: https://github.com/drush-ops/drush/issues/210

Have a look at the Paranoia module, in particular, paranoia.drush.inc, to see how it extends the sql-sanitize command. You can write your own sitename_drush_sql_sync_sanitize() function in a site specific module and have it run whenever sql-sanitize is run.

In case you don't heed this advice, here is the original project description:

scrub-drupal
============

MySQL script for scrubbing a Drupal 7 database

This project springs from the common need to scrub sensetive data out of a Drupal database. This is Drupal 7 specific. The intent of this scrubbing is to be able to hand the database off to another developer without giving away sensetive customer data.

This script is modified from https://github.com/acquia/cloud-hooks/tree/master/samples

Usage
============

To scrub a database with this script, import the database into a safe place (don't ever run this on your production database!) and then run:

mysql -u[username] -p[password] [databasename] < scrub.sql
