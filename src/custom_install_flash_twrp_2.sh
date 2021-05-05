#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	
	### Flash twrp to phone
	## Verify the md5 checksum of the TWRP image is correct.
	# Read out the md5 checksum of the downloaded social package.
	md5_of_social_package=$(sudo md5sum "$TWRP_FILEPATH")

	# Extract actual md5 checksum from the md5 command response.
	md5_of_social_package_head=${md5_of_social_package:0:32}

	# Assert the measured md5 checksum equals the hardcoded md5 checksum of the expected file.
	if [ "$md5_of_social_package_head" == "$TWRP_MD5" ]; then
	
		# Ask user to flash and not to turn the phone off.
		flashed_and_rebooted_into_twrp_successfully="false"
		while [ "$flashed_and_rebooted_into_twrp_successfully" == "false" ]
		do
			read -p "We will now flash twrp to your phone. It is IMPORTANT that you keep your phone connected. Will you keep your phone connected?" yn
			if [ "$yn" == "y" ]; then			
				# Flash phone.
				#update=$(fastboot reboot)
				update=$(fastboot flash recovery $TWRP_FILEPATH)
				echo $update > "${LOG_PATH}"
				
				
				# Source; https://forum.fairphone.com/t/twrp-3-2-1-0-fp2-img-not-functional-on-my-new-fairphone2/39079
				# AnotherElk explains that rebooting into adb after flashing twrp recovery makes the fairphone os overwrite
				# the recently flashed twrp with the default fairphone recovery. This is not desired, hence, directly after
				# flashing the twrp, one should reboot into recovery from the fastboot mode, instead of first going to 
				# reboot to adb/normal mode. Hence the flash command is followed by an attempted `
				# fastboot reboot recovery` command.
				# reboot into twrp:
				rebooted_into_recovery_mode="false"
				#while [ "$rebooted_into_recovery_mode" == "false" ]:
				#do
				#	read -p "When the screen goes black (1 sec after answering y), immediately press and hold  POWER ON+VOLUME UP till you see the blue TWRP screen. Will you  do that?" yn
				#	if [ "$yn" == "y" ]; then			
				#		# note fastboot reboot recovery did not boot into recovery even though adb reboot recovery did.
				#		# Temporary solution, ask user to hold volume up and power on buttons simultaneuosly while phone boots.
				#		reboot_into_twrp=$(fastboot reboot)
				#		
				#		sleep 20
				#		# TODO: verify the fastboot reboot was succesfull before proceeding.
				#		run_main_functions custom_install_get_device_id_with_fastboot
				#
				#		# read device id from file
				#		read -d $'\x04' fastboot_device_id < "$FASTBOOT_DEVICE_ID_PATH"
				#		
				#		if [ "$fastboot_device_id" != "" ]; then
				#			break;
				#		else
				#			echo "The device id did not have length 8, instead it consisted of:$device_id"
				#		fi
				#	fi
				#done
				while [ "$rebooted_into_recovery_mode" == "false" ]
				do
					#read -p "Please press and hold the POWER ON/OFF+VOLUME UP button untill the device reboots, AND while it is rebooting untill you see the blue TWRP screen. answer yes once you're done." yn # the device does not respond to holding this combination, perhaps because the computer controls it or because combo only is recognized in adb mode and not in fastboot mode.
					read -p "When the screen goes black (1 sec after answering y), immediately press and hold  POWER ON+VOLUME UP till you see the blue TWRP screen. Will you  do that?" yn
					if [ "$yn" == "y" ]; then
						sleep 1
						reboot_into_twrp=$(fastboot reboot)
						#reboot_into_twrp=$(fastboot reboot recovery) # try to boot automatically into twrp, returns: fastboot: usage: unknown reboot target recovery
						sleep 20
					fi
					
					# Verify if booted into twrp
					twrp_status_response=$(adb shell twrp print none)
					read -p "the first four characters of the responseis:${twrp_status_response:0:4}"
					if [ "${twrp_status_response:0:4}" == "none" ]; then
						#read -p "Succesfully booted into twrp." sink
						rebooted_into_recovery_mode="true"
						flashed_and_rebooted_into_twrp_successfully="true"
					else
						read -p "You did not reboot into twrp succesfully. That is okay, just restart this installer (CTRL+C) to stop it, and try again. Ignore the errors below." sink
						# TODO: Terminate installation.
					fi
				done
			fi
		done
	else
		echo "THETWRPIMAGEWASNOTFOUND"
	fi
}
apt_update "$@"
