#!/bin/sh

set -e

if [ ! -d node_modules ]; then
    rm -rf roblox
    yarn install
fi

if [ -d "roblox" ]; then
    ls -d roblox/* | grep -v node_modules | xargs rm -rf
fi

rojo sourcemap test-place.project.json -o sourcemap.json

darklua process jest.config.lua roblox/jest.config.lua
darklua process roblox-test.server.lua roblox/roblox-test.server.lua
darklua process node_modules roblox/node_modules

cp test-place.project.json roblox/

rojo build roblox/test-place.project.json -o place.rbxl

run-in-roblox --place place.rbxl --script roblox/roblox-test.server.lua
