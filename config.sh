#!/bin/sh

local_path="/home/$USER/.config"
chezmoi_path="/home/$USER/.local/share/chezmoi/dot_config"

export CONFIGS=$(cat <<END
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
    --cursor=* \
    --item.bold"


KEY=$(echo "$CONFIGS" | gum choose $GUM_CONFIG)
CHOICE=$(echo "$CONFIGS" | grep $KEY | cut -d':' -f2)

# Create a switch case for each config
case $CHOICE in
    i3wm)
        $EDITOR $local_path/i3/config
        ;;
    lf)
        $EDITOR $chezmoi_path/lf/lfrc
        ;;
    kitty)
        $EDITOR $local_path/kitty/kitty.conf
        ;;
    picom)
        $EDITOR $local_path/picom/picom.conf
        ;;
    fish)
        $EDITOR $chezmoi_path/private_fish/config.fish
        ;;
    mimeapps)
        $EDITOR $chezmoi_path/mimeapps.list
        ;;
    External_Drives)
        lf /media/
        ;;
    nvim)
        lf $chezmoi_path/nvim/
        ;;

    *)
        echo "Usage: config.sh [i3wm|lf|kitty|picom|fish|mimeapps|External_Drives|nvim]"
        ;;
esac
