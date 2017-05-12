#!/bin/bash
chmod a+x /etc/init.d/deluge-daemon
chmod 444 /var/www/html
update-rc.d deluge-daemon defaults
