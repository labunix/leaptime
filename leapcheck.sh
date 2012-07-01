#!/bin/bash
set -e
echo $PATH | sed s/":"/"\n"/g | grep "^/usr/sbin\$" > /dev/null 2>&1 || \
  export PATH=/usr/sbin/${PATH}
echo $PATH | sed s/":"/"\n"/g | grep "^/sbin\$" > /dev/null 2>&1 || \
  export PATH=/sbin/${PATH}

if [ `id -u` -ne 0 ];then
  echo "Sorry,Not Permit User"
  exit 2
fi

if [ "x$1" == "x" ];then
  echo "Usage $0 [Parent-NTP-Server-IP or hostname]"
  exit 2
else
  PNTP="$1"
fi

/etc/init.d/ntp stop
ntpdate ${PNTP} || echo "ntpdate error"
/etc/init.d/ntp start

ntptime | grep "returns code 0" || exit 1

env LANG=C date '+%H:%M:%S' | \
  awk -F\: '{printf "%02d:%02d:%02d", $1, $2, (($3+3)%60)}' | \
  date -s "`xargs`";

cnt=0
while true;do
  echo ${cnt} | awk '{printf "%04d\n", $1}'
  let cnt=${cnt}+1
  ntptime | grep "returns code 0" && exit 0
  sleep 0.9;
done
