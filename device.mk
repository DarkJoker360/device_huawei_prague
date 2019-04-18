#
# Copyright 2019 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

$(call inherit-product-if-exists, vendor/huawei/prague/prague-vendor.mk)
$(call inherit-product-if-exists, vendor/huawei/hi6250-common/hi6250-common-vendor.mk)

# Android Open Source Project Common Stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_o.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/telephony.mk)

PRODUCT_PACKAGES += \
    Launcher3QuickStep \
    messaging

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi

# APN
ifeq ($(TARGET_PRODUCT),aosp_prague)
ifeq ($(TARGET_PRODUCT),aoscp_prague)
PRODUCT_COPY_FILES += \
    device/generic/goldfish/data/etc/apns-conf.xml:system/etc/apns-conf.xml
endif
endif

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_generic.xml:system/etc/audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/primary_audio_policy_configuration.xml:system/etc/primary_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml

# Codecs
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/media-codec-blacklist:system/etc/media-codec-blacklist

# Device
#$(call inherit-product, device/huawei/hi6250-common/device.mk)

# Display
TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1080

# GPS
PRODUCT_COPY_FILES += \
    device/huawei/prague/rootdir/system/etc/gps.conf:system/etc/gps.conf \
    device/huawei/prague/rootdir/system/etc/gps_debug.conf:system/etc/gps_debug.conf \

# Graphics
PRODUCT_PACKAGES += \
    libion \
    vr_hwc

# Hardware Overlays
ifeq ($(TARGET_PRODUCT),aosp_prague)
PRODUCT_PACKAGES += \
    TrebleApp \
    treble-overlay-huawei \
    treble-overlay-huawei-ANE \
    treble-overlay-huawei-BND \
    treble-overlay-huawei-LLD \
    treble-overlay-huawei-PRA \
    treble-overlay-huawei-RNE \
    treble-overlay-huawei-WAS \
    treble-overlay-NavBar \
    treble-overlay-NightMode \
    treble-overlay-SystemUI-FalseLocks
endif

# HIDL
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/compatibility_matrix.xml:system/compatibility_matrix.xml

PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0

# Input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/fingerprint.kl:system/usr/keylayout/fingerprint.kl

# NFC
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    com.android.nfc_extras \
    nfc_nci.pn54x.default

PRODUCT_COPY_FILES += \
    device/huawei/prague/rootdir/system/etc/libnfc_brcm_pra_L31.conf:system/etc/libnfc-brcm.conf \
    device/huawei/prague/rootdir/system/etc/libnfc-nci.conf:system/etc/libnfc-nci.conf \
    device/huawei/prague/rootdir/system/etc/libnfc_nxp_pra_L31.conf:system/etc/libnfc-nxp.conf \
    device/huawei/prague/rootdir/system/etc/nfcscc_access.xml:system/etc/nfcscc_access.xml \
    device/huawei/prague/rootdir/system/etc/nfcse_access.xml:system/etc/nfcse_access.xml \

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay/common \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:system/etc/permissions/android.hardware.fingerprint.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.build.version.all_codenames=$(PLATFORM_VERSION_ALL_CODENAMES) \
    ro.build.version.codename=$(PLATFORM_VERSION_CODENAME) \
    ro.build.version.huawei=8.0.0 \
    ro.build.version.huawei1=8.1.0 \
    ro.build.version.release=$(PLATFORM_VERSION) \
    ro.build.version.sdk=$(PLATFORM_SDK_VERSION) \
    ro.cust.cdrom=/dev/null

# Radio
ifeq ($(TARGET_AOSP_BASED),)
PRODUCT_PACKAGES += \
    qti-telephony-common

PRODUCT_BOOT_JARS += \
    telephony-ext
endif

# Ramdisk
PRODUCT_PACKAGES += \
    init.bcm43xx.rc \
    init.hisi.rc \
    init.hi6250.rc \
    init.hi6250.ab.rc \
    init.hi6250.environ.rc

# Recovery
PRODUCT_PACKAGES += \
    resize2fs_static

# Release Tools
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/releasetools/releasetools.hi6250.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/releasetools.hi6250.sh

# Remove Packages
PRODUCT_PACKAGES += \
    RemovePackages \
    RemovePackages2

# Selinux
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sepolicy/26.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/26.0.cil \
    $(LOCAL_PATH)/sepolicy/27.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/27.0.cil \
    $(LOCAL_PATH)/sepolicy/28.0.cil:$(TARGET_COPY_OUT_SYSTEM)/etc/selinux/mapping/28.0.cil

# Shims
PRODUCT_PACKAGES += \
    libshims_hisupl \
    libshims_hwsmartdisplay_jni

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.hi6250

# VNDK
PRODUCT_PACKAGES += \
    ld.config.vndk_lite.txt \
    vndk-sp

# VNDK
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vndk-compat/ld.config.26.txt:system/etc/ld.config.26.txt \
    $(LOCAL_PATH)/vndk-compat/llndk.libraries.26.txt:system/etc/llndk.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/vndksp.libraries.26.txt:system/etc/vndksp.libraries.26.txt \
    $(LOCAL_PATH)/vndk-compat/ld.config.27.txt:system/etc/ld.config.27.txt

PRODUCT_COPY_FILES += \
    build/make/target/product/vndk/init.gsi.rc:system/etc/init/init.gsi.rc \
    build/make/target/product/vndk/init.vndk-27.rc:system/etc/init/gsi/init.vndk-27.rc

# Wi-Fi
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0 \
    android.hardware.wifi@1.2

# Speed-up stuff
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.image-dex2oat-filter=verify-none
