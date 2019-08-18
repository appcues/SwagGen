#!/usr/bin/env bash
set -e

# Delete previous framework output.

if [ -d "Yams.framework" ]; then
  rm -rf "Yams.framework"
fi

# Build the framework for device and for simulator.

xcodebuild clean build \
-workspace "SwagGen.xcworkspace" \
-scheme "Yams" \
-configuration Release \
-sdk 'iphoneos' \
ONLY_ACTIVE_ARCH=NO \
ARCHS='i386 x86_64 armv7 arm64' \
IPHONEOS_DEPLOYMENT_TARGET=10 \
ENABLE_BITCODE=YES \
OTHER_CFLAGS='-fembed-bitcode' \
BITCODE_GENERATION_MODE=bitcode \
SYMROOT="./Build" \
OBJROOT="./Build"

xcodebuild build \
-workspace "SwagGen.xcworkspace" \
-scheme "Yams" \
-configuration Release \
-sdk 'iphonesimulator' \
ONLY_ACTIVE_ARCH=NO \
ARCHS='i386 x86_64 armv7 arm64' \
IPHONEOS_DEPLOYMENT_TARGET=10 \
ENABLE_BITCODE=YES \
OTHER_CFLAGS='-fembed-bitcode' \
BITCODE_GENERATION_MODE=bitcode \
SYMROOT="./Build" \
OBJROOT="./Build"

DEVICE_FRAMEWORK=./Build/Release-iphoneos/Yams.framework
SIMULATOR_FRAMEWORK=./Build/Release-iphonesimulator/Yams.framework

# Use correct generated framework paths.
# Sometimes Xcode / xcodebuild switches these between ${SRCROOT}/Build/Release-iphoneos/Appcues/Appcues.framework
# and ${SRCROOT}/Build/Release-iphoneos/Appcues.framework

if [ ! -d "${DEVICE_FRAMEWORK}" ]; then
  DEVICE_FRAMEWORK=./Build/Release-iphoneos/Yams/Yams.framework
fi

if [ ! -d "${SIMULATOR_FRAMEWORK}" ]; then
  SIMULATOR_FRAMEWORK=./Build/Release-iphonesimulator/Yams/Yams.framework
fi

# Merge simulator & device swiftmodules

cp -R "./Build/Release-iphonesimulator/Yams.framework/Modules/Yams.swiftmodule/." "./Build/Release-iphoneos/Yams.framework/Modules/Yams.swiftmodule"

# Copy the device version of the framework.

cp -rf "${DEVICE_FRAMEWORK}" "./Yams.framework"

# Merge device executable with simulator executable and overwrite framework executable with merged.

lipo -create \
"${DEVICE_FRAMEWORK}/Yams" \
"${SIMULATOR_FRAMEWORK}/Yams" \
-output "./Yams.framework/Yams"
