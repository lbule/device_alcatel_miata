#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# inherit from the proprietary version
-include vendor/alcatel/miata/BoardConfigVendor.mk

LOCAL_PATH := device/alcatel/miata

# Assert
#TARGET_OTA_ASSERT_DEVICE := TCL6036Y

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a7
#TARGET_CPU_VARIANT := krait
ARCH_ARM_HAVE_TLS_REGISTER := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8226


# Kernel
#TARGET_NO_KERNEL := true
#TARGET_PREBUILT_KERNEL := device/alcatel/miata/kernel
TARGET_KERNEL_SOURCE := kernel/alcatel/miata
TARGET_KERNEL_CONFIG := miata_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.bootloader=L4EAV0V0AT00
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --dt device/alcatel/miata/dt.img
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk

# Shader cache config options
# Maximum size of the GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024


# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216  # 0x1000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 0x1000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 469762048 # 0x1C000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5916048384 # 0x1609FBC00
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_HAS_LARGE_FILESYSTEM := true

# Recovery
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/alcatel/miata/recovery.fstab
BOARD_HAS_NO_SELECT_BUTTON := true
RECOVERY_NAME := CWM for Alcatel 6036Y by Jk
#RECOVERY_EXTEND_NANDROID_MENU := true
#BOARD_TOUCH_RECOVERY := true

# Vold
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_VOLD_MAX_PARTITIONS := 40
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# SELinux
BOARD_SEPOLICY_DIRS += \
	$(LOCAL_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
	adbd.te \
	app.te \
	bluetooth_loader.te \
	bridge.te \
	camera.te \
	device.te \
	dhcp.te \
	dnsmasq.te \
	domain.te \
	drmserver.te \
	file.te \
	file_contexts \
	hostapd.te \
	init_shell.te \
	init.te \
	libqc-opt.te \
	mediaserver.te \
	mpdecision.te \
	netd.te \
	netmgrd.te \
	nfc.te \
	property.te \
	qcom.te \
	qmux.te \
	radio.te \
	rild.te \
	rmt.te \
	sdcard_internal.te \
	sdcardd.te \
	seapp_contexts \
	sensors.te \
	shell.te \
	surfaceflinger.te \
	system.te \
	tee.te \
	te_macros \
	thermald.te \
	ueventd.te \
	vold.te \
	wpa_supplicant.te \
	su.te


#TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_QCOM_AUDIO_VARIANT := caf
#AUDIO_FEATURE_DISABLED_ANC_HEADSET := true
#AUDIO_FEATURE_DISABLED_DS1_DOLBY_DDP := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
#BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/HighScreen/D10A_HighScreen/bluetooth

# Camera
USE_CAMERA_STUB := true
#USE_DEVICE_SPECIFIC_CAMERA := true
#COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# CMHW
#BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/

# Enable suspend during charger mode
BOARD_CHARGER_ENABLE_SUSPEND := true

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# FM
BOARD_HAVE_QCOM_FM := true

# GPS
BOARD_USES_QCOM_GPS := true
#BOARD_HAVE_NEW_QC_GPS := true
TARGET_NO_RPC := true

# Media
#TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
TARGET_QCOM_MEDIA_VARIANT := caf

# Power
TARGET_POWERHAL_VARIANT := qcom

# Wi-Fi Radio
#BOARD_HAS_QCOM_WLAN := true
#BOARD_HAS_QCOM_WLAN_SDK := true
#BOARD_HOSTAPD_DRIVER := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
#BOARD_WLAN_DEVICE := qcwcn
#BOARD_WPA_SUPPLICANT_DRIVER := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
#WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
#WIFI_DRIVER_MODULE_NAME := "wlan"
#WPA_SUPPLICANT_VERSION := VER_0_8_X

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/egl.cfg
TARGET_QCOM_DISPLAY_VARIANT := caf
#TARGET_USES_C2D_COMPOSITION := true
#TARGET_USES_ION := true
#USE_OPENGL_RENDERER := true
#TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_INSECURE_MM_HEAP := true
DEVICE_RESOLUTION := 540x960

#ADDITIONAL_DEFAULT_PROPERTIES += \
#	ro.secure=0 \
#	ro.debuggable=1 \
#	ro.adb.secure=0
