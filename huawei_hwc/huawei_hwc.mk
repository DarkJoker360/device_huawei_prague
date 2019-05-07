DEVICE_PATH := device/huawei/prague

# Huawei HWC
PRODUCT_COPY_FILES += \
    $DEVICE_PATH/huawei_hwc/android.hardware.graphics.composer@2.2-service:system/huawei_hwc/android.hardware.graphics.composer@2.2-service \
    $DEVICE_PATH/huawei_hwc/hwcomposer.kirin970.so:system/huawei_hwc/hwcomposer.kirin970.so \
    $DEVICE_PATH/huawei_hwc/libhidltransport.so:system/huawei_hwc/libhidltransport.so \
    $DEVICE_PATH/huawei_hwc/libhwc2onfbadapter.so:system/huawei_hwc/libhwc2onfbadapter.so \
    $DEVICE_PATH/huawei_hwc/libperfgenius_vendor_client.so:system/huawei_hwc/libperfgenius_vendor_client.so \
    $DEVICE_PATH/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.0.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.0.so \
    $DEVICE_PATH/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.1.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.1.so \
    $DEVICE_PATH/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.2.so:system/huawei_hwc/vendor.huawei.hardware.graphics.displayeffect@1.2.so \
    $DEVICE_PATH/huawei_hwc/vendor.huawei.hardware.perfgenius@2.0.so:system/huawei_hwc/vendor.huawei.hardware.perfgenius@2.0.so
