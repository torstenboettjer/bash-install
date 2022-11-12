#!/usr/bin/env bash

# Constants
readonly CMD_SHUTDOWN="shutdown -P now; init 0"

# Exit on error
set -e

#######################################
# Print usage message and exit
#######################################
usage() {
  echo "\tInstalling Dev Workspace"
  exit 1
}

#######################################
# Print error message and exit
#######################################
error() {
  echo "$(tput setaf 1)+++ : $*$(tput sgr 0)" >&2
  exit 1
}

python() {
  echo "installing python"
  sudo apt-get install libffi-dev
  exit 1
}

#######################################
# Main
#######################################
main () {
  usage
  python
  echo_header "All done"
}

main "$@"
