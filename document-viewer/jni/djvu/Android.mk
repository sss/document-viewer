LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../mupdf/mupdf/thirdparty/libjpeg \
	$(LOCAL_PATH)/../mupdf/mupdf/scripts/libjpeg \
	$(LOCAL_PATH)/djvulibre/libdjvu \
	$(LOCAL_PATH) \

LOCAL_MODULE    := djvu
LOCAL_CFLAGS    := -fexceptions -DHAVE_CONFIG_H -DTHREADMODEL=POSIXTHREADS -DDIR_DATADIR=\"/usr/local/share\"

ifeq ($(TARGET_ARCH_ABI),armeabi)
    LOCAL_ARM_MODE := arm
endif # TARGET_ARCH_ABI == armeabi

LOCAL_SRC_FILES := \
	$(wildcard $(LOCAL_PATH)/djvulibre/libdjvu/*.cpp) \

LOCAL_SRC_FILES := \
	$(subst $(LOCAL_PATH)/,, \
		$(LOCAL_SRC_FILES) \
	)

include $(BUILD_STATIC_LIBRARY)
