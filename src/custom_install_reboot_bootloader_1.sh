#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	## Verify the device is recognised by adb debugging
		# Remove device id files if exist
		if [ -f "$DEVICE_ID_PATH" ] ; then
			rm "$DEVICE_ID_PATH"
		fi
		
		# Scan device id
		run_main_functions custom_verify_adb_enabled
		
		# read device id from file
		device_id=$(head -c 8 "$DEVICE_ID_PATH")
		
		# break if device id is found and contains 8 characters
		if [ ${#device_id} -eq 8 ]; then 
			pass=""
		else
			#break;
			exit 0
		fi
	
	update=$(adb reboot bootloader)	
	
	echo $update > "${LOG_PATH}"
}
apt_update "$@"
