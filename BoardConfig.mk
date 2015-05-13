USE_CAMERA_STUB := true
#USE_DEVICE_SPECIFIC_CAMERA := true

# inherit from the proprietary version
-include vendor/alcatel/miata/BoardConfigVendor.mk

LOCAL_PATH := device/alcatel/miata

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true

TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
#TARGET_CPU_VARIANT := krait
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := miata
DEVICE_RESOLUTION := 540x960

# Kernel
#TARGET_NO_KERNEL := true
#TARGET_PREBUILT_KERNEL := device/alcatel/miata/kernel
TARGET_KERNEL_SOURCE := kernel/alcatel/miata
TARGET_KERNEL_CONFIG := miata_defconfig
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 androidboot.bootloader=L4EAV0V0AT00
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --dt device/alcatel/miata/dt.img
#BOARD_KERNEL_SEPARATED_DT := true
#BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216  # 0x1000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 0x1000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 469762048 # 0x1C000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5916048384 # 0x1609FBC00
BOARD_FLASH_BLOCK_SIZE := 131072

# Recovery
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
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
	device/alcatel/miata/sepolicy

#BOARD_SEPOLICY_REPLACE += \
#	file_contexts

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
	property_contexts \
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


