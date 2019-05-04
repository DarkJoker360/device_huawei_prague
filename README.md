# Honor 8 Lite / Huawei P8 Lite 2017 / Huawei P9 Lite 2017 Device Tree

# Requirements
* Capient hard disk.
* Fast connection to download the whole source of your favorite rom.
* Fast PC.
* Ubuntu, Mint or Lubuntu as recommened system.

# Setup PC

* Open terminal and install the following packages:
```bash
sudo apt-get update
sudo apt-get install git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev libgl1-mesa-dev libxml2-utils xsltproc unzip bc repo schedtool imagemagick
```

# Setup ADB
```bash
sudo apt install android-tools-adb android-tools-fastboot
```

# Setup Git
```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

# Building ROMs:
* In this example I'll use LineageOS as simple way to learn building concept so let's start together;
* Make a new folder in /home like the following example.
```bash
mkdir /home/$USER/lineage
cd /home/$USER/lineage
repo init -u git://github.com/LineageOS/android.git -b lineage-16.0
repo sync --no-tags
```

* Apply GSI Patches from https://github.com/phhusson/treble_patches nor https://github.com/Dil3mm4/treble_patches for our DSSI .
* Or use the script located in patches
```. patches.sh```
Choose the rom u want to build
EX: Aosp 1, DotOS 3, Etc...

* Create the manifest to download my own sources.
```bash
mkdir /home/$USER/lineage/.repo/local_manifests
gedit /home/$USER/lineage/.repo/local_manifests/hi6250.xml
```
* Copy my manifest.
```bash

<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="hak86/android_device_huawei_prague" path="device/huawei/prague" remote="github" revision="aosp-9.x"/>
  <project name="hak86/proprietary_vendor_huawei_hi6250-common" path="vendor/huawei/hi6250-common" remote="github" revision="lineage-16.0"/>
</manifest>
```
* Refresh the code by repo sync command to download my repos.

# Build LineageOS
```bash
. build/envsetup.sh
lunch lineage_prague-userdebug
brunch prague
```
# ROMs List Booted
- [x] AOSP 9.0
- [x] AOSCP "CypherOS" 9.0
- [x] APSiP 9.0
- [x] CandyRoms 9.0
- [x] DotOS 9.0
- [x] LineageOS 16.0

# Install Guide:
* Reboot to TWRP.
* Flash your ROM by dirty flash.
* Flash Gapps .
* Run factory reset with stock ramdisk,
* Enjoy.

# Features

Basic         |Spec Sheet
-------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------
Network	      | GSM / HSPA / LTE
Launch	      |2017, January
Body	        |147.2 x 72.9 x 7.6 mm (5.80 x 2.87 x 0.30 in); 147 g (5.19 oz); Dual SIM (Nano-SIM, dual stand-by)
Display	      |5.2 inches, 74.5 cm2 (~69.5% screen-to-body ratio); 1080 x 1920 pixels, 16:9 ratio (~424 ppi density)
Platform      |Android 7.0 (Nougat), upgradable to 8.0 (Oreo)
Chipset	      |HiSilicon Kirin 655
CPU	          |Octa-core (4x2.1 GHz Cortex-A53 & 4x1.7 GHz Cortex-A53)
GPU	          |Mali-T830MP2
Memory	      |16 GB, 3 GB RAM, 64 GB, 4 GB RAM - India, microSD, up to 256 GB (uses SIM 2 slot)
Rear Camera   |12 MP, AF, LED flash, panorama, HDR. 1080p@30fps
Front Camera  |8 MP, 1080p
Sound	        |- Active noise cancellation with dedicated mic; - DTS audio
WLAN	        |Wi-Fi 802.11 b/g/n, Wi-Fi Direct, hotspot
Bluetooth     |4.1, A2DP, EDR, LE
GPS	          |Yes, with A-GPS, GLONASS, BDS
NFC           |Yes (market dependent)
Radio	        |FM radio
USB	          |microUSB 2.0
Sensors	      |Fingerprint (rear-mounted), accelerometer, proximity, compass
Battery	      |Non-removable 3000 mAh battery
Colors 	      |Black, White, Gold, Blue (India)


![Huawei P8 Lite 2017](https://cdn2.gsmarena.com/vv/pics/huawei/huawei-p8-lite-2017-1.jpg "Huawei P8 Lite 2017")
