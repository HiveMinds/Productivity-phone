#!/bin/bash
verify_adb_enabled() {
	
	# verify the adb debugging mode is enabled.
	actual_result=$(adb devices)
	if [ "${actual_result:0:24}" == "List of devices attached" ]; then
		#if [ "${actual_result:34:6}" == "device" ]; then
		if [ "${actual_result: -6}" == "device" ]; then
			# export device code
			device_code="${actual_result:25:8}"
			echo "$device_code" > "${DEVICE_ID_PATH}"
		#else
			#echo "nodevicecodefound" > "${LOG_PATH}"
		fi
	#else
		#echo "noadbdevices" > "${LOG_PATH}"
	fi
}
verify_adb_enabled "$@"
