LOCAL_PATH := $(call my-dir)

TARGET_KERNEL_CONFIG := $(LOCAL_PATH)/impc_defconfig
TARGET_INITRD_SCRIPTS := $(LOCAL_PATH)/impc_info

include $(GENERIC_X86_ANDROID_MK)
