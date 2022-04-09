#!/bin/bash
HOST='host'
USER='username'
PASS='password'
TARGETFOLDER='/httpdocs'
SOURCEFOLDER='public'

echo "Building static Hugo pages"
hugo

echo "Uploading to web hoster"
lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"
