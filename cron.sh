#!/bin/bash
#
# Run this via cron to clean up exipired maps. Do this every 10 minutes or so.
#
RAILS_ENV=production rake clean:expired > /dev/null 2>&1
