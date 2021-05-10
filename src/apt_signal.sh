#!/bin/bash
# Declare filenames of files that perform commands to install signal
install_signal() {
	
	# Declare filenames of files that perform commands
	declare -a arr=("apt_install_signal_1"
                "apt_install_signal_2"
                "apt_update"
                "apt_install_signal_4"
                )

	# Loop through files that perform commands
	for i in "${arr[@]}"
	do
		# run main functions that perform some commands
		run_main_functions "$i"
	done
}

test_signal() {
	./test/libs/bats/bin/bats test/post_setup/test_apt_install_signal_postsetup.bats
}
