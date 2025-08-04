#!/bin/sh

set -e

export PATH=$HOME/go/bin:$PATH

echo "run db migration"
/app/goose -dir ./migration postgres "$DB_SOURCE" up

echo "start the app"
exec "$@"