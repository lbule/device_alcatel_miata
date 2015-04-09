$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/alcatel/miata/miata-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/alcatel/miata/overlay

LOCAL_PATH := device/alcatel/miata
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_miata
PRODUCT_DEVICE := miata
PRODUCT_CHARACTERISTICS := phone


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qcom:root/fstab.qcom 


# Screen density
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 960
TARGET_SCREEN_WIDTH := 540

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images


