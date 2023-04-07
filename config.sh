#!/bin/sh


local_path="/home/$USER/.config"
chezmoi_path="/home/$USER/.local/share/chezmoi/dot_config"


export CONFIGS=$(cat <<END
i3wm:$local_path/i3/config
lf:$chezmoi_path/lf/lfrc
kitty:$local_path/kitty/kitty.conf
picom:$local_path/picom/picom.conf
fish:$chezmoi_path/private_fish/config.fish
mimeapps:$chezmoi_path/mimeapps.list
External_Drives:/media/
nvim:$chezmoi_path/nvim/
END
)


GUM_CONFIG="\
    --cursor=* \
    --item.bold"


KEY=$(echo "$CONFIGS" | cut -d':' -f1 | gum choose $GUM_CONFIG)
CHOICE=$(echo "$CONFIGS" | grep $KEY | cut -d':' -f2)


$EDITOR $CHOICE

