LOCAL_PATH:= $(call my-dir)

SOURCES := \
	phyreg.c
	

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := $(SOURCES)
LOCAL_DISABLE_FORMAT_STRING_CHECKS := true
LOCAL_CFLAGS += -pie -fPIE  -DDEBUG_STD -DNS_ENABLE_DEBUG
LOCAL_LDFLAGS += -pie -fPIE
LOCAL_MODULE := phyreg
include $(BUILD_EXECUTABLE)
