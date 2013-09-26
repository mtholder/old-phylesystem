#!/bin/sh

for i in ./study/0/*.json; do
    echo "Validating ./study/0/$i"
    cat $i | python -mjson.tool > /dev/null
    if [ $? -ne 0 ]; then
        exit $?
    fi
done
