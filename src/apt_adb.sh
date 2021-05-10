#!/bin/bash
# Declare filenames of files that perform commands to install adb
install_adb() {
	
	# Declare filenames of files that perform commands
	declare -a arr=("apt_update"
                "apt_upgrade"
                "apt_install_adb"
                )
                	
	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_adb() {
	./test/libs/bats/bin/bats test/post_setup/test_apt_install_adb_postsetup.bats
}
