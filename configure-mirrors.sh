#!/bin/bash

OPT="--color always -q --noprogressbar --noconfirm --logfile pacman-$0.log"
   
echo "===== MIRROR CONFIGURATION"
echo "===== Downloading latest mirrors"
curl -s https://www.archlinux.org/mirrorlist/all/ -o mirrorlist_download
cat mirrorlist_download |tail -n +6|grep -v -e "^$" > mirrorlist_trimmed
file="mirrorlist_trimmed"
file_out="mirrorlist_out"
rm -f $file_out
use_mirror=N
using_mirrors="United Kingdom, Germany"
echo "===== Using mirrors from: $using_mirrors"
while IFS= read line
do
        # display $line or do something with $line
    a=${line:0:2}
    if [ "$a" == "##" ]
    then
        country=${line:3:100}
        match=$(echo ${using_mirrors} | grep "${country}")
        if [ -n "$match" ]
        then
          use_mirror=Y
          echo -e "\n" >> $file_out
          echo "## ${country}" >> $file_out
        else
          use_mirror=N
        fi
        echo -n "."
    else
        if [ "$a" == "#S" ] && [ "$use_mirror" == "Y" ]
        then
            server=${line:1:300}
            echo "${server}" >> $file_out
        fi
    fi
done <"$file"
echo -e "\n" >> $file_out
echo -e "\n"

cp $file_out /etc/pacman.d/mirrorlist

