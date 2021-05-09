#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	while :
	do		
		## Verify the device is recognised by adb debugging
		# read device id from file
		device_id=$(head -c 8 "$DEVICE_ID_PATH")
		echo "The device id is:$device_id" >&2
		
		sleep 10
		# break if device id is found and contains 8 characters
		if [ ${#device_id} -eq 8 ]; then 
			
			## check if the device is in fastboot mode
			# Remove device id files if exist
			if [ -f "$FASTBOOT_MODE_RESPONSE_PATH" ] ; then
				rm "$FASTBOOT_MODE_RESPONSE_PATH"
			fi
			
			# Scan fastboot mode check response
			run_main_functions custom_verify_fastboot_mode_enabled
			
			
			
			# read device id from file
			fastboot_mode_response=$(head -c 17 "$FASTBOOT_MODE_RESPONSE_PATH")
			
			
			if [ "${fastboot_mode_response}" == "$device_id	fastboot" ]; then
				#echo "Thephoneisinfastbootmode"
				#echo $fastboot_mode_response > "${TIMESTAMP_PATH}"
				run_main_functions custom_install_flash_twrp_2
				break;
			fi
		fi
		
	done
}
apt_update "$@"
