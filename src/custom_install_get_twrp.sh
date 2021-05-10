#!/bin/bash
apt_update() {
	local LOG_PATH=$1
	
	source src/hardcoded_variables.txt
	
	update=$(yes | curl $TWRP_URL > "$TWRP_PATH")	
	update=$(curl --header "Host: dl.twrp.me" --user-agent "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:88.0) Gecko/20100101 Firefox/88.0" --header "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8" --header "Accept-Language: en-US,en;q=0.5" --referer "$TWRP_URL" --header "Upgrade-Insecure-Requests: 1" --header "Sec-GPC: 1" "$TWRP_LINK" --output "$TWRP_FILEPATH")
	
	echo $update > "${LOG_PATH}"
}
apt_update "$@"
