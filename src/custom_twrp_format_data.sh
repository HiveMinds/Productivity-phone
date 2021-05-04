#!/bin/bash
# Declare filenames of files that perform commands to install github
custom_twrp_format_data() {
	
	# Declare filenames of files that perform commands
	# TODO: Install curl and test it
	declare -a arr=(
	"custom_install_twrp_format_data"
	 #"custom_install_twrp_advanced_wipe"
	)
                	
	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_custom_twrp_format_data() {
	./test/libs/bats/bin/bats test/post_setup/test_custom_twrp_format_data_postsetup.bats
}
