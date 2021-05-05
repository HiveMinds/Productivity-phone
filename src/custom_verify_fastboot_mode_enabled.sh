#!/bin/bash
custom_verify_fastboot_mode_enabled() {
	local LOG_PATH=$1
	
	# verify the adb debugging mode is enabled.
	actual_result=$(fastboot devices)
	# expected response =
	#a3d8ba3a	fastboot
	#actual_result="filler"
	
	#echo "$actual_result" > "${FASTBOOT_MODE_RESPONSE_PATH}"
	
	# read device_id from file
	device_id=$(head -c 8 "$FASTBOOT_DEVICE_ID_PATH")
	echo "device_id =$device_id"
	
	if [ "${actual_result:0:17}" == "$device_id	fastboot" ]; then
			
		# export fastboot mode check response
		echo "$actual_result" > "${FASTBOOT_MODE_RESPONSE_PATH}"
	fi
}
custom_verify_fastboot_mode_enabled "$@"
