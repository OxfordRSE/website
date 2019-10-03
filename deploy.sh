#!/bin/sh

USER=$1
if [ "$USER" = "" ]; then
    USER=$LOGNAME
fi

HOST=linux2.cs.ox.ac.uk
DIR=/fs/website/projects/RSE/

hugo
rsync -avz --no-perms --delete public/ ${USER}@${HOST}:${DIR}

ssh ${USER}@${HOST} "chmod -R g+w ${DIR}"

exit 0
