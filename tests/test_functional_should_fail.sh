#!/bin/sh

# should fail because KBC_PARAMETER_OUTFILENAME is not set
mkdir -p /data/in/tables /data/out/tables
echo "foo,bar" > /data/in/tables/foo.csv
echo "baz,qux" > /data/in/tables/baz.csv

# export KBC_PARAMETER_OUTFILENAME='spam.csv'
function expect_fail() {
    echo $1
    exit 1
}
export KBC_DATADIR='/data'
./main.sh

# last command
if [[ $? -eq 0 ]]
then
    echo "Should have failed since KBC_PARAMETER_OUTFILENAME is not set"
    exit 1
else
    echo "main.sh failed and that's ok"
    exit 0
fi
