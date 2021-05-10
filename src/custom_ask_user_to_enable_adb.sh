#!/bin/bash
# Declare filenames of files that perform commands to install github
custom_ask_user_to_enable_adb() {
	
	# Declare filenames of files that perform commands
	declare -a arr=(
		"custom_install_ask_user_to_enable_adb"
		"custom_verify_adb_enabled"
	)
                	
	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_custom_ask_user_to_enable_adb() {
	./test/libs/bats/bin/bats test/post_setup/test_custom_install_ask_user_to_enable_adb_postsetup.bats
}
