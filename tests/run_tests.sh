#!/usr/bin/env bash
set -e

PYCMD=${PYCMD:="python"}


if [[ $COVERAGE -eq 1 ]]; then
    coverage erase
    PYCMD="coverage run --parallel-mode --source antspy "
    echo "coverage flag found. Setting python command to: \"$PYCMD\""
fi

pushd "$(dirname "$0")"


echo "Running core tests"
$PYCMD test_core_ants_image.py $@
$PYCMD test_core_ants_image_io.py $@

echo "Running registation tests"
$PYCMD test_registation.py $@

echo "Running segmentation tests"
$PYCMD test_segmentation.py $@

echo "Running bug tests"
$PYCMD test_bugs.py $@

popd
