#!/bin/bash

TYPE="$1"

if [[ "$TYPE" == "all" ]]; then
    PREFIX="*.txt"
elif [[ "$TYPE" == "day" ]]; then
    echo "Specify the day in the following format: dd-mm-yyyy";
    while read -r LINE
    do
        if [[ "$LINE" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
            PREFIX="log-$LINE.txt"
            break;
        else
            echo "Invalid day format, please try again:"
        fi
    done
else 
    echo "usage: ./day-or-all.sh [all|day]"
    exit 0
fi

TARGET="logs/"$PREFIX

TMP="tmp.tmp"
touch "$TMP"
for FILE in $TARGET; do 
    while IFS='|' read -ra ADDR; do
        OCC=$(find logs -name "$PREFIX" | xargs grep -E "$ADDR" | wc -l)
        echo "$ADDR : $OCC" >> "$TMP"
    done <<< "$(cat "$FILE")"
done
cat "$TMP" | uniq
rm "$TMP"
