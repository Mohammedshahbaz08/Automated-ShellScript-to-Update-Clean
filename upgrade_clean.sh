#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove && sudo apt-get autoclean
sudo apt-get clean

# Removes old revisions of snaps
# Close all snaps prior to running the script
set -eu 
# -e shell immediately exits when command fails
# -u write message to standard error when shell tries to expand unset parameter


LANG=C snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
notify-send "System Updated-> Upgraded-> Cleaned!!"
