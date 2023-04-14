#!/bin/bash
# Shell script that can flip a variable based on live keyboard input

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

CHOOSE_CONFIG="\
--cursor=> \
--item.bold"

STATE="CHOOSE"

function changeState(){
    if [[ $STATE == "CHOOSE" ]]; then
        STATE="FZF"
    else
        STATE="CHOOSE"
    fi
}

while true; do
    while true; do
        KEY=$(echo "$CONFIGS" | gum choose $CHOOSE_CONFIG)
        CHOICE=$(echo "$CONFIGS" | grep $KEY)
        read -rsn1 INPUT
        # if [[ $INPUT = "/" && $STATE = "CHOOSE"]]; then
        #     STATE="FZF"
        #     break
        #     elif [[ $input = "y" ]]; then
        #     echo "STATE: $STATE"
        #     break
        #     elif [[ $input = "q" ]]; then
        #     echo "Exiting..."
        #     exit 0
        #     elif [[ $input = $'\e' ]]; then
        #     echo "Exiting..."
        #     exit 0
        case $INPUT in
            "/")
                changeState
                break
            ;;
            "q")
                echo "Exiting..."
                exit 0
            ;;
            $'\e')
                echo "Exiting..."
                exit 0
            ;;
            # Create a switch case for each config
            else
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
            
        fi
    done
done


