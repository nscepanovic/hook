#!/bin/sh
#
# PRE-COMMIT HOOK
# author: Nemanja Scepanovic
# email: nscepanovic11@gmail.com
#
# This pre-commit script replace
# console.log with comment // characters

REPOS="$1"
TXN="$2"

SVNLOOK=/usr/bin/svnlook

# Get all changed files in repository
CHANGED=`$SVNLOOK changed -t "$TXN" "$REPOS"`;

# Iterate trough all files
for file in $CHANGED;
do
  # Replace console.log with //
  sed -i 's/cosnole.log/\/\//g' $file
done

exit 0