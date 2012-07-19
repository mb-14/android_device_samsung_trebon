# Correct bootanimation size for the screen
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit device configuration
$(call inherit-product, device/samsung/trebon/trebon.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Setup device configuration
PRODUCT_NAME := cm_trebon
PRODUCT_DEVICE := trebon
PRODUCT_BRAND := Samsung
PRODUCT_MODEL :=  GT-S7500
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=U8818 BUILD_FINGERPRINT=google/soju/crespo:4.0.4/IMM76D/299849:user/release-keys PRIVATE_BUILD_DESC="soju-user 4.0.4 IMM76D 299849 release-keys" BUILD_NUMBER=299849
PRODUCT_RELEASE_NAME :trebon
