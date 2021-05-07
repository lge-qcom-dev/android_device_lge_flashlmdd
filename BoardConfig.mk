#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lge/flashlmdd

# inherit from common tree
-include device/lge/sm8150-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 560

# HIDL
ODM_MANIFEST_FILES += $(DEVICE_PATH)/manifest_odm.xml

# Kernel
TARGET_KERNEL_CONFIG := vendor/flash_lao_com-perf_defconfig

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 90

# Security Patch Level
VENDOR_SECURITY_PATCH := 2022-08-01

# SEPolicy
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# inherit from the proprietary version
include vendor/lge/flashlmdd/BoardConfigVendor.mk
