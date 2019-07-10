echo $1
rootdir="$PWD"
# ---------------------------------

dirs="build external/selinux frameworks/av frameworks/base frameworks/native frameworks/opt/net/wifi frameworks/opt/telephony packages/services/Telephony system/bt system/core system/netd system/sepolicy system/vold"

for dir in $dirs ; do
	cd $rootdir
	cd $dir
	echo "Applying $dir patches..."
	git apply $rootdir/device/huawei/prague/patches/$dir/*.patch
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdir
