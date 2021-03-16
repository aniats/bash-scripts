#!/bin/bash

SPECIES=""
DATE=""
PLACE=""
COMMENTS=""

echo "Please, specify bird species: "
while read -r LINE
do
    SPECIES="$LINE"
    break;
done
echo "Please, specify date and time in the following format:"
echo "dd-mm-yyyy hh:mm"
while read -r LINE
do
    DATE="$LINE"
    if [[ "$DATE" =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}[[:space:]][0-9]{2}:[0-9]{2}$ ]]; then
        break;
    else
        echo "Date format invalid, please try again";
    fi
done
echo "Please, specify place of the observation:"
while read -r LINE
do
    PLACE="$LINE"
    break;
done
echo "Any additional comments?"
while read -r LINE
do
    COMMENTS="$LINE"
    break;
done


DATE_PARTS=($DATE)

mkdir -p logs
echo "$SPECIES|$DATE|$PLACE|$COMMENTS" >> "logs/log-${DATE_PARTS[0]}.txt"
