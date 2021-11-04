#!/bin/bash
cd $(dirname $0)/..

TMPDIR=$(mktemp -d)

cleanup() {
  rm -rf ${TMPDIR}
}

trap cleanup EXIT

mkdir $TMPDIR/conformance
cp scripts/lcms2.py scripts/conformance.py $TMPDIR/conformance

rsync -zrvL --include="*/" --include="*.npy" --include="*.json" \
  --include="*.jpg" --include="*.icc" --include "*.txt" --include "*.jxl" \
  --exclude="*" testcases $TMPDIR/conformance

DIR=$(realpath $(pwd))

cd ${TMPDIR}
zip -r conformance.zip conformance/*
mv conformance.zip $DIR
cd $DIR
