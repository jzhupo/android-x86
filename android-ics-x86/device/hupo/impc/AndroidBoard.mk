LOCAL_PATH := $(call my-dir)

TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/impc_defconfig
TARGET_INITRD_SCRIPTS := $(LOCAL_PATH)/impc_info
TARGET_PREBUILT_APPS := $(subst $(LOCAL_PATH)/,,$(wildcard $(LOCAL_PATH)/app/*.apk))

include $(GENERIC_X86_ANDROID_MK)
