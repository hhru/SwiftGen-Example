#!/bin/sh

PODSROOT="$1"
OUTPUT_FILES=()

COUNTER=0
while [ $COUNTER -lt ${SCRIPT_OUTPUT_FILE_COUNT} ];
do
    tmp="SCRIPT_OUTPUT_FILE_$COUNTER"
    OUTPUT_FILES+=(${!tmp})
    COUNTER=$[$COUNTER+1]
done

for file in "${OUTPUT_FILES[@]}"
do
    if [ -f $file ]
    then
        chmod a=rw "$file"
    fi
done

$PODSROOT/SwiftGen/bin/swiftgen config run --config SwiftGen/swiftgen.yml

for file in "${OUTPUT_FILES[@]}"
do
    chmod a=r "$file"
done
