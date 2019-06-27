#! /bin/sh

set -e

RETRIES=60

until psql -h postgres -U user -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
    echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
    sleep 3
done

OUT=$(psql -h postgres -U user -v ON_ERROR_STOP=1 -1 -f sample_sql_file.sql)

EXPECTED="SET
SET
SET
SET
SET
 set_config 
------------
 
(1 row)

SET
SET
SET
SET
CREATE EXTENSION
COMMENT
SET
SET
CREATE TABLE
ALTER TABLE
CREATE SEQUENCE
ALTER TABLE
ALTER SEQUENCE
ALTER TABLE
COPY 10
 setval 
--------
      1
(1 row)

ALTER TABLE"

if [ "$OUT" != "$EXPECTED" ]; then
    echo "OUT = '$OUT'"
    echo "Not '$EXPECTED'"
    exit 1
fi

pg_dump -h postgres -U user > sample_output.sql

DIFF=$(diff sample_sql_file.sql sample_output.sql)

if [ "$DIFF" != "" ]; then
    echo "Expected output from diff was ''"
    echo "Actual output was '$DIFF'"
    exit 1
fi

# apt-get update && apt-get install -y wget

# wget "https://sample-videos.com/sql/Sample-SQL-File-10rows.sql"


# echo "Cleaning Up..."
# rm Sample-SQL-File-10rows.sql
echo "This worked ok"

