LOCAL_PATH := $(call my-dir)
LOCAL_APPLICATION := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/system/app/*$(COMMON_ANDROID_PACKAGE_SUFFIX)))

define install-local-application
include $(CLEAR_VARS)
LOCAL_MODULE := $$(notdir $$(basename $(1)))
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := $$(suffix $(1))
LOCAL_SRC_FILES := $(1)
LOCAL_MODULE_CLASS := APPS
LOCAL_CERTIFICATE := PRESIGNED
include $$(BUILD_PREBUILT)

ALL_DEFAULT_INSTALLED_MODULES += $$(LOCAL_INSTALLED_MODULE)
endef

$(foreach a,$(LOCAL_APPLICATION),$(eval $(call install-local-application,$(a))))
