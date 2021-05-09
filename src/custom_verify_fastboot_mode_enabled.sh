#!/bin/bash
custom_verify_fastboot_mode_enabled() {
	local LOG_PATH=$1
	
	# verify the adb debugging mode is enabled.
	actual_result=$(fastboot devices)
	echo "The actual_result is:$actual_result" >&2
	
	# expected response =
	#a3d8ba3a	fastboot
	#actual_result="filler"
	
	# export the fastboot result
	echo "$actual_result" > "${FASTBOOT_MODE_RESPONSE_PATH}"
	
	# TODO: get actual fastboot device id from return string
	# and allow variable fastboot device id string length
	echo "$actual_result{0:8}" > "${FASTBOOT_DEVICE_ID_PATH}"
	
	# read device_id from file
	device_id=$(head -c 8 "$FASTBOOT_DEVICE_ID_PATH")
	echo "device_id =$device_id"
	
	if [ "${actual_result:0:17}" == "$device_id	fastboot" ]; then
			
		# export fastboot mode check response
		echo "$actual_result" > "${FASTBOOT_MODE_RESPONSE_PATH}"
	fi
}
custom_verify_fastboot_mode_enabled "$@"
