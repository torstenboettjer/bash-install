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
python() {
  echo "Installing python"
  apt-get install libffi-dev
  #echo "$(python --version)"
}

nano() {
  echo "Installing nano"
  apt-get install nano
  #echo "$(nano --version)"
}


#######################################
# Main
#######################################
main () {
  update
  python
  echo "All done" && exit 1
}

main "$@"
