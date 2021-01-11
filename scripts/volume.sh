#!/bin/bash
l_volume=`amixer get Master | awk '/Limits/{ print $NF }'`
c_volume=`amixer get Master | awk -F'[ []' 'END { print $6 }'`

rate=10 #音量变化的百分比

function ajvolume(){
	echo $c_volume
	if [ $c_volume -lt 0 ]; then
		let c_volume=0
	elif [ $c_volume -gt $l_volume ];then
		let c_volume=$l_volume
	fi
	amixer sset Master $c_volume
}
if [ $1 = "+" ];then
	if [ $c_volume != $l_volume ]; then
		let c_volume+=$[l_volume*$rate/100]
		ajvolume
	fi
elif [ $1 = "-" ];then
	if [ $c_volume != 0 ]; then
		let c_volume-=$[l_volume*$rate/100]
		ajvolume
	fi
else
	echo 参数错误
fi

