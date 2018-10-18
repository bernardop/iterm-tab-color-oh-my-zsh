iterm-tab-color() {
	if [ $# -eq 1 ]; then
		if ( [[ $1 == \#* ]] ); then
			RED_HEX=${1:1:2}
			GREEN_HEX=${1:3:2}
			BLUE_HEX=${1:5:2}
		else
			RED_HEX=${1:0:2}
			GREEN_HEX=${1:2:2}
			BLUE_HEX=${1:4:2}
		fi

		RED=$(( 16#${RED_HEX} ))
		GREEN=$(( 16#${GREEN_HEX} ))
		BLUE=$(( 16#${BLUE_HEX} ))

		echo -ne "\033]6;1;bg;red;brightness;$RED\a"
    	echo -ne "\033]6;1;bg;green;brightness;$GREEN\a"
    	echo -ne "\033]6;1;bg;blue;brightness;$BLUE\a"

    	return 1
	fi

	echo -ne "\033]6;1;bg;red;brightness;$1\a"
    echo -ne "\033]6;1;bg;green;brightness;$2\a"
    echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

alias tc='iterm-tab-color'