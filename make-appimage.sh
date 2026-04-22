#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=0.47.5
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=PATH_OR_URL_TO_ICON
export DEPLOY_OPENGL=1

# Deploy dependencies
quick-sharun /PATH/TO/BINARY_AND_LIBRARIES_HERE

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage

# Test the app for 12 seconds, if the test fails due to the app
# having issues running in the CI use --simple-test instead
quick-sharun --test ./dist/*.AppImage
