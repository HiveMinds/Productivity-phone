#!./test/libs/bats/bin/bats

load '../../test/libs/bats-support/load'
load '../../test/libs/bats-assert/load'

source src/hardcoded_variables.txt
source test/helper.sh

@test "running the apt update function in some file and verifying log output." {
	LOG_CONTENT=$(cat $LOG_LOCATION"apt_update.txt")
        ALLOWED_RESULTS=("Reading package lists... Building dependency tree... Reading state information... All packages are up to date."
        	"packages can be upgraded. Run 'apt list --upgradable' to see them."
        )
	TEST_RESULT=$(actual_result_has_any_allowed_result_in_tail "$LOG_CONTENT" "${ALLOWED_RESULTS[@]}")
	
	assert_equal "$(echo -n "$TEST_RESULT" | tail -c 4)" "true"
}

@test "running the apt upgrade function in some file and verifying log output." {
	LOG_ENDING=$(tail -c 11 $LOG_LOCATION"apt_upgrade.txt")
	EXPECTED_OUTPUT=" upgraded."
		
	assert_equal "$LOG_ENDING" "$EXPECTED_OUTPUT"
}

@test "running the apt install fastboot function in some file and verifying log output." {
	LOG_ENDING=$(head -c 120 $LOG_LOCATION"apt_install_fastboot.txt")
	EXPECTED_OUTPUT="Reading package lists... Building dependency tree... Reading state information... fastboot is already the newest version"
		
	assert_equal "$LOG_ENDING" "$EXPECTED_OUTPUT"
}

@test "Checking fastboot version response." {
	COMMAND_OUTPUT=$(fastboot --version)
		
	ALLOWED_RESULTS=(
			"fastboot version 1:"
			"fastboot version 2:"
        	"fastboot version 3:"
        	"fastboot version 4:"
        	"fastboot version 5:"
        	"fastboot version 6:"
        	"fastboot version 7:"
        	"fastboot version 8:"
        	"fastboot version 9:"
        )
	TEST_RESULT=$(actual_result_has_any_allowed_result_in_head "$COMMAND_OUTPUT" "${ALLOWED_RESULTS[@]}")
	
	assert_equal "$(echo -n "$TEST_RESULT" | tail -c 4)" "true"
}
