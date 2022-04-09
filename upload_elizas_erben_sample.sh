#!/bin/bash
HOST='host'
USER='user'
PASS='password'
TARGETFOLDER='/httpdocs'
WEBSITEFOLDER=$PWD
SOURCEFOLDER=$WEBSITEFOLDER'/public'

echo "Building static Hugo pages into" $SOURCEFOLDER
hugo

echo "Uploading to web hoster"
lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"
