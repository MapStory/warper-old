#!/bin/bash
#
# Run this via cron to clean up expired maps. Do this every 10 minutes or so.
#
RAILS_ENV=production rake remove:expired > expired.log 2>&1
