#!./test/libs/bats/bin/bats

load '../../test/libs/bats-support/load'
load '../../test/libs/bats-assert/load'

source src/hardcoded_variables.txt
source test/helper.sh

@test "Checking if adb devices is enabled." {
	actual_result=$(adb devices)
	assert_equal "${actual_result:0:24}" "List of devices attached"
	assert_equal "${actual_result:34:6}" "device"
}