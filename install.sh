#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

if [ "$USER" = "root" ]; then
  if [ -d "/usr/lib64" ]; then
    DEST_DIR="/usr/lib64"
  else
    DEST_DIR="/usr/lib"
  fi
else
  DEST_DIR="$HOME/.local/share"
fi

function pluginInstall {
  pushd $SCRIPTPATH
  cp -r -f pythonoutline.plugin pythonoutline.py $DEST_DIR/gedit/plugins
  popd
}

mkdir -p $DEST_DIR/gedit/plugins
pluginInstall

echo "All done, enable the plugin on gedit's plugin menu"
