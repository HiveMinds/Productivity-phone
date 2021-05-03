#!./test/libs/bats/bin/bats

load '../../test/libs/bats-support/load'
load '../../test/libs/bats-assert/load'

source src/hardcoded_variables.txt
source test/helper.sh

@test "Checking if adb devices is enabled after fastboot reboot after flashing." {
	actual_result=$(adb shell twrp print none)
	assert_equal "${actual_result:0:4}" "none"
	assert_equal "${actual_result:6:27}" "Done processing script file"
}