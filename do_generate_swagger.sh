#!/usr/bin/env bash
set -e

# Delete previous framework output.

if [ -d "Swagger.framework" ]; then
  rm -rf "Swagger.framework"
fi

# Build the framework for device and for simulator.

xcodebuild clean build \
-workspace "SwagGen.xcworkspace" \
-scheme "Swagger" \
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
-scheme "Swagger" \
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

DEVICE_FRAMEWORK=./Build/Release-iphoneos/Swagger.framework
SIMULATOR_FRAMEWORK=./Build/Release-iphonesimulator/Swagger.framework

# Use correct generated framework paths.
# Sometimes Xcode / xcodebuild switches these between ${SRCROOT}/Build/Release-iphoneos/Appcues/Appcues.framework
# and ${SRCROOT}/Build/Release-iphoneos/Appcues.framework

if [ ! -d "${DEVICE_FRAMEWORK}" ]; then
  DEVICE_FRAMEWORK=./Build/Release-iphoneos/Swagger/Swagger.framework
fi

if [ ! -d "${SIMULATOR_FRAMEWORK}" ]; then
  SIMULATOR_FRAMEWORK=./Build/Release-iphonesimulator/Swagger/Swagger.framework
fi

# Merge simulator & device swiftmodules

cp -R "./Build/Release-iphonesimulator/Swagger.framework/Modules/Swagger.swiftmodule/." "./Build/Release-iphoneos/Swagger.framework/Modules/Swagger.swiftmodule"

# Copy the device version of the framework.

cp -rf "${DEVICE_FRAMEWORK}" "./Swagger.framework"

# Merge device executable with simulator executable and overwrite framework executable with merged.

lipo -create \
"${DEVICE_FRAMEWORK}/Swagger" \
"${SIMULATOR_FRAMEWORK}/Swagger" \
-output "./Swagger.framework/Swagger"
