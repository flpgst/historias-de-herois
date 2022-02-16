#!/bin/sh
set -e

export SERVICE=${SERVICE_NAME:-$(cat ${GITHUB_WORKSPACE}/package.json  | grep name | head -1 | sed 's/"name"://' | sed 's/[",]//g'| tr -d '[[:space:]]')}
export PACKAGE_VERSION=$(cat ${GITHUB_WORKSPACE}/package.json | grep version | head -1 | awk -F= "{ print $2 }" | sed 's/[version:,\",]//g' | tr -d '[[:space:]]')
echo "Service is $SERVICE:$PACKAGE_VERSION"
