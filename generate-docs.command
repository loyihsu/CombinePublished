#!/bin/bash

mkdir ./docs-temp

xcodebuild docbuild -scheme CombinePublished \
    -destination generic/platform=iOS \
    OTHER_DOCC_FLAGS="--transform-for-static-hosting --hosting-base-path CombinePublished" \
    DOCC_OUTPUT_DIR=./docs-temp

rm -r ./docs/*
mv ./docs-temp/CombinePublished.doccarchive/* ./docs
rm -r ./docs-temp
