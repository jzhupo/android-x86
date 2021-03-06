LOCAL_PATH := $(call my-dir)
LOCAL_FIRMWARE := $(filter-out %.mk,$(subst $(LOCAL_PATH)/,,$(shell find $(LOCAL_PATH) -type f)))

define install-local-firmware
include $$(CLEAR_VARS)
LOCAL_MODULE := $(1)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FIRMWARE
LOCAL_MODULE_PATH := $$(TARGET_OUT_SHARED_LIBRARIES)/firmware
LOCAL_SRC_FILES := $(1)
include $$(BUILD_PREBUILT)

ALL_DEFAULT_INSTALLED_MODULES += $$(LOCAL_INSTALLED_MODULE)
endef

$(foreach f,$(LOCAL_FIRMWARE),$(eval $(call install-local-firmware,$(f))))
