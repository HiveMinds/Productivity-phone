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
			while :
			do		
	
				# Ask user to flash and not to turn the phone off.
				# Flash phone.
				update=$(fastboot reboot)	
				echo $update > "${LOG_PATH}"
				break;
				done
		else
			echo "THETWRPIMAGEWASNOTFOUND"
		fi
		
		

}
apt_update "$@"
