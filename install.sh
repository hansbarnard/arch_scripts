#!/bin/bash

export USER_NAME=hansbarnard

drive=$1
if [ -z "$drive" ]
then
  echo "No drive specified. Exiting..."
  exit 1
fi

if ! ./isoroot/pre-install.sh
then
  echo "===== Initialization failed. Exiting..."
  exit 1
fi


if ! ./isoroot/partitions-install.sh $drive
then
  echo "===== Creating partitions failed. Exiting..."
  exit 1
fi

if ! ./isoroot/linux-install.sh $drive
then
  echo "===== Install failed. Exiting..."
  exit 1
fi

if ! ./chroot-install.sh
then
  echo "===== Configure failed. Exiting..."
  exit 1
fi

