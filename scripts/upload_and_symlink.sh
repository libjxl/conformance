#!/bin/bash

FILES_PATTERN="-name *.icc -o -name *.npy -o -name *.jpg"
TESTCASE_DIRECTORY="testcases/"

cd "$(dirname "$(realpath $0)")/.."

mkdir -p .objects

echo Fetching latest object state...
gsutil -m rsync gs://jxl-conformance/objects/ .objects/

for f in $(find "${TESTCASE_DIRECTORY}" \( $FILES_PATTERN \) -type f)
do
  echo Replacing $f
  sha=$(sha256sum $f | cut -f 1 -d ' ')
  # Update test.json
  ./scripts/update_sha.py $(basename $f) $sha $(dirname $f)/test.json
  if [ -f .objects/$sha ]
  then
    rm $f 
  else
    mv $f .objects/$sha
  fi
  ln -s $(realpath --relative-to $(dirname $f) .objects/$sha) $f
done

echo Pushing changes...
gsutil -m rsync .objects/ gs://jxl-conformance/objects/
