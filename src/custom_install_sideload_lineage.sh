#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
	# read device id using adb
	adb_devices=$(adb devices)
	device_id="${adb_devices:25:8}"
	
	# Determine which os is selected.
	if [ "$OS_CHOICE" == "fairphone_os" ]; then
		os_filepath="$FAIRPHONE_OS_FILEPATH"
		os_url="$FAIRPHONE_OS_URL"
		expected_md5_of_os_zip="$FAIRPHONE_OS_MD5"
	elif [ "$OS_CHOICE" == "fairphone_open" ]; then
		os_filepath="$FAIRPHONE_OPEN_FILEPATH"
		os_url="$FAIRPHONE_OPEN_URL"
		expected_md5_of_os_zip="$FAIRPHONE_OPEN_MD5"
	elif [ "$OS_CHOICE" == "lineage" ]; then
		os_filepath="$LINEAGEOS_FILEPATH"
		os_url="$LINEAGEOS_URL"
		expected_md5_of_os_zip="$LINEAGEOS_MD5"
	fi
	
	# break if device id is found and contains 8 characters
	if [ ${#device_id} -eq 8 ]; then 
	
		# enable sideloading
		enable_sideloading=$(adb shell twrp sideload)
		#echo $enable_sideloading > "${ENABLE_SIDELOADING_DATA_PATH}"
		
		sleep 20
		
		sideload_lineage=$(sudo adb sideload $os_filepath)
		# TODO: refactor to Sideload_os_data_path
		echo $sideload_lineage > "${SIDELOAD_LINEAGE_DATA_PATH}"
		
		# TODO: format data before reboot
		wipe_data=$(adb shell twrp wipe data)
		echo $wipe_data > "${WIPE_DATA_PATH}"
		wipe_cache=$(adb shell twrp wipe cache)
		echo $wipe_cache > "${WIPE_CACHE_PATH}"
		wipe_dalvik=$(adb shell twrp wipe dalvik)
		echo $wipe_dalvik > "${WIPE_DALVIK_PATH}"
		
		final_adb_reboot=$(adb reboot)
		echo $final_adb_reboot > "${FINAL_ADB_REBOOT_PATH}"
	else
		exit 0
	fi
	
}
apt_update "$@"
