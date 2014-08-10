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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

-include device/lenovo/msm8226-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/lenovo/shellr/BoardConfigVendor.mk

LOCAL_PATH := device/lenovo/shellr

# Vendor Init
#TARGET_UNIFIED_DEVICE := true
#TARGET_INIT_VENDOR_LIB := libinit_msm
#TARGET_LIBINIT_DEFINES_FILE := device/lenovo/shellr/init/init_falcon.c

# Kernel
BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK := device/lenovo/shellr/mkbootimg.mk
TARGET_KERNEL_SOURCE := kernel/lenovo/msm8926
TARGET_KERNEL_CONFIG := shellr_defconfig
BOARD_KERNEL_CMDLINE := console=tty60,115200,n8 vmalloc=576M androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100

#bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

#TWRP
DEVICE_RESOLUTION := 720x1280
TW_IGNORE_MAJOR_AXIS_0 := true

# Fix USB Storage Mount
BOARD_UMS_LUNFILE := "/sys/devices/platform/msm_hsusb/gadget/lun1/file"

# userdata 8GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5092397056
