#!/bin/sh
# Shell script that runs commands from an interactive menu
# Mostly used for jumping to config files

# Check for gum dependancy
if ! command -v gum &> /dev/null
then
    
    echo "Command 'gum' could not be found.
    Please install it through your local package manager
    or download it from 'https://github.com/charmbracelet/gum'"
    exit
fi

# YAML Parser
function parse_yaml {
   local prefix=$2
   local s='[[:space:]]*' w='[a-zA-Z0-9_]*' fs=$(echo @|tr @ '\034')
   sed -ne "s|^\($s\):|\1|" \
        -e "s|^\($s\)\($w\)$s:$s[\"']\(.*\)[\"']$s\$|\1$fs\2$fs\3|p" \
        -e "s|^\($s\)\($w\)$s:$s\(.*\)$s\$|\1$fs\2$fs\3|p"  $1 |
   awk -F$fs '{
      indent = length($1)/2;
      vname[indent] = $2;
      for (i in vname) {if (i > indent) {delete vname[i]}}
      if (length($3) > 0) {
         vn=""; for (i=0; i<indent; i++) {vn=(vn)(vname[i])("_")}
         printf("%s%s%s=\"%s\"\n", "'$prefix'",vn, $2, $3);
      }
   }'
}

export CONFIGS=$(parse_yaml config.yaml)

GUM_CONFIG="\
    --header Gofigure\
    --header.bold\
    --header.foreground"


# Separate the keys from their values, runs gum filter
KEY=$(echo "$CONFIGS" | cut -d '=' -f 1 | gum filter $GUM_CONFIG)

# Selects the value for the given key
CHOICE=$(echo "$CONFIGS" | grep $KEY | cut -d '=' -f 2)

# Strips CHOICE of quotation marks and executes
eval "${CHOICE//\"/}"

