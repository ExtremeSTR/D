#!/bin/bash
sudo chmod a+x /etc/init.d/deluge-daemon
sudo chmod 444 /var/www/html
sudo update-rc.d deluge-daemon defaults
