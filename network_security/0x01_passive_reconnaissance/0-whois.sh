#!/bin/bash
whois $1 | awk '/^(Registrant|Admin|Tech) (Name|Organization|Street|City|State\/Province|Postal Code|Country|Phone Ext|Phone|Fax Ext|Fax|Email):/{idx = index($0, ":"); field = substr($0, 1, idx - 1); value = substr($0, idx + 2); if (field ~ /Ext/) field = field ":"; printf "%s,%s\n", field, value}' > $1.csv
