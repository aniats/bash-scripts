#!/bin/bash

TYPE="$1"

FIRST=""
SECOND=""

if [[ "$TYPE" == "month" ]]; then
    echo "Specify the starting month in the following format: mm-yyyy";
    while read LINE
    do
        if [[ "$LINE" =~ ^[0-9]{2}-[0-9]{4}$ ]]; then
            FIRST="01-$LINE"
            break;
        else
            echo "Invalid month format, please try again:"
            echo "Specify the starting month in the following format: mm-yyyy";
        fi
    done

    echo "Specify the ending month in the following format: mm-yyyy";
    while read LINE
    do
        if [[ "$LINE" =~ ^[0-9]{2}-[0-9]{4}$ ]]; then
            SECOND="01-$LINE"
            break;
        else
            echo "Invalid month format, please try again:"
            echo "Specify the ending month in the following format: mm-yyyy";
        fi
    done

elif [[ "$TYPE" == "days" ]]; then
    echo "Specify the starting day in the following format: dd-mm-yyyy";
    while read LINE
    do
        if [[ "$LINE" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
            FIRST="$LINE"
            break;
        else
            echo "Invalid day format, please try again:"
            echo "Specify the starting day in the following format: dd-mm-yyyy";
        fi
    done

    echo "Specify the ending day in the following format: dd-mm-yyyy";
    while read LINE
    do
        if [[ "$LINE" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]; then
            SECOND="$LINE"
            break;
        else
            echo "Invalid day format, please try again:"
            echo "Specify the ending day in the following format: dd-mm-yyyy";
        fi
    done
else
    echo "usage: ./stat.sh [month|day]"
    exit 0
fi

# echo $FIRST
# echo $SECOND

TARGET="logs/"*

TMP="tmp.tmp"
touch "$TMP"
for FILE in $TARGET; do 
    RAW=${FILE#"logs/log-"}
    RAW=${RAW%".txt"}
    if [[ "$RAW" < "$SECOND" || "$RAW" == "$SECOND" ]]; then
        if [[ "$RAW" > "$FIRST" || "$RAW" == "$FIRST" ]]; then
            while IFS='|' read -ra ADDR; do
                OCC=$(find logs -name "log-$RAW.txt" | xargs grep -E "$ADDR" | wc -l)
                echo "$ADDR" >> "$TMP"
            done <<< $(cat "logs/log-$RAW.txt")
        fi
    fi
done

touch "cnt.cnt"
while read NAME
do
    echo "$NAME : $(grep "$NAME" "$TMP" | wc -l)" >> "cnt.cnt"
done <<< $(cat "$TMP")

rm "$TMP"
cat "cnt.cnt" | uniq
rm "cnt.cnt"
