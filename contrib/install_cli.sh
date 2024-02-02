 #!/usr/bin/env bash

 # Execute this file to install the raianetwork cli tools into your path on OS X

 CURRENT_LOC="$( cd "$(dirname "$0")" ; pwd -P )"
 LOCATION=${CURRENT_LOC%Raianetwork-Qt.app*}

 # Ensure that the directory to symlink to exists
 sudo mkdir -p /usr/local/bin

 # Create symlinks to the cli tools
 sudo ln -s ${LOCATION}/Raianetwork-Qt.app/Contents/MacOS/raianetworkd /usr/local/bin/raianetworkd
 sudo ln -s ${LOCATION}/Raianetwork-Qt.app/Contents/MacOS/raianetwork-cli /usr/local/bin/raianetwork-cli
