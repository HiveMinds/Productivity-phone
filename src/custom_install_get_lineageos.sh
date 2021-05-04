#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	source src/hardcoded_variables.txt
	
	# Determine which os is selected.
	if [ "$OS_CHOICE" == "fairphone" ]; then
		os_filepath="$FAIRPHONE_FILEPATH"
		os_url="$FAIRPHONE_OS_URL"
		expected_md5_of_os_zip="$FAIRPHONE_MD5"
	elif [ "$OS_CHOICE" == "fairphone" ]; then
		os_filepath="$LINEAGEOS_FILEPATH"
		os_url="$LINEAGEOS_URL"
		expected_md5_of_os_zip="$LINEAGEOS_MD5"
	fi
	
	## check if the file is already downloaded, if not , download it.
	# TODO: if file exists
	
	# Read out the md5 checksum of the downloaded social package.
	md5_of_os_zip=$(sudo md5sum "$os_filepath")
	
	# Extract actual md5 checksum from the md5 command response.
	md5_of_os_zip_head=${md5_of_os_zip:0:32}
	
	# Assert the measured md5 checksum equals the hardcoded md5 checksum of the expected file.
	if [ "$md5_of_os_zip_head" != "$expected_md5_of_os_zip" ]; then
	 
	
		update=$(yes | curl $os_url > "$os_filepath")
		#curl --header 'Host: mirrors.dotsrc.org' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-GPC: 1' 'https://mirrors.dotsrc.org/lineageos/full/FP2/20210430/lineage-17.1-20210430-nightly-FP2-signed.zip' --output 'lineage-17.1-20210430-nightly-FP2-signed.zip'
		echo $update > "${LOG_PATH}"
	fi
}
apt_update "$@"
