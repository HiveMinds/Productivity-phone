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

@test "running the apt install adb function in some file and verifying log output." {
	LOG_ENDING=$(head -c 115 $LOG_LOCATION"apt_install_adb.txt")
	EXPECTED_OUTPUT="Reading package lists... Building dependency tree... Reading state information... adb is already the newest version"
		
	assert_equal "$LOG_ENDING" "$EXPECTED_OUTPUT"
}

@test "Checking adb version response." {
	COMMAND_OUTPUT=$(adb --version)
	EXPECTED_OUTPUT="adb version 2."
		
	ALLOWED_RESULTS=(
			"Android Debug Bridge version 1."
			"Android Debug Bridge version 2."
        	"Android Debug Bridge version 3."
        	"Android Debug Bridge version 4."
        	"Android Debug Bridge version 5."
        	"Android Debug Bridge version 6."
        	"Android Debug Bridge version 7."
        	"Android Debug Bridge version 8."
        	"Android Debug Bridge version 9."
        )
	TEST_RESULT=$(actual_result_has_any_allowed_result_in_head "$COMMAND_OUTPUT" "${ALLOWED_RESULTS[@]}")
	
	assert_equal "$(echo -n "$TEST_RESULT" | tail -c 4)" "true"
}
