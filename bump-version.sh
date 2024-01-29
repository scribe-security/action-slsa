#!/usr/bin/env bash
set -ex

version=$1
git checkout dev
git pull origin dev
git branch -D  prep_release/$version || true
git checkout -b prep_release/$version
sed -i "s/dev-latest/$version/g" action.yml
git add action.yml || true
git commit -m "bump version" || true
git push -f origin prep_release/$version || true