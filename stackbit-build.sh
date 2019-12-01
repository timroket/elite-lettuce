#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5de3a6ffc3a9070019b01835/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5de3a6ffc3a9070019b01835
curl -s -X POST https://api.stackbit.com/project/5de3a6ffc3a9070019b01835/webhook/build/ssgbuild > /dev/null
jekyll build
curl -s -X POST https://api.stackbit.com/project/5de3a6ffc3a9070019b01835/webhook/build/publish > /dev/null
