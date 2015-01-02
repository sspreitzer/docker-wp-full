#!/bin/bash

set -e

sha1()
{
	head -c1M /dev/urandom | sha1sum | cut -d' ' -f1
}

stopall()
{
	echo "Stopping container.."
	/etc/init.d/apache2 stop
	/etc/init.d/mysql stop
	pkill tail
	exit
}

chown -R www-data:www-data /srv/wordpress

CONF=/srv/wordpress/wp-config.php
grep '__AUTH_KEY__' $CONF > /dev/null
if [ $? -eq 0 ]; then
	keys=(
        	AUTH_KEY
        	SECURE_AUTH_KEY
        	LOGGED_IN_KEY
        	NONCE_KEY
        	AUTH_SALT
        	SECURE_AUTH_SALT
        	LOGGED_IN_SALT
        	NONCE_SALT
	)
	for key in "${keys[@]}"; do
		sed -ir "s/__${key}__/$(sha1)/" $CONF
	done
fi

if [ "$@" != "wordpress" ]; then
	exec "$@"
fi

echo "Starting container.."
/etc/init.d/mysql start
/etc/init.d/apache2 start
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8"

trap stopall SIGINT SIGTERM

tail -f /var/log/apache2/*.log &
wait
