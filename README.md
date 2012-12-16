scrub-drupal
============

MySQL script for scrubbing a Drupal 7 database

This project springs from the common need to scrub sensetive data out of a Drupal database. This is Drupal 7 specific. The intent of this scrubbing is to be able to hand the database off to another developer without giving away sensetive customer data.

This script is modified from https://github.com/acquia/cloud-hooks/tree/master/samples

Usage
============

To scrub a database with this script, import the database into a safe place (don't ever run this on your production database!) and then run:

mysql -u[username] -p[password] [databasename] < scrub.sql
