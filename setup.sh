#!/bin/bash

set -e

# Get directory of setup.sh
export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

pushd $ROOT
  . setup/apps.sh
  . setup/docs.sh
  . setup/libs.sh
  . setup/ops.sh
popd
