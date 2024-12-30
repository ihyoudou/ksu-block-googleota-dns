mkdir -p "$MODPATH/system/etc"
mkdir "$MODPATH/worker"

cp -af /system/etc/hosts "$MODPATH/system/etc/hosts"

chcon -r u:object_r:system_file:s0 "$MODPATH/system"
chmod 644 "$MODPATH/system/etc/hosts"

echo "0.0.0.0 ota.googlezip.net" >> $MODPATH/system/etc/hosts

touch "$MODPATH/skip_mount"
