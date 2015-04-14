LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_atomic
LOCAL_SRC_FILES := stage/lib/$(TARGET_ARCH_ABI)/libboost_atomic-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_chrono
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_chrono-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_date_time
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_date_time-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_filesystem
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_filesystem-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_random
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_random-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_regex
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_regex-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_system
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_system-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libboost_thread_pthread
LOCAL_SRC_FILES :=  stage/lib/$(TARGET_ARCH_ABI)/libboost_thread_pthread-gcc-mt-1_57.a
include $(PREBUILT_STATIC_LIBRARY)

