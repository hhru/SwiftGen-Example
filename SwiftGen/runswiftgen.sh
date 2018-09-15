#!/bin/bash

SRCROOT="$1"
PODSROOT="$2"

if [ -f $SRCROOT/SwiftGenExample/Image.swift ]; then
    chmod +w $SRCROOT/SwiftGenExample/Image.swift
fi
if [ -f $SRCROOT/SwiftGenExample/Localization.swift ]; then
    chmod +w $SRCROOT/SwiftGenExample/Localization.swift
fi
$PODSROOT/SwiftGen/bin/swiftgen config run --config SwiftGen/swiftgen.yml
chmod -w $SRCROOT/SwiftGenExample/Image.swift
chmod -w $SRCROOT/SwiftGenExample/Localization.swift
