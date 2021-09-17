#!/bin/bash
get_device_id_with_adb() {
	
	device_id=""
while [ "$device_id" == "" ]
do
	# Re-initialise variables within while loop
	addVar=()
	yn=""
	device_id=""

	# get the response
	for f in $(adb devices); do
		addVar+=("$f")
	done
  
	if [  "${addVar[0]}" == "List" ]; then
		if [  "${addVar[1]}" == "of" ]; then
			if [  "${addVar[2]}" == "devices" ]; then
				if [  "${addVar[3]}" == "attached" ]; then
				
					# check if device is recognised
					if [  "${addVar[5]}" == "device" ]; then
						device_id="${addVar[4]}"
					fi
							
					# check if the adb is allowed.
					if [  "${addVar[5]}" == "unauthorized" ]; then
						read -rp "You did not give the computer permission to access your phone. Please reconnect your phone to the computer and press ok, when the pc asks for permmision. Have you done that?" yn
					fi
					
					# check if device id is detected
					if [ "$device_id" == "" ]; then
						if [ "$yn" == "" ]; then
							read -rp "The pc was not able to detect your phone, most likely you did not enable adb debugging. Please do so. Have you done that?" yn
						fi
					fi
				fi
			fi
		fi
	fi
	#echo "$device_id"
	echo "$device_id" > "${DEVICE_ID_PATH}"
done

}
get_device_id_with_adb "$@"