#!/bin/sh

CONFIG_PATH="$HOME/.config"

# SEARCH rules
# Enter Key: Executes
# Esc Key: Exits
# Ctrl + C: Exits
# Arrow Keys: Navigate
# HJKL: Navigate
# /: Set STATE to FZF

# FZF rules
# Enter Key: Executes
# Esc Key: Returns to CHOOSE
# Ctrl + C: Exits
# Arrow Keys: Navigate
# Regular Keys: Type

STATE='CHOOSE'
#STATE='FZF'

export CONFIGS=$(
    cat <<END
i3wm
lf
kitty
picom
fish
mimeapps
External_Drives
nvim
END
)

GUM_CONFIG="\
    --cursor=> \
    --item.bold"

KEY=$(echo "$CONFIGS" | gum choose $GUM_CONFIG)
CHOICE=$(echo "$CONFIGS" | grep $KEY)

# Create a switch case for each config
case $CHOICE in
i3wm)
    $EDITOR $CONFIG_PATH/i3/config
    ;;
lf)
    $EDITOR $CONFIG_PATH/lf/lfrc
    ;;
kitty)
    $EDITOR $CONFIG_PATH/kitty/kitty.conf
    ;;
picom)
    $EDITOR $CONFIG_PATH/picom/picom.conf
    ;;
fish)
    $EDITOR $CONFIG_PATH/private_fish/config.fish
    ;;
mimeapps)
    $EDITOR $CONFIG_PATH/mimeapps.list
    ;;
External_Drives)
    lf /media/
    ;;
nvim)
    lf $CONFIG_PATH/nvim/
    ;;

*)
    echo "Usage: config.sh [i3wm|lf|kitty|picom|fish|mimeapps|External_Drives|nvim]"
    ;;
esac
