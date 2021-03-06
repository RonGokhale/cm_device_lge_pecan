#Adding ALL Languages

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/lg/swift/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


include frameworks/base/data/sounds/AudioPackage4.mk

DEVICE_PACKAGE_OVERLAYS += device/lg/swift/overlay
    
PRODUCT_PACKAGES += \
    VoiceDialer \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    LiveWallpapersPicker \
    Launcher2 \
    CMParts \
    CMPartsHelper \
    CMWallpapers \
    DSPManager \
    Provision \
    GoogleSearch \
    LatinIME \
    Stk \
    copybit.swift \
    hcitool \
    Superuser

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.media.dec.jpeg.memcap=10000000 \
    ro.com.android.dataroaming=false \
    ro.setupwizard.enable_bypass=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.rommanager.developerid=cyanogenmod \
    ro.config.ringtone=DonMessWivIt.ogg

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=14


# Ril Config
PRODUCT_PROPERTY_OVERRIDES += \
rild.libpath=/system/lib/libril-qc-1.so \
rild.libargs=-d /dev/smd0 \
ro.ril.hsxpa=2 \
ro.ril.gprsclass=12 \
ro.telephony.default_network=0 \
ro.telephony.call_ring.multiple=false \
ro.telephony.call_ring.delay=5000 \
persist.rild.nitz_plmn=	\
persist.rild.nitz_long_ons_0= \	
persist.rild.nitz_long_ons_1= \
persist.rild.nitz_long_ons_2= \
persist.rild.nitz_long_ons_3= \
persist.rild.nitz_short_ons_0= \
persist.rild.nitz_short_ons_1= \
persist.rild.nitz_short_ons_2= \
persist.rild.nitz_short_ons_3= \
persist.cust.tel.adapt=1 \
persist.cust.tel.eons=1 



# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
    ro.compcache.default=1

# density in DPI of the LCD of this board. This is used to scale the UI
# appropriately. If this property is not defined, the default value is 160 dpi. 
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=120

# Enable JIT by default
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.execution-mode=int:jit \
    dalvik.vm.heapsize=24m

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_pecan
PRODUCT_DEVICE := pecan
PRODUCT_MODEL := LG OPTIMUS ME 
