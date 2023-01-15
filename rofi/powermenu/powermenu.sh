#!/bin/bash

declare -A actions

shutdown=("")
reboot=("")
logout=("")

actions[$shutdown]="systemctl poweroff"
actions[$reboot]="systemctl reboot"
actions[$logout]="loginctl terminate-session ${XDG_SESSION_ID-}"

buttons=($shutdown $reboot $logout)

for i in ${!buttons[@]};
  do echo ${buttons[$i]}
done

test=${@}
eval ${actions[$test]}
