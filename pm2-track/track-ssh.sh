#!/bin/bash

while getopts "s:p:" opt
do
    case "${opt}" in
        s) SOURCE=${OPTARG};; # here goes an ssh connection addressee string
        p) PM2PROC=${OPTARG};; # here goes title of pm2 proc to be logged
    esac
done

if [ -z $SOURCE  ]
then
	echo "SSH connection string is undefined"
	exit -1
fi

if [ -z $PM2PROC ]
then
	echo "PM2 process title is undefined"
	exit -1
fi

# tracking is being made
# ^c to interrupt

ssh $SOURCE "pm2 logs $PM2PROC"
