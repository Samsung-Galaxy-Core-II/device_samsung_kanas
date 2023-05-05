# Copyright (C) 2017 The LineageOS Project
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

# Inherit from vendor
$(call inherit-product, vendor/samsung/kanas/kanas-vendor.mk)

# Inherit from scx35-common device configuration
$(call inherit-product, device/samsung/scx35-common/common.mk)

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Advanced Display
PRODUCT_PACKAGES += \
	AdvancedDisplay-mod

# Audio
PRODUCT_PACKAGES += \
	audio_vbc_eq

# Camera
PRODUCT_PACKAGES += \
	Snap \
	camera.sc8830 \
	camera2.sc8830 \
	android.hardware.camera.provider@2.4-service

# Cell Radio
PRODUCT_PACKAGES += \
	refnotify \
	nvitemd

# Codecs
PRODUCT_PACKAGES += \
	libstagefright_sprd_soft_mpeg4dec \
	libstagefright_sprd_soft_h264dec

# Common stuffs
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_steps=25 \
	ro.sys.sdcardfs=true

# Configstore
PRODUCT_PACKAGES += \
	android.hardware.configstore@1.0-service

# Explicitly include mkf2fsuserimg.sh
PRODUCT_PACKAGES += \
	mkf2fsuserimg.sh \
	badblocks

# Extra shims
PRODUCT_PACKAGES += \
	libengpc_shim \
	libvsp_shim \
	liblpm_shim

# GPS wrapper
PRODUCT_PACKAGES += \
	gps.default

# Graphics
PRODUCT_PACKAGES += \
	sprd_gsp.sc8830 \
	hwcomposer.sc8830 \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.composer@2.1-impl

# HWUI prop overrides
PRODUCT_PROPERTY_OVERRIDES += \
	ro.hwui.texture_cache_size=9 \
	ro.hwui.layer_cache_size=6 \
	ro.hwui.path_cache_size=1.5 \
	ro.hwui.gradient_cache_size=0.5 \
	ro.hwui.drop_shadow_cache_size=1 \
	ro.hwui.r_buffer_cache_size=1

# Keylayouts
KEYLAYOUT_FILES := \
	$(LOCAL_PATH)/keylayouts/ist30xx_ts_input.kl \
	$(LOCAL_PATH)/keylayouts/sci-keypad.kl

PRODUCT_COPY_FILES += \
	$(foreach f,$(KEYLAYOUT_FILES),$(f):system/usr/keylayout/$(notdir $(f)))

# Lights
PRODUCT_PACKAGES += \
	android.hardware.light@2.0-service

# Media
PRODUCT_PACKAGES += \
	android.hardware.cas@1.0-service

# Memtrack
PRODUCT_PACKAGES += \
	memtrack.sc8830 \
	android.hardware.memtrack@1.0-impl

# Power
 PRODUCT_PACKAGES += \
	android.hardware.power@1.0-service.kanas

# Rootdir files
PRODUCT_PACKAGES += \
	fstab.sc8830

# Sensors
PRODUCT_PACKAGES += \
	sensors.sc8830 \
	android.hardware.sensors@1.0-service

# Prebuilt targets
MEDIA_CONFIGS := \
	$(LOCAL_PATH)/configs/media/media_profiles_V1_0.xml

AUDIO_CONFIGS := \
	$(LOCAL_PATH)/configs/audio/audio_hw.xml \
	$(LOCAL_PATH)/configs/audio/audio_para \
	$(LOCAL_PATH)/configs/audio/audio_policy.conf\
	$(LOCAL_PATH)/configs/audio/codec_pga.xml \
	$(LOCAL_PATH)/configs/audio/tiny_hw.xml

WIFI_CONFIGS := \
	$(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf \
	$(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf

RAMDISK_FILES := \
	$(LOCAL_PATH)/rootdir/ueventd.sc8830.rc \
	$(LOCAL_PATH)/rootdir/init.board.rc \
	$(LOCAL_PATH)/rootdir/init.sc8830.rc

INIT_FILES := \
	$(LOCAL_PATH)/system/etc/init/rild_scx15.rc \
	$(LOCAL_PATH)/system/etc/init/kill_phone.rc \
	$(LOCAL_PATH)/system/etc/init/refnotify.rc \
	$(LOCAL_PATH)/system/etc/init/wpa_supplicant.rc

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_CONFIGS),$(f):system/vendor/etc/$(notdir $(f))) \
	$(foreach f,$(AUDIO_CONFIGS),$(f):system/vendor/etc/$(notdir $(f))) \
	$(foreach f,$(WIFI_CONFIGS),$(f):system/vendor/etc/wifi/$(notdir $(f))) \
	$(foreach f,$(RAMDISK_FILES),$(f):root/$(notdir $(f))) \
	$(foreach f,$(INIT_FILES),$(f):system/vendor/etc/init/$(notdir $(f)))
