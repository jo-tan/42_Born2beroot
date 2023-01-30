#!/bin/bash

#Get the last character from system boot time and save it as an interger variable
declare -i d=`who -b | tail -c 2 | sed ' '`

#let the script pause for d mins
sleep "$d"m

#Variables
TOLDSK=$(df -Bg |grep /dev/ | grep -v /boot | awk '{td += $2} END {print td}')
USDDSK=$(df -m |grep /dev/ | grep -v /boot | awk '{ud += $3} END {print ud}')
PSTDSK=$(df -h |grep /dev/ | grep -v /boot | awk '{td += $2} {ud += $3} END {printf "%d", ud/td*100}')

#Broadcase with wall command
wall \
	$'#Architecture: ' `uname -a`\
	$'\n#CPU physical : ' `grep "physical id" /proc/cpuinfo | awk '{print $4}'`\
	$'\n#vCPU : ' `grep "processor" /proc/cpuinfo | wc -l`\
	$'\n#Memory Usage: ' `free -m | grep "Mem:" | awk '{printf "%d/%dMB (%.2f%%)", $3, $2, $3/$2*100}'`\
	$'\n#Disk Usage: ' `echo "${USDDSK}/${TOLDSK}Gb (${PSTDSK}%)"`\
	$'\n#CPU load: ' `top -bn1 | grep '%Cpu(s)' | cut -c9- | awk '{printf "%.1f%%", $1+$3}'`\
	$'\n#Last boot: ' `who -b | awk '{print $3, $4}'`\
	$'\n#LVM use: ' `cat /etc/fstab/ | [/dev/mapping/] | echo "Yes" || echo "No"`\
	$'\n#Connections TCP : ' `grep "TCP" /proc/net/sockstat | awk '{print $3, $2}'`\
	$'\n#User log:' `who | wc -l`\
	$'\n#Network: IP ' `hostname -I` `ip link | grep "link/ether" | awk '{printf "(%s)", $2}'`\
	$'\nSudo : ' `cat /var/log/sudo/sudo.log | wc -l` "cmd"
	

