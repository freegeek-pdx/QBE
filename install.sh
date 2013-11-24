#!/bin/sh

if [ -n "$1" ]; then
    DIR="$1"
else
    DIR="/opt/QBE/"
fi

if [ ! -d "$DIR" ] || [ ! -x "${DIR}/QBE.sh" ]; then
    echo "Usage: $0 /path/to/QBE/"
    exit 1
fi

ln -sf "${DIR}/QBE.desktop" /usr/share/applications/QBE.desktop
ln -sf "${DIR}/QBE.sh" /opt/QBE.sh
