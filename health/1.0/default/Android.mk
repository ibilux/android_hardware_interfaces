LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.health@1.0-impl
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_C_INCLUDES := system/core/healthd/include system/core/base/include
LOCAL_SRC_FILES := \
    Health.cpp \

ifeq ($(BOARD_USES_MTK_HARDWARE),true)
 LOCAL_CFLAGS += -DMTK_HARDWARE
endif

LOCAL_HEADER_LIBRARIES := libhealthd_headers

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils \
    android.hardware.health@1.0 \
    libminui

LOCAL_STATIC_LIBRARIES := libminui android.hardware.health@1.0-convert

LOCAL_HAL_STATIC_LIBRARIES := libhealthd

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PROPRIETARY_MODULE := true
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE := android.hardware.health@1.0-service
LOCAL_INIT_RC := android.hardware.health@1.0-service.rc
LOCAL_SRC_FILES := \
    HealthService.cpp \

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libcutils \
    libdl \
    libbase \
    libutils \
    libhidlbase \
    libhidltransport \
    android.hardware.health@1.0 \

include $(BUILD_EXECUTABLE)

include $(call first-makefiles-under,$(LOCAL_PATH))
