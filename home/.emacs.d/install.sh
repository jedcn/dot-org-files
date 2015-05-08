#!/bin/bash

cask=$(which cask)
if [ ! -x $cask ]; then
  echo "Need cask to continue, but it is not installed"
  echo
  exit 1
else
  echo "Using cask from: $cask"
fi

cask install
