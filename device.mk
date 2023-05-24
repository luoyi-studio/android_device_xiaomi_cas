#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk) # 啟用 apex 更新

# Enable Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk) # 导入 6G dalvik 配置

# Get non-open-source specific aspects
$(call inherit-product, vendor/xiaomi/cas/cas-vendor.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom \
    $(LOCAL_PATH)/rootdir/init/init.recovery.qcom.rc:recovery/root/init.recovery.qcom.rc
# Common init scripts
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.recovery.qcom.rc

# Fastboot
PRODUCT_PACKAGES += \
    fastbootd

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := false

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
   $(LOCAL_PATH) # 指定 soong 命名空间

# Enforce native interfaces of product partition as VNDK
PRODUCT_PRODUCT_VNDK_VERSION := current

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 28 29 30

# Platform
PRODUCT_BOARD_PLATFORM := kona

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Display Composer
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.composer-service

# Display Allocator
PRODUCT_PACKAGES += \
    vendor.qti.hardware.display.allocator-service

# Graphics Mapper
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@3.0-impl-qti-display \
    android.hardware.graphics.mapper@4.0-impl-qti-display \

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti
