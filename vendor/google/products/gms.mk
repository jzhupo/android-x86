LOCAL_SRC_FILES := $(filter-out %$(COMMON_ANDROID_PACKAGE_SUFFIX),$(subst $(LOCAL_PATH)/,,$(shell find $(LOCAL_PATH)/system -type f)))
PRODUCT_COPY_FILES += $(foreach f,$(LOCAL_SRC_FILES),$(LOCAL_PATH)/$(f):$(f))
PRODUCT_PROPERTY_OVERRIDES += \
	ro.addon.type=gapps \
	ro.addon.platform=kk \
	ro.addon.version=gapps-kk-20140105 \
	ro.addon.minimumversion=4.4.2
