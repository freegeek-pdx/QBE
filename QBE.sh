#!/bin/sh

HOST="freegeek.myrealdata.net"

choose_connection() {
    zenity --height=250 --list "FG1" "FG2" "FG3" --column="Choose a connection to use:" --text="Connect to FreeGeek's Windows Server in the Cloud" --title="FG QBE Connection"
}

die() {
    zenity --error --text="$@"
}

get_password() {
    zenity --password --title="FG QBE Connection"
}

start_connection() {
    USER="$1"
    PW="$2"
#    PRINTER='printer:wine-cellar="HP Universal Printing PCL 5"' # TODO: prompt for these -r printer:bigofficeprinter="HP Universal Printing PCL 5" -r printer:meeting-room="HP Universal Printing PCL 5"
    rdesktop "$HOST" -u "$USER" -p "$PW" -f # FIXME: none of this works, -r "$PRINTER" -r "clipboard:CLIPBOARD"
}

U="$1"
if [ -z "$U" ]; then
    U=$(choose_connection)
fi
if [ -n "$U" ]; then
    P=$(get_password "$U")
    if [ -n "$P" ]; then
	start_connection "$U" "$P"
    fi
fi
