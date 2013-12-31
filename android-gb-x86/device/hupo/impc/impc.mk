PRODUCT_PACKAGES := $(THIRD_PARTY_APPS)
PRODUCT_PACKAGES += sensors.$(TARGET_PRODUCT) lights.$(TARGET_PRODUCT)

PRODUCT_COPY_FILES += $(LOCAL_PATH)/modprobe.conf:system/etc/modprobe.conf
PRODUCT_COPY_FILES += $(LOCAL_PATH)/wlan.ko:system/lib/modules/wlan.ko

$(call inherit-product,$(SRC_TARGET_DIR)/product/generic_x86.mk)

PRODUCT_NAME := impc
PRODUCT_DEVICE := impc
PRODUCT_MANUFACTURER := Hu Po

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlays
