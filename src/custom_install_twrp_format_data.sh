#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
	# read device id using adb
	#read -p "adb devices.<press enter>" sink
	echo "adb devices." >&2
	adb_devices=$(adb devices)
	device_id="${adb_devices:25:8}"
	#read -p "got device id as:$device_id.<press enter>" sink
	echo "got device id as:$device_id." >&2
	
	# break if device id is found and contains 8 characters
	if [ ${#device_id} -eq 8 ]; then 
		#read -p "Starting erasing data with trp shell<press enter>" sink
		echo "Starting erasing data with trp shell" >&2
		wipe_data=$(adb shell twrp wipe data)
		echo $wipe_data > "${WIPE_DATA_PATH}"
		echo "Completed erasing data with trp shell" >&2
		
		#read -p "Starting erasing cache with trp shell<press enter>" sink
		echo "Starting erasing cache with trp shell" >&2
		wipe_cache=$(adb shell twrp wipe cache)
		echo $wipe_cache > "${WIPE_CACHE_PATH}"
		echo "Completed erasing cache with trp shell" >&2
		
		#read -p "Starting erasing dalvik with trp shell<press enter>" sink
		echo "Starting erasing dalvik with trp shell" >&2
		wipe_dalvik=$(adb shell twrp wipe dalvik)
		echo $wipe_dalvik > "${WIPE_DALVIK_PATH}"
		echo "Completed erasing dalvik with trp shell" >&2
		
		#read -p "Starting erasing /system with trp shell<press enter>" sink
		echo "Starting erasing system with trp shell" >&2
		wipe_system=$(adb shell twrp wipe /system)
		echo $wipe_system > "${WIPE_SYSTEM_PATH}"
		echo "Completed erasing /system with trp shell" >&2
		
		#read -p "Starting erasing system with trp shell<press enter>" sink
		echo "Starting erasing system with trp shell" >&2
		wipe_system=$(adb shell twrp wipe system)
		echo $wipe_system > "${WIPE_SYSTEM_PATH}"
		echo "Completed erasing system with trp shell" >&2
	else
		exit 0
	fi
	#read -p "completed erasing.<press enter>" sink
	echo "Completed erasing." >&2
}
apt_update "$@"
