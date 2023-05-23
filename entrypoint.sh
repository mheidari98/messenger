#!/bin/bash

set -e

until nc -z -v -w30 $DB_HOST $DB_PORT
do
  echo "Waiting for database connection..."
  sleep 5
done
echo "Database is available, starting your application now..."

exec "$@"
