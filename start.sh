#!/bin/sh

set -e

echo "run db migration"
/app/goose -dir ./migration postgres "$DB_SOURCE" up

echo "start the app"
exec "$@"