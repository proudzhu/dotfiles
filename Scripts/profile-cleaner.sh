#!/bin/bash

do_clean() {
	bsize=$(ls -l "$1" | awk {'print $5'})
	sqlite3 "$1" vacuum &>/dev/null
	sqlite3 "$1" reindex &>/dev/null
	asize=$(ls -l "$1" | awk {'print $5'})
	dsize=$(echo "scale=2; ($bsize-$asize)/1048576" | bc)
	echo "$1" reduced by $dsize Mbytes
}

do_chromium() {
	prepath=$HOME/.config/chromium
	if [[ -h "$prepath" ]]; then
		path=$(readlink $prepath)
	else
		path="$prepath"
	fi

	if [[ ! -d "$path" ]]; then
		echo "Error: no profile directory for chromium found."
		exit 0
	fi

	for i in History Archived Safe; do
		find ${path} -maxdepth 2 -type f -name "$i*" -print0 | xargs -0 -n 1 -I {} bash -c "do_clean {} 2>/dev/null"
	done
}

do_chrome() {
	prepath=$HOME/.config/google-chrome
	if [[ -h "$prepath" ]]; then
		path=$(readlink $prepath)
	else
		path="$prepath"
	fi

	if [[ ! -d "$path" ]]; then
		echo "Error: no profile directory for chrome found."
		exit 0
	fi

	for i in History Archived Safe; do
		find ${path} -maxdepth 2 -type f -name "$i*" -print0 | xargs -0 -n 1 -I {} bash -c "do_clean {} 2>/dev/null"
	done
}

do_xulbased() {
	# prepath should be defined in the do_whatever function
	if [[ -h "$prepath" ]]; then
		path=$(readlink $prepath)
	else
		path="$prepath"
	fi

	if [[ ! -d "$path" ]]; then
		echo "Error: cannot locate $path"
		exit 0
	fi

	if [[ ! -f $path/profiles.ini ]]; then
		echo "Error: cannot locate $path/profiles.ini to determine names of profiles."
		exit 0
	fi

	# read each profile into the work array
	work=( $(grep Path $path/profiles.ini | sed -e 's/Path=//' -e 's/\r//') )

	for i in "${work[@]}"; do
		if [ ! -d ${path}/"$i" ]; then
			find $i -maxdepth 2 -name '*.sqlite' -print0 | xargs -0 -n 1 -I {} bash -c "do_clean {} 2>/dev/null"
	else
			find ${path}/$i -maxdepth 2 -name '*.sqlite' -print0 | xargs -0 -n 1 -I {} bash -c "do_clean {} 2>/dev/null"
		fi
	done
}

do_firefox() {
	prepath=$HOME/.mozilla/firefox
	do_xulbased
}

do_conkeror() {
	prepath=$HOME/.conkeror.mozdev.org/conkeror
	do_xulbased
}

do_thunderbird() {
	prepath=$HOME/.thunderbird
	do_xulbased
}

export -f do_clean

case "$1" in
	c)
		do_chromium
		exit 0
		;;

	gc)
		do_chrome
		exit 0
		;;	
	f)
		do_firefox
		exit 0
		;;
	ck)
		do_conkeror
		exit 0
		;;
	t)
		do_thunderbird
		exit 0
		;;
	*)
		echo "Usage $0 {c|ck|f|gc|t}"
		echo " c) chromium"
		echo "ck) conkeror"
		echo " f) firefox"
		echo "gc) google chrome"
		echo " t) thunderbird"
		exit 0
		;;
esac
