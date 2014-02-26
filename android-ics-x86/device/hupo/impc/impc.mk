PRODUCT_PACKAGES := $(THIRD_PARTY_APPS)
PRODUCT_PACKAGES += sensors.$(TARGET_PRODUCT)
PRODUCT_PACKAGES += audio.primary.$(TARGET_PRODUCT) audio_policy.$(TARGET_PRODUCT) audio.a2dp.default alsa.$(TARGET_PRODUCT)
PRODUCT_PACKAGES += AndroidTerm FileManager
PRODUCT_PACKAGES += PinyinIME dhcpcd.conf
PRODUCT_PACKAGES += SpeechRecorder NoiseField Stk RSSReader

PRODUCT_COPY_FILES := \
	frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml

ifeq (yes, no)
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/driver/realtek/wlan.ko:system/lib/modules/wlan.ko
endif

PRODUCT_PROPERTY_OVERRIDES := \
	wifi.interface=wlan0 \
	persist.sys.language=zh \
	persist.sys.country=CN \
	persist.sys.timezone=Asia/Shanghai \
	ro.init.auto_time=true \
	ro.init.accelerometer_rotation=false

$(call inherit-product,$(SRC_TARGET_DIR)/product/generic_x86.mk)

PRODUCT_NAME := impc
PRODUCT_DEVICE := impc
PRODUCT_MANUFACTURER := Hu Po
PRODUCT_MODEL := Android-x86 Tablet PC

PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlays

