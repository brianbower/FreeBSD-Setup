#!/bin/sh
echo "Change root password..."
passwd
echo "Apply Security Patches..."
freebsd-update fetch
freebsd-update install
echo "Fetch and extract ports..."
portsnap fetch
portsnap extract
echo "Install nano..."
cd /usr/ports/editors/nano
make install clean
echo "Change hostname..."
nano /etc/rc.conf
echo "Install sudo..."
cd /usr/ports/security/sudo
make install clean
echo "Setup user..."
adduser
echo "Add user to sudoers..."
visudo
echo "Disable root login..."
nano /etc/ssh/sshd_config
echo "Install nginx..."
cd /usr/ports/www/nginx
make install clean
echo "Add nginx_enable=YES..."
nano /etc/rc.conf
