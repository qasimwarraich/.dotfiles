#!/bin/bash

declare -i ID
# ID=`xinput list | grep -Eio '(touchpad|glidepoint)\s*id\=[0-9]{1,2}' | grep -Eo '[0-9]{1,2}'`
ID=`xinput list | grep -Eio '(touchpad|glidepoint|Synaptics TM3418-002)\s*id\=[0-9]{1,2}' | awk '{print $3}' | sed 's/id=//'`
declare -i STATE
STATE=`xinput list-props $ID|grep 'Device Enabled'|awk '{print $4}'`
if [ $STATE -eq 1 ]
then
    xinput disable $ID
    # echo "Touchpad disabled."
    notify-send 'Touchpad Disabled' -i input-touchpad
else
    xinput enable $ID
    # echo "Touchpad enabled."
    notify-send 'Touchpad Enabled' -i input-touchpad
fi
