#!/bin/sh

set -e

export PATH=$HOME/go/bin:$PATH

echo "run db migration"
goose -dir ./db/migration postgres "$DB_SOURCE" up

echo "start the app"
exec "$@"