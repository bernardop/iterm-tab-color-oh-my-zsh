tcDirsFilePath="$(dirname "$0")/.tc-dirs"
declare -A directoryColors
declare -a orderedDirectories
IFS="="
while read -r dirPath hexValue
do
  if ! ( [[ $dirPath == \#* ]]); then
	orderedDirectories+=( $dirPath )
  	directoryColors[$dirPath]+=$hexValue
  fi
done < $tcDirsFilePath

function directory_tab_color() {
  for k in $orderedDirectories; do
  	if ( [[ "$PWD" =~ "$k" ]] ); then
  	  iterm_tab_color "$directoryColors[$k]"
  	  return 0
  	fi
  done

  iterm_tab_color
}

function iterm_tab_color() {
  if [ $# -eq 0 ]; then
    # Reset tab color if called with no arguments
	echo -ne "\033]6;1;bg;*;default\a"
	return 0
  elif [ $# -eq 1 ]; then
    if ( [[ $1 == \#* ]] ); then
	  # If single argument starts with '#', skip first character to find hex value
	  RED_HEX=${1:1:2}
	  GREEN_HEX=${1:3:2}
	  BLUE_HEX=${1:5:2}
	else
	  # If single argument doesn't start with '#', assume it's hex value
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

	return 0
  fi

  # If more than 1 argument, assume 3 arguments were passed
  echo -ne "\033]6;1;bg;red;brightness;$1\a"
  echo -ne "\033]6;1;bg;green;brightness;$2\a"
  echo -ne "\033]6;1;bg;blue;brightness;$3\a"
}

alias tc='iterm_tab_color'
chpwd_functions=(${chpwd_functions[@]} "directory_tab_color")
directory_tab_color
