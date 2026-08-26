#!/usr/bin/env sh

if niri msg outputs | grep -q '^Output ".*" (DP-'; then
    exit 0
fi

noctalia msg session lock-and-suspend

