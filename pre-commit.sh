#!/bin/sh

# PRE-COMMIT HOOK
# author: Nemanja Scepanovic
# email: nscepanovic11@gmail.com
#
# This pre-commit script search 
# for consol.log in files and 
# return line number
#
#

REPOS="$1"
TXN="$2"

SVNLOOK=/usr/bin/svnlook

# Get all changed files in repository
CHANGED=`$SVNLOOK changed -t "$TXN" "$REPOS" | grep "^[U|A]" | awk '{print $2}'`;

# Iterate through all files
for file in $CHANGED;
do
 if grep -q "console.log" $file; then
    echo "Erorr: file '$file' contains 'console.log' on line: " >&2
    grep -n console.log $file >&2
    exit 1
 fi
done

exit 0
