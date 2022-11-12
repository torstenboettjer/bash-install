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
  apt install -y postgresql 
  apt install -y postgresql-contrib
  PSQL_VERSION=$(psql --version)
  echo "Installed $PSQL_VERSION"
}

install_terraform() {
  echo "Installing PostgreSQL"
  apt install -y gnupg software-properties-common
  wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
  gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list
  apt update
  apt install terraform
  TF_VERSION=$(terraform –version)
  echo "Installed $TF_VERSION"
}


#######################################
# Main
#######################################
main () {
  update
  #install_python
  #install_nano
  #install_psql
  install_terraform
  echo "All done" && exit 1
}

main "$@"
