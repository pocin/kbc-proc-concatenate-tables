#!/bin/sh
set -e
mkdir -p /data/in/tables /data/out/tables
echo "foo,bar" > /data/in/tables/foo.csv
echo "baz,qux" > /data/in/tables/baz.csv

export KBC_PARAMETER_OUTFILENAME='spam.csv'
export KBC_DATADIR='/data'
./main.sh
RESULT_FILE=/data/out/tables/spam.csv

NO_LINES=$(wc -l $RESULT_FILE | cut -d ' ' -f 1)

if [[ $NO_LINES -eq 2 ]]
then
    echo "functional test ok"
    exit 0
else
    echo "resulting ${RESULT_FILE} has ${NO_LINES} lines, expected 2"
    cat ${RESULT_FILE}
    exit 1
fi

