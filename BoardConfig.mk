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

include build/make/target/board/generic_arm64_a/BoardConfig.mk

DEVICE_PATH := device/huawei/prague

# Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a15

# Assert
TARGET_OTA_ASSERT_DEVICE := hi6250,prague

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true

# Bootloader
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_CAMERA_NEEDS_ADD_STATES_IN_ENUMERATE := true

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2080000U

# File System
TARGET_EXFAT_DRIVER := exfat
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

# Graphics
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_HWC2 := true

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
TARGET_NO_KERNEL := false
TARGET_PREBUILT_KERNEL := /dev/null

# LineageOS Hardware
BOARD_HARDWARE_CLASS += \
    $(DEVICE_PATH)/lineagehw

# Partitions
BOARD_AVB_ENABLE := false
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 16777216
BOARD_USES_METADATA_PARTITION := true

TARGET_COPY_OUT_VENDOR := vendor

# Properties
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.hi6250

# Release Tools
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)/releasetools

# Selinux
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
BOARD_PLAT_PUBLIC_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/public

# Shims
TARGET_LD_SHIM_LIBS := \
    /system/lib64/libdisplayenginesvc_1_0.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libdisplayenginesvc_1_1.so|libshims_hwsmartdisplay_jni.so \
    /system/lib64/libhwsmartdisplay_jni.so|libshims_hwsmartdisplay_jni.so \
    /vendor/bin/hw/vendor.huawei.hardware.hisupl@1.0-service|libshims_hisupl.so

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# VNDK
BOARD_VNDK_VERSION := current
PRODUCT_EXTRA_VNDK_VERSIONS := 27

# Vintf
DEVICE_FRAMEWORK_MANIFEST_FILE := $(DEVICE_PATH)/framework_manifest.xml
