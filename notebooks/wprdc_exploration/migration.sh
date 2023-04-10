#!/usr/bin/env bashd

# Dumps data from the current database to the new one.
# Batching them by the first and second digits of their IDs.

bad_groups=(2 7 9 b e f)
hex_digits=(0 1 2 3 4 5 6 7 8 9 a b c d e f)

for i in "${bad_groups[@]}" # use hex_digits or update the bad_groups
do
  for j in "${hex_digits[@]}"
  do
    pg_dump "postgresql://ckan:$OLD_DB_PASSWORD@$OLD_DB:5432/datastore_prod" -t "$i$j*" --clean --if-exists  \
     | psql "postgresql://postgres:$NEW_DB_PASSWORD@$NEW_DB/datastore_prod"
  done
done
