#!/bin/bash
custom_install() {
	local LOG_PATH=$1
	
	# TODO: include gif display:https://unix.stackexchange.com/questions/317537/how-to-open-a-gif-without-loop-repetition-with-oeg
	# Note. gif in terminal is awesome but not practical because the chosen installation options and responses should remain visible.
	x=1
	while :
	do
		x=$(( $x + 1 ))
		read -p "Please enable adb-debugging on your phone. See enable_adb.gif on how to do so. Answer y when don$x and $yn e.?" yn
		if [ "$yn" == "y" ]
		then
		
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
				break
			fi
			
		fi
	done
}
custom_install "$@"