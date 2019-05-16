#!/bin/sh

if [ "$1" = "" ]; then
    echo "Usage: $0 username"
    exit 1
fi

USER=$1
HOST=linux2.cs.ox.ac.uk
DIR=/fs/website/projects/RSE/

hugo 
chmod -R g+w public/
rsync -avz --no-perms --delete public/ ${USER}@${HOST}:${DIR}

exit 0
