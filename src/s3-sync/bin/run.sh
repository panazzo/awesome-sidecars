syslog-ng
/root/goofys -f --region $REGION --stat-cache-ttl 1m0s --type-cache-ttl 1m0s --dir-mode 0500 --file-mode 0500 $BUCKET $MOUNT_DIR
