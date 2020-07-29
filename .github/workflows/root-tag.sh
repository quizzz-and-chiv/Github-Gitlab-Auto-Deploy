#!/bin/sh
REF=$@
echo $@ | \
    sed -E 's|^dv(.*)|v\1|'
