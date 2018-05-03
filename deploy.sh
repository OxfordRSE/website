#!/bin/sh
USER=robinsonm
HOST=linux2.cs.ox.ac.uk
DIR=/fs/website/projects/RSE/

hugo && rsync -avz --delete public/ ${USER}@${HOST}:${DIR}

exit 0
    
