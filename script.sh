#!/bin/bash

set -e

eval DIR=$1

if [ -z "$DIR" ]; then
    echo "Invalid directory entered"
    exit 1
fi

swiftc AbandonedConstraints/XMLParserDelegate.swift AbandonedConstraints/main.swift

find "$DIR" \( -name '*.xib' -or -name '*.storyboard' \) | while read line; do
    constraints=$(./main $line)
    if [ ! -z "$constraints" ]; then
        echo "Deleting $constraints in $line"
        IFS=","
        for constraint in $constraints; do
            sed -i '' /"$constraint"/d $line
        done
        printf "\n"
    fi
done
