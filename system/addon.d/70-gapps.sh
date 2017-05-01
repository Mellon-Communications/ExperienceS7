#!/sbin/sh
# 
# /system/addon.d/70-gapps.sh
#
. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
etc/permissions/com.google.android.camera2.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/preferred-apps/google.xml
framework/com.google.android.camera2.jar
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
priv-app/GoogleBackupTransport/GoogleBackupTransport.apk
priv-app/GoogleFeedback/GoogleFeedback.apk
priv-app/GoogleLoginService/GoogleLoginService.apk
priv-app/GoogleOneTimeInitializer/GoogleOneTimeInitializer.apk
priv-app/GooglePartnerSetup/GooglePartnerSetup.apk
priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
priv-app/Phonesky/Phonesky.apk
priv-app/PrebuiltGmsCore/lib/arm/libAppDataSearch.so
priv-app/PrebuiltGmsCore/lib/arm/libconscrypt_gmscore_jni.so
priv-app/PrebuiltGmsCore/lib/arm/libgames_rtmp_jni.so
priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_base.so
priv-app/PrebuiltGmsCore/lib/arm/libgcastv2_support.so
priv-app/PrebuiltGmsCore/lib/arm/libgmscore.so
priv-app/PrebuiltGmsCore/lib/arm/libgms-ocrclient.so
priv-app/PrebuiltGmsCore/lib/arm/libjgcastservice.so
priv-app/PrebuiltGmsCore/lib/arm/libNearbyApp.so
priv-app/PrebuiltGmsCore/lib/arm/libsslwrapper_jni.so
priv-app/PrebuiltGmsCore/lib/arm/libWhisper.so
priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
priv-app/SetupWizard.apk
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
   rm -rf /system/app/BrowserProviderProxy
   rm -f /system/app/BrowserProviderProxy.apk
   rm -rf /system/app/PartnerBookmarksProvider
   rm -f /system/app/PartnerBookmarksProvider.apk
   rm -rf /system/app/Provision
   rm -f /system/app/Provision.apk
   rm -rf /system/app/QuickSearchBox
   rm -f /system/app/QuickSearchBox.apk
   rm -rf /system/app/Vending
   rm -f /system/app/Vending.apk
   rm -rf /system/priv-app/BrowserProviderProxy
   rm -f /system/priv-app/BrowserProviderProxy.apk
   rm -rf /system/priv-app/PartnerBookmarksProvider
   rm -f /system/priv-app/PartnerBookmarksProvider.apk
   rm -rf /system/priv-app/Provision
   rm -f /system/priv-app/Provision.apk
   rm -rf /system/priv-app/QuickSearchBox
   rm -f /system/priv-app/QuickSearchBox.apk
   rm -rf /system/priv-app/Vending
   rm -f /system/priv-app/Vending.apk
  ;;
esac
