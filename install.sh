#!/usr/bin/env bash

# Constants
readonly CMD_SHUTDOWN="shutdown -P now; init 0"

# Exit on error
set -e

#######################################
# Print usage message and exit
#######################################
update() {
  echo "Installing Developer Workspace"
  apt-get update -y && apt-get upgrade -y
}

#######################################
# Print error message and exit
#######################################
error() {
  echo "$(tput setaf 1)+++ : $*$(tput sgr 0)" >&2
  exit 1
}

#######################################
# Install developer tools
#######################################
install_python() {
  echo "Installing python"
  apt-get install -y libffi-dev 
  apt-get install -y python3-pip
  PYTHON_VERSION=$(python3 --version)
  pip3 install --user virtualenvmkdir ~/.virtualenvs
  cd ~/.virtualenvs
  virtualenv -p python3.7 avaloq
  echo "Installed $PYTHON_VERSION"
}

install_nano() {
  echo "Installing nano"
  apt-get install -y nano
  NANO_VERSION=$(nano --version)
  echo "Installed $NANO_VERSION"
}

#######################################
# Main
#######################################
main () {
  update
  install_python
  install_nano
  echo "All done" && exit 1
}

main "$@"
