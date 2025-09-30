#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common tree
$(call inherit-product, device/lge/sm8150-common/sm8150.mk)

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := 560dpi
PRODUCT_AAPT_PREBUILT_DPI := xxxhdpi xxhdpi xhdpi hdpi

# Bootanimation
TARGET_SCREEN_WIDTH := 1440
TARGET_SCREEN_HEIGHT := 3120

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_effects_tune.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects_tune.xml \
    $(LOCAL_PATH)/audio/audio_io_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_io_policy.conf \
    $(LOCAL_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    $(LOCAL_PATH)/audio/mixer_paths_tavil.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_tavil.xml

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/keylayout/goodix_fp_key.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/goodix_fp_key.idc \
    $(LOCAL_PATH)/keylayout/touch_dev_2nd.idc:$(TARGET_COPY_OUT_VENDOR)/usr/idc/touch_dev_2nd.idc \
    $(LOCAL_PATH)/keylayout/Vendor_1004_Product_637a.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Vendor_1004_Product_637a.kl \
    $(LOCAL_PATH)/keylayout/goodix_fp_key.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/goodix_fp_key.kl

# LiveDisplay
$(call soong_config_set,livedisplay_lge,enable_se,true)

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml

# NFC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/nfc/libnfc-nxp-hk.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-hk.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-KR.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-KR.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-lg.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-lg.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-SG.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-SG.conf \
    $(LOCAL_PATH)/nfc/libnfc-nxp-US.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp-US.conf

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Get non-open-source specific aspects
$(call inherit-product, vendor/lge/flashlmdd/flashlmdd-vendor.mk)
