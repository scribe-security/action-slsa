#!/usr/bin/env bash

set -ex

new_version=$1
sed -i "s/latest/$new_version/g" action.yml
git add action.yml
git commit -m "bump version"

git tag -a $1 -m "bump version $1"

sed -i "s/$new_version/latest/g" action.yml
git add action.yml
git commit -m "presist latest"
