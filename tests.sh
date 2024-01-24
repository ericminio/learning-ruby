#!/bin/bash

files=$(find about -name "*.rb")
for file in ${files[@]}; do
    ruby "$file"
    if (( $? != 0 )); then
        exit 1
    fi
done