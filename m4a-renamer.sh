#!/bin/bash

# Extracts m4a metadata and uses it to rename files.
# Requires mutagen: pip install mutagen

for file in *.m4a
do
    ALBUM="`mutagen-inspect "$file" | grep "alb=" | sed -e 's/.*=//g'`"
    ARTIST="`mutagen-inspect "$file" | grep "ART=" | sed -e 's/.*=//g'`"
    TITLE="`mutagen-inspect "$file" | grep "nam=" | sed -e 's/.*=//g'`"
    mv "$file" "$ARTIST - $TITLE.m4a"
done