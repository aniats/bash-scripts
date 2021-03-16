#!/bin/bash

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
