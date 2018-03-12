#!/bin/sh
set -e

echo "RUNNING TESTS"
for f in `find tests/test_*.sh`; do
    echo "running ${f}"
    ./${f} || exit 1
done
echo "TESTS OK"
