tcConfigFilePath="$(dirname "$0")/.tc-config"
declare -A tcConfigColors
declare -a orderedConfig
while IFS="=" read -r configKey hexValue || [ -n "$hexValue" ]; do
  if ! ( [[ $configKey == \#* ]]); then
    orderedConfig+=( $configKey )
    tcConfigColors[$configKey]+=$hexValue
  fi
done < $tcConfigFilePath

function directory_tab_color() {
  try_set_tab_color "$PWD"
}

function command_tab_color() {
  try_set_tab_color "$1"
}

function try_set_tab_color() {
  for k in $orderedConfig; do
    if ( [[ "$1" =~ "$k" ]] ); then
      iterm_tab_color "$tcConfigColors[$k]"
      return 0
    fi
  done
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
preexec_functions=(${preexec_functions[@]} "command_tab_color")
precmd_functions=(${precmd_functions[@]} "directory_tab_color")
