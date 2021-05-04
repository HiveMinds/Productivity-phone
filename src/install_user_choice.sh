#!/bin/bash
source src/hardcoded_variables.txt

source src/apt_github.sh
source src/apt_signal.sh
source src/apt_adb.sh
source src/apt_fastboot.sh
source src/custom_ask_user_to_enable_adb.sh
source src/custom_get_twrp.sh
source src/custom_reboot_bootloader.sh
source src/custom_flash_twrp.sh
source src/custom_get_lineageos.sh
source src/custom_twrp_format_data.sh
source src/custom_sideload_lineage.sh

install_user_choices() {
	selected_software_packages=($(read_software_packages "selected")) # outer brackets to store as list
	
	# loop through selected packages
	for i in "${!selected_software_packages[@]}"; do
		if [ "${selected_software_packages[i]}" == github ]; then
			$(install_github) # install user choice: github
		elif [ "${selected_software_packages[i]}" == signal ]; then
			$(install_signal) # install user choice: signal
		elif [ "${selected_software_packages[i]}" == adb ]; then
			$(install_adb) # install user choice: adb
		elif [ "${selected_software_packages[i]}" == fastboot ]; then
			$(install_fastboot) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == enable_adb ]; then
			$(custom_ask_user_to_enable_adb) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == get_twrp ]; then
			$(custom_get_twrp) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == reboot_bootloader ]; then
			$(custom_reboot_bootloader) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == flash_twrp ]; then
			$(custom_flash_twrp) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == get_lineageos ]; then
			$(custom_get_lineageos) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == twrp_format_data ]; then
			$(custom_twrp_format_data) # install user choice: fastboot
		elif [ "${selected_software_packages[i]}" == sideload_lineage ]; then
			$(custom_sideload_lineage) # install user choice: fastboot
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
		elif [ "${selected_software_packages[i]}" == adb ]; then
			test_adb
		elif [ "${selected_software_packages[i]}" == fastboot ]; then
			test_fastboot
		elif [ "${selected_software_packages[i]}" == enable_adb ]; then
			#test_custom_ask_user_to_enable_adb
			pass="1"
		elif [ "${selected_software_packages[i]}" == get_twrp ]; then
			test_custom_get_twrp
		elif [ "${selected_software_packages[i]}" == reboot_bootloader ]; then
			#test_custom_reboot_bootloader
			pass="1"
		elif [ "${selected_software_packages[i]}" == flash_twrp ]; then
			#test_custom_flash_twrp
			pass="1"
		elif [ "${selected_software_packages[i]}" == get_lineageos ]; then
			test_custom_get_lineageos
		fi
	done
}