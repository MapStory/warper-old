#!/bin/bash
#
# Run this via cron to clean up expired maps. Do this every 10 minutes or so.
#
cd /var/www/warper/
RAILS_ENV=production rake remove:expired > /var/www/warper/expired.log 2>&1
