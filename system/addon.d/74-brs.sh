#!/sbin/sh
#
# /system/addon.d/74-brs.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF

EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/$FILE
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/$FILE $R
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)

   rm -rf /system/app/Calendar
   rm -rf /system/app/CMFileManager
   rm -rf /system/app/Email
   rm -rf /system/app/Gello
   rm -rf /system/app/messaging
   rm -rf /system/priv-app/Dialer
   rm -rf /system/priv-app/Gallery2
   rm -rf /system/priv-app/Contacts
  ;;
esac
