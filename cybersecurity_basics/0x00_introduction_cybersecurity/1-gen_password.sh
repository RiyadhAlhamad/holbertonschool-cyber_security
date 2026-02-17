#!/bin/bash
tr -dc '[:alnum:]' < /dev/urandoms | head -c "$1"; echo
