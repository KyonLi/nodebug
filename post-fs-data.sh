MODDIR=${0%/*}

# Create a personalized system.prop
getprop | grep "userdebug" >> "$MODDIR/tmp.prop"
getprop | grep "test-keys" >> "$MODDIR/tmp.prop"

sed -i 's/\[//g'  "$MODDIR/tmp.prop"
sed -i 's/\]//g'  "$MODDIR/tmp.prop"
sed -i 's/: /=/g' "$MODDIR/tmp.prop"

sed -i 's/userdebug/user/g' "$MODDIR/tmp.prop"
sed -i 's/test-keys/release-keys/g' "$MODDIR/tmp.prop"

sort -u "$MODDIR/tmp.prop" > "$MODDIR/system.prop"
rm "$MODDIR/tmp.prop"
