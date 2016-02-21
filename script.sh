#!/bin/bash

eval DIR="~/Desktop/test"

swiftc AbandonedConstraints/XMLParserDelegate.swift AbandonedConstraints/main.swift

find "$DIR" -name '*.storyboard' | while read line; do
    ./main $line
done
