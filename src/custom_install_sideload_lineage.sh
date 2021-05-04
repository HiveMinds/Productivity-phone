#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
	# read device id using adb
	adb_devices=$(adb devices)
	device_id="${adb_devices:25:8}"
	
	# break if device id is found and contains 8 characters
	if [ ${#device_id} -eq 8 ]; then 
	
		# enable sideloading
		enable_sideloading=$(adb shell twrp sideload)
		#echo $enable_sideloading > "${ENABLE_SIDELOADING_DATA_PATH}"
		
		sideload_lineage=$(sudo adb sideload $LINEAGEOS_FILEPATH)
		echo $sideload_lineage > "${SIDELOAD_LINEAGE_DATA_PATH}"
		final_adb_reboot=$(adb reboot)
		echo $final_adb_reboot > "${FINAL_ADB_REBOOT_PATH}"
	else
		exit 0
	fi
	
}
apt_update "$@"
