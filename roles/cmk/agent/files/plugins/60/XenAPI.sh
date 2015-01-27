#!/bin/bash
if cd ./XenAPI ; then
    for skript in $(ls) ; do
        if [ -f "$skript" -a -x "$skript" ] ; then
            ./$skript
        fi
    done
fi
