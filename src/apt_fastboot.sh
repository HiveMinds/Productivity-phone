#!/bin/bash
# Declare filenames of files that perform commands to install fastboot
install_fastboot() {
	
	# Declare filenames of files that perform commands
	declare -a arr=("apt_update"
                "apt_upgrade"
                "apt_install_fastboot"
                )
                	
	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_fastboot() {
	./test/libs/bats/bin/bats test/post_setup/test_apt_install_fastboot_postsetup.bats
}
