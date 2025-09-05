#!/bin/sh
LEVEL=0
PVF="/etc/phextos.version"
if [ -f $PVF ]; then
  LEVEL=`cat $PVF`
fi
if [ $LEVEL -lt 1 ]; then
  apk add tmux openssh-server openssh-client git
  LEVEL=1
fi
if [ $LEVEL -lt 2 ]; then
  cp etc/network/interfaces /etc/network/
  cp etc/apk/repositories /etc/apk/
  rc-update add networking boot
  service networking restart
  LEVEL=2
fi
echo "PhextOS Ready"
echo "Level: $LEVEL"
echo -n $LEVEL >$PVF
