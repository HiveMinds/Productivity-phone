#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
	# read device id using adb
	read -p "adb devices.<press enter>" sink
	adb_devices=$(adb devices)
	device_id="${adb_devices:25:8}"
	read -p "got device id as:$device_id.<press enter>" sink
	
	# break if device id is found and contains 8 characters
	if [ ${#device_id} -eq 8 ]; then 
		read -p "Starting ereasing data with trp shell<press enter>" sink
		wipe_data=$(adb shell twrp wipe data)
		echo $wipe_data > "${WIPE_DATA_PATH}"
		
		read -p "Starting ereasing cache with trp shell<press enter>" sink
		wipe_cache=$(adb shell twrp wipe cache)
		echo $wipe_cache > "${WIPE_CACHE_PATH}"
		
		read -p "Starting ereasing dalvik with trp shell<press enter>" sink
		wipe_dalvik=$(adb shell twrp wipe dalvik)
		echo $wipe_dalvik > "${WIPE_DALVIK_PATH}"
		
		read -p "Starting ereasing system with trp shell<press enter>" sink
		wipe_system=$(adb shell twrp wipe /system)
		echo $wipe_system > "${WIPE_SYSTEM_PATH}"
	else
		exit 0
	fi
	read -p "completed ereasing.<press enter>" sink
}
apt_update "$@"
