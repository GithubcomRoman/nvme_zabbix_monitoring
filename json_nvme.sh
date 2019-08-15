#!/bin/bash

list=`lsblk | grep nvme | grep disk | awk '{print $1}'`

JSON=$(for i in $list; do printf "{\"{#NVME_DISK}\":\"$i\"},"; done | sed 's/^\(.*\).$/\1/')

printf "{\"data\":["
printf "$JSON"
printf "]}"