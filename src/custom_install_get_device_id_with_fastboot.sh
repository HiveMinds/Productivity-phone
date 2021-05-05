#!/bin/bash
get_device_id_with_fastboot() {
	device_id=""
	while [ "$device_id" == "" ]
	do
		# Re-initialise variables within while loop
		addVar=()
		yn=""
		device_id=""

		# get the response
		for f in $(fastboot devices); do
			addVar+=("$f")
		done
		
		# check if device is recognised
		if [  "${addVar[1]}" == "fastboot" ]; then
			device_id="${addVar[0]}"
		fi
		
		# check if device id is detected
		if [ "$device_id" == "" ]; then
			read -p "The pc was not able to detect your phone, most likely you did not enable adb debugging. Please do so. Have you done that?" yn
		fi
	done
	echo "$device_id" > "${FASTBOOT_DEVICE_ID_PATH}"
}
get_device_id_with_fastboot "$@"