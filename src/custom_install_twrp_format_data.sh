#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
	# read device id using adb
	adb_devices=$(adb devices)
	device_id="${adb_devices:25:8}"
	
	# break if device id is found and contains 8 characters
	if [ ${#device_id} -eq 8 ]; then 
		wipe_data=$(adb shell twrp wipe data)
		echo $wipe_data > "${WIPE_DATA_PATH}"
		wipe_cache=$(adb shell twrp wipe cache)
		echo $wipe_cache > "${WIPE_CACHE_PATH}"
		wipe_dalvik=$(adb shell twrp wipe dalvik)
		echo $wipe_dalvik > "${WIPE_DALVIK_PATH}"
		wipe_system=$(adb shell twrp wipe /system)
		echo $wipe_system > "${WIPE_SYSTEM_PATH}"
	else
		exit 0
	fi
	
}
apt_update "$@"
