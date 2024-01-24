#!/bin/bash

for file in $(find about -name "*.rb"); do
    ruby "$file"
    if (( $? != 0 )); then
        exit 1
    fi
done