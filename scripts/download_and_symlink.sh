#!/bin/bash
#
# "post-checkout" git hook.

set -eu

TESTCASE_DIRECTORY="testcases/"

cd "$(dirname "$(realpath $0)")/.."

mkdir -p .objects

echo Fetching latest object state...
gsutil -m rsync gs://jxl-conformance/objects/ .objects/

for t in $(find $TESTCASE_DIRECTORY -name test.json)
do
  ./scripts/list_shas.py $t | while read name sha
  do
    f=$(dirname $t)/$name
    rm -f $f
    echo Linking $name
    ln -s $(realpath --relative-to $(dirname $f) .objects/$sha) $f
  done
done
