#!/bin/bash
rm -r ./src/logs
# Run this file to run all the tests, once
#./test/libs/bats/bin/bats test/*.bats
#./test/libs/bats/bin/bats test/test_greedy_user.bats
#./test/libs/bats/bin/bats test/test_is_allowed_result_head.bats
#./test/libs/bats/bin/bats test/test_apt_install_git.bats
#./test/libs/bats/bin/bats test/test_apt_install_adb.bats
#./test/libs/bats/bin/bats test/test_apt_install_fastboot.bats
#./test/libs/bats/bin/bats test/test_custom_install_ask_user_to_enable_adb.bats
#./test/libs/bats/bin/bats test/test_custom_get_twrp.bats
#./test/libs/bats/bin/bats test/test_install_git_through_user_selection.bats  
#./test/libs/bats/bin/bats test/test_is_allowed_result_tail.bats
#./test/libs/bats/bin/bats test/post_setup  test_apt_install_signal.bats  
#./test/libs/bats/bin/bats test/test_is_allowed_result_contains.bats
#./test/libs/bats/bin/bats test/test_remainder_helper_functions.bats
./test/libs/bats/bin/bats test/test_apt_install_adb_reboot_bootloader.bats