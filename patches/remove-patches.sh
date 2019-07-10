echo $1
rootdir="$PWD"
# ---------------------------------

dirs="build external/selinux frameworks/av frameworks/base frameworks/native frameworks/opt/net/wifi frameworks/opt/telephony packages/services/Telephony system/bt system/core system/netd system/sepolicy system/vold"

for dir in $dirs ; do
	cd $rootdir
	cd $dir
	echo "Reverting $dir patches..."
	git reset --hard
	git clean -f -d
	echo " "
done

# -----------------------------------
echo "Changing to build directory..."
cd $rootdir
