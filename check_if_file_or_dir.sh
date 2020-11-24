#!/bin/bash
 
MY_PATH=$(dirname "$0")
FOLDER_NAME=$(date '+%Y-%m-%d-%H-%M-%S')
PASSED=$1

if [ -d "$PASSED" ]; then
	echo "is a dir";
else
	if [ -f "$PASSED" ]; then
		echo "is a file";
	else
		echo "is not valid";
	fi
fi

# mkdir $MY_PATH/backup/$FOLDER_NAME
# cp $MY_PATH/data/* $MY_PATH/backup/$FOLDER_NAME
# rm -r $FOLDER_NAME
