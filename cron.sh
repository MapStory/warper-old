#!/bin/bash
#
# Run this via cron to clean up expired maps. Do this every 10 minutes or so.
#
source "$HOME/.rvm/scripts/rvm"
cd /var/www/warper/
RAILS_ENV=production rake remove:expired >> /var/www/warper/log/expired.log 2>&1
