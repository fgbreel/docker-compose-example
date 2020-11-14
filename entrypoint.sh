#!/bin/bash


while ! nc -z mysql 3306; do
	echo "waiting for mysql database..."
	sleep 1
done

echo "mysql database is up!"

mkdir /tmp/foo

app=/tmp/foo/index.html
echo "<body>" > $app
echo "<h1>Hostname: $HOSTNAME</h1>" >> $app
echo "<pre>" >> $app
echo "$(mysql --user root --host mysql --execute "STATUS")" >> $app
echo "</pre>" >> $app
echo "</body>" >> $app

exec python3 -m http.server --directory /tmp/foo 8000
