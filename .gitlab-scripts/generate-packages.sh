#!/bin/sh
set -eu

PACKAGES=`realpath "${1}"`
mkdir -p "${PACKAGES}"

find . -name 'cookiecutter*' -prune -o -name setup.py -print | while read path; do
    (cd "`dirname ${path}`" && python setup.py sdist && cp dist/* "${PACKAGES}")
done
