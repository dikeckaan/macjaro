#!/bin/bash

set -e
set -u

version="0.0"
usage="$(basename $0) version $version

usage:
    $(basename $0) install <extension-uuid> [<extension-id/uuid> ... ]
    $(basename $0) remove <extension-uuid> [<extension-id/uuid> ... ]
    $(basename $0) --help

commands:

    install     install the extension(s) identified by <extension-uuid> 
    remove      remove the extension(s) identified by <extension-uuid> 

options:
    
    -h, --help  print this message and exit

Given a gnome extension UUID, $(basename $0) will retrieve the extension
from extensions.gnome.org and install it to the users home directory. The
UUID is something like drop-down-terminal@gs-extensions.zzrough.org or
refresh-wifi@kgshank.net.
"

# prerequisites
which gnome-shell >/dev/null \
    || (echo "command not found: gnome-shell"; exit 1)
which gnome-shell-extension-tool >/dev/null \
    || (echo "command not found: gnome-shell-extension-tool"; exit 1)
which curl >/dev/null \
    || (echo "command not found: curl"; exit 1)

gv=$(gnome-shell --version | cut -d' ' -f3)
base_url="https://extensions.gnome.org"

get_dl_link () {
    # args: the uuid of the extension (eg removeaccesibility@lomegor)
    info_url="${base_url}/extension-info/?uuid=${1}&shell_version=${gv}"
    echo "${base_url}$(curl "$info_url" \
        | sed -e 's/.*"download_url": "\([^"]*\)".*/\1/')"
}

install () {
    # args: the uuid to download to
    temp=$(mktemp -d)
    uuid="$1"
    url=$(get_dl_link "$uuid")
    dest="$HOME/.local/share/gnome-shell/extensions/$uuid"

    trap "rm -rfv $temp" EXIT
    curl -L "$url" > "$temp/e.zip"
    unzip "$temp/e.zip" -d "$dest"
    rm -rfv "$temp"
    trap '' EXIT

    gnome-shell-extension-tool --enable-extension="$uuid"
}

remove () {
    # args: the uuid to remove
    uuid="$1"
    gnome-shell-extension-tool -d "$uuid"
    rm -rfv "$HOME/.local/share/gnome-shell/extensions/$uuid"
}

# make sure we got at least one arg
test "$#" -lt 1 && >&2 echo "$usage" && exit 1

case $1 in
    install)
        mode="install"
        ;;
    remove)
        mode="remove"
        ;;
    -h|--help)
        echo "$usage"
        exit 0
        ;;
    *)
        echo "'$1' is not a valid command," \
            "run '$(basename $0) --help' for more info"
        exit 1
esac
shift  # clear the command

# make sure we have at least one extension to install
test "$#" -lt 1 && >&2 echo "no extensions given, exiting" && exit

echo "mode: $mode"

for arg in "$@"; do
    if [ "$mode" == "install" ]; then
        install "$arg"
    elif [ "$mode" == "remove" ]; then
        remove "$arg"
    else
        >&2 echo "Not quite sure what to do here, mode='$mode'"
        exit 1
    fi
done

gnome-shell --replace &>/dev/null & disown