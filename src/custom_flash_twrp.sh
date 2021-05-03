#!/bin/bash
# Declare filenames of files that perform commands to install github
custom_flash_twrp() {
	
	# Declare filenames of files that perform commands
	# TODO: Install curl and test it
	declare -a arr=(
	"custom_install_flash_twrp"
	)
                	
	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_custom_flash_twrp() {
	./test/libs/bats/bin/bats test/post_setup/test_custom_flash_twrp_postsetup.bats
}
