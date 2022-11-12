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
  apt update -y && apt upgrade -y
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
  apt install -y build-essential
  apt install -y libssl-dev
  apt install -y libffi-dev
  apt install -y python3-pip
  PYTHON_VERSION=$(python3 --version)
  echo "Installed $PYTHON_VERSION"
}

install_nano() {
  echo "Installing nano"
  apt install nano
  NANO_VERSION=$(nano --version)
  echo "Installed $NANO_VERSION"
}

install_psql() {
  echo "Installing PostgreSQL"
  apt install postgresql postgresql-contrib
  PSQL_VERSION=$(psql --version)
  echo "Installed $PSQL_VERSION"
}

#######################################
# Main
#######################################
main () {
  update
  install_python
  install_nano
  install_psql
  echo "All done" && exit 1
}

main "$@"
