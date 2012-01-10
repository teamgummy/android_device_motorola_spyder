# Inherit device configuration for Spyder.
$(call inherit-product, device/motorola/spyder/device_spyder.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common_full.mk)

# Include GSM stuff
#$(call inherit-product, vendor/cyanogen/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cyanogen_spyder
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := spyder
PRODUCT_MODEL := DROID RAZR
PRODUCT_MANUFACTURER := motorola
PRODUCT_BUILD_PROP_OVERRIDES += \
   PRODUCT_NAME=spyder_vzw \
   BUILD_ID=5.5.1_84_DBN-65 \
   BUILD_DISPLAY_ID=5.5.1_84_DBN-65 \
   BUILD_FINGERPRINT=verizon/spyder_vzw/cdma_spyder:4.0.3/6.5.1-73_DHD-11_TA-3/${BUILD_NUMBER}:user/release-keys \
   PRIVATE_BUILD_DESC=cdma_spyder-user 4.0.3 6.5.1-73_DHD-11_TA-3 "${BUILD_NUMBER}" release-keys" \
   TARGET_DEVICE=cdma_spyder \
   PRODUCT_BRAND=verizon \
   BUILD_UTC_DATE= \
   BUILD_NUMBER=110812 \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=dhacker29 \
   BUILD_HOST=TH3ORYROM-BuildBox \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \

# Extra Spyder overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/SPYDER

# Broadcom FM radio
$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-7-$(shell date +%m%d%Y)-NIGHTLY-SPYDER-SELFKANG
else
    ifdef CYANOGEN_RELEASE
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-SPYDER
    else
        PRODUCT_PROPERTY_OVERRIDES += \
            ro.modversion=CyanogenMod-7.1.0-SPYDER-SELFKANG
    endif
endif

#
# Copy Spyder specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/hdpi/media/bootanimation.zip:system/media/bootanimation.zip
