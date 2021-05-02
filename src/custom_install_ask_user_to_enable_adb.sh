#!/bin/bash
custom_install() {
	local LOG_PATH=$1
	
	# TODO: include gif display:https://unix.stackexchange.com/questions/317537/how-to-open-a-gif-without-loop-repetition-with-oeg
	# Note. gif in terminal is awesome but not practical because the chosen installation options and responses should remain visible.
	while true; do
		read -p "Please enable adb-debugging on your phone. See enable_adb.gif on how to do so. Answer y when done.?" yn
		case $yn in
		[Yy]* ) echo "true"; break;;
		* ) echo "Please answer yes or no.";;
		esac
		
		# is not executed
		# TODO: copy test content and move the break;; in line 10 only effective after the test is passed
		./test/libs/bats/bin/bats test/post_setup/test_custom_install_ask_user_to_enable_adb_postsetup.bats
	done
}
custom_install "$@"
