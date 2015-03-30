add_lunch_combo cm_X9180-userdebug
add_lunch_combo cm_X9180-eng

add_lunch_combo nameless_X9180-userdebug
add_lunch_combo nameless_X9180-eng

add_lunch_combo mk_X9180-userdebug
add_lunch_combo mk_X9180-eng

add_lunch_combo pac_X9180-userdebug
add_lunch_combo pac_X9180-eng

add_lunch_combo liquid_X9180-userdebug
add_lunch_combo liquid_X9180-eng

sh device/ZTE/X9180/update-overlay.sh

cd frameworks/base
if grep -q "ro.storage_list.override" services/core/java/com/android/server/MountService.java
then
    echo '[storages] Frameworks/base already patched';
else
    git apply ../../device/ZTE/X9180/patches/frameworks-base-1.patch;
    git apply ../../device/ZTE/X9180/patches/frameworks-base-2.patch;
fi
if grep -q "SHOW_SU_INDICATOR" core/java/android/provider/Settings.java
then
    echo '[su icon] Frameworks/base already patched';
else
    git apply ../../device/ZTE/X9180/patches/su-icon-frameworks-base.patch;
fi
croot

cd packages/apps/Settings
if grep -q "show_su_indicator" res/xml/status_bar_settings.xml
then
    echo '[su icon] Settings already patched';
else
    git apply ../../device/ZTE/X9180/patches/su-icon-settings.patch;
fi
croot
