#!./test/libs/bats/bin/bats

load '../../test/libs/bats-support/load'
load '../../test/libs/bats-assert/load'

source src/hardcoded_variables.txt
source test/helper.sh

# TODO: include testing md5 of Fairphone OS in case the selected os is Fairphone OS instead of LineageOS
# (See custom_install_get_lineageos.sh)
# TODO: rename get_lineageos.sh to get_os.sh
@test "Verifying the lineageos md5 is as expected." {
	
	# Read out the md5 checksum of the downloaded social package.
	md5_of_social_package=$(sudo md5sum "$LINEAGEOS_FILEPATH")
	
	# Extract actual md5 checksum from the md5 command response.
	md5_of_social_package_head=${md5_of_social_package:0:32}
	
	# Assert the measured md5 checksum equals the hardcoded md5 checksum of the expected file.
	assert_equal "$md5_of_social_package_head" "$LINEAGEOS_MD5"
}
