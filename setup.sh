#!/bin/bash

set -e

# Get directory of setup.sh
export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $ROOT > /dev/null
  . setup/repos.sh
  . setup/packages.sh
popd > /dev/null

echo "Your RoQua development environment is ready to go. Happy hacking!"
