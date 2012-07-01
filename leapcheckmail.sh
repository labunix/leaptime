#!/bin/bash 

MDATE=`date '+%Y/%m/%d %H:%M'`
MFQDN=`hostname -f`
MUSER=`whoami`
MLOG=/var/log/ntpq.log
if [ `id -u` -eq "0" ];then
  echo "#\"leap=\" check ${MDATE}" >> ${MLOG}
  ntpq -c rv >> ${MLOG}
  sed s/"\,"/"\n"/g ${MLOG} | grep "leap=" | mail -s "ntpq leap second report : ${MDATE}" ${MUSER}@${MFQDN}
  exit 0
else
  echo "You must be root to exec $0"
  exit 1
fi
unset MDATE MFQDN MUSER MLOG
