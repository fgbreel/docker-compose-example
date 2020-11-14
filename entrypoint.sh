#!/bin/bash


while ! nc -z mysql 3306; do
	echo "waiting for mysql database..."
	sleep 1
done

echo "mysql database is up!"

mkdir /tmp/foo
echo "<body><h1>Hostname: $HOSTNAME</h1></body>" >/tmp/foo/index.html

exec python3 -m http.server --directory /tmp/foo 8000
