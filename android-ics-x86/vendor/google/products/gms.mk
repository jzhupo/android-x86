#LOCAL_PATH := vendor/google/products
LOCAL_SRC_FILES := $(filter-out %.apk,$(subst $(LOCAL_PATH)/,,$(shell find $(LOCAL_PATH)/system -type f)))
PRODUCT_COPY_FILES += $(foreach f,$(LOCAL_SRC_FILES),$(LOCAL_PATH)/$(f):$(f))

