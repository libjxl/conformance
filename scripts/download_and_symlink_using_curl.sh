#!/bin/bash
#
# "post-checkout" git hook.

set -eu

TESTCASE_DIRECTORY="testcases/"

cd "$(dirname "$(realpath $0)")/.."

mkdir -p .objects

echo -n Fetching latest object state
for URL in $(curl -s https://storage.googleapis.com/storage/v1/b/jxl-conformance/o | grep mediaLink | sed -e 's/.*"mediaLink":\s*"\(.*\)",/\1/'); do
	FILENAME=".objects/$(basename "${URL}" | sed -e 's/objects%2F\([^\?]\+\).*/\1/')"
	if [ -f "${FILENAME}" ]; then
		curl -s -z "${FILENAME}" -C - -o "${FILENAME}" "${URL}"
	else
		curl -s -o "${FILENAME}" "${URL}"
	fi
	echo -n .
done
echo done

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
