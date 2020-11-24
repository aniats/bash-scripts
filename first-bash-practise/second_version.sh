#!/bin/bash
 
MY_PATH=$(dirname "$0")
echo $MY_PATH

FOLDER_NAME=$(date '+%Y-%m-%d-%H-%M-%S')
echo $FOLDER_NAME
mkdir $MY_PATH/backup/$FOLDER_NAME
cp $MY_PATH/data/* $MY_PATH/backup/$FOLDER_NAME
# rm -r $FOLDER_NAME
