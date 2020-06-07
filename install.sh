#!/bin/bash

drive=$1
if [ -z "$drive" ]
then
  echo "No drive specified. Exiting..."
  exit 1
fi


if ! ./create-partitions.sh $drive
then
  echo "===== Creating partitions failed. Exiting..."
  exit 1
fi

if ! ./install-linux.sh $drive
then
  echo "===== Install failed. Exiting..."
  exit 1
fi

if ! ./configure-linux.sh
then
  echo "===== Configure failed. Exiting..."
  exit 1
fi

