#!/bin/sh

for i in ./study/0/*.json; do
    echo "Validating $i"
    python -mjson.tool $i /dev/null || exit $?
done
