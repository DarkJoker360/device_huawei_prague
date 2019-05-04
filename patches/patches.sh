#!/usr/bin/env bash
#
# ROM patching script for P8 Lite 2017 (prague)
#
# Copyright (C) 2019 DarkJoker360<simoespo159@gmail.com>
#
# This program is free software: you can REDistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>
source build/envsetup.sh

DEFAULT_URL="https://raw.githubusercontent.com/DarkJoker360/prague_patches/android-9.0"

echo "Which rom are you building?"
select yn in "AOSP" "CandyRoms" "DotOS" "LineageOS"; do
    case $yn in
		AOSP )cd packages/apps/Settings
                   echo "Patching packages/apps/Settings..."
                   wget $DEFAULT_URL/platform_packages_apps_Settings/0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   patch -p1< 0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   echo " "
                   cd ../../..
		   cd system/sepolicy
	           echo "Patching system/sepolicy..."
	           wget $DEFAULT_URL/platform_system_sepolicy/%5BPATCH%5D-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
		   patch -p1< [PATCH]-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
                   cd ../..
	           cd frameworks/native
                   echo "Patching frameworks/native..."
                   wget $DEFAULT_URL/platform_frameworks_native/0001-AOSP-8.0-8.1-didn-t-use-presentOrValidate-so-it-s-br.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0002-Ignore-usage-bits-verification.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0003-device-Huawei-HWC-doesn-t-understand-0-0-0-0-fullscr.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0004-Enable-fallback-to-old-ro.sf.hwrotation-property.patch
	           cd ../..
	           break;;

		CandyRoms )cd packages/apps/Settings
                   echo "Patching packages/apps/Settings..."
                   wget $DEFAULT_URL/platform_packages_apps_Settings/0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   patch -p1< 0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   echo " "
                   cd ../../..
		   cd system/sepolicy
		   echo "Patching system/sepolicy..."
                   wget $DEFAULT_URL/platform_system_sepolicy/%5BPATCH%5D-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
		   patch -p1< [PATCH]-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
                   cd ../..
		   cd frameworks/native
		   echo "Patching frameworks/native..."
                   wget $DEFAULT_URL/candy_frameworks_native/0001-adapt-hwcomposer-patch-for-candyroms.patch
		   echo " "
                   patch -p1< 0001-adapt-hwcomposer-patch-for-candyroms.patch
                   cd ..
            	   break;;

		DotOS )cd build
		   echo "Patching build..."
                   wget $DEFAULT_URL/platform_build/0001-disable-system-as-root-for-emui8.patch
                   echo " "
		   patch -p1< 0001-disable-system-as-root-for-emui8.patch
                   cd ..
	           cd frameworks/native
                   echo "Patching frameworks/native..."
                   wget $DEFAULT_URL/platform_frameworks_native/0001-AOSP-8.0-8.1-didn-t-use-presentOrValidate-so-it-s-br.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0002-Ignore-usage-bits-verification.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0003-device-Huawei-HWC-doesn-t-understand-0-0-0-0-fullscr.patch
                   wget $DEFAULT_URL/platform_frameworks_native/0004-Enable-fallback-to-old-ro.sf.hwrotation-property.patch
		   cd ../..
                   break;;

                LineageOS )cd packages/apps/Settings
                   echo "Patching packages/apps/Settings..."
                   wget $DEFAULT_URL/platform_packages_apps_Settings/0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   patch -p1< 0001-Act-as-usb-device-when-there-is-no-hal-but-we-believ.patch
                   echo " "
                   cd ../../..
		   cd system/sepolicy
		   echo "Patching system/sepolicy..."
		   wget $DEFAULT_URL/platform_system_sepolicy/%5BPATCH%5D-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
		   patch -p1< [PATCH]-Allow-hal_usb-access-sysfs-when-in-coredomain.patch
                   cd ../..
	           cd frameworks/native
		   echo "Patching frameworks/native..."
                   wget $DEFAULT_URL/lineage_frameworks_native/0001-prague-fix-boot-for-hi6250.patch
                   patch -p1< 0001-prague-fix-boot-for-hi6250.patch
                   cd ../..
            	   break;;
    esac
done
# This is the common part for every roms
cd build
echo "Patching build..."
wget $DEFAULT_URL/platform_build/0001-Revert-Remove-root-folder-bt_firmware-in-GSI.patch
wget $DEFAULT_URL/platform_build/0002-Set-ro.build.fingerprint-in-system-etc-prop.default.patch
echo " "
patch -p1< 0001-Revert-Remove-root-folder-bt_firmware-in-GSI.patch
patch -p1< 0002-Set-ro.build.fingerprint-in-system-etc-prop.default.patch
cd ..

cd external/selinux
echo "Patching externel/selinux..."
wget $DEFAULT_URL/platform_external_selinux/0001-Enable-multipl_decls-by-default.-This-is-needed-beca.patch
wget $DEFAULT_URL/platform_external_selinux/0002-Increase-default-log_level-to-get-actual-selinux-err.patch
echo " "
patch -p1< 0001-Enable-multipl_decls-by-default.-This-is-needed-beca.patch
patch -p1< 0002-Increase-default-log_level-to-get-actual-selinux-err.patch
cd ../..

cd frameworks/av
echo "Patching frameworks/av..."
wget $DEFAULT_URL/platform_frameworks_av/0001-FIH-devices-Fix-Earpiece-audio-output.patch
wget $DEFAULT_URL/platform_frameworks_av/0002-Fix-WiFi-Display-on-Huawei-devices-EMUI-8.0.patch
wget $DEFAULT_URL/platform_frameworks_av/0003-CameraService-Support-calling-addStates-in-enumerateProviders.patch
echo " "
patch -p1< 0001-FIH-devices-Fix-Earpiece-audio-output.patch
patch -p1< 0002-Fix-WiFi-Display-on-Huawei-devices-EMUI-8.0.patch
patch -p1< 0003-CameraService-Support-calling-addStates-in-enumerateProviders.patch
cd ..

cd base
echo "Patching frameworks/base..."
wget $DEFAULT_URL/platform_frameworks_base/0001-fix-security-patches.patch
echo " "
patch -p1< 0001-fix-security-patches.patch
cd ..

cd native
echo "Patching frameworks/native..."
wget $DEFAULT_URL/platform_frameworks_native/%5BPATCH%5D-HACK%3A-SF%3A-Force-client-composition-for-all-layers
echo " "
patch -p1< [PATCH]-HACK:-SF:-Force-client-composition-for-all-layers
cd ..

cd opt/net/wifi
echo "Patching frameworks/opt/net/wifi..."
wget $DEFAULT_URL/platform_frameworks_opt_net_wifi/0001-Revert-SupplicantManager-Remove-ensure_config_file_e.patch
wget $DEFAULT_URL/platform_frameworks_opt_net_wifi/0002-Start-supplicant-later.patch
wget $DEFAULT_URL/platform_frameworks_opt_net_wifi/0003-Support-hostap-on-O-O-MR1-vendors.patch
echo " "
patch -p1< 0001-Revert-SupplicantManager-Remove-ensure_config_file_e.patch
patch -p1< 0002-Start-supplicant-later.patch
patch -p1< 0003-Support-hostap-on-O-O-MR1-vendors.patch
cd ../..

cd telephony
echo "Patching frameworks/opt/telephony..."
wget $DEFAULT_URL/platform_frameworks_opt_telephony/0001-Add-route-to-gateway-on-null-netmask.patch
wget $DEFAULT_URL/platform_frameworks_opt_telephony/0003-Don-not-call-onUssdRelease.patch
wget $DEFAULT_URL/platform_frameworks_opt_telephony/0004-Squashed-Kirin-SignalStrengthHacks.patch
echo " "
patch -p1< 0001-Add-route-to-gateway-on-null-netmask.patch
patch -p1< 0003-Don-not-call-onUssdRelease.patch
patch -p1< 0004-Squashed-Kirin-SignalStrengthHacks.patch
cd ../../..

cd packages/services/Telephony
echo "Patching packages/services/Telephony..."
wget $DEFAULT_URL/platform_packages_services_Telephony/0001-Telephony-Support-muting-by-RIL-command.patch
echo " "
patch -p1< 0001-Telephony-Support-muting-by-RIL-command.patch
cd ../../..

cd system/bt
echo "Patching system/bt..."
wget $DEFAULT_URL/platform_system_bt/0001-Make-BTM_BYPASS_EXTRA_ACL_SETUP-dynamic.patch
wget $DEFAULT_URL/platform_system_bt/%5BPATCH%5D-Add-props-to-control-supported-features-and-states
wget $DEFAULT_URL/platform_system_bt/%5BPATCH%5D-define-PROPERTY_VALUE_MAX
echo " "
patch -p1< 0001-Make-BTM_BYPASS_EXTRA_ACL_SETUP-dynamic.patch
patch -p1< [PATCH]-Add-props-to-control-supported-features-and-states
patch -p1< [PATCH]-define-PROPERTY_VALUE_MAX
cd ..

cd core
echo "Patching system/core..."
wget $DEFAULT_URL/platform_system_core/0001-Revert-logd-add-passcred-for-logdw-socket.patch
wget $DEFAULT_URL/platform_system_core/0002-Some-kernel-crashes-when-using-too-recent-sdcardfs-o.patch
wget $DEFAULT_URL/platform_system_core/0003-First-drop_privs-which-may-fail-and-only-run-thread-.patch
echo " "
patch -p1< 0001-Revert-logd-add-passcred-for-logdw-socket.patch
patch -p1< 0002-Some-kernel-crashes-when-using-too-recent-sdcardfs-o.patch
patch -p1< 0003-First-drop_privs-which-may-fail-and-only-run-thread-.patch
cd ..

cd netd
echo "Patching system/netd..."
wget $DEFAULT_URL/platform_system_netd/0001-device-Huawei-Kirin-960-accept-broken-rpfilter-match.patch
echo " "
patch -p1< 0001-device-Huawei-Kirin-960-accept-broken-rpfilter-match.patch
cd ..

cd sepolicy
echo "Patching system/sepolicy..."
wget $DEFAULT_URL/platform_system_sepolicy/0001-Don-t-set-esdfs-or-exfat-genfscon.-Assume-OEM-does.patch
wget $DEFAULT_URL/platform_system_sepolicy/0002-Relax-proc-read-from-ueventd-huawei-needs-it.patch
echo " "
patch -p1< 0001-Don-t-set-esdfs-or-exfat-genfscon.-Assume-OEM-does.patch
patch -p1< 0002-Relax-proc-read-from-ueventd-huawei-needs-it.patch
cd ..

cd vold
echo "Patching system/vold..."
wget $DEFAULT_URL/platform_system_vold/0001-Allow-deletion-of-symlink.patch
wget $DEFAULT_URL/platform_system_vold/0002-Don-t-set-reserved_disk-group-it-panics-old-inits.patch
wget $DEFAULT_URL/platform_system_vold/0003-Create-vendor_de.-This-is-done-by-init.rc-on-system-.patch
wget $DEFAULT_URL/platform_system_vold/0005-Also-create-vendor_ce-same-reason-as-vendor_de.patch
echo " "
patch -p1< 0001-Allow-deletion-of-symlink.patch
patch -p1< 0002-Don-t-set-reserved_disk-group-it-panics-old-inits.patch
patch -p1< 0003-Create-vendor_de.-This-is-done-by-init.rc-on-system-.patch
patch -p1< 0005-Also-create-vendor_ce-same-reason-as-vendor_de.patch
