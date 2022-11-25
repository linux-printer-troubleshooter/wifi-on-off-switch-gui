#!/bin/bash

name=$(nmcli device show |  grep -v wifi[-] | grep -B 1 wifi | grep -i general.device | awk '{print $2}');
status=$(nmcli device show $name | grep GENERAL.STATE | awk '{print $2}');
if [[ $status -eq 20 ]]
then
arg=$(zenity --forms --add-list="$name" --list-values="Off|On" --column-values="Select");
else
arg=$(zenity --forms --add-list="$name" --list-values="On|Off" --column-values="Select");
fi;


if [[ $arg == "On" ]];then nmcli radio wifi     on; fi; if [[ $arg == "Off" ]];then nmcli radio wifi off;fi
