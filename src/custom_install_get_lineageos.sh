#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	source src/hardcoded_variables.txt
	
	update=$(yes | curl $LINEAGEOS_URL > "$LINEAGEOS_FILEPATH")
	#curl --header 'Host: mirrors.dotsrc.org' --user-agent 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0' --header 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' --header 'Accept-Language: en-US,en;q=0.5' --header 'Upgrade-Insecure-Requests: 1' --header 'Sec-GPC: 1' 'https://mirrors.dotsrc.org/lineageos/full/FP2/20210430/lineage-17.1-20210430-nightly-FP2-signed.zip' --output 'lineage-17.1-20210430-nightly-FP2-signed.zip'
	echo $update > "${LOG_PATH}"
}
apt_update "$@"
