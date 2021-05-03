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
			while :
			do
				read -p "We will now flash twrp to your phone. It is IMPORTANT that you keep your phone connected. Will you keep your phone connected?" yn
				if [ "$yn" == "y" ]
				then			
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
					while :
					do
						read -p "Yay, you have flashed twrp recovery on your fairphone.\n Now you need to press and hold POWER ON+VOLUME UP as soon as your phone shuts down, untill you see the blue TWRP screen.Will you do that?\n\n (Once you answer yes, we will wait 1 second for you to switch from keyboard to phone, and then send the shutdown signal.)" yn
						if [ "$yn" == "y" ]
						then			
							# note fastboot reboot recovery did not boot into recovery even though adb reboot recovery did.
							# Temporary solution, ask user to hold volume up and power on buttons simultaneuosly while phone boots.
							reboot_into_twrp=$(fastboot reboot)
							break;
						fi
					done
					
					# Obsolete info:
					# fastboot reboot
					# adb reboot recovery
					# is the same ad pressing power and volume up, goes into > "No command found."
					break;
				fi
			done
		else
			echo "THETWRPIMAGEWASNOTFOUND"
		fi
		
		

}
apt_update "$@"
