#!/system/bin/sh

hwcpath=$(find /system/vendor/lib64/hw/ -name "*hwcomposer*")

mount -o bind /system/huawei_hwc/hwcomposer.kirin970.so $hwcpath
setprop ctl.stop hwcomposer-2-1
LD_LIBRARY_PATH=/system/huawei_hwc/ /system/huawei_hwc/android.hardware.graphics.composer@2.2-service
