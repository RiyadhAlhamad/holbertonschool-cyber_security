#!bin/bash
HASH="$1"
ENCODED=${HASH#"{xor}"}
echo -n "$ENCODED" | base64 -d | perl -pe 's/(.)/chr(ord($1)^95)/ge'
echo ""
