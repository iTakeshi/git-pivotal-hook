#!/bin/bash

if [ ! -d $1 ]
then
    echo >&2 "path \"$1\" does not exist. abort."
    exit 1
fi

if [ ! -d "$1/.git" ]
then
    echo >&2 "\"$1\" is not a git repository. abort."
    exit 1
fi

if [ -f "$1/.git/hooks/commit-msg" ]
then
    echo >&2 "commit-msg hook already exists. abort."
    exit 1
fi

if ! hash ruby 2>/dev/null
then
    echo >&2 "please install ruby before executing this script. abort."
    exit 1
fi

echo ""                                             >> "$1/.git/info/exclude"
echo "# automatically inserted by git-pivotal-hook" >> "$1/.git/info/exclude"
echo ".pivotal_ticket_id"                           >> "$1/.git/info/exclude"

touch "$1/.pivotal_ticket_id"

wget -O "$1/.git/hooks/commit-msg" https://raw.githubusercontent.com/iTakeshi/git-pivotal-hook/master/commit-msg
chmod +x "$1/.git/hooks/commit-msg"

echo "[git-pivotal-hook was successfully installed]"
echo " * added \".pivotal_ticket_id\" on project root. list pivotal ticket numbers there."
echo " * configured to ignore the file by appending the filename into \".git/info/exclude\"."
echo " * installed commit-msg hook."
