#!/bin/bash
 
MY_PATH=$(dirname "$0")
FOLDER_NAME=$(date '+%Y-%m-%d-%H-%M-%S')
PASSED=$1

if [ -d "$PASSED" ]; then
	# echo "is a dir";
	BACKUP_FOLDER=$PASSED
else
	BACKUP_FOLDER="$MY_PATH/backup"
	# if [ -f "$PASSED" ]; then
	#	echo "is a file";
	# else
	#	echo "is not valid";
	# fi
fi

mkdir "$BACKUP_FOLDER"/"$FOLDER_NAME"
cp "$MY_PATH"/data/* "$BACKUP_FOLDER"/"$FOLDER_NAME"
