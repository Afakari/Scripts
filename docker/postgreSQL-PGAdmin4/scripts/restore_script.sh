#!/bin/bash

# Automating the restoring process
# This script is suppose to be ran after the pgdb is up
# the information below is mounted in docker-compose file
# the problem with this script is the names are hardcoded
# and it's not worth to make it dynamic

BACKUP_DIR="/docker-entrypoint-initdb.d"
SCHEMA_BACKUP="${BACKUP_DIR}/test_schema_mosahebe.backup"
DATA_BACKUP="${BACKUP_DIR}/test_data_mosahebe.backup"


# This script assumes the env variables set in docker compose file
# using users and DB dynamically
# Also considering that, I used no-owner to remove the access complexities

until pg_isready -U "$POSTGRES_USER" -d "$POSTGRES_DB"; do
  echo "Waiting for PostgreSQL to start..."
  sleep 2
done

# Restore the schema backup file
if [ -f "$SCHEMA_BACKUP" ]; then   # Double check
  echo "Restoring schema from $SCHEMA_BACKUP..."
  pg_restore --no-owner -U "$POSTGRES_USER" -d "$POSTGRES_DB" "$SCHEMA_BACKUP"
fi

# Restore the data backup file
if [ -f "$DATA_BACKUP" ]; then
  echo "Restoring data from $DATA_BACKUP..."
  pg_restore --no-owner -U "$POSTGRES_USER" -d "$POSTGRES_DB" "$DATA_BACKUP"
fi

echo "Done!"

