#!/bin/sh

MODE='MODE 1'
while true; do
    while true; do
        read -rsn1 input
        if [[ $input = "/" ]]; then
            echo "You pressed /"
            break
        elif [[ $input = "f" ]]; then
            echo "You pressed F"
            break
        fi
    done
done
