#!./test/libs/bats/bin/bats

load '../../test/libs/bats-support/load'
load '../../test/libs/bats-assert/load'

source src/hardcoded_variables.txt
source test/helper.sh

@test "Checking fastboot version response." {
	actual_result=$(fastboot devices)
	assert_equal "${actual_result:9:8}" "fastboot"
}