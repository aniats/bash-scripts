#!/bin/bash

function is_dir {
    if [ -d "$1" ]; then
        echo "dir";
    else
        echo "nodir";
    fi
}

function check_print {
    check=$(is_dir "$1")
    if [ "$check" = "nodir" ]; then
        echo "$2";
        exit 1;
    fi
}

if [[ $# -ne 1 ]]; then
    echo "usage: ./helper.sh path/to/directory";
    exit 1;
fi

ROOT="$1"
check_print "$ROOT" "Invalid argument - argument not a directory."
SOURCE="$ROOT/source"
check_print "$SOURCE" "Invalid argument - target directory does not contain 'source'."

RESULTS="$ROOT/results"
mkdir -p "$RESULTS"

for dir in "$SOURCE/"*
do
    TOTAL_FILES=$(find "$dir" -type f -name '*' -printf x | wc -c)
    if [ "$TOTAL_FILES" -ne 1 ]; then 
        echo "Student directory '$dir' has 0 or more than 1 files in it"; 
    else
        for FILE_NAME in "$dir/"*
        do
            FILE_TYPE=""
            for word in $(file --mime-type "$FILE_NAME");
            do
                FILE_TYPE="$word"
            done

            if [ "$FILE_TYPE" = "text/plain" ]; then
                less "$FILE_NAME"                 
                echo "Enter the mark for current student:"
                read -r MARK 
                mkdir -p "$RESULTS/$MARK"
                mv "$dir" "$RESULTS/$MARK"
            else
                echo "File '$FILE_NAME' is not plain text, skipping...";
            fi
        done
    fi
done
