#!/bin/bash
 
# PATH=$(dirname "$0")
# echo $PATH

INFO=$(date '+%Y-%m-%d-%H-%M-%S')
echo $INFO
cd backup
mkdir $INFO
printf $(ls -a)
# rm -r $INFO
cp ../data/* $INFO
rm -r $INFO
