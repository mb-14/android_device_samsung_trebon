# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/trebon/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/trebon/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Video decoding
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore \
    Torch \
    setup_fs 

# Graphics 
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.msm7x27 \
    libtilerenderer \
    libQcomUI

# Audio
PRODUCT_PACKAGES += \
    audio.primary.trebon \
    audio_policy.trebon \
    audio.a2dp.default \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    lights.trebon \
    gps.trebon

# Camera
PRODUCT_PACKAGES += \
        camera.msm7x27
        
# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory


## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

#init
PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/init.qcom.rc:root/init.qcom.rc \
    device/samsung/trebon/prebuilt/ueventd.qct.rc:root/ueventd.qct.rc \
    device/samsung/trebon/prebuilt/init.qcom.sh:root/init.qcom.sh \
    device/samsung/trebon/prebuilt/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/trebon/recovery/fix_reboot.sh:recovery/root/sbin/fix_reboot.sh  

## Camera
PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/system/lib/hw/camera.trebon.so:system/lib/hw/camera.trebon.so \
    device/samsung/trebon/prebuilt/system/lib/libcamera.so:system/lib/libcamera.so \
    device/samsung/trebon/prebuilt/system/lib/lib/system/libcamera_client.so:system/lib/libcamera_client.so \
    device/samsung/trebon/prebuilt/system/lib/lib/system/libcameraservice.so:system/lib/libcameraservice.so \
    device/samsung/trebon/prebuilt/system/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/samsung/trebon/prebuilt/system/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/samsung/trebon/prebuilt/system/lib/libmmipl.so:system/lib/libmmipl.so \
    device/samsung/trebon/prebuilt/system/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/samsung/trebon/prebuilt/system/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/samsung/trebon/prebuilt/system/lib/liboemcamera.so:system/lib/liboemcamera.so

PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/wifi/system/etc/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/trebon/prebuilt/system/etc/wifi/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/trebon/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/trebon/prebuilt/system/etc/init.qcom.composition_type.sh:system/etc/init.qcom.composition_type.sh \
    device/samsung/trebon/prebuilt/system/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/samsung/trebon/prebuilt/system/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/samsung/trebon/prebuilt/system/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/samsung/trebon/prebuilt/system/etc/calib.dat:system/etc/calib.dat \
    device/samsung/trebon/prebuilt/system/etc/param.dat:system/etc/param.dat \
    device/samsung/trebon/prebuilt/system/etc/sensors.dat:system/etc/sensors.dat \
    device/samsung/trebon/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab \
    device/samsung/trebon/mediaprofiles/media_profiles.xml:system/etc/media_profiles.xml \
    device/samsung/trebon/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/system/usr/idc/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc


# Keyboard maps
PRODUCT_COPY_FILES += \
	device/samsung/trebon/prebuilt/system/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
	device/samsung/trebon/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
	device/samsung/trebon/prebuilt/system/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
	device/samsung/trebon/prebuilt/system/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
	device/samsung/trebon/prebuilt/system/usr/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
	device/samsung/trebon/prebuilt/system/usr/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
	device/samsung/trebon/prebuilt/system/usr/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl 
    
PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/system/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/trebon/prebuilt/system/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/trebon/prebuilt/system/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/trebon/prebuilt/system/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/trebon/prebuilt/system/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
    device/samsung/trebon/prebuilt/system/lib/libC2D2.so:system/lib/libC2D2.so \
    device/samsung/trebon/prebuilt/system/lib/libOpenVG.so:system/lib/libOpenVG.so \
    device/samsung/trebon/prebuilt/system/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
    device/samsung/trebon/prebuilt/system/lib/libgsl.so:system/lib/libgsl.so


PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml 

## ril
PRODUCT_COPY_FILES += \
    device/samsung/trebon/prebuilt/system/lib/libdiag.so:system/lib/libdiag.so \
    device/samsung/trebon/prebuilt/system/lib/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/trebon/prebuilt/system/lib/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/trebon/prebuilt/system/lib/libril.so:system/lib/libril.so 

# For userdebug builds
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.secure=0 \
    ro.allow.mock.location=1 \
    ro.debuggable=1

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, build/target/product/full_base.mk)
