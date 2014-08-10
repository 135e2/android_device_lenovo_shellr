#
# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/lenovo/msm8226-common/msm8226.mk)

LOCAL_PATH := device/lenovo/shellr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vold.fstab:system/etc/vold.fstab

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Europe/Moscow \
	persist.sys.language=ru \
	persist.sys.country=RU \
    ro.product.locale.language=ru \
    ro.product.locale.region=RU

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    sys.storage.ums_enabled=1 \
    persist.sys.usb.config=mass_storage

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.debuggable=1

# CUSTOM PROPERTIES
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.dataroaming=true \
	persist.sys.logkit.ctrlcode=1 \
	persist.aanc.enable=true \
	tunnel.decode=false \
	tunnel.audiovideo.decode=false \
	persist.cne.feature=0 \
	ro.qualcomm.sensors.qmd=true \
	ro.qualcomm.sensors.pedometer=true \
	persist.radio.multisim.config=dsds
	persist.dsds.config=dsds \
	persist.radio.rat_on=combine \
	ro.qc.sdk.izat.premium_enabled=1 \
	ro.qc.sdk.izat.service_mask=0x5 \
	persist.gps.qc_nlp_in_use=1 \
	persist.loc.nlp_name=com.qualcomm.services.location \
	persist.radio.calls.on.ims=0 \
	persist.radio.jbims=0 \
	persist.radio.csvt.enabled=false \
	persist.radio.custom_ecc=1 \
	persist.radio.mt_sms_ack=20 \
	persist.radio.apm_sim_not_pwdn=0 \
	persist.radio.restore_mode_pref=1

# shellr specific overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += xhdpi
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

$(call inherit-product, device/lenovo/msm8226-common/keylayout/keylayout.mk)
$(call inherit-product, vendor/lenovo/shellr/shellr-vendor.mk)
