METRICS_LOCATION=$1
START=$2
END=$3
SIZE=$4

# Write to a temporary file invisible to prometheus
cat > $(pwd)/postgres_backup.prom.$$ <<EOT
# HELP postgres backup start time, in unixtime.
# TYPE postgres_backup_start gauge
postgres_backup_backup_start ${START}
# HELP postgres_backup_end backup end time, in unixtime.
# TYPE postgres_backup_end gauge
postgres_backup_end ${END}
# HELP postgres_backup_size backup size, in bytes.
# TYPE postgres_backup_size gauge
postgres_backup_size ${SIZE}
EOT

# Atomic move so prometheus can see it
mv $(pwd)/postgres_backup.prom.$$ "/metrics/metrics.txt"
