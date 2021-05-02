#!/bin/bash
source src/hardcoded_variables.txt

source src/apt_github.sh
source src/apt_signal.sh

install_user_choices() {
	selected_software_packages=($(read_software_packages "selected")) # outer brackets to store as list
	
	# loop through selected packages
	for i in "${!selected_software_packages[@]}"; do
		if [ "${selected_software_packages[i]}" == github ]; then
			$(install_github) # install user choice: github
		elif [ "${selected_software_packages[i]}" == signal ]; then
			$(install_signal) # install user choice: signal
		fi
	done
}

test_user_choice_installation() {
	selected_software_packages=($(read_software_packages "selected")) # outer brackets to store as list
	
	# loop through selected packages
	for i in "${!selected_software_packages[@]}"; do
		if [ "${selected_software_packages[i]}" == github ]; then
			test_github
		elif [ "${selected_software_packages[i]}" == signal ]; then
			test_signal
		fi
	done
}