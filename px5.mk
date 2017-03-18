#
# Copyright 2014 The Android Open-Source Project
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
# This file is the build configuration for an aosp Android
# build for rockchip px5 hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and px5, hence its name.

include device/rockchip/rk3368/BoardConfig.mk
# Inherit from those products. Most specific first.
$(call inherit-product, device/rockchip/rk3368/product.mk)
$(call inherit-product, device/rockchip/common/device.mk)

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_BUILD_MODULE := px5car

# Live Wallpapers
PRODUCT_PACKAGES += \
        rild \
        Launcher3

PRODUCT_NAME := px5
PRODUCT_DEVICE := px5
PRODUCT_BRAND := Android
PRODUCT_MODEL := px5
PRODUCT_MANUFACTURER := rockchip

#modem with DTS4108C
PRODUCT_MODEM := DTS4108C
PRODUCT_RTK_BT_CHIP_FLOW_CTRL := false

# Get the long list of APNs
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += vendor/rockchip/common/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/px5/gps.default.so:system/lib64/hw/gps.default.so
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/px5/gps.conf:system/etc/gps.conf
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/px5/zsgps.conf:system/etc/zsgps.conf
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/px5/martianFW.bin:system/etc/martianFW.bin
PRODUCT_COPY_FILES +=  $(LOCAL_PATH)/px5/miniBL.bin:system/etc/miniBL.bin
