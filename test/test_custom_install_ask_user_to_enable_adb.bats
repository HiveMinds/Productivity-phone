#!./test/libs/bats/bin/bats

load 'libs/bats-support/load'
load 'libs/bats-assert/load'

source test/helper.sh
source src/hardcoded_variables.txt
source src/helper.sh

# TODO: execute arguments to answer yes to enable adb debugging and verify if it is enabled.

@test "Checking fastboot version response." {
	actual_result=$(adb devices)
	assert_equal "${actual_result:0:24}" "List of devices attached"
	assert_equal "${actual_result:34:6}" "device"
}