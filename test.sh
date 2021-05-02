#!/bin/bash
rm -r ./src/logs
# Run this file to run all the tests, once
./test/libs/bats/bin/bats test/*.bats
#./test/libs/bats/bin/bats test/test_apt_install_git.bats
#./test/libs/bats/bin/bats test/test_apt_install_signal.bats
#./test/libs/bats/bin/bats test/test_ask_user_choice.bats