## Specify phone tech before including full_phone	
$(call inherit-product, vendor/lineage/config/telephony.mk)

# Release name
PRODUCT_RELEASE_NAME := kanas

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/kanas.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kanas
PRODUCT_NAME := lineage_kanas
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-G355H
PRODUCT_MANUFACTURER := samsung
PRODUCT_CHARACTERISTICS := phone

