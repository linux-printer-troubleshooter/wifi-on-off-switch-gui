#!/bin/bash
name=$(nmcli device show |  grep -v wifi[-] | grep -B 1 wifi | grep -i general.device | awk '{print $2}');arg=$(zenity --forms --add-list="$name" --list-values="On|Off" --column-values="Select");
if [[ $arg == "On" ]];then nmcli radio wifi     on; fi; if [[ $arg == "Off" ]];then nmcli radio wifi off;fi
