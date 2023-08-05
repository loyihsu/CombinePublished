#!/bin/bash
swift package --allow-writing-to-directory ./docs \
    generate-documentation --target CombinePublished \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path CombinePublished \
    --output-path ./docs
