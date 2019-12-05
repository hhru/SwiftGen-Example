#!/bin/sh

PODSROOT="$1"
OUTPUT_FILES=( ${SCRIPT_OUTPUT_FILE_0} ${SCRIPT_OUTPUT_FILE_1} )

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
