# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Boot animation
TARGET_SCREEN_WIDTH := 720
TARGET_SCREEN_HEIGHT := 1280

# Release name
PRODUCT_RELEASE_NAME := LENOVO S856
PRODUCT_NAME := cm_shellr

$(call inherit-product, device/lenovo/shellr/full_shellr.mk)
