#!/bin/bash
if which lshw > /dev/null 2>&1;then
    lshw -short -C network -quiet
fi
