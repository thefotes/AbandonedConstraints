#!/bin/bash

eval DIR="~/Desktop/test"
eval asdf="~/Documents/TicketMaster/CoreApp-iOS"

swiftc AbandonedConstraints/XMLParserDelegate.swift AbandonedConstraints/main.swift

find "$asdf" \( -name '*.xib' -or -name '*.storyboard' \) | while read line; do
    thing=$(./main $line)
    if [ ! -z "$thing" ]; then
        echo "Deleting $thing in $line"
        IFS=","
        for constraint in $thing; do
            sed -i '' /"$constraint"/d $line
        done
        printf "\n"
    fi
done
