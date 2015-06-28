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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Dalvik
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Include path
LOCAL_PATH := device/alcatel/miata

# The gps config appropriate for this device
#$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Proprietary files
$(call inherit-product-if-exists, vendor/alcatel/miata/miata-vendor.mk)

# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi


# Language
PRODUCT_LOCALES := ru_RU en_US

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := full_miata
PRODUCT_DEVICE := miata
PRODUCT_CHARACTERISTICS := phone


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom 


# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images


# GPS
PRODUCT_PACKAGES += \
    gps.msm8226 \
    libgps.utils \
    libloc_adapter \
    libloc_eng


# Wifi
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
	$(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
	$(LOCAL_PATH)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
	$(LOCAL_PATH)/ramdisk/init.class_main.sh:root/init.class_main.sh \
	$(LOCAL_PATH)/ramdisk/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
	$(LOCAL_PATH)/ramdisk/init.qcom.factory.sh:root/init.qcom.factory.sh \
	$(LOCAL_PATH)/ramdisk/init.qcom.ssr.sh:root/init.qcom.ssr.sh \
	$(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
	$(LOCAL_PATH)/ramdisk/init.target.usb.rc:root/init.target.usb.rc \
	$(LOCAL_PATH)/ramdisk/init.target.usb.sh:root/init.target.usb.sh \
	$(LOCAL_PATH)/ramdisk/ueventd.qcom.rc:root/ueventd.qcom.rc \
#	$(LOCAL_PATH)/ramdisk/init.qcom.ril.sh:root/init.qcom.ril.sh \

# Display
PRODUCT_PACKAGES += \
    copybit.msm8226 \
    gralloc.msm8226 \
    hwcomposer.msm8226 \
    memtrack.msm8226 \
    liboverlay

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8226

# Lights
PRODUCT_PACKAGES += \
    lights.msm8226
    
# Power
PRODUCT_PACKAGES += \
    power.msm8226

# Qualcomm
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true \
    qcom.hw.aac.encoder=true \
    ro.qualcomm.cabl=0 \
    ro.vendor.extension_library=/vendor/lib/libqc-opt.so



# QRNG
PRODUCT_PACKAGES += \
    qrngd \
    qrngp


PRODUCT_PACKAGES += \
    libcurl \
    libnetcmdiface \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    wcnss_service

XPRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/wpa_supplicant_ath6kl.conf:system/etc/wifi/wpa_supplicant_ath6kl.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_wcn.conf:system/etc/wifi/wpa_supplicant_wcn.conf

PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1 \
    persist.sys.wfd.virtual=0 \
    persist.sys.ssr.restart_level=3 \
    wifi.interface=wlan0
    
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.adb.enable=1
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=0
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.secure=0
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.allow.mock.location=1
#PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.debuggable=1   

# Camera
PRODUCT_PACKAGES += \
    libxml2 \
    libqomx_core \
    camera.msm8226
    
# Audio 
PRODUCT_PACKAGES += \
	audio.primary.msm8226 \
    audio_policy.msm8226 \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default
	
# Omx
PRODUCT_PACKAGES += \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libmm-omxcore \
    libstagefrighthw
