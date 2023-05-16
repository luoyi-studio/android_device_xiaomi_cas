#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

CAS_PREBUILT := device/xiaomi/Pre-Built-MIUI-13

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk) # 啟用 apex 更新

# Enable Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk) # 导入 6G dalvik 配置

# API
PRODUCT_SHIPPING_API_LEVEL := 29

# Common init scripts
PRODUCT_PACKAGES += \
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

# Pre-built Kernel DTB
PRODUCT_COPY_FILES += \
    $(CAS_PREBUILT)/kernel/dtb.img:dtb.img

