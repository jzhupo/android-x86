#
# Copyright (C) 2012-2013 The Android-x86 Open Source Project
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

# This is a generic product that isn't specialized for a specific device.
# It includes the base Android-x86 platform.

# Additional settings used in all AOSP builds
PRODUCT_PROPERTY_OVERRIDES := \
    ro.com.android.dateformat=MM-dd-yyyy \

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.language=zh \
    persist.sys.country=CN \
    persist.sys.timezone=Asia/Shanghai \
    ro.init.auto_time=true \
    ro.init.accelerometer_rotation=false

PRODUCT_PACKAGES += \
    PinyinIME

# Put en_US first in the list, so make it default.
#PRODUCT_LOCALES := en_US

# Get a list of languages.
$(call inherit-product,$(SRC_TARGET_DIR)/product/locales_full.mk)

# Get everything else from the parent package
$(call inherit-product,$(SRC_TARGET_DIR)/product/generic.mk)

# Get some sounds
$(call inherit-product-if-exists,frameworks/base/data/sounds/AudioPackage6.mk)

$(call inherit-product,$(LOCAL_PATH)/device.mk)
$(call inherit-product,$(LOCAL_PATH)/packages.mk)

# Overrides
PRODUCT_NAME := android_x86
PRODUCT_BRAND := Android-x86
PRODUCT_DEVICE := x86
PRODUCT_MODEL := Generic Android-x86

#GENERIC_X86_CONFIG_MK := $(GENERIC_X86_DIR)/BoardConfig.mk
#GENERIC_X86_ANDROID_MK := $(GENERIC_X86_DIR)/AndroidBoard.mk
